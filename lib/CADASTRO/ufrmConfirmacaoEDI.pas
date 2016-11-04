unit ufrmConfirmacaoEDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, Menus, dxTL, dxDBCtrl, dxDBGrid, DB, dxCntner,
  IBCustomDataSet, IBQuery,ExtCtrls, ComCtrls, ImgList, StdCtrls, Buttons,
  pngimage, dxDBTLCl, dxGrClms, DBCtrls, Mask, Grids, DBGrids, dxEditor,
  dxEdLib, dxDBELib, IBDatabase, ToolEdit, RXDBCtrl;

type
  TfrmConfirmacaoEDI = class(TForm)
    dsDados: TDataSource;
    PopupMenu1: TPopupMenu;
    Aceitar1: TMenuItem;
    Processar1: TMenuItem;
    TB_REGISTROS: TIBDataSet;
    TB_REGISTROSDS_TIPO: TStringField;
    Visualizar1: TMenuItem;
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
    Comparar1: TMenuItem;
    TB_REGISTROSKEY: TIBStringField;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    TB_REGISTROSchave: TIntegerField;
    TB_REGISTROSDT_INC_REGISTRO: TDateTimeField;
    TB_REGISTROSDT_EXPORTACAO: TDateTimeField;
    TB_REGISTROSCD_INC_USUARIO: TIntegerField;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ImageList1: TImageList;
    Panel2: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ImageList2: TImageList;
    TB_REGISTROSCD_UND_ENVIO: TIntegerField;
    TB_REGISTROSUNIDADE_ENVIO: TIBStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    grDados: TdxDBGrid;
    grDadosDS_PROVINCIA: TdxDBGridColumn;
    grDadosDS_MUNICIPIO: TdxDBGridColumn;
    grDadosVL_MESANO: TdxDBGridColumn;
    grDadosDS_UNIDADE: TdxDBGridColumn;
    grDadosFL_ACEITAR: TdxDBGridImageColumn;
    grDadosDT_ACEITAR: TdxDBGridDateColumn;
    grDadosFL_IMPORTAR: TdxDBGridImageColumn;
    grDadosDS_TIPO: TdxDBGridColumn;
    grDadosDT_IMPORTAR: TdxDBGridDateColumn;
    grDadosDT_INC_REGISTRO: TdxDBGridDateColumn;
    grDadosDT_EXPORTACAO: TdxDBGridDateColumn;
    grDadosCD_UND_ENVIO: TdxDBGridColumn;
    grDadosUNIDADE_ENVIO: TdxDBGridColumn;
    Panel3: TPanel;
    Panel5: TPanel;
    btIncluir: TBitBtn;
    pLista: TPageControl;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    btCancelar: TBitBtn;
    btgravar: TBitBtn;
    pCadastro: TPageControl;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    dsSolicitacao: TDataSource;
    Label3: TLabel;
    btLocProvincia: TdxDBButtonEdit;
    edProvincia: TdxDBEdit;
    btLocMunicipio: TdxDBButtonEdit;
    Label4: TLabel;
    edMunicipio: TdxDBEdit;
    ckAtiva: TDBCheckBox;
    btLocUnidade: TdxDBButtonEdit;
    edUnidade: TdxDBEdit;
    btAtualizar: TBitBtn;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1CD_ST_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid1CD_UND: TdxDBGridMaskColumn;
    dxDBGrid1CD_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid1DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid1DT_EXP: TdxDBGridDateColumn;
    dxDBGrid1CD_EDI: TdxDBGridMaskColumn;
    dxDBGrid1CD_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid1CD_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid1CD_USU_INCLUSAO: TdxDBGridMaskColumn;
    dxDBGrid1DT_INCLUSAO: TdxDBGridDateColumn;
    dxDBGrid1CD_USU_ALTERACAO: TdxDBGridMaskColumn;
    dxDBGrid1DT_ALTERACAO: TdxDBGridDateColumn;
    dxDBGrid1DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid1DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid1ST_STATUS: TdxDBGridImageColumn;
    dxDBGrid1FL_ATIVA: TdxDBGridCheckColumn;
    dxDBGrid1CD_ATIP: TdxDBGridCheckColumn;
    dxDBGrid1CD_PTV: TdxDBGridCheckColumn;
    dxDBGrid1CD_TARV_I: TdxDBGridCheckColumn;
    dxDBGrid1CD_TARV_A: TdxDBGridCheckColumn;
    dxDBGrid1Column21: TdxDBGridColumn;
    Label2: TLabel;
    Image2: TImage;
    Label5: TLabel;
    Image4: TImage;
    Label6: TLabel;
    Image3: TImage;
    Label7: TLabel;
    DBCheckBox5: TDBCheckBox;
    dxDBGrid1CD_COINF: TdxDBGridCheckColumn;
    dxDBGrid1NM_USU: TdxDBGridColumn;
    Label8: TLabel;
    dxDBEdit1: TdxDBEdit;
    TB_REGISTROSNM_USU: TIBStringField;
    TB_REGISTROSVL_VERSAO: TIBStringField;
    Panel4: TPanel;
    tbaHist: TTabSheet;
    dxDBGrid2: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    dxDBGridImageColumn1: TdxDBGridImageColumn;
    dxDBGridDateColumn1: TdxDBGridDateColumn;
    dxDBGridImageColumn2: TdxDBGridImageColumn;
    dxDBGridColumn5: TdxDBGridColumn;
    dxDBGridDateColumn2: TdxDBGridDateColumn;
    dxDBGridDateColumn3: TdxDBGridDateColumn;
    dxDBGridDateColumn4: TdxDBGridDateColumn;
    dxDBGridColumn6: TdxDBGridColumn;
    dxDBGridColumn7: TdxDBGridColumn;
    TB_REGISTROSDS_OBSERVACAO: TIBStringField;
    dxDBGrid2DS_OBSERVACAO: TdxDBGridColumn;
    mmObs: TMemo;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    qyRegistrosHist: TIBQuery;
    qyRegistrosHistKEY: TIBStringField;
    qyRegistrosHistCD_UNIDADE: TIntegerField;
    qyRegistrosHistCD_PROVINCIA: TIntegerField;
    qyRegistrosHistCD_MUNICIPIO: TIntegerField;
    qyRegistrosHistVL_MESANO: TIBStringField;
    qyRegistrosHistFL_ACEITAR: TIBStringField;
    qyRegistrosHistFL_IMPORTAR: TIBStringField;
    qyRegistrosHistCD_ACEITAR_USU: TIntegerField;
    qyRegistrosHistDT_ACEITAR: TDateTimeField;
    qyRegistrosHistDT_IMPORTAR: TDateTimeField;
    qyRegistrosHistDT_INC_REGISTRO: TDateTimeField;
    qyRegistrosHistCD_INC_USUARIO: TIntegerField;
    qyRegistrosHistDT_EXPORTACAO: TDateTimeField;
    qyRegistrosHistCD_UND_ENVIO: TIntegerField;
    qyRegistrosHistNM_USU: TIBStringField;
    qyRegistrosHistVL_VERSAO: TIBStringField;
    qyRegistrosHistDS_OBSERVACAO: TIBStringField;
    qyRegistrosHistTIPO: TIntegerField;
    qyRegistrosHistDS_UNIDADE: TIBStringField;
    qyRegistrosHistUNIDADE_ENVIO: TIBStringField;
    qyRegistrosHistDS_MUNICIPIO: TIBStringField;
    qyRegistrosHistDS_PROVINCIA: TIBStringField;
    dsRegistroHist: TDataSource;
    TabSheet5: TTabSheet;
    dxDBGrid3: TdxDBGrid;
    qyAR: TIBQuery;
    dsAR: TDataSource;
    PopupMenu2: TPopupMenu;
    Confirmar1: TMenuItem;
    qyARSync: TIBQuery;
    qyARANO: TIBStringField;
    qyARDS_PROVINCIA: TIBStringField;
    qyARDT_REGISTRO: TDateTimeField;
    qyARDT_EXP: TDateTimeField;
    qyARTIPO: TIBStringField;
    dxDBGrid3ANO: TdxDBGridMaskColumn;
    dxDBGrid3DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid3DT_REGISTRO: TdxDBGridDateColumn;
    dxDBGrid3DT_EXP: TdxDBGridDateColumn;
    dxDBGrid3TIPO: TdxDBGridMaskColumn;
    qyARCD_PROVINCIA: TIntegerField;
    dxDBGrid3Column6: TdxDBGridColumn;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    dxDBGrid1Column24: TdxDBGridColumn;
    dxDBGrid1Column25: TdxDBGridColumn;
    dxDBGrid1Column26: TdxDBGridColumn;
    dxDBGrid1Column27: TdxDBGridColumn;
    dxDBGrid1Column28: TdxDBGridColumn;
    procedure Aceitar1Click(Sender: TObject);
    procedure Processar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TB_REGISTROSCalcFields(DataSet: TDataSet);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TB_REGISTROSBeforeOpen(DataSet: TDataSet);
    procedure Comparar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btCancelarClick(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
    procedure btEditarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure Confirmar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sSQLProtocolo:String;
    sArqHtml:string;
    bCompare:boolean;
    procedure ProcessaTodos;
    procedure ProcessarExclusao;
    procedure VisualizaPrograma(bVisualizar:boolean; var sArquivo:string; sTabela:string);
    procedure VisualizaAtv(bVisualizar:boolean; var sArquivo:string; sTabela:string);
    procedure VisualizaPtv(bVisualizar:boolean; var sArquivo:string; sTabela:string);
    procedure VisualizaTarv(bVisualizar:boolean; var sArquivo:string; sTabela:string);
    procedure VisualizaTarvEsquema(bVisualizar:boolean; var sArquivo:string; sTabela:string);
    procedure VisualizaTarvCD4(bVisualizar:boolean; var sArquivo:string; sTabela:string);
    procedure VisualizaTarvAcomp(bVisualizar:boolean; var sArquivo:string; sTabela:string);
    procedure VisualizaCOINFECCAO(bVisualizar:boolean; var sArquivo:string; sTabela:string);
  end;

var
  frmConfirmacaoEDI: TfrmConfirmacaoEDI;

implementation

uses UDMGERAL, UGeral, UGeralSQL,  ufrmEDI, UDM, ufrmMenuEDI, uRelatorioWEB,
  uCadPROGRAMA, uCadTARV, uCadATV, uCadPTV, uCadTARVCD4, uCadTARVACOMP,
  uCadTARVESQUEMA, uCadCOINFECCAO, ufrmCompare, UfrmLocalizar;

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

{    if (TB_REGISTROSDT_INC_REGISTRO.AsDateTime >=1 ) then
      begin
        sWhere := 'where      ' +
        '"CD_UNIDADE" = :CD_UNIDADE and ' +
        '"CD_PROVINCIA" = :CD_PROVINCIA and ' +
        '"CD_MUNICIPIO" = :CD_MUNICIPIO and ' +
        '"VL_MESANO" = :VL_MESANO and ' +
        'extract(day from DT_REGISTRO)||''/''|| ' +
        'extract(month from DT_REGISTRO)||''/''|| ' +
        'extract(year from DT_REGISTRO)||'' ''|| ' +
        'extract(hour from DT_REGISTRO)||'':''|| ' +
        'extract(minute from DT_REGISTRO) = :DT_REGISTRO';
      end;
}
  sSQL :=
     'insert into ' +sNomeTabela+' '+
     'select * from "'+sNomeTabela+'_EDI" ' +
     sWhere;

  qySync.SQL.Text := sSQL;
  qySync.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qySync.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qySync.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qySync.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
//  if (TB_REGISTROSDT_INC_REGISTRO.AsDateTime >=1 ) then
//    qySync.ParamByName('DT_REGISTRO').AsString := FormatDateTime('dd/mm/yyyy hh:nn', TB_REGISTROSDT_INC_REGISTRO.AsDateTime);

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
   1:VisualizaAtv(false, sArqHtml,'');
   2:VisualizaPtv(false, sArqHtml,'');
   3:VisualizaTarv(false, sArqHtml,'');
   4:VisualizaTarvEsquema(false,sArqHtml,'');
   5:VisualizaTarvCD4(false,sArqHtml,'');
   6:VisualizaTarvAcomp(false,sArqHtml,'');
   7:VisualizaPrograma(false,sArqHtml,'');
   8:VisualizacOINFECCAO(false,sArqHtml,'');
  end;

  dmGeral.TB_PROTOCOLO_ENVIO.Close;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('CD_UNIDADE').AsInteger := TB_REGISTROSCD_UNIDADE.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('CD_PROVINCIA').AsInteger := TB_REGISTROSCD_PROVINCIA.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('CD_MUNICIPIO').AsInteger := TB_REGISTROSCD_MUNICIPIO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  dmGeral.TB_PROTOCOLO_ENVIO.ParamByName('TP_PROTOCOLO').AsInteger := TB_REGISTROSTIPO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIO.Open;

  if dmGeral.TB_PROTOCOLO_ENVIO.IsEmpty then
  begin
    dmGeral.TB_PROTOCOLO_ENVIO.Insert;
    dmGeral.TB_PROTOCOLO_ENVIOCD_UND.AsString := prmUnidade;
  end
  else
    dmGeral.TB_PROTOCOLO_ENVIO.Edit;

  dmGeral.TB_PROTOCOLO_ENVIOTP_PROTOCOLO.AsInteger := TB_REGISTROSTIPO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOCD_REGISTRO_GERAL.AsInteger := 0;
  dmGeral.TB_PROTOCOLO_ENVIOCD_UNIDADE.AsInteger := TB_REGISTROSCD_UNIDADE.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOCD_PROVINCIA.AsInteger := TB_REGISTROSCD_PROVINCIA.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOCD_MUNICIPIO.AsInteger := TB_REGISTROSCD_MUNICIPIO.AsInteger;
  dmGeral.TB_PROTOCOLO_ENVIOVL_MESANO.AsString := TB_REGISTROSVL_MESANO.AsString;
  if FileExists(sArqHtml) then
    dmGeral.TB_PROTOCOLO_ENVIOBL_PROTOCOLO.LoadFromFile(sArqHtml);
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
//  if (TB_REGISTROSDT_INC_REGISTRO.AsDateTime >=1 ) then
//    qySync.ParamByName('DT_REGISTRO').AsString := FormatDateTime('dd/mm/yyyy hh:nn', TB_REGISTROSDT_INC_REGISTRO.AsDateTime);

  qySync.ExecSQL;

{ if (TB_REGISTROSDT_INC_REGISTRO.AsDateTime >=1 ) then
  begin
    sWhere := 'where      ' +
    '"CD_UNIDADE" = :CD_UNIDADE and ' +
    '"CD_PROVINCIA" = :CD_PROVINCIA and ' +
    '"CD_MUNICIPIO" = :CD_MUNICIPIO and ' +
    '"VL_MESANO" = :VL_MESANO and ' +
    'extract(day from DT_INC_REGISTRO)||''/''|| ' +
    'extract(month from DT_INC_REGISTRO)||''/''|| ' +
    'extract(year from DT_INC_REGISTRO)||'' ''|| ' +
    'extract(hour from DT_INC_REGISTRO)||'':''|| ' +
    'extract(minute from DT_INC_REGISTRO) = :DT_INC_REGISTRO';
  end;
}
  sSQL :=
     'delete from "'+sNomeTabela+'_PAI" ' +
     sWhere;

  qySync.SQL.Text := sSQL;
  qySync.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qySync.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qySync.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qySync.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
//  if (TB_REGISTROSDT_INC_REGISTRO.AsDateTime >=1 ) then
//    qySync.ParamByName('DT_INC_REGISTRO').AsString := FormatDateTime('dd/mm/yyyy hh:nn', TB_REGISTROSDT_INC_REGISTRO.AsDateTime);

  qySync.ExecSQL;

  dm.Commit(qySync);

end;

procedure TfrmConfirmacaoEDI.FormCreate(Sender: TObject);
begin
  sSQLProtocolo := TB_REGISTROS.SelectSQL.Text;
  TB_REGISTROS.Open;
  qyAR.Open;
end;

procedure TfrmConfirmacaoEDI.TB_REGISTROSCalcFields(
  DataSet: TDataSet);
begin
  TB_REGISTROSDS_TIPO.AsString :=
    Protocolo[TB_REGISTROSTIPO.AsInteger];

  TB_REGISTROSchave.AsInteger := TB_REGISTROS.RecNo;
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
   1:VisualizaAtv(true,sArq,'');
   2:VisualizaPtv(true,sArq,'');
   3:VisualizaTarv(true,sArq,'');
   4:VisualizaTarvEsquema(true,sArq,'');
   5:VisualizaTarvCD4(true,sArq,'');
   6:VisualizaTarvAcomp(true,sArq,'');
   7:VisualizaPrograma(true,sArq,'');
   8:VisualizacOINFECCAO(true,sArq,'');
  end;
end;

procedure TfrmConfirmacaoEDI.ProcessarExclusao;
//var sTabela:string;
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

procedure TfrmConfirmacaoEDI.VisualizaPrograma(bVisualizar:boolean; var sArquivo:string; sTabela:string);
begin
  frmCadPrograma := TfrmCadPrograma.Create(self);
  frmCadPrograma.limpar;
  frmCadPrograma.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadPrograma.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadPrograma.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadPrograma.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadPrograma.sNomeTabela := 'REGISTRO_PROGRAMA_EDI';
  if sTabela <> '' then
    frmCadPrograma.sNomeTabela := sTabela;
  frmCadPrograma.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioPrograma'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadPrograma.sArq := sArqHtml;
      frmCadPrograma.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioPrograma'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadPrograma.sArq := sArqHtml;
    frmCadPrograma.GeraXML;
  end;
  frmCadPrograma.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarv(bVisualizar:boolean; var sArquivo:string; sTabela:string);
begin
  frmCadTARV := TfrmCadTARV.Create(self);
  frmCadTARV.limpar;
  frmCadTARV.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARV.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARV.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARV.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARV.sNomeTabela := 'REGISTRO_TARV_EDI';
  if sTabela <> '' then
    frmCadTARV.sNomeTabela := sTabela;
  frmCadTARV.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioTARV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARV.sArq := sArqHtml;
      frmCadTARV.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioTARV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadTARV.sArq := sArqHtml;
    frmCadTARV.GeraXML;
  end;
  frmCadTARV.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaATV(bVisualizar:boolean; var sArquivo:string; sTabela:string);
begin
  frmCadATV := TfrmCadATV.Create(self);
  frmCadATV.limpar;
  frmCadATV.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadATV.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadATV.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadATV.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadATV.sNomeTabela := 'REGISTRO_ATV_EDI';
  if sTabela <> '' then
    frmCadATV.sNomeTabela := sTabela;
  frmCadATV.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadATV.sArq := sArqHtml;
      frmCadATV.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadATV.sArq := sArqHtml;
    frmCadATV.GeraXML;
  end;
  frmCadATV.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaPTV(bVisualizar:boolean; var sArquivo:string; sTabela:string);
begin
  frmCadPTV := TfrmCadPTV.Create(self);
  frmCadPTV.limpar;
  frmCadPTV.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadPTV.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadPTV.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadPTV.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadPTV.sNomeTabela := 'REGISTRO_PTV_EDI';
  if sTabela <> '' then
    frmCadPTV.sNomeTabela := sTabela;
  frmCadPTV.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioPTV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadPTV.sArq := sArqHtml;
      frmCadPTV.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioPTV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadPTV.sArq := sArqHtml;
    frmCadPTV.GeraXML;
  end;
  frmCadPTV.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarvAcomp(bVisualizar: boolean;
  var sArquivo: string; sTabela:string);
begin
  frmCadTARVACOMP := TfrmCadTARVACOMP.Create(self);
  frmCadTARVACOMP.limpar;
  frmCadTARVACOMP.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARVACOMP.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARVACOMP.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARVACOMP.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARVACOMP.sNomeTabela := 'REGISTRO_TARV_ACOMP_EDI';
  if sTabela <> '' then
    frmCadTARVACOMP.sNomeTabela := sTabela;
  frmCadTARVACOMP.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioTARVACOMP'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARVACOMP.sArq := sArqHtml;
      frmCadTARVACOMP.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioTARVACOMP'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadTARVACOMP.sArq := sArqHtml;
    frmCadTARVACOMP.GeraXML;
  end;
  frmCadTARVACOMP.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarvCD4(bVisualizar: boolean;
  var sArquivo: string; sTabela:string);
begin
  frmCadTARVCD4 := TfrmCadTARVCD4.Create(self);
  frmCadTARVCD4.limpar;
  frmCadTARVCD4.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARVCD4.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARVCD4.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARVCD4.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARVCD4.sNomeTabela := 'REGISTRO_TARV_CD4_EDI';
  if sTabela <> '' then
    frmCadTARVCD4.sNomeTabela := sTabela;
  frmCadTARVCD4.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioTARVCD4'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARVCD4.sArq := sArqHtml;
      frmCadTARVCD4.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioTARVCD4'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadTARVCD4.sArq := sArqHtml;
    frmCadTARVCD4.GeraXML;
  end;
  frmCadTARVCD4.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaTarvEsquema(bVisualizar: boolean;
  var sArquivo: string; sTabela:string);
begin
  frmCadTARVESQUEMA := TfrmCadTARVESQUEMA.Create(self);
  frmCadTARVESQUEMA.limpar;
  frmCadTARVESQUEMA.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadTARVESQUEMA.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadTARVESQUEMA.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadTARVESQUEMA.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadTARVESQUEMA.sNomeTabela := 'REGISTRO_TARV_ESQUEMA_EDI';
  if sTabela <> '' then
    frmCadTARVESQUEMA.sNomeTabela := sTabela;
  frmCadTARVESQUEMA.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioTARVESQ'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadTARVESQUEMA.sArq := sArqHtml;
      frmCadTARVESQUEMA.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioTARVESQ'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadTARVESQUEMA.sArq := sArqHtml;
    frmCadTARVESQUEMA.GeraXML;
  end;
  frmCadTARVESQUEMA.Free;
end;

procedure TfrmConfirmacaoEDI.VisualizaCOINFECCAO(bVisualizar: boolean;
  var sArquivo: string; sTabela:string);
begin
  frmCadCOINFECCAO := TfrmCadCOINFECCAO.Create(self);
  frmCadCOINFECCAO.limpar;
  frmCadCOINFECCAO.leProvincia.LookupValue := TB_REGISTROSCD_PROVINCIA.AsString;
  frmCadCOINFECCAO.leMunicipio.LookupValue := TB_REGISTROSCD_MUNICIPIO.AsString;
  frmCadCOINFECCAO.leUnidade.LookupValue := TB_REGISTROSCD_UNIDADE.AsString;
  frmCadCOINFECCAO.cbMesAno.Text := TB_REGISTROSVL_MESANO.AsString;
  frmCadCOINFECCAO.sNomeTabela := 'REGISTRO_COINFECCAO_EDI';
  if sTabela <> '' then
    frmCadCOINFECCAO.sNomeTabela := sTabela;
  frmCadCOINFECCAO.btConsultarClick(nil);

  if bVisualizar then
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArqHtml := sPathConsulta+'RelatorioCOINFECCAO'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      frmCadCOINFECCAO.sArq := sArqHtml;
      frmCadCOINFECCAO.GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArqHtml);
      frmRelatorioWEB.WindowState := wsMaximized;
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArqHtml) then
        DeleteFile(sArqHtml);
    end;
  end
  else
  begin
    sArqHtml := sPathConsulta+'RelatorioCOINFECCAO'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    sArquivo := sArqHtml;
    frmCadCOINFECCAO.sArq := sArqHtml;
    frmCadCOINFECCAO.GeraXML;
  end;
  frmCadCOINFECCAO.Free;
