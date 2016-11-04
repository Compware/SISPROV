unit ufrmConfirmacaoEDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, Menus, dxTL, dxDBCtrl, dxDBGrid, DB, dxCntner,
  IBCustomDataSet, IBQuery;

type
  TfrmConfirmacaoEDI = class(TForm)
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
    TB_REGISTROS: TIBDataSet;
    grDadosColumn8: TdxDBGridColumn;
    TB_REGISTROSDS_TIPO: TStringField;
    Visualizar1: TMenuItem;
    grDadosColumn9: TdxDBGridColumn;
    qyGeral: TIBQuery;
    TB_REGISTROSCD_UNIDADE: TIntegerField;
    TB_REGISTROSCD_PROVINCIA: TIntegerField;
    TB_REGISTROSCD_MUNICIPIO: TIntegerField;
    TB_REGISTROSVL_MESANO: TIBStringField;
    TB_REGISTROSFL_ACEITAR: TIBStringField;
    TB_REGISTROSFL_IMPORTAR: TIBStringField;
    TB_REGISTROSCD_ACEITAR_USU: TIntegerField;
    TB_REGISTROSDT_ACEITAR: TDateTimeField;
    TB_REGISTROSDT_IMPORTAR: TDateTimeField;
    TB_REGISTROSTIPO: TIntegerField;
    TB_REGISTROSDS_UNIDADE: TIBStringField;
    TB_REGISTROSDS_MUNICIPIO: TIBStringField;
    TB_REGISTROSDS_PROVINCIA: TIBStringField;
    qySync: TIBQuery;
    qyGeral2: TIBQuery;
    qyGeral3: TIBQuery;
    procedure Aceitar1Click(Sender: TObject);
    procedure Processar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TB_REGISTROSCalcFields(DataSet: TDataSet);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TB_REGISTROSBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sSQLProtocolo:String;
    sArq:string;
    procedure ProcessaTodos;
    procedure ProcessarExclusao;
    procedure VisualizaPrograma(bVisualizar:boolean; var sArquivo:string);
    procedure VisualizaAtv(bVisualizar:boolean; var sArquivo:string);
    procedure VisualizaPtv(bVisualizar:boolean; var sArquivo:string);
    procedure VisualizaTarv(bVisualizar:boolean; var sArquivo:string);
    procedure VisualizaTarvEsquema(bVisualizar:boolean; var sArquivo:string);
    procedure VisualizaTarvCD4(bVisualizar:boolean; var sArquivo:string);
    procedure VisualizaTarvAcomp(bVisualizar:boolean; var sArquivo:string);
    procedure VisualizaCOINFECCAO(bVisualizar:boolean; var sArquivo:string);
  end;

var
  frmConfirmacaoEDI: TfrmConfirmacaoEDI;

implementation

uses UDMGERAL, UGeral, ufrmEDI, UDM, ufrmMenuEDI, uRelatorioWEB,
  uCadPROGRAMA, uCadTARV, uCadATV, uCadPTV, uCadTARVCD4, uCadTARVACOMP,
  uCadTARVESQUEMA, uCadCOINFECCAO;

{$R *.dfm}

procedure TfrmConfirmacaoEDI.Aceitar1Click(Sender: TObject);
var dHoje:TDate;
begin
  dHoje := dm.GetDateTime;

  TB_REGISTROS.Edit;
  TB_REGISTROSFL_ACEITAR.AsString := cvSim;
  TB_REGISTROSDT_ACEITAR.AsDateTime := dHoje;
  TB_REGISTROS.Post;

  qyGeral.Close;
  qyGeral.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qyGeral.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qyGeral.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qyGeral.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  qyGeral.ParamByName('FL_ACEITAR').AsString := cvSim;
  qyGeral.ParamByName('CD_ACEITAR_USU').AsString := dm.qyLoginCD_USUARIO.AsString;
  qyGeral.ParamByName('DT_ACEITAR').AsDateTime := dHoje;
  qyGeral.ExecSQL;
  dm.Commit(TB_REGISTROS);
end;

procedure TfrmConfirmacaoEDI.Processar1Click(Sender: TObject);
var sWhere,sSQL,sNomeTabela:String;
    dHoje:TDate;
