unit uFrmLocNotificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxEdLib, dxCntner, dxEditor, dxExEdtr, StdCtrls, Buttons, Mask,
  ToolEdit, ExtCtrls;

type
  TfrmLocNotificacao = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edNome: TEdit;
    edSexo: TComboBox;
    ckGestante: TCheckBox;
    edDataNasc: TDateEdit;
    edIdade: TEdit;
    edNomeMae: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    btProvinciaUtente: TdxButtonEdit;
    edProvinciaUtente: TdxEdit;
    btMunicipioUtente: TdxButtonEdit;
    edMunicipioUtente: TdxEdit;
    Label8: TLabel;
    edDataNotificacao: TDateEdit;
    Label9: TLabel;
    btProvinciaNot: TdxButtonEdit;
    edProvinciaNot: TdxEdit;
    Label10: TLabel;
    btMunicipioNot: TdxButtonEdit;
    edMunicipioNot: TdxEdit;
    Label11: TLabel;
    btUnidadeNot: TdxButtonEdit;
    edUnidadeNot: TdxEdit;
    Label12: TLabel;
    edDataDiagnostico: TDateEdit;
    Label13: TLabel;
    edTesteTriagem: TComboBox;
    edTesteConfirmatorio: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    edprocesso: TdxEdit;
    GroupBox3: TGroupBox;
    edDe: TDateEdit;
    edAte: TDateEdit;
    Label16: TLabel;
    Label17: TLabel;
    procedure btProvinciaUtenteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btProvinciaUtenteChange(Sender: TObject);
    procedure btProvinciaUtenteExit(Sender: TObject);
    procedure btMunicipioUtenteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btMunicipioUtenteChange(Sender: TObject);
    procedure btMunicipioUtenteExit(Sender: TObject);
    procedure btProvinciaNotButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btProvinciaNotChange(Sender: TObject);
    procedure btProvinciaNotExit(Sender: TObject);
    procedure btMunicipioNotButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btMunicipioNotChange(Sender: TObject);
    procedure btMunicipioNotExit(Sender: TObject);
    procedure btUnidadeNotButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btUnidadeNotChange(Sender: TObject);
    procedure btUnidadeNotExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocNotificacao: TfrmLocNotificacao;
implementation

uses UfrmLocalizar, UCadNotificacao, UgeralSQL;

{$R *.dfm}

procedure TfrmLocNotificacao.btProvinciaUtenteButtonClick(Sender: TObject;
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
    btProvinciaUtente.text := frmLocalizar.qyDados.FieldByname('cd_provincia').AsString;
    edProvinciaUtente.text := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmLocNotificacao.btProvinciaUtenteChange(Sender: TObject);
begin
  if btProvinciaUtente.Text = '' then
    edProvinciaUtente.Clear
  else if btProvinciaUtente.Modified then
  begin
    try
      edProvinciaUtente.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btProvinciaUtente.Text],nil);
    except
      begin
        edProvinciaUtente.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocNotificacao.btProvinciaUtenteExit(Sender: TObject);
begin
  if btProvinciaUtente.Text <> '' then
  begin
    try
      edProvinciaUtente.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btProvinciaUtente.Text],nil);
    except
      begin
        MessageDlg('Provincia n�o encontrada!',mtWarning,[mbOK],0);
        btProvinciaUtente.Clear;
        edProvinciaUtente.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocNotificacao.btMunicipioUtenteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Munic�pio';
  try
    if (btProvinciaUtente.Text<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(strToInt(btProvinciaUtente.Text));
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
    btMunicipioUtente.text := frmLocalizar.qyDados.FieldByname('cd_municipio').AsString;
    edMunicipioUtente.text := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmLocNotificacao.btMunicipioUtenteChange(Sender: TObject);
begin
  if btMunicipioUtente.Text = '' then
    edMunicipioUtente.Clear
  else if btMunicipioUtente.Modified then
  begin
    if btProvinciaUtente.text <> '' then
    begin
      try
        edMunicipioUtente.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btMunicipioUtente.Text],nil);
       except
          begin
            edMunicipioUtente.Clear;
          end;
       end;
      end
    else
      begin
        btMunicipioUtente.Clear;
        edMunicipioUtente.Clear;
        MessageDlg('� necess�rio incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;

end;

procedure TfrmLocNotificacao.btMunicipioUtenteExit(Sender: TObject);
begin
  if btMunicipioUtente.Text <> '' then
  begin
      try
        edMunicipioUtente.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btMunicipioUtente.Text],nil);
       except
          begin
            MessageDlg('Municipio n�o encontrado!',mtWarning,[mbOK],0);
            btMunicipioUtente.Clear;
            edMunicipioUtente.Clear;
          end;
       end;
  end;