end;

procedure TfrmConfirmacaoEDI.Comparar1Click(Sender: TObject);
var sArq,sArq2:string;  frmRelatorioWEB1,frmRelatorioWEB2:TfrmRelatorioWEB;
begin
//
  frmRelatorioWEB1 := nil;
  frmRelatorioWEB2 := nil;
  frmCompare := TfrmCompare.Create(Application);
  try
    case TB_REGISTROSTIPO.AsInteger of
     1:begin
         VisualizaAtv(false,sArq,'');
         Sleep(1000);
         VisualizaAtv(false,sArq2,'REGISTRO_ATV');
     end;
     2:begin
         VisualizaPtv(false,sArq,'');
         Sleep(1000);
         VisualizaPtv(false,sArq2,'REGISTRO_PTV');
     end;
     3:begin
         VisualizaTarv(false,sArq,'');
         Sleep(1000);
         VisualizaTarv(false,sArq2,'REGISTRO_TARV');
     end;
     4:begin
         VisualizaTarvEsquema(false,sArq,'');
         Sleep(1000);
         VisualizaTarvEsquema(false,sArq2,'REGISTRO_TARV_ESQUEMA');
     end;
     5:begin
         VisualizaTarvCD4(false,sArq,'');
         Sleep(1000);
         VisualizaTarvCD4(false,sArq2,'REGISTRO_TARV_CD4');
     end;
     6:begin
         VisualizaTarvAcomp(false,sArq,'');
         Sleep(1000);
         VisualizaTarvAcomp(false,sArq2,'REGISTRO_TARV_ACOMP');
     end;
     7:begin
         VisualizaPrograma(false,sArq,'');
         Sleep(1000);
         VisualizaPrograma(false,sArq2,'REGISTRO_PROGRAMA');
     end;
     8:begin
         VisualizacOINFECCAO(false,sArq,'');
         Sleep(1000);
         VisualizacOINFECCAO(false,sArq2,'REGISTRO_COINFECCAO');
     end;
    end;

    frmRelatorioWEB1 := TfrmRelatorioWEB.Create(application);
    frmRelatorioWEB2 := TfrmRelatorioWEB.Create(application);
    frmRelatorioWEB1.BorderStyle := bsNone;
    frmRelatorioWEB1.WindowState := wsMaximized;
    frmRelatorioWEB2.BorderStyle := bsNone;
    frmRelatorioWEB2.WindowState := wsMaximized;
    frmRelatorioWEB1.relatorio.Navigate(sArq);     //Recebido
    frmRelatorioWEB2.relatorio.Navigate(sArq2);    //Existente
    frmRelatorioWEB1.Parent := frmCompare.sbDireita;
    frmRelatorioWEB2.Parent := frmCompare.sbEsquerda;
    frmRelatorioWEB2.Show;
    frmRelatorioWEB1.Show;
    frmCompare.WindowState := wsMaximized;
    frmCompare.ShowModal;
  finally
    frmRelatorioWEB1.Free;
    frmRelatorioWEB2.Free;
    frmCompare.Free;
    if FileExists(sArq) then
     DeleteFile(sArq);
    if FileExists(sArq2) then
     DeleteFile(sArq2);
  end;
