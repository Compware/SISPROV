unit UIMAPGetUID;

interface

uses
  Classes, SysUtils, IdIMAP4, IdGlobal, IdException, IdResourceStrings, ufrmGerenciadorErros;
type
  EIdNumberInvalid = class(Exception);

function  IMAPGetUID(var IMAPClient: TIdIMAP4; const AMsgNum: Integer; var AUID: string): Boolean;
function IsNumberValid(const ANumber: Integer): Boolean;
function NewCmdCounter : String;


implementation

var
  I : Integer;

function NewCmdCounter : String;
begin
  INC(I);
  Result := 'V'+ IntToStr(I);
end;

function  IMAPGetUID(var IMAPClient: TIdIMAP4; const AMsgNum: Integer; var AUID: string): Boolean;
{This gets the message UID from the message relative number.  Based on the code
in "function TIdIMAP4.CheckMsgSeen(const AMsgNum: Integer): Boolean;"}
var
  Ln : Integer;
  LSlRetrieve : TStringList;
begin
    Result := False;
    AUID := '';  {Do not Localize}
    
    IsNumberValid(AMsgNum);

    if (IMAPClient.ConnectionState = csSelected) then begin
        {Some servers return NO if the requested message number is not present
        (e.g. Cyrus), others return OK but no data (CommuniGate).}
        IMAPClient.SendCmd(NewCmdCounter, ('FETCH' + ' ' + IntToStr(AMsgNum) + {Do not Localize}
          ' (' + 'UID' + ')' ), [wsOk,wsNO]);                   {Do not Localize}
        if (IMAPClient.LastCmdResult.NumericCode = wsOk) then begin
            //frmGerenciadorErros.memLog.Lines.Add(IntToStr(AMsgNum));
            //frmGerenciadorErros.memLog.Lines.AddStrings(IMAPClient.LastCmdResult.Text);
            for Ln := 0 to (IMAPClient.LastCmdResult.Text.Count - 1) do begin
                LSlRetrieve := TStringList.Create;
                try
                    BreakApart(IMAPClient.LastCmdResult.Text[Ln], ' ', LSlRetrieve);           {Do not Localize}
                    if LSlRetrieve.Count > 3 then begin
                        if (//AnsiSameText(LSlRetrieve[0], IntToStr(AMsgNum)) and
                          AnsiSameText(LSlRetrieve[1], 'FETCH') and
                          AnsiSameText(LSlRetrieve[2], '(UID')) then begin {Do not Localize}
                            Result := True;
                            AUID := Copy(LSlRetrieve[3], 1, Pos(')', LSlRetrieve[3])-1); {Do not Localize}
                        end;
                    end;
                finally
                    LSlRetrieve.Free;
                end;
            end;
        end;
    end else begin
        raise EIdConnectionStateError.CreateFmt(RSIMAP4ConnectionStateError, []);
    end; 
end;

function IsNumberValid(const ANumber: Integer): Boolean;
    {CC3: Need to validate message numbers (relative and UIDs), because otherwise
    the routines wait for a response that never arrives and so functions never return.}
begin
    if ANumber < 1 then begin
        raise EIdNumberInvalid.Create('Number passed as parameter is invalid, must be 1 or greater');
    end;
    Result := True;
end;

initialization

  I := 0;

end.