end;

procedure TfrmLocNotificacao.btProvinciaNotButtonClick(Sender: TObject;
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
    btProvinciaNot.text := frmLocalizar.qyDados.FieldByname('cd_provincia').AsString;
    edProvinciaNot.text := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmLocNotificacao.btProvinciaNotChange(Sender: TObject);
begin
  if btProvinciaNot.Text = '' then
    edProvinciaNot.Clear
  else if btProvinciaNot.Modified then
  begin
    try
      edProvinciaNot.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btProvinciaNot.Text],nil);
    except
      begin
        edProvinciaNot.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocNotificacao.btProvinciaNotExit(Sender: TObject);
begin
  if btProvinciaNot.Text <> '' then
  begin
    try
      edProvinciaNot.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btProvinciaNot.Text],nil);
    except
      begin
        MessageDlg('Provincia n�o encontrada!',mtWarning,[mbOK],0);
        btProvinciaNot.Clear;
        edProvinciaNot.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocNotificacao.btMunicipioNotButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Munic�pio';
  try
    if (btProvinciaNot.Text<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(strToInt(btProvinciaNot.Text));
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
    btMunicipioNot.text := frmLocalizar.qyDados.FieldByname('cd_municipio').AsString;
    edMunicipioNot.text := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

procedure TfrmLocNotificacao.btMunicipioNotChange(Sender: TObject);
begin
  if btMunicipioNot.Text = '' then
    edMunicipioNot.Clear
  else if btMunicipioNot.Modified then
  begin
    if btProvinciaNot.text <> '' then
    begin
      try
        edMunicipioNot.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btMunicipioNot.Text],nil);
       except
          begin
            edMunicipioNot.Clear;
          end;
       end;
      end
    else
      begin
        btMunicipioNot.Clear;
        edMunicipioNot.Clear;
        MessageDlg('� necess�rio incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;
end;

procedure TfrmLocNotificacao.btMunicipioNotExit(Sender: TObject);
begin
  if btMunicipioNot.Text <> '' then
  begin
    try
      edMunicipioNot.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
        [btMunicipioNot.Text],nil);
     except
        begin
          MessageDlg('Municipio n�o encontrado!',mtWarning,[mbOK],0);
          btMunicipioNot.Clear;
          edMunicipioNot.Clear;
        end;
     end;
  end;
end;

procedure TfrmLocNotificacao.btUnidadeNotButtonClick(Sender: TObject;
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
    btUnidadeNot.text := frmLocalizar.qyDados.FieldByname('cd_unidade').AsString;
    edUnidadeNot.text := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
procedure TfrmLocNotificacao.btUnidadeNotChange(Sender: TObject);
begin
  if btUnidadeNot.Text = '' then
    edUnidadeNot.Clear
  else if btUnidadeNot.Modified then
  begin
    try
      edUnidadeNot.text :=
        PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btUnidadeNot.Text],nil);
    except
      begin
        edUnidadeNot.Clear;
      end;
    end;
  end;

end;

procedure TfrmLocNotificacao.btUnidadeNotExit(Sender: TObject);
begin
    if btUnidadeNot.Text <> '' then
    begin
      try
        edUnidadeNot.Text :=
          PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
          [btUnidadeNot.Text],nil);
      except
        begin
          MessageDlg('Unidade n�o encontrada!',mtWarning,[mbOK],0);
          btUnidadeNot.Clear;
          edUnidadeNot.Clear;
        end;
      end;
    end;