end;

procedure TfrmConfirmacaoEDI.Excluir1Click(Sender: TObject);
var sWhere,sSQL,sNomeTabela:String;
begin
  sNomeTabela := TabelaProtocolo[TB_REGISTROSTIPO.AsInteger];
  sWhere := 'where      ' +
    '"CD_UNIDADE" = :CD_UNIDADE and ' +
    '"CD_PROVINCIA" = :CD_PROVINCIA and ' +
    '"CD_MUNICIPIO" = :CD_MUNICIPIO and ' +
    '"VL_MESANO" = :VL_MESANO ' ;

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

  TB_REGISTROS.Delete;
  dm.Commit(TB_REGISTROS);
end;

procedure TfrmConfirmacaoEDI.Timer1Timer(Sender: TObject);
begin
  statusbar1.Panels[0].Text:=''+FormatDateTime('hh:nn:ss',Now);//Exibe a hora atual
  statusbar1.Panels[1].Text:=''+FormatDateTime('dddd '', '' dd '' de '' mmmm '' de '' yyyy',Now);//Exibe a data atual

end;

procedure TfrmConfirmacaoEDI.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with StatusBar1.Canvas do
   begin
    FillRect(Rect);
    //Definir Font e Style
    Font.Name := 'Arial';
    Font.Color := ClNavy;
    //Font.Style := [FsBold];
    //Desenha as imagens de acordo com o indice de cada panel
    ImageList1.Draw(StatusBar1.Canvas,Rect.Left+5,Rect.Top+1,Panel.Index);

    //Escreve o texto em cada panel

    //Usuario
    if Panel.Index = 3 then
      TextOut(Rect.Left + 25, Rect.Top + 1,'Usuário: ' + dm.qyLoginNM_USUARIO.AsString);
    //Unidade
    if Panel.Index = 2 then
      TextOut(Rect.Left + 25, Rect.Top + 1,'Unidade: ' + prmUnidade +'-'+ sUnidadeDefautDescricao);

   end;