begin

  sNomeTabela := TabelaProtocolo[TB_REGISTROSTIPO.AsInteger];

  sWhere := 'where      ' +
    '"CD_UNIDADE" = :CD_UNIDADE and ' +
    '"CD_PROVINCIA" = :CD_PROVINCIA and ' +
    '"CD_MUNICIPIO" = :CD_MUNICIPIO and ' +
    '"VL_MESANO" = :VL_MESANO ' ;

  sSQL :=
     'delete from "'+sNomeTabela+'" ' +
     sWhere;

  qySync.SQL.Text := sSQL;
  qySync.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qySync.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qySync.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qySync.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  qySync.ExecSQL;

  sSQL :=
     'insert into ' +sNomeTabela+' '+
     'select * from "'+sNomeTabela+'_EDI" ' +
     sWhere;

  qySync.SQL.Text := sSQL;
  qySync.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qySync.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qySync.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qySync.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  qySync.ExecSQL;

  dHoje := dm.GetDateTime;

  TB_REGISTROS.Edit;
  TB_REGISTROSFL_IMPORTAR.AsString := cvSim;
  TB_REGISTROSDT_IMPORTAR.AsDateTime := dHoje;
  TB_REGISTROS.Post;

  qyGeral2.Close;
  qyGeral2.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qyGeral2.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qyGeral2.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qyGeral2.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  qyGeral2.ParamByName('FL_IMPORTAR').AsString := cvSim;
  qyGeral2.ParamByName('DT_IMPORTAR').AsDateTime := dHoje;
  qyGeral2.ExecSQL;

  case TB_REGISTROSTIPO.AsInteger of
   1:VisualizaAtv(false, sArq);
   2:VisualizaPtv(false, sArq);
   3:VisualizaTarv(false, sArq);
   4:VisualizaTarvEsquema(false,sArq);
   5:VisualizaTarvCD4(false,sArq);
   6:VisualizaTarvAcomp(false,sArq);
   7:VisualizaPrograma(false,sArq);
   8:VisualizacOINFECCAO(false,sArq);
  end;

  dmGeral.TB_PROTOCOLO_ENVIO.Close;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('CD_UNIDADE').AsInteger := TB_REGISTROSCD_UNIDADE.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('CD_PROVINCIA').AsInteger := TB_REGISTROSCD_PROVINCIA.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('CD_MUNICIPIO').AsInteger := TB_REGISTROSCD_MUNICIPIO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('TP_PROTOCOLO').AsInteger := TB_REGISTROSTIPO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.Open;

  if dmGeral.TB_PROTOCOLO_ENVIO.IsEmpty then
    dmGeral.TB_PROTOCOLO_ENVIO.Insert
  else
    dmGeral.TB_PROTOCOLO_ENVIO.Edit;

  dmGeral.TB_PROTOCOLO_ENVIOCD_UND.AsString := prmUnidade;
  dmGeral.TB_PROTOCOLO_ENVIOTP_PROTOCOLO.AsInteger := TB_REGISTROSTIPO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOCD_REGISTRO_GERAL.AsInteger := 0;
  dmGeral.TB_PROTOCOLO_ENVIOCD_UNIDADE.AsInteger := TB_REGISTROSCD_UNIDADE.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOCD_PROVINCIA.AsInteger := TB_REGISTROSCD_PROVINCIA.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOCD_MUNICIPIO.AsInteger := TB_REGISTROSCD_MUNICIPIO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOVL_MESANO.AsString := TB_REGISTROSVL_MESANO.AsString;
  if FileExists(sArq) then
    dmGeral.TB_PROTOCOLO_ENVIOBL_PROTOCOLO.LoadFromFile(sArq);
  dmGeral.TB_PROTOCOLO_ENVIOFL_ACEITAR.AsString := cvSim;
  dmGeral.TB_PROTOCOLO_ENVIOFL_ENVIADO.AsString := cvSim;
  dmGeral.TB_PROTOCOLO_ENVIOFL_IMPORTADO.AsString := cvSim;
  dmGeral.TB_PROTOCOLO_ENVIODT_EXP.Clear;
  dmGeral.TB_PROTOCOLO_ENVIOCD_EDI.Clear;
  dmGeral.TB_PROTOCOLO_ENVIOCD_USU_INCLUSAO.AsInteger := dm.qyLoginCD_USUARIO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIODT_INCLUSAO.AsDateTime := dm.GetDate;
  dmGeral.TB_PROTOCOLO_ENVIO.Post;


  sSQL :=
     'delete from "'+sNomeTabela+'_EDI" ' +
     sWhere;

  qySync.SQL.Text := sSQL;
  qySync.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qySync.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qySync.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qySync.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  qySync.ExecSQL;

  sSQL :=
     'delete from "'+sNomeTabela+'_PAI" ' +
     sWhere;

  qySync.SQL.Text := sSQL;
  qySync.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qySync.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qySync.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qySync.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  qySync.ExecSQL;

  dm.Commit(qySync);

