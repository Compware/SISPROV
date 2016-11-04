unit UfrmControleGestantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UframeControleGestante, StdCtrls, dxCntner, dxEditor,
  dxEdLib, DB, IBCustomDataSet, IBQuery, Buttons, dxDBELib, frxClass,
  frxExportPDF, frxDBSet;

type
  TfrmControleGestantes = class(TForm)
    frameControleGestante1: TframeControleGestante;
    Panel1: TPanel;
    qyProcuraPaciente: TIBQuery;
    dsProcuraPaciente: TDataSource;
    btPesquisar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    dxDBEdit1: TdxDBEdit;
    dxDBEdit2: TdxDBEdit;
    qyProcuraPacienteCD_PACIENTE: TIntegerField;
    qyProcuraPacienteNM_PACIENTE: TIBStringField;
    qyProcuraPacienteNR_PROCESSO: TIntegerField;
    btCancelar: TBitBtn;
    btEditar: TBitBtn;
    btGravar: TBitBtn;
    btRelatorio: TBitBtn;
    fxGestante: TfrxReport;
    fxdbGestacoes: TfrxDBDataset;
    fxdbPaciente: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    qyProcuraPacienteDS_UNIDADE: TIBStringField;
    qyProcuraPacienteDS_MUNICIPIO: TIBStringField;
    qyProcuraPacienteDS_PROVINCIA: TIBStringField;
    procedure qyProcuraPacienteAfterOpen(DataSet: TDataSet);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure frameControleGestante1btInserirClick(Sender: TObject);
    procedure btRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    procedure inicializaControles;
  public
    { Public declarations }
  end;

var
  frmControleGestantes: TfrmControleGestantes;

implementation

uses UDM, ufrmLocalizar, UGeralSQL, UGeral;

{$R *.dfm}

procedure TfrmControleGestantes.qyProcuraPacienteAfterOpen(
  DataSet: TDataSet);
begin
  if not frameControleGestante1.qyGestante.Active then
    frameControleGestante1.qyGestante.Open;
end;

procedure TfrmControleGestantes.btPesquisarClick(Sender: TObject);
begin
  frameControleGestante1.Cancelar;
  inicializaControles;
  try
    if not Assigned(frmLocalizar) then
      frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Utente';
    frmLocalizar.qyDados := SelectDadosPaciente;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,5);
      frmLocalizar.KeyField := 'cd_paciente';
      VCampo[0].Titulo  := 'Cód.';
      VCampo[0].Width := 6;
      VCampo[1].Titulo  := 'Nome Utente';
      VCampo[1].Width := 25;
      VCampo[2].Titulo  := 'Nome Mãe';
      VCampo[2].Width := 25;
      VCampo[3].Titulo  := 'Data Nasc.';
      VCampo[3].Width := 13;
      VCampo[4].Titulo  := 'Nr. Processo';
      VCampo[4].Width := 10;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := True;
      VCampo[3].Visivel := True;
      VCampo[4].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      qyProcuraPaciente.Close;
      qyProcuraPaciente.ParamByName('CD_PACIENTE').AsInteger := frmLocalizar.qyDados.FieldByname('cd_paciente').AsInteger;
      qyProcuraPaciente.Open;
    end;
  finally
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;

end;


procedure TfrmControleGestantes.inicializaControles;
begin
  bteditar.Enabled := true;
  btgravar.Enabled := false;
  btCancelar.Enabled := false;
end;

procedure TfrmControleGestantes.FormCreate(Sender: TObject);
begin
  inicializaControles;
end;

procedure TfrmControleGestantes.btCancelarClick(Sender: TObject);
begin
  frameControleGestante1.Cancelar;
  inicializaControles;
end;

procedure TfrmControleGestantes.btEditarClick(Sender: TObject);
begin
  frameControleGestante1.Editar;
  bteditar.Enabled := false;
  btgravar.Enabled := true;
  btCancelar.Enabled := true;
end;

procedure TfrmControleGestantes.btGravarClick(Sender: TObject);
begin
  frameControleGestante1.Gravar;
  inicializaControles;
end;

procedure TfrmControleGestantes.frameControleGestante1btInserirClick(
  Sender: TObject);
begin
  frameControleGestante1.btInserirClick(Sender);

end;

procedure TfrmControleGestantes.btRelatorioClick(Sender: TObject);
var sRel:string;
begin
  sRel := '\RelGestante.fr3';
  fxGestante.LoadFromFile(sPathLayOut + sRel);
  fxGestante.ShowReport;
end;

end.