end;

procedure TfrmConfirmacaoEDI.BitBtn2Click(Sender: TObject);
begin
  Aceitar1Click(Sender);
  Processar1Click(Sender);
end;

procedure TfrmConfirmacaoEDI.BitBtn3Click(Sender: TObject);
begin
  Visualizar1Click(Sender);
end;

procedure TfrmConfirmacaoEDI.BitBtn4Click(Sender: TObject);
begin
  Comparar1Click(Sender);
end;

procedure TfrmConfirmacaoEDI.BitBtn5Click(Sender: TObject);
begin
  Excluir1Click(Sender);
end;

procedure TfrmConfirmacaoEDI.BitBtn1Click(Sender: TObject);
begin
  TB_REGISTROS.Close;
  TB_REGISTROS.Open;
  qyAR.Close;
  qyAR.Open;
end;

procedure TfrmConfirmacaoEDI.btIncluirClick(Sender: TObject);
begin
  dsSolicitacao.DataSet.Insert;
  pCadastro.Visible := true;
  pLista.Visible := false;
  btIncluir.Enabled := false;
  btCancelar.Enabled := true;
  btgravar.Enabled := true;

end;

procedure TfrmConfirmacaoEDI.btgravarClick(Sender: TObject);
begin
  pCadastro.Visible := false;
  pLista.Visible := true;
  dsSolicitacao.DataSet.Post;
  pCadastro.Visible := false;
  btIncluir.Enabled := true;
  btCancelar.Enabled := false;
  btgravar.Enabled := false;
  btAtualizarClick(Sender);