end;

procedure TfrmConfirmacaoEDI.FormCreate(Sender: TObject);
begin
  sSQLProtocolo := TB_REGISTROS.SelectSQL.Text;
  TB_REGISTROS.Open;
end;

procedure TfrmConfirmacaoEDI.TB_REGISTROSCalcFields(
  DataSet: TDataSet);
begin
  TB_REGISTROSDS_TIPO.AsString :=
    Protocolo[TB_REGISTROSTIPO.AsInteger];
end;

procedure TfrmConfirmacaoEDI.Visualizar1Click(Sender: TObject);
var sArq:string;
begin
{
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
}

  case TB_REGISTROSTIPO.AsInteger of
   1:VisualizaAtv(true,sArq);
   2:VisualizaPtv(true,sArq);
   3:VisualizaTarv(true,sArq);
   4:VisualizaTarvEsquema(true,sArq);
   5:VisualizaTarvCD4(true,sArq);
   6:VisualizaTarvAcomp(true,sArq);
   7:VisualizaPrograma(true,sArq);
   8:VisualizacOINFECCAO(true,sArq);
  end;
end;

procedure TfrmConfirmacaoEDI.ProcessarExclusao;
var sTabela:string;
begin
{
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
}   
end;

procedure TfrmConfirmacaoEDI.FormDestroy(Sender: TObject);
begin
  TB_REGISTROS.SelectSQL.Text := sSQLProtocolo;
end;

procedure TfrmConfirmacaoEDI.TB_REGISTROSBeforeOpen(
  DataSet: TDataSet);
begin
{  if (prmConfirmaEDI <> cvSim) then
    TB_PROTOCOLO_ENVIO.SelectSQL.Text :=
      StringReplace(sSQLProtocolo,'/**/',
          'WHERE "PROTOCOLO_ENVIO"."FL_ACEITAR" IS NULL ' +
          'OR "PROTOCOLO_ENVIO"."FL_IMPORTADO" IS NULL',[]); }
end;

procedure TfrmConfirmacaoEDI.ProcessaTodos;
begin
{
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
}   
end;

procedure TfrmConfirmacaoEDI.VisualizaPrograma(bVisualizar:boolean; var sArquivo:string);
begin
  frmCadPrograma := TfrmCadPrograma.Create(self);
  frmCadPrograma.limpar;
  frmCadPrograma.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadPrograma.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadPrograma.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadPrograma.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadPrograma.sNomeTabela := 'REGISTRO_PROGRAMA_EDI';
  frmCadPrograma.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioPrograma'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadPrograma.sArq := sArq;
      frmCadPrograma.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioPrograma'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadPrograma.sArq := sArq;
    frmCadPrograma.GeraXML;
  end;
  frmCadPrograma.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarv(bVisualizar:boolean; var sArquivo:string);
begin
  frmCadTARV := TfrmCadTARV.Create(self);
  frmCadTARV.limpar;
  frmCadTARV.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARV.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARV.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARV.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARV.sNomeTabela := 'REGISTRO_TARV_EDI';
  frmCadTARV.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioTARV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARV.sArq := sArq;
      frmCadTARV.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioTARV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadTARV.sArq := sArq;
    frmCadTARV.GeraXML;
  end;
  frmCadTARV.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaATV(bVisualizar:boolean; var sArquivo:string);
