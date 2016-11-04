unit UfrmRelGestante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, CheckLst, DB, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, ExtCtrls, IBCustomDataSet, IBQuery, uGeral, Mask,
  ToolEdit, RxLookup, ComCtrls, Menus, dxDBTLCl, dxGrClms,uCadNotificacao,
  ufrmDlgStatus, frxClass, frxExportPDF, frxDBSet, UframeControleGestante;

type
  TfrmRelGestante = class(TForm)
    Panel1: TPanel;
    ckComProcesso: TCheckBox;
    grDados: TdxDBGrid;
    dsGestantes: TDataSource;
    btPesquisar: TBitBtn;
    lbStatus: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtDe: TDateTimePicker;
    Label5: TLabel;
    dtAte: TDateTimePicker;
    ckPeriodo: TCheckBox;
    Label6: TLabel;
    qyGestantes: TIBDataSet;
    grDadosN_Processo: TdxDBGridColumn;
    grDadosNMPaciente: TdxDBGridColumn;
    grDadosFL_Gestante: TdxDBGridCheckColumn;
    grDadosNR_Meses: TdxDBGridColumn;
    grDadosDT_Notificacao: TdxDBGridDateColumn;
    Panel3: TPanel;
    btCancelar: TBitBtn;
    btEditar: TBitBtn;
    btGravar: TBitBtn;
    fxGestante: TfrxReport;
    fxdbGestantes: TfrxDBDataset;
    fxdbUnidade: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    BitBtn1: TBitBtn;
    frameControleGestante1: TframeControleGestante;
    qyGestantesNR_PROCESSO: TIntegerField;
    qyGestantesNM_PACIENTE: TIBStringField;
    qyGestantesFL_GESTANTE: TIntegerField;
    qyGestantesNR_MESES: TIntegerField;
    qyGestantesDT_INICIO_GESTACAO: TDateField;
    qyGestantesDT_FIM_GESTACAO: TDateField;
    grDadosDT_FIM_GESTACAO: TdxDBGridDateColumn;
    qyGestantesCD_PACIENTE: TIntegerField;
    qyUnidade: TIBQuery;
    dsUnidade: TDataSource;
    qyUnidadeDS_UNIDADE: TIBStringField;
    qyUnidadeDS_MUNICIPIO: TIBStringField;
    qyUnidadeDS_PROVINCIA: TIBStringField;
    qyGestantesCODIGO: TIntegerField;
    procedure btPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qyGestantesAfterOpen(DataSet: TDataSet);
    procedure btEditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure qyGestantesBeforeScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure qyGestantesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure inicializaControles;
  public
    { Public declarations }
  end;

var
  frmRelGestante: TfrmRelGestante;
  sSQL:string;
  bExportando:boolean;
  PSQL, MSQL, USQL:string;

implementation

uses UDM;

{$R *.dfm}

procedure TfrmRelGestante.btPesquisarClick(Sender: TObject);
begin
  qyGestantes.Close;
  qyGestantes.SelectSQL.Text := sSQL;

  if ckPeriodo.Checked then
   qyGestantes.SelectSQL.Add('and G.DT_INICIO_GESTACAO Between :DE and :ATE');

  if ckComProcesso.Checked then
   qyGestantes.SelectSQL.Add('and P.NR_PROCESSO is not null');

  qyGestantes.SelectSQL.Add('order by G.DT_INICIO_GESTACAO DESC');

  if ckPeriodo.Checked then
  begin
     qyGestantes.ParamByName('DE').AsDate := trunc(dtDe.Date);
     qyGestantes.ParamByName('ATE').AsDate := trunc(dtAte.Date);
  end;

  qyGestantes.Active := true;
  qyGestantes.First;
  
end;

procedure TfrmRelGestante.FormCreate(Sender: TObject);
begin
  inicializaControles;
  sSQL:=qyGestantes.SelectSQL.Text;
  qyGestantes.Prepare;

  grDados.IniFileName := sPathGrid + '\' + self.Name + '.ini';
end;

procedure TfrmRelGestante.FormShow(Sender: TObject);
begin
  dtDe.Date := Date;
  dtAte.Date := Date;
end;

procedure TfrmRelGestante.qyGestantesAfterOpen(
  DataSet: TDataSet);
begin
  if not frameControleGestante1.qyGestante.Active then
    frameControleGestante1.qyGestante.Open;
end;

procedure TfrmRelGestante.inicializaControles;
begin
  bteditar.Enabled := true;
  btgravar.Enabled := false;
  btCancelar.Enabled := false;
end;

procedure TfrmRelGestante.btEditarClick(Sender: TObject);
begin
  frameControleGestante1.Editar;
  bteditar.Enabled := false;
  btgravar.Enabled := true;
  btCancelar.Enabled := true;
end;

procedure TfrmRelGestante.btCancelarClick(Sender: TObject);
begin
  frameControleGestante1.Cancelar;
  InicializaControles;
end;

procedure TfrmRelGestante.btGravarClick(Sender: TObject);
begin
  frameControleGestante1.Gravar;
  inicializaControles;
end;

procedure TfrmRelGestante.qyGestantesBeforeScroll(
  DataSet: TDataSet);
begin
  btCancelarClick(nil);
end;

procedure TfrmRelGestante.BitBtn1Click(Sender: TObject);
var sRel:string;
begin
  qyUnidade.Close;
  qyUnidade.ParamByName('CD_UNIDADE').AsString := prmUnidade;
  qyUnidade.Open;

  sRel := '\RelGestantes.fr3';
  fxGestante.LoadFromFile(sPathLayOut + sRel);
  fxGestante.ShowReport;

  qyUnidade.Close;
end;

procedure TfrmRelGestante.qyGestantesCalcFields(DataSet: TDataSet);
begin
  qyGestantesCODIGO.AsInteger := qyGestantes.RecNo;
end;

end.