end;

procedure TfrmConfirmacaoEDI.btLocProvinciaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsSolicitacao.DataSet.State in [dsEdit, dsInsert]) then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Provincia';
    frmLocalizar.qyDados := SelectDadosProvincia;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,2);
      frmLocalizar.KeyField := 'cd_provincia';
      VCampo[0].Titulo  := 'Prov';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome da Provincia';
      VCampo[1].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      dmGeral.TB_ST_UNIDADECD_PROVINCIA.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
      dmGeral.TB_ST_UNIDADEDS_PROVINCIA.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;

end;

procedure TfrmConfirmacaoEDI.btLocMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsSolicitacao.DataSet.State in [dsEdit, dsInsert]) and (btLocProvincia.Text <> '') then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  try
    if(dsSolicitacao.DataSet.FieldByName('CD_PROVINCIA').AsString<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(dsSolicitacao.DataSet.FieldByName('CD_PROVINCIA').AsInteger);
      frmLocalizar.Where := true;
    end;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Municipio';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome do Municipio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_ST_UNIDADECD_MUNICIPIO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_ST_UNIDADEDS_MUNICIPIO.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
  end
  else
  if btLocProvincia.Text = '' then
    MessageDlg('Necessário incluir a Província!',mtInformation,[mbOK],0);
end;

procedure TfrmConfirmacaoEDI.btLocUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsSolicitacao.DataSet.State in [dsEdit, dsInsert]) and (btLocProvincia.Text <> '') then
    begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Unidade';
    frmLocalizar.qyDados.SQL.Clear;
    frmLocalizar.qyDados.SQL.Add('select                                                                                                        '+
                                  'u.cd_unidade,                                                                                                 '+
                                  'u.ds_unidade,                                                                                                 '+
                                  'u.cd_provincia,                                                                                               '+
                                  'p.ds_provincia,                                                                                               '+
                                  'u.cd_municipio,                                                                                               '+
                                  'm.ds_municipio,                                                                                               '+
                                  'u.fl_ativa,                                                                                                   '+
                                  ' (select case when s.cd_servico = 1 then 1 else 0 end from servicos s inner join unidade_servicos us          '+
                                  '  on us.cd_unidade = u.cd_unidade where s.cd_servico = us.cd_servico and s.cd_servico = 1) as "ATIP",         '+
                                  ' (select case when s.cd_servico = 2 then 1 else 0 end from servicos s inner join unidade_servicos us          '+
                                  '  on us.cd_unidade = u.cd_unidade where s.cd_servico = us.cd_servico and s.cd_servico = 2) as "PTV",          '+
                                  ' (select case when s.cd_servico = 3 then 1 else 0 end from servicos s inner join unidade_servicos us          '+
                                  '  on us.cd_unidade = u.cd_unidade where s.cd_servico = us.cd_servico and s.cd_servico = 3) as "TARV_INFANTIL",'+
                                  ' (select case when s.cd_servico = 4 then 1 else 0 end from servicos s inner join unidade_servicos us          '+
                                  '  on us.cd_unidade = u.cd_unidade where s.cd_servico = us.cd_servico and s.cd_servico = 4) as "TARV_ADULTO",   '+
                                  ' (select case when s.cd_servico = 5 then 1 else 0 end from servicos s inner join unidade_servicos us          '+
                                  '  on us.cd_unidade = u.cd_unidade where s.cd_servico = us.cd_servico and s.cd_servico = 5) as "COINF",   '+
                                  '   (select us.dt_inicio from unidade_servicos us where us.cd_unidade = u.cd_unidade     '+
                                  '   and us.cd_servico = 1) as "DTATIP",                                                  '+
                                  '   (select us.dt_inicio from unidade_servicos us where us.cd_unidade = u.cd_unidade     '+
                                  '   and us.cd_servico = 2) as "DTPTV",                                                   '+
                                  '   (select us.dt_inicio from unidade_servicos us where us.cd_unidade = u.cd_unidade     '+
                                  '   and us.cd_servico = 3) as "DTTARV_INFANTIL",                                         '+
                                  '   (select us.dt_inicio from unidade_servicos us where us.cd_unidade = u.cd_unidade     '+
                                  '   and us.cd_servico = 4) as "DTTARV_ADULTO",                                           '+
                                  ' (select us.dt_inicio from unidade_servicos us where us.cd_unidade = u.cd_unidade       '+
                                  '   and us.cd_servico = 5) as "DTCOINF"                                                 '+
                                  'from unidade u                                                                                                '+
                                  '  left outer join provincia p                                                                                 '+
                                  '  on u.cd_provincia = p.cd_provincia                                                                          '+
                                  '  left outer join municipio m                                                                                 '+
                                  '  on u.cd_municipio = m.cd_municipio where u.cd_provincia = :PROVINCIA                                        ');
    frmLocalizar.qyDados.ParamByName('PROVINCIA').AsInteger := StrToInt(btLocProvincia.Text);


    try
      frmLocalizar.Where := true;
      SetLength(VCampo,17);
      frmLocalizar.KeyField := 'u.cd_unidade';
      VCampo[0].Titulo  := 'Unidade';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome';
      VCampo[1].Width := 50;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[3].Visivel := false;
      VCampo[4].Visivel := false;
      VCampo[5].Visivel := false;
      VCampo[6].Visivel := false;
      VCampo[7].Visivel := false;
      VCampo[8].Visivel := false;
      VCampo[9].Visivel := false;
      VCampo[10].Visivel := false;
      VCampo[11].Visivel := false;
      VCampo[12].Visivel := false;
      VCampo[13].Visivel := false;
      VCampo[14].Visivel := false;
      VCampo[15].Visivel := false;
      VCampo[16].Visivel := false;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      dmGeral.TB_ST_UNIDADECD_UNIDADE.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
      dmGeral.TB_ST_UNIDADEDS_UNIDADE.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
      dmGeral.TB_ST_UNIDADECD_PROVINCIA.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
      dmGeral.TB_ST_UNIDADEDS_PROVINCIA.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
      dmGeral.TB_ST_UNIDADECD_MUNICIPIO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
      dmGeral.TB_ST_UNIDADEDS_MUNICIPIO.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
      dmGeral.TB_ST_UNIDADEFL_ATIVA.AsString := frmLocalizar.qyDados.FieldByname('fl_ativa').AsString;
      dmGeral.TB_ST_UNIDADECD_ATIP.AsInteger := frmLocalizar.qyDados.FieldByname('ATIP').AsInteger;
      dmGeral.TB_ST_UNIDADECD_PTV.AsInteger := frmLocalizar.qyDados.FieldByname('PTV').AsInteger;
      dmGeral.TB_ST_UNIDADECD_TARV_I.AsInteger := frmLocalizar.qyDados.FieldByname('TARV_INFANTIL').AsInteger;
      dmGeral.TB_ST_UNIDADECD_TARV_A.AsInteger := frmLocalizar.qyDados.FieldByname('TARV_ADULTO').AsInteger;
      dmGeral.TB_ST_UNIDADECD_COINF.AsInteger := frmLocalizar.qyDados.FieldByname('COINF').AsInteger;
      dmGeral.TB_ST_UNIDADEDT_INI_ATIP.AsString := frmLocalizar.qyDados.FieldByname('DTATIP').AsString;
      dmGeral.TB_ST_UNIDADEDT_INI_PTV.AsString := frmLocalizar.qyDados.FieldByname('DTPTV').AsString;
      dmGeral.TB_ST_UNIDADEDT_INI_TARV_I.AsString := frmLocalizar.qyDados.FieldByname('DTTARV_INFANTIL').AsString;
      dmGeral.TB_ST_UNIDADEDT_INI_TARV_A.AsString := frmLocalizar.qyDados.FieldByname('DTTARV_ADULTO').AsString;
      dmGeral.TB_ST_UNIDADEDT_INI_COINF.AsString := frmLocalizar.qyDados.FieldByname('DTCOINF').AsString;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end
  else
  if btLocProvincia.Text = '' then
    MessageDlg('Necessário incluir a Província!',mtInformation,[mbOK],0);
