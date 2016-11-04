unit uThreadedCDSOpen;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows ,Forms {$ENDIF};

type
  TThreadedCDSOpen = class(TThread)
  private
    procedure SetName;
  protected
    procedure Execute; override;
    procedure Teste;
  end;

implementation

uses SysUtils, ufrmEDI, IBCustomDataSet, DBLocalI, uConstanteScript, uDm,
uGeral, Variants, ufrmMenuEDI;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TThreadedCDSOpen.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{$IFDEF MSWINDOWS}
type
  TThreadNameInfo = record
    FType: LongWord;     // must be 0x1000
    FName: PChar;        // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord;    // reserved for future use, must be zero
  end;
{$ENDIF}

{ TThreadedCDSOpen }

procedure TThreadedCDSOpen.SetName;
{$IFDEF MSWINDOWS}
var
  ThreadNameInfo: TThreadNameInfo;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'TThreadedCDS';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo );
  except
  end;
{$ENDIF}
end;

procedure TThreadedCDSOpen.Execute;
begin
  SetName;
  { Place thread code here }
  Teste;
end;

procedure TThreadedCDSOpen.Teste;
var
  sArquivo:string;
  ocds:TIBClientDataSet;
  oibds:TIBDataSet;
  sTabela:string;
  dtRegistro:TDateTime;
  j:integer;
begin
  ocds := TIBClientDataSet.Create(Application);
  oibds := TIBDataSet.Create(Application);
  try
    sTabela := 'REGISTRO_PROGRAMA';
    sArquivo := 'Q:\Bin\EDI\IN\REGISTRO_PROGRAMA31040814181927.xml';
    frmEDI.MontaDataSet(sTabela,oibds);
    ocds.LoadFromFile(sArquivo);
    dtRegistro := Now;
    while not ocds.Eof do
    begin
//******************************************************************************
{
      try
        oibds.SelectSQL.Text := Format(cvSelectDadosImpUK,[sTabela]);
        oibds.ParamByName('CD_UNIDADE').Value := ocds.FieldValues['CD_UNIDADE'];
        oibds.ParamByName('CD_PROVINCIA').Value := ocds.FieldValues['CD_PROVINCIA'];
        oibds.ParamByName('CD_MUNICIPIO').Value := ocds.FieldValues['CD_MUNICIPIO'];
        oibds.ParamByName('VL_MESANO').Value := ocds.FieldValues['VL_MESANO'];
        oibds.Open;
        oibds.Last;
        oibds.First;
        if oibds.FindField('DT_REGISTRO')<>nil then
        begin
          //Exclui os Existentes para Entao Inserir Novos
          while not oibds.Eof do
          begin
             if (oibds.FieldByName('DT_REGISTRO').AsDateTime<>dtRegistro) then
                oibds.Delete
             else
                oibds.Next;
          end;
        end;

        dm.Transacao(dm.IBD);
        if oibds.RecordCount = 0 then
          oibds.Insert
        else
          oibds.Edit;
        for j:=0 to ocds.FieldCount-1 do
          frmEDI.CopiaValor(ocds.Fields[j],oibds.FieldByName(ocds.Fields[j].FieldName));

        if oibds.FieldByName('CD_UND').Value <> prmUnidadeCentral then //Somente INLS nao precisa
          oibds.FieldByName('DT_EXP').Value := Null;

        oibds.Post;
        dm.Commit(dm.IBD);
        oibds.Close;
}
        ocds.Delete;
        frmMenuEDI.StatusBar1.Panels[2].Text :=
              intToStr(ocds.RecNo) +
              'x' + intToStr(ocds.RecordCount);
{
      except
        on E:Exception do
        begin
           frmMenuEDI.StatusBar1.Panels[2].Text :=
              intToStr(ocds.RecNo) +
              'x' + intToStr(ocds.RecordCount) +
              e.Message;
           oibds.Close;
           ocds.Next;
        end;
      end;
}        
//******************************************************************************
      //ocds.Next;
    end;
  finally
    ocds.Close;
    FreeAndNil(ocds);
  end;
end;

end.