begin
  frmCadATV := TfrmCadATV.Create(self);
  frmCadATV.limpar;
  frmCadATV.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadATV.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadATV.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadATV.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadATV.sNomeTabela := 'REGISTRO_ATV_EDI';
  frmCadATV.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadATV.sArq := sArq;
      frmCadATV.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadATV.sArq := sArq;
    frmCadATV.GeraXML;
  end;
  frmCadATV.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaPTV(bVisualizar:boolean; var sArquivo:string);
begin
  frmCadPTV := TfrmCadPTV.Create(self);
  frmCadPTV.limpar;
  frmCadPTV.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadPTV.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadPTV.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadPTV.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadPTV.sNomeTabela := 'REGISTRO_PTV_EDI';
  frmCadPTV.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioPTV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadPTV.sArq := sArq;
      frmCadPTV.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioPTV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadPTV.sArq := sArq;
    frmCadPTV.GeraXML;
  end;
  frmCadPTV.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarvAcomp(bVisualizar: boolean;
  var sArquivo: string);
begin
  frmCadTARVACOMP := TfrmCadTARVACOMP.Create(self);
  frmCadTARVACOMP.limpar;
  frmCadTARVACOMP.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARVACOMP.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARVACOMP.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARVACOMP.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARVACOMP.sNomeTabela := 'REGISTRO_TARV_ACOMP_EDI';
  frmCadTARVACOMP.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioTARVACOMP'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARVACOMP.sArq := sArq;
      frmCadTARVACOMP.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioTARVACOMP'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadTARVACOMP.sArq := sArq;
    frmCadTARVACOMP.GeraXML;
  end;
  frmCadTARVACOMP.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarvCD4(bVisualizar: boolean;
  var sArquivo: string);
begin
  frmCadTARVCD4 := TfrmCadTARVCD4.Create(self);
  frmCadTARVCD4.limpar;
  frmCadTARVCD4.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARVCD4.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARVCD4.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARVCD4.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARVCD4.sNomeTabela := 'REGISTRO_TARV_CD4_EDI';
  frmCadTARVCD4.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioTARVCD4'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARVCD4.sArq := sArq;
      frmCadTARVCD4.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioTARVCD4'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadTARVCD4.sArq := sArq;
    frmCadTARVCD4.GeraXML;
  end;
  frmCadTARVCD4.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarvEsquema(bVisualizar: boolean;
  var sArquivo: string);
begin
  frmCadTARVESQUEMA := TfrmCadTARVESQUEMA.Create(self);
  frmCadTARVESQUEMA.limpar;
  frmCadTARVESQUEMA.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARVESQUEMA.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARVESQUEMA.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARVESQUEMA.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARVESQUEMA.sNomeTabela := 'REGISTRO_TARV_ESQUEMA_EDI';
  frmCadTARVESQUEMA.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioTARVESQ'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARVESQUEMA.sArq := sArq;
      frmCadTARVESQUEMA.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioTARVESQ'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadTARVESQUEMA.sArq := sArq;
    frmCadTARVESQUEMA.GeraXML;
  end;
  frmCadTARVESQUEMA.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaCOINFECCAO(bVisualizar: boolean;
  var sArquivo: string);
begin
  frmCadCOINFECCAO := TfrmCadCOINFECCAO.Create(self);
  frmCadCOINFECCAO.limpar;
  frmCadCOINFECCAO.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadCOINFECCAO.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadCOINFECCAO.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadCOINFECCAO.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadCOINFECCAO.sNomeTabela := 'REGISTRO_COINFECCAO_EDI';
  frmCadCOINFECCAO.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioCOINFECCAO'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadCOINFECCAO.sArq := sArq;
      frmCadCOINFECCAO.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end
  else
  begin
    sArq := sPathConsulta+'RelatorioCOINFECCAO'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArq;
    frmCadCOINFECCAO.sArq := sArq;
    frmCadCOINFECCAO.GeraXML;
  end;
  frmCadCOINFECCAO.Free;
end;

end.