end;

procedure TfrmConfirmacaoEDI.btCancelarClick(Sender: TObject);
begin
  dsSolicitacao.DataSet.Cancel;
  pCadastro.Visible := false;
  pLista.Visible := true;
  btIncluir.Enabled := true;
  btCancelar.Enabled := false;
  btgravar.Enabled := false;
end;

procedure TfrmConfirmacaoEDI.btAtualizarClick(Sender: TObject);
begin
  if not (dsSolicitacao.DataSet.State in [dsEdit, dsInsert]) then
  begin
    dsSolicitacao.DataSet.Close;
    dsSolicitacao.DataSet.Open;
  end;
end;

procedure TfrmConfirmacaoEDI.PageControl1Change(Sender: TObject);
begin

  qyRegistrosHist.Active := PageControl1.TabIndex = 2;

  if PageControl1.TabIndex = 1 then
  begin
    btAtualizarClick(Sender);
    Panel2.Visible := false;
  end;

  if PageControl1.TabIndex = 0 then
    Panel2.Visible := true;

  if PageControl1.TabIndex = 2 then
    Panel2.Visible := false;

  if PageControl1.TabIndex = 3 then
    Panel2.Visible := false;

end;

procedure TfrmConfirmacaoEDI.dsDadosDataChange(Sender: TObject;
  Field: TField);
