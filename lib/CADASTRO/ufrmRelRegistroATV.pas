unit ufrmRelRegistroATV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, ComCtrls, RpCon, RpConDS, RpBase, RpSystem,
  RpDefine, RpRave, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, dxExEdtr, dxEdLib, dxCntner, dxEditor, RpRenderRTF,
  RpRenderHTML, RpRender, RpRenderPDF;

type
  TfrmRelRegistroATV = class(TfrmRelPad)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btLocUnidade: TdxButtonEdit;
    edUnidade: TdxEdit;
    btLocProvincia: TdxButtonEdit;
    edProvincia: TdxEdit;
    btLocMunicipio: TdxButtonEdit;
    edMunicipio: TdxEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    procedure btLocUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeChange(Sender: TObject);
    procedure btLocProvinciaChange(Sender: TObject);
    procedure btLocMunicipioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRegistroATV: TfrmRelRegistroATV;

implementation

uses UfrmLocalizar, UGeralSQL;

{$R *.dfm}

procedure TfrmRelRegistroATV.btLocUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados := SelectDadosUnidade;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'Cód.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Unidade';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocUnidade.Text := frmLocalizar.qyDados.FieldByname('cd_unidade').AsString;
    edUnidade.Text := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmRelRegistroATV.btLocProvinciaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;
  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'Cód.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Provincia';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocProvincia.text := frmLocalizar.qyDados.FieldByname('cd_provincia').AsString;
    edProvincia.text := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmRelRegistroATV.btLocMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Município';
  try
    if (btLocProvincia.Text<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(strToInt(btLocProvincia.Text));
      frmLocalizar.Where := true;
    end;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Cód.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Município';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocMunicipio.text := frmLocalizar.qyDados.FieldByname('cd_municipio').AsString;
    edMunicipio.text := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmRelRegistroATV.btLocUnidadeChange(Sender: TObject);
begin
  inherited;
  if btLocUnidade.Text = '' then
    edUnidade.Clear;

end;

procedure TfrmRelRegistroATV.btLocProvinciaChange(Sender: TObject);
begin
  inherited;
  if btLocProvincia.Text = '' then
    edProvincia.Clear;

end;

procedure TfrmRelRegistroATV.btLocMunicipioChange(Sender: TObject);
begin
  inherited;
  if btLocMunicipio.Text = '' then
    edMunicipio.Clear;

end;

end.
