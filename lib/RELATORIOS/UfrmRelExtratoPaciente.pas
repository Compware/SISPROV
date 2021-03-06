unit UfrmRelExtratoPaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPadFast, frxExportImage, frxExportRTF, frxExportHTML,
  frxExportPDF, frxClass, frxExportXLS, frxDBSet, DB, IBCustomDataSet,
  IBQuery, StdCtrls, Buttons, ExtCtrls, ComCtrls, dxEdLib, dxCntner,
  dxEditor, dxExEdtr, ufrmLocalizar, uGeral;

type
  TfrmRelExtratoPaciente = class(TfrmRelPadFast)
    tabFiltro: TTabSheet;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    btLocUtente: TdxButtonEdit;
    edUtente: TdxEdit;
    procedure btLocUtenteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btImprimirClick(Sender: TObject);
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelExtratoPaciente: TfrmRelExtratoPaciente;

implementation

{$R *.dfm}

procedure TfrmRelExtratoPaciente.btLocUtenteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Utente';
  frmLocalizar.qyDados.SQL.Text := 'select cd_Paciente, nr_Processo, '+
                                   'nm_Paciente from paciente';

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,3);
    frmLocalizar.KeyField := 'cd_Paciente';
    VCampo[0].Titulo  := 'C�d.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Processo';
    VCampo[1].Width := 25;
    VCampo[2].Titulo  := 'Nome';
    VCampo[2].Width := 80;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocUtente.Text := frmLocalizar.qyDados.FieldByname('cd_Paciente').AsString;
    edUtente.Text := frmLocalizar.qyDados.FieldByname('nm_Paciente').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

procedure TfrmRelExtratoPaciente.btImprimirClick(Sender: TObject);
var sRel:string;
begin
  inherited;
  if (btLocUtente.Text <> '') then
  begin
    qyGeral.Open;
    sRel := '\RelMapaMedicoExtrato.fr3';
    frxReport1.LoadFromFile(sPathLayOut + sRel);
    frxReport1.ShowReport;
  end;
end;

procedure TfrmRelExtratoPaciente.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyGeral.ParamByName('CD_paciente').AsString := btLocUtente.Text;
end;

end.