begin
  mmObs.Text := TB_REGISTROSDS_OBSERVACAO.AsString;
end;

procedure TfrmConfirmacaoEDI.btEditarClick(Sender: TObject);
begin
  mmObs.Enabled := true;
  mmObs.Color := clWindow;
  mmObs.SetFocus;
end;

procedure TfrmConfirmacaoEDI.btSalvarClick(Sender: TObject);
var sWhere,sSQL,sNomeTabela, sAux:String;
begin

  sNomeTabela := TabelaProtocolo[TB_REGISTROSTIPO.AsInteger];

  sWhere := 'where      ' +
    '"CD_UNIDADE" = :CD_UNIDADE and ' +
    '"CD_PROVINCIA" = :CD_PROVINCIA and ' +
    '"CD_MUNICIPIO" = :CD_MUNICIPIO and ' +
    '"VL_MESANO" = :VL_MESANO ' ;

  sSQL :=
     'update "'+sNomeTabela+'_PAI" ' +
     ' set ds_observacao = ' + QuotedStr(mmObs.Text) + ' ' +
     sWhere;

  qySync.SQL.Text := sSQL;
  qySync.ParamByName('CD_UNIDADE').AsString := TB_REGISTROSCD_UNIDADE.AsString;
  qySync.ParamByName('CD_PROVINCIA').AsString := TB_REGISTROSCD_PROVINCIA.AsString;
  qySync.ParamByName('CD_MUNICIPIO').AsString := TB_REGISTROSCD_MUNICIPIO.AsString;
  qySync.ParamByName('VL_MESANO').AsString := TB_REGISTROSVL_MESANO.AsString;
  qySync.ExecSQL;

  sAux := mmObs.Text;
  TB_REGISTROS.Edit;
  TB_REGISTROSDS_OBSERVACAO.AsString := sAux;
  TB_REGISTROS.Post;


  mmObs.Enabled := false;
  mmObs.Color := cl3DLight;

