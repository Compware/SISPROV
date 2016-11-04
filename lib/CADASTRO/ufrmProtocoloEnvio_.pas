unit ufrmProtocoloEnvio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, Menus, dxTL, dxDBCtrl, dxDBGrid, DB, dxCntner,
  IBCustomDataSet, IBQuery;

type
  TfrmProtocoloEnvio = class(TForm)
    grDados: TdxDBGrid;
    dsDados: TDataSource;
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    grDadosColumn3: TdxDBGridColumn;
    grDadosColumn4: TdxDBGridColumn;
    grDadosColumn5: TdxDBGridColumn;
    grDadosColumn6: TdxDBGridColumn;
    grDadosColumn7: TdxDBGridColumn;
    PopupMenu1: TPopupMenu;
    Aceitar1: TMenuItem;
    Processar1: TMenuItem;
    TB_PROTOCOLO_ENVIO: TIBDataSet;
    TB_PROTOCOLO_ENVIOCD_PROTOCOLO: TIntegerField;
    TB_PROTOCOLO_ENVIOCD_UND: TIntegerField;
    TB_PROTOCOLO_ENVIOTP_PROTOCOLO: TIntegerField;
    TB_PROTOCOLO_ENVIOCD_UNIDADE: TIntegerField;
    TB_PROTOCOLO_ENVIOCD_PROVINCIA: TIntegerField;
    TB_PROTOCOLO_ENVIOCD_MUNICIPIO: TIntegerField;
    TB_PROTOCOLO_ENVIOVL_MESANO: TIBStringField;
    TB_PROTOCOLO_ENVIOBL_PROTOCOLO: TBlobField;
    TB_PROTOCOLO_ENVIODT_EXP: TDateTimeField;
    TB_PROTOCOLO_ENVIOCD_EDI: TIntegerField;
    TB_PROTOCOLO_ENVIOCD_USU_INCLUSAO: TIntegerField;
    TB_PROTOCOLO_ENVIODT_INCLUSAO: TDateTimeField;
    TB_PROTOCOLO_ENVIOCD_USU_ALTERACAO: TIntegerField;
    TB_PROTOCOLO_ENVIODT_ALTERACAO: TDateTimeField;
    TB_PROTOCOLO_ENVIOCD_USU_EXCLUSAO: TIntegerField;
    TB_PROTOCOLO_ENVIODT_EXCLUSAO: TDateTimeField;
    TB_PROTOCOLO_ENVIOFL_ENVIADO: TIBStringField;
    TB_PROTOCOLO_ENVIOCD_REGISTRO_GERAL: TIntegerField;
    TB_PROTOCOLO_ENVIOFL_ACEITAR: TIBStringField;
    TB_PROTOCOLO_ENVIOFL_IMPORTADO: TIBStringField;
    TB_PROTOCOLO_ENVIOCD_ARQUIVO: TIntegerField;
    TB_PROTOCOLO_ENVIODS_UNIDADE: TIBStringField;
    TB_PROTOCOLO_ENVIODS_MUNICIPIO: TIBStringField;
    TB_PROTOCOLO_ENVIODS_PROVINCIA: TIBStringField;
    grDadosColumn8: TdxDBGridColumn;
    TB_PROTOCOLO_ENVIODS_TIPO: TStringField;
    Visualizar1: TMenuItem;
    grDadosColumn9: TdxDBGridColumn;
    qyGeral: TIBQuery;
    procedure Aceitar1Click(Sender: TObject);
    procedure Processar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TB_PROTOCOLO_ENVIOCalcFields(DataSet: TDataSet);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TB_PROTOCOLO_ENVIOBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sSQLProtocolo:String;
    procedure ProcessaTodos;
    procedure ProcessarExclusao;
  end;

var
  frmProtocoloEnvio: TfrmProtocoloEnvio;

implementation

uses UDMGERAL, UGeral, ufrmEDI, UDM, ufrmMenuEDI, uRelatorioWEB;

{$R *.dfm}

procedure TfrmProtocoloEnvio.Aceitar1Click(Sender: TObject);
begin
  TB_PROTOCOLO_ENVIO.Edit;
  TB_PROTOCOLO_ENVIOFL_ACEITAR.AsString := cvSim;
  TB_PROTOCOLO_ENVIO.Post;
  dm.Commit(TB_PROTOCOLO_ENVIO);
end;