end;

procedure TfrmLocNotificacao.BitBtn1Click(Sender: TObject);
begin
  frmCadNotificacao.qyLocalizarNotificacao.Close;
  frmCadNotificacao.qyLocalizarNotificacao.SQL.Text := StringReplace(sNSQL,'and 1=2','',[]);
  //Notificacao
  if edDataNotificacao.Text <> '  /  /    ' then
  begin
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.DT_NOTIFICACAO =:DATANOTIFICACAO');
    frmCadNotificacao.qyLocalizarNotificacao.ParamByName('DATANOTIFICACAO').AsDate := edDataNotificacao.Date;
  end;

  if edDataDiagnostico.Text <> '  /  /    ' then
  begin
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.DT_DIAGNOSTICO =:DATADIAGNOSTICO');
    frmCadNotificacao.qyLocalizarNotificacao.ParamByName('DATADIAGNOSTICO').AsDate := edDataDiagnostico.Date;
  end;

  if (edDe.Text <> '  /  /    ') and (edAte.Text <> '  /  /    ') then
  begin
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.dt_notificacao between :de and :ate');
    frmCadNotificacao.qyLocalizarNotificacao.ParamByName('de').AsDate := edDe.Date;
    frmCadNotificacao.qyLocalizarNotificacao.ParamByName('ate').AsDate := edAte.Date;
  end;

  If btProvinciaNot.Text <> '' then
    begin
      frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.CD_PROVINCIA_NOT = ''' +
                              btProvinciaNot.Text + '''');

      If btMunicipioNot.Text <> '' then
        begin
         frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.CD_MUNICIPIO = ''' +
                                  btMunicipioNot.Text + '''');
        end;
    end;

  If btUnidadeNot.Text <> '' then
    begin
     frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.CD_UNIDADE = ''' +
                              btUnidadeNot.Text + '''');
    end;

  if edTesteTriagem.Text = 'Positivo' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.CD_TESTE_TRIAGEM = 1');

  if edTesteTriagem.Text = 'N�o Realizado' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.CD_TESTE_TRIAGEM = 98');

  if edTesteConfirmatorio.Text = 'Positivo' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.CD_TESTE_CONFIRMATORIO = 1');

  if edTesteConfirmatorio.Text = 'N�o Realizado' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND NOTIFICACAO.CD_TESTE_CONFIRMATORIO = 98');

  //Paciente
  if edNome.Text <> '' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('and Upper(NM_PACIENTE) like('''+ UpperCase(ednome.Text) + '%'')');

  If edprocesso.Text <> '' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.NR_PROCESSO = ''' +edprocesso.Text + '''');

  if edSexo.Text = 'Feminino' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.TP_SEXO = ''' +'F'+ '''');

  if edSexo.Text = 'Masculino' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.TP_SEXO = ''' +'M'+ '''');

  if ckGestante.Checked then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.FL_GESTANTE = 1');


  if edDataNasc.Text <> '  /  /    ' then
    begin
      frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.DT_NASCIMENTO =:DATA');
      frmCadNotificacao.qyLocalizarNotificacao.ParamByName('DATA').AsDate := edDataNasc.Date;
    end;

  if edIdade.Text <> '' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.IDADE = ''' +
                              edIdade.Text + '''');

  if edNomeMae.Text <> '' then
    frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('and Upper(PACIENTE.NM_MAE) like('''+ UpperCase(edNomeMae.Text) + '%'')');

  If btProvinciaUtente.Text <> '' then
    begin
      frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.CD_NAR_PROVINCIA = ''' +
                              btProvinciaUtente.Text + '''');

      If btMunicipioUtente.Text <> '' then
        begin
         frmCadNotificacao.qyLocalizarNotificacao.SQL.Add('AND PACIENTE.CD_MOR_MUNICIPIO = ''' +
                                  btMunicipioUtente.Text + '''');
        end;
    end;

  frmCadNotificacao.qyLocalizarNotificacao.Open;

end;

end.
