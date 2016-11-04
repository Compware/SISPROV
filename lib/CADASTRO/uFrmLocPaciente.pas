unit uFrmLocPaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxEdLib, dxCntner, dxEditor, dxExEdtr,
  ExtCtrls, Mask, ToolEdit;

type
  TfrmLocPaciente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    btLocProvincia: TdxButtonEdit;
    edProvincia: TdxEdit;
    btLocMunicipio: TdxButtonEdit;
    edMunicipio: TdxEdit;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edNome: TEdit;
    edSexo: TComboBox;
    ckGestante: TCheckBox;
    edData: TDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    edIdade: TEdit;
    Label7: TLabel;
    edNomeMae: TEdit;
    Label15: TLabel;
    edprocesso: TdxEdit;
    edprocessocriancaexp: TdxEdit;
    Label8: TLabel;
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvinciaChange(Sender: TObject);
    procedure btLocMunicipioChange(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btLocProvinciaExit(Sender: TObject);
    procedure btLocMunicipioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocPaciente: TfrmLocPaciente;

implementation

uses Math, UCadPaciente, UfrmLocalizar, UGeralSQL;

{$R *.dfm}

procedure TfrmLocPaciente.btLocProvinciaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
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

procedure TfrmLocPaciente.btLocMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
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

procedure TfrmLocPaciente.btLocProvinciaChange(Sender: TObject);
begin
  if btLocProvincia.Text = '' then
    edProvincia.Clear
  else if btLocProvincia.Modified then
  begin
    try
      edProvincia.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btLocProvincia.Text],nil);
    except
      begin
        edProvincia.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocPaciente.btLocMunicipioChange(Sender: TObject);
begin
  if btLocMunicipio.Text = '' then
    edMunicipio.Clear
  else if btLocMunicipio.Modified then
  begin
    if btLocProvincia.text <> '' then
    begin
      try
        edMunicipio.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btLocMunicipio.Text],nil);
       except
          begin
            edMunicipio.Clear;
          end;
       end;
      end
    else
      begin
        btLocMunicipio.Clear;
        edMunicipio.Clear;
        MessageDlg('É necessário incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;

end;

procedure TfrmLocPaciente.btConfirmarClick(Sender: TObject);
var
  sWhere :String;
begin
  sWhere := 'WHERE';
  frmCadPaciente.qyPaciente.Close;
  frmCadPaciente.qyPaciente.SQL.Text := sPSQL;

  if edNome.Text <> '' then
    begin
     frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' Upper(NM_PACIENTE) like('''+ UpperCase(ednome.Text) + '%'')');
     sWhere := 'AND';
    end;

  If edprocesso.Text <> '' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.NR_PROCESSO = ''' +edprocesso.Text + '''');
      sWhere := 'AND';
    end;

  If edprocessocriancaexp.Text <> '' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.NR_PROCESSO_CRIANCA_EXP like('''+ UpperCase(edprocessocriancaexp.Text) + '%'')');
      sWhere := 'AND';
    end;

  if edSexo.Text = 'Feminino' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.TP_SEXO = ''' +'F'+ '''');
      sWhere := 'AND';
    end;

  if edSexo.Text = 'Masculino' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.TP_SEXO = ''' +'M'+ '''');
      sWhere := 'AND';
    end;

  if ckGestante.Checked then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.FL_GESTANTE = 1');
      sWhere := 'AND';
    end;

  if edData.Text <> '  /  /    ' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.DT_NASCIMENTO =:DATA');
      frmCadPaciente.qyPaciente.ParamByName('DATA').AsDate := eddata.Date;
      sWhere := 'AND';
    end;

  if edIdade.Text <> '' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.IDADE = ''' +
                              edIdade.Text + '''');
      sWhere := 'AND';
    end;

  if edNomeMae.Text <> '' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' Upper(PACIENTE.NM_MAE) like('''+ UpperCase(edNomeMae.Text) + '%'')');
      sWhere := 'AND';
    end;

  If btLocProvincia.Text <> '' then
    begin
      frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.CD_NAR_PROVINCIA = ''' +
                              btLocProvincia.Text + '''');
      sWhere := 'AND';
      If btLocMunicipio.Text <> '' then
        begin
          frmCadPaciente.qyPaciente.SQL.Add(sWhere + ' PACIENTE.CD_MOR_MUNICIPIO = ''' +
                                  btLocMunicipio.Text + '''');
          sWhere := 'AND';
        end;
    end;

  frmCadPaciente.qyPaciente.Open;
end;

procedure TfrmLocPaciente.btLocProvinciaExit(Sender: TObject);
begin
  if btLocProvincia.Text <> '' then
  begin
    try
      edProvincia.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btLocProvincia.Text],nil);
    except
      begin
        MessageDlg('Provincia não encontrada!',mtWarning,[mbOK],0);
        btLocProvincia.Clear;
        edProvincia.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocPaciente.btLocMunicipioExit(Sender: TObject);
begin
  if btLocMunicipio.Text <> '' then
  begin
      try
        edMunicipio.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btLocMunicipio.Text],nil);
       except
          begin
            MessageDlg('Municipio não encontrado!',mtWarning,[mbOK],0);
            btLocMunicipio.Clear;
            edMunicipio.Clear;
          end;
       end;
  end;

end;

end.