end;

procedure TfrmConfirmacaoEDI.Confirmar1Click(Sender: TObject);
var
  sSQL:String;
  
  procedure ConfirmarAR(sTabela:String);
  begin
    //delete _AR
    sSQL :=
       'delete from "'+sTabela+'" ' +
       'where cd_provincia =:provincia';

    qyARSync.SQL.Text := sSQL;
    qyARSync.ParamByName('provincia').AsString := qyARCD_PROVINCIA.AsString;
    qyARSync.ExecSQL;

    //Insert de/para
    sSQL :=
     'insert into ' +sTabela+' '+
     'select * from "'+sTabela+'E" ' +
     'where cd_provincia =:provincia';

    qyARSync.SQL.Text := sSQL;
    qyARSync.ParamByName('provincia').AsString := qyARCD_PROVINCIA.AsString;
    qyARSync.ExecSQL;

    //delete _ARE
    sSQL :=
       'delete from "'+sTabela+'E" ' +
       'where cd_provincia =:provincia';

    qyARSync.SQL.Text := sSQL;
    qyARSync.ParamByName('provincia').AsString := qyARCD_PROVINCIA.AsString;
    qyARSync.ExecSQL;

  end;
begin
  if TB_REGISTROS.Locate('cd_provincia', qyARCD_PROVINCIA.AsInteger,[]) then
  begin
    MessageDlg('Pendente na Confirmação. Favor verificar a Aba Relatórios.',mtInformation,[mbOK],0);
    abort;
  end;

  if not qyAR.Eof then
  begin
    ConfirmarAR('REGISTRO_ATV_AR');
    ConfirmarAR('REGISTRO_PTV_AR');
    ConfirmarAR('REGISTRO_TARV_AR');
    ConfirmarAR('REGISTRO_TARV_ACOMP_AR');
    ConfirmarAR('REGISTRO_TARV_ESQUEMA_AR');
    ConfirmarAR('REGISTRO_TARV_CD4_AR');
    ConfirmarAR('REGISTRO_COINFECCAO_AR');
    ConfirmarAR('REGISTRO_PROGRAMA_AR');
    qyAR.Close;
    qyAR.Open;
  end;
end;

end.
