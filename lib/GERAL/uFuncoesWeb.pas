unit uFuncoesWeb;

interface

uses Forms, CHILKATUPLOADLib_TLB, CHILKATHTTPLib_TLB;

function Get(sURL:String):string;

implementation

function Get(sURL:String):string;
var
  http: TChilkatHttp;
  success: Integer;
  msgErro:string;
begin
  http := TChilkatHttp.Create(Application);
  http.Login := 'vertrou';
  http.Password := 'lilian';

  //  Any string unlocks the component for the 1st 30-days.
  success := http.UnlockComponent('30277129240');
  if (success <> 1) then
  begin
    msgErro := http.LastErrorText;
    Exit;
  end;
  result := http.QuickGetStr(sURL);
end;


end.
