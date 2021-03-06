unit UfrmRelMapaMedicoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPadFast, frxExportImage, frxExportRTF, frxExportHTML,
  frxExportPDF, frxClass, frxExportXLS, frxDBSet, DB, IBCustomDataSet,
  IBQuery, StdCtrls, Buttons, ExtCtrls, ComCtrls, dxEdLib, dxCntner,
  dxEditor, dxExEdtr, ufrmLocalizar, uGeral;

type
  TfrmRelMapaMedicoPeriodo = class(TfrmRelPadFast)
    tabFiltro: TTabSheet;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    btLocMedico: TdxButtonEdit;
    edMedico: TdxEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btImprimirClick(Sender: TObject);
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMapaMedicoPeriodo: TfrmRelMapaMedicoPeriodo;
  fsSQL:String;
implementation

{$R *.dfm}

procedure TfrmRelMapaMedicoPeriodo.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Medico';
  frmLocalizar.qyDados.SQL.Text := 'select cd_medico, nm_medico '+
                                   'from medico';

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_medico';
    VCampo[0].Titulo  := 'C�d.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 50;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocMedico.Text := frmLocalizar.qyDados.FieldByname('cd_medico').AsString;
    edMedico.Text := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

procedure TfrmRelMapaMedicoPeriodo.btImprimirClick(Sender: TObject);
var sRel:string;
begin
  inherited;
  if (btLocMedico.Text<>'') then
    qyGeral.SQL.Text := StringReplace(FsSQL,'/*MEDICO*/',
      'and   ("MAPA_MEDICO"."CD_MEDICO" = :CD_MEDICO)',[]);
  qyGeral.Open;
  sRel := '\RelMapaMedicoPeriodo.fr3';
  frxReport1.LoadFromFile(sPathLayOut + sRel);
  frxReport1.ShowReport;
end;

procedure TfrmRelMapaMedicoPeriodo.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if (btLocMedico.Text<>'') then
    qyGeral.ParamByName('CD_MEDICO').AsString := btLocMedico.Text;

  if (dtDe.Date > 0) then
    qyGeral.ParamByName('DE').AsDate := dtDe.Date;
  if (dtAte.Date > 0) then
    qyGeral.ParamByName('ATE').AsDate := dtAte.Date;
end;

procedure TfrmRelMapaMedicoPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  fsSQL := qyGeral.SQL.Text;
end;

end.
