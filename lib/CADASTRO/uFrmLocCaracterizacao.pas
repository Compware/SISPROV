unit uFrmLocCaracterizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxEdLib, dxCntner, dxEditor, dxExEdtr, StdCtrls, Buttons, Mask,
  ToolEdit, ExtCtrls;

type
  TfrmLocCaracterizacao = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edNome: TEdit;
    edDataNasc: TDateEdit;
    edNomeMae: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    edDataVisita: TDateEdit;
    Label9: TLabel;
    btProvincia: TdxButtonEdit;
    edProvincia: TdxEdit;
    Label10: TLabel;
    btMunicipio: TdxButtonEdit;
    edMunicipio: TdxEdit;
    Label11: TLabel;
    btUnidade: TdxButtonEdit;
    edUnidade: TdxEdit;
    edResultado: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    edprocesso: TdxEdit;
    Label12: TLabel;
    edSexo: TComboBox;
    Label3: TLabel;
    btConselheiro: TdxButtonEdit;
    edConselheiro: TdxEdit;
    Label2: TLabel;
    edGestante: TComboBox;
    Label4: TLabel;
    edIdade: TdxEdit;
    procedure btProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btProvinciaChange(Sender: TObject);
    procedure btProvinciaExit(Sender: TObject);
    procedure btMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btMunicipioChange(Sender: TObject);
    procedure btMunicipioExit(Sender: TObject);
    procedure btUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btUnidadeChange(Sender: TObject);
    procedure btUnidadeExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btConselheiroButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btConselheiroChange(Sender: TObject);
    procedure btConselheiroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCaracterizacao: TfrmLocCaracterizacao;
implementation

uses UfrmLocalizar, UCadNotificacao, UgeralSQL, uCadCaracterizacao;

{$R *.dfm}

procedure TfrmLocCaracterizacao.btProvinciaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;
  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'C�d.';
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
    btProvincia.text := frmLocalizar.qyDados.FieldByname('cd_provincia').AsString;
    edProvincia.text := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmLocCaracterizacao.btProvinciaChange(Sender: TObject);
begin
  if btProvincia.Text = '' then
    edProvincia.Clear
  else if btProvincia.Modified then
  begin
    try
      edProvincia.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btProvincia.Text],nil);
    except
      begin
        edProvincia.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocCaracterizacao.btProvinciaExit(Sender: TObject);
begin
  if btProvincia.Text <> '' then
  begin
    try
      edProvincia.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btProvincia.Text],nil);
    except
      begin
        MessageDlg('Provincia n�o encontrada!',mtWarning,[mbOK],0);
        btProvincia.Clear;
        edProvincia.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocCaracterizacao.btMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Munic�pio';
  try
    if (btProvincia.Text<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(strToInt(btProvincia.Text));
      frmLocalizar.Where := true;
    end;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'C�d.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Munic�pio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btMunicipio.text := frmLocalizar.qyDados.FieldByname('cd_municipio').AsString;
    edMunicipio.text := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmLocCaracterizacao.btMunicipioChange(Sender: TObject);
begin
  if btMunicipio.Text = '' then
    edMunicipio.Clear
  else if btMunicipio.Modified then
  begin
    if btProvincia.text <> '' then
    begin
      try
        edMunicipio.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btMunicipio.Text],nil);
       except
          begin
            edMunicipio.Clear;
          end;
       end;
      end
    else
      begin
        btMunicipio.Clear;
        edMunicipio.Clear;
        MessageDlg('� necess�rio incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;

end;

procedure TfrmLocCaracterizacao.btMunicipioExit(Sender: TObject);
begin
  if btMunicipio.Text <> '' then
  begin
      try
        edMunicipio.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btMunicipio.Text],nil);
       except
          begin
            MessageDlg('Municipio n�o encontrado!',mtWarning,[mbOK],0);
            btMunicipio.Clear;
            edMunicipio.Clear;
          end;
       end;
  end;

end;

procedure TfrmLocCaracterizacao.btUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados := SelectDadosUnidade;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'Unidade';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btUnidade.text := frmLocalizar.qyDados.FieldByname('cd_unidade').AsString;
    edUnidade.text := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
procedure TfrmLocCaracterizacao.btUnidadeChange(Sender: TObject);
begin
  if btUnidade.Text = '' then
    edUnidade.Clear
  else if btUnidade.Modified then
  begin
    try
      edUnidade.text :=
        PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btUnidade.Text],nil);
    except
      begin
        edUnidade.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocCaracterizacao.btUnidadeExit(Sender: TObject);