procedure TfrmProtocoloEnvio.Processar1Click(Sender: TObject);
begin

  if not TB_PROTOCOLO_ENVIODT_EXCLUSAO.IsNull then
  begin
    ProcessarExclusao;
  end
  else
  begin
    frmMenuEdi := TfrmMenuEdi.Create(Application);
    frmEdi := TfrmEdi.Create(Application);
    frmEdi.Importar;
    frmEdi.Free;
    frmMenuEdi.Free;
  end;

end;

procedure TfrmProtocoloEnvio.FormCreate(Sender: TObject);
begin
  sSQLProtocolo := TB_PROTOCOLO_ENVIO.SelectSQL.Text;
  TB_PROTOCOLO_ENVIO.Open;
end;

procedure TfrmProtocoloEnvio.TB_PROTOCOLO_ENVIOCalcFields(
  DataSet: TDataSet);
begin
  TB_PROTOCOLO_ENVIODS_TIPO.AsString :=
    Protocolo[TB_PROTOCOLO_ENVIOTP_PROTOCOLO.AsInteger];
end;

procedure TfrmProtocoloEnvio.Visualizar1Click(Sender: TObject);
var sArq:string;
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(Application);
  try
    sArq := sPathConsulta + FormatDateTime('ddmmyyhhnnss',Now) + '.xml';
    TB_PROTOCOLO_ENVIOBL_PROTOCOLO.SaveToFile(sArq);
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    DeleteFile(sArq);
  end;
end;

procedure TfrmProtocoloEnvio.ProcessarExclusao;
var sTabela:string;
begin
   if TB_PROTOCOLO_ENVIOFL_IMPORTADO.AsString <> cvSim then
   begin
     sTabela := TabelaProtocolo[TB_PROTOCOLO_ENVIOTP_PROTOCOLO.AsInteger];
     qyGeral.Close;
     qyGeral.SQL.Text :=
       'DELETE FROM ' + sTabela +
       ' WHERE CD_UNIDADE = :CD_UNIDADE '+
       ' AND CD_PROVINCIA = :CD_PROVINCIA ' +
       ' AND CD_MUNICIPIO = :CD_MUNICIPIO ' +
       ' AND VL_MESANO = :VL_MESANO ';
     qyGeral.ParamByName('CD_UNIDADE').AsString := TB_PROTOCOLO_ENVIOCD_UNIDADE.AsString;
     qyGeral.ParamByName('CD_PROVINCIA').AsString := TB_PROTOCOLO_ENVIOCD_PROVINCIA.AsString;
     qyGeral.ParamByName('CD_MUNICIPIO').AsString := TB_PROTOCOLO_ENVIOCD_MUNICIPIO.AsString;
     qyGeral.ParamByName('VL_MESANO').AsString := TB_PROTOCOLO_ENVIOVL_MESANO.AsString;
     qyGeral.ExecSQL;

     TB_PROTOCOLO_ENVIO.Edit;
     TB_PROTOCOLO_ENVIOFL_IMPORTADO.AsString := cvSim;
     TB_PROTOCOLO_ENVIO.Post;

     dm.Commit(qyGeral);
   end;
end;

procedure TfrmProtocoloEnvio.FormDestroy(Sender: TObject);
begin
  TB_PROTOCOLO_ENVIO.SelectSQL.Text := sSQLProtocolo;
end;

procedure TfrmProtocoloEnvio.TB_PROTOCOLO_ENVIOBeforeOpen(
  DataSet: TDataSet);
begin
  if (prmConfirmaEDI <> cvSim) then
    TB_PROTOCOLO_ENVIO.SelectSQL.Text :=
      StringReplace(sSQLProtocolo,'/**/',
          'WHERE "PROTOCOLO_ENVIO"."FL_ACEITAR" IS NULL ' +
          'OR "PROTOCOLO_ENVIO"."FL_IMPORTADO" IS NULL',[]);
end;

procedure TfrmProtocoloEnvio.ProcessaTodos;
begin
   TB_PROTOCOLO_ENVIO.Open;
   TB_PROTOCOLO_ENVIO.First;
   while not TB_PROTOCOLO_ENVIO.Eof do
   begin
     Aceitar1Click(Self);
     if not TB_PROTOCOLO_ENVIODT_EXCLUSAO.IsNull then
       ProcessarExclusao;
     TB_PROTOCOLO_ENVIO.Next;
   end;
   TB_PROTOCOLO_ENVIO.Close;
   Processar1Click(Self);
end;

end.