begin
    if btUnidade.Text <> '' then
    begin
      try
        edUnidade.Text :=
          PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
          [btUnidade.Text],nil);
      except
        begin
          MessageDlg('Unidade n�o encontrada!',mtWarning,[mbOK],0);
          btUnidade.Clear;
          edUnidade.Clear;
        end;
      end;
    end;
end;

procedure TfrmLocCaracterizacao.BitBtn1Click(Sender: TObject);
begin
  frmCadCaracterizacao.qyCaracterizacao.Close;
  frmCadCaracterizacao.qyCaracterizacao.SQL.Text := StringReplace(sCSQL,'where 1=2','where 1=1',[]);
  //Caracteriza��o
  if edDataVisita.Text <> '  /  /    ' then
  begin
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.dt_visita =:datavisita');
    frmCadCaracterizacao.qyCaracterizacao.ParamByName('datavisita').AsDate := edDatavisita.Date;
  end;

  If btProvincia.Text <> '' then
    begin
      frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.cd_provincia = ''' +
                              btProvincia.Text + '''');

      If btMunicipio.Text <> '' then
        begin
         frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.CD_MUNICIPIO = ''' +
                                  btMunicipio.Text + '''');
        end;
    end;

  If btUnidade.Text <> '' then
    begin
     frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.CD_UNIDADE = ''' +
                              btUnidade.Text + '''');
    end;

  If btconselheiro.Text <> '' then
    begin
     frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.cd_investigador = ''' +
                              btconselheiro.Text + '''');
    end;

  if edSexo.Text = 'Masculino' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.FL_SEXO = 1');

  if edSexo.Text = 'Feminino' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.FL_SEXO = 2');

  if edIdade.Text <> '' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.nr_idade = ''' +
                              edIdade.Text + '''');

  if edGestante.Text = 'N�o' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.FL_GESTANTE = 0');

  if edGestante.Text = 'Sim' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.FL_GESTANTE = 1');

  if edResultado.Text = 'Negativo' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.FL_teste_hoje = 1');

  if edResultado.Text = 'Positivo' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.FL_teste_hoje = 2');

  if edResultado.Text = 'Indeterminado' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND caracterizacao.FL_teste_hoje = 3');

  //Paciente
  if edNome.Text <> '' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('and Upper(paciente.NM_PACIENTE) like('''+ UpperCase(ednome.Text) + '%'')');

  If edprocesso.Text <> '' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND PACIENTE.NR_PROCESSO = ''' +edprocesso.Text + '''');

  if edDataNasc.Text <> '  /  /    ' then
    begin
      frmCadCaracterizacao.qyCaracterizacao.SQL.Add('AND PACIENTE.DT_NASCIMENTO =:DATA');
      frmCadCaracterizacao.qyCaracterizacao.ParamByName('DATA').AsDate := edDataNasc.Date;
    end;


  if edNomeMae.Text <> '' then
    frmCadCaracterizacao.qyCaracterizacao.SQL.Add('and Upper(PACIENTE.NM_MAE) like('''+ UpperCase(edNomeMae.Text) + '%'')');

  frmCadCaracterizacao.qyCaracterizacao.Open;

end;

procedure TfrmLocCaracterizacao.btConselheiroButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar M�dico';
    frmLocalizar.qyDados := SelectDadosInvestigador;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,4);
      frmLocalizar.KeyField := 'cd_investigador';
      VCampo[0].Titulo  := 'C�d.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome';
      VCampo[1].Width := 25;
      VCampo[2].Titulo  := 'Fun��o';
      VCampo[2].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := True;
      VCampo[3].Visivel := false;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      btConselheiro.Text := frmLocalizar.qyDados.FieldByname('cd_investigador').AsString;
      edConselheiro.Text := frmLocalizar.qyDados.FieldByname('nm_investigador').AsString;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);

end;

procedure TfrmLocCaracterizacao.btConselheiroChange(Sender: TObject);
begin
    if btConselheiro.Text = '' then
      edConselheiro.Clear
    else if btConselheiro.Modified then
    begin
      try
        edConselheiro.Text := PegaValor('NM_INVESTIGADOR','INVESTIGADOR',['CD_INVESTIGADOR'],
          [btConselheiro.Text],nil);
      except
        begin
          edConselheiro.Clear;
        end;
      end;
    end;

end;

procedure TfrmLocCaracterizacao.btConselheiroExit(Sender: TObject);
begin
    if btConselheiro.Text <> '' then
    begin
      try
        edConselheiro.Text := PegaValor('NM_INVESTIGADOR','INVESTIGADOR',['CD_INVESTIGADOR'],
          [btConselheiro.Text],nil);

      except
        begin
          MessageDlg('Conselheiro n�o encontrado!',mtWarning,[mbOK],0);
          edConselheiro.Clear;
          btConselheiro.Clear;
        end;
      end;
    end;

end;

end.
