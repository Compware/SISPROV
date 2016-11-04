unit uFramePaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RxLookup, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask,
  ToolEdit, RXDBCtrl, RxDBComb, DB, IBCustomDataSet, IBQuery, dxExEdtr,
  DBCtrls, Buttons, ExtCtrls, ImgList, RXCtrls;

type
  TframPaciente = class(TFrame)
    dsPaciente: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dxDBEdit1: TdxDBEdit;
    dxDBEdit6: TdxDBEdit;
    dxDBEdit7: TdxDBEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label16: TLabel;
    Label5: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    DBDateEdit3: TDBDateEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    RxDBComboBox3: TRxDBComboBox;
    dxDBEdit5: TdxDBEdit;
    RxDBComboBox5: TRxDBComboBox;
    Label12: TLabel;
    dxDBEdit4: TdxDBEdit;
    btLocProvincia: TdxDBButtonEdit;
    btLocMunicipio: TdxDBButtonEdit;
    btLocProvinciaMor: TdxDBButtonEdit;
    btLocMunicipioMor: TdxDBButtonEdit;
    btLocPais: TdxDBButtonEdit;
    btLocOcupacao: TdxDBButtonEdit;
    qyTipoDocumento: TIBQuery;
    dsTipoDocumeto: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dxDBEdit9: TdxDBEdit;
    dxDBEdit10: TdxDBEdit;
    dxDBEdit11: TdxDBEdit;
    dxDBEdit12: TdxDBEdit;
    dxDBEdit13: TdxDBEdit;
    dxDBEdit14: TdxDBEdit;
    SpeedButton1: TSpeedButton;
    dxDBEdit15: TdxDBEdit;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    pendereco: TPanel;
    ImageList1: TImageList;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    Label24: TLabel;
    pdica: TSecretPanel;
    Label23: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton3: TSpeedButton;
    dxDBMemo1: TdxDBMemo;
    gbGestante: TGroupBox;
    lbGestante: TLabel;
    Label31: TLabel;
    cbGestante: TRxDBComboBox;
    dxDBEdit8: TdxDBEdit;
    Label29: TLabel;
    dxDBEdit16: TdxDBEdit;
    Label30: TLabel;
    ckCasoNovo: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    GroupBox3: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBDateEdit1: TDBDateEdit;
    Label32: TLabel;
    pcriancaexp: TPanel;
    btCriancaExp: TBitBtn;
    btProcuraMae: TSpeedButton;
    Label34: TLabel;
    dxDBEdit17: TdxDBEdit;
    Label35: TLabel;
    cbDesfecho: TRxDBComboBox;
    ckCriancaExp: TDBCheckBox;
    dtFimCriancaExp: TDBDateEdit;
    Label33: TLabel;
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvinciaMorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioMorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocOcupacaoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocPaisButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dsPacienteDataChange(Sender: TObject; Field: TField);
    procedure DBDateEdit3Exit(Sender: TObject);
    procedure dxDBEdit3Exit(Sender: TObject);
    procedure dxDBEdit4Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btLocProvinciaChange(Sender: TObject);
    procedure btLocMunicipioChange(Sender: TObject);
    procedure btLocPaisChange(Sender: TObject);
    procedure btLocProvinciaMorChange(Sender: TObject);
    procedure btLocMunicipioMorChange(Sender: TObject);
    procedure btLocOcupacaoChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btLocProvinciaExit(Sender: TObject);
    procedure btLocMunicipioExit(Sender: TObject);
    procedure btLocPaisExit(Sender: TObject);
    procedure btLocProvinciaMorExit(Sender: TObject);
    procedure btLocMunicipioMorExit(Sender: TObject);
    procedure btLocOcupacaoExit(Sender: TObject);
    procedure btCriancaExpClick(Sender: TObject);
    procedure btProcuraMaeClick(Sender: TObject);
    procedure dsPacienteStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure VerificarCampos;
    procedure MostraEscondePCriancaExp(Mostra: Boolean);
  end;

implementation

uses UDM, UDMGERAL, UfrmLocalizar, UGeralSQL, UGeral, DateUtils, UDMDIG;

{$R *.dfm}

{ TframPaciente }


procedure TframPaciente.AbreConsultas;
begin
  qyTipoDocumento.Open;
end;

procedure TframPaciente.FechaConsultas;
begin
  qyTipoDocumento.Close;
end;

procedure TframPaciente.VerificarCampos;
begin

  if DMGERAL.TB_PACIENTENM_PACIENTE.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Nome do Utente!',mtInformation,
     [mbOK],0);

    dxDBEdit2.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_PACIENTETP_SEXO.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Sexo do Utente!',mtInformation,
     [mbOK],0);

    RxDBComboBox2.SetFocus;
    Abort;
  end;

  if (DMGERAL.TB_PACIENTEIDADE.AsString = '') then
  begin
    MessageDlg('É necessário incluir a Idade ou Meses do Utente!',mtInformation,
     [mbOK],0);

    dxDBEdit3.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_PACIENTENM_MAE.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Nome da Mãe do Utente!',mtInformation,
     [mbOK],0);

    dxDBEdit5.SetFocus;
    Abort;
  end;
end;

procedure TframPaciente.btLocProvinciaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
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
    dmGeral.TB_PACIENTECD_PROVINCIA.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_PACIENTEDS_PROVINCIA.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_PACIENTECD_MUNICIPIO.Clear;
    DMGERAL.TB_PACIENTEDS_MUNICIPIO.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TframPaciente.btLocMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Municipio';
    try
      if(dsPaciente.DataSet.FieldByName('CD_PROVINCIA').AsString<>'')then
      begin
        frmLocalizar.qyDados := SelectDadosMunicipio(dsPaciente.DataSet.FieldByName('CD_PROVINCIA').AsInteger);
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
      dmGeral.TB_PACIENTECD_MUNICIPIO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
      dmGeral.TB_PACIENTEDS_MUNICIPIO.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;

    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TframPaciente.btLocProvinciaMorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
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
    dmGeral.TB_PACIENTECD_NAR_PROVINCIA.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_PACIENTEDS_PROVINCIA_MORADA.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_PACIENTECD_MOR_MUNICIPIO.Clear;
    DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TframPaciente.btLocMunicipioMorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  try
    if(dsPaciente.DataSet.FieldByName('CD_NAR_PROVINCIA').AsString<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(dsPaciente.DataSet.FieldByName('CD_NAR_PROVINCIA').AsInteger);
      frmLocalizar.Where := true;
    end;
    SetLength(VCampo,3);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Municipio';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome do Municipio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := False;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_PACIENTECD_MOR_MUNICIPIO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_PACIENTEDS_MUNICIPIO_MORADA.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TframPaciente.btLocOcupacaoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Ocupacao';
  frmLocalizar.qyDados := SelectDadosOcupacao;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_ocupacao';
    VCampo[0].Titulo  := 'Ocupacao';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Descrição';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_PACIENTECD_OCUPACAO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_ocupacao').AsInteger;
    dmGeral.TB_PACIENTEDS_OCUPACAO.AsString := frmLocalizar.qyDados.FieldByname('ds_ocupacao').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TframPaciente.btLocPaisButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar País';
  frmLocalizar.qyDados := SelectDadosPais;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_Pais';
    VCampo[0].Titulo  := 'Código';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'País';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_PACIENTECD_PAIS.AsInteger := frmLocalizar.qyDados.FieldByname('cd_pais').AsInteger;
    dmGeral.TB_PACIENTEDS_PAIS.AsString := frmLocalizar.qyDados.FieldByname('DS_pais').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TframPaciente.dsPacienteDataChange(Sender: TObject;
  Field: TField);
begin
  if RxDBComboBox2.Text = 'Feminino' then
    gbGestante.Visible := true
  else
    gbGestante.Visible := false;

end;

procedure TframPaciente.DBDateEdit3Exit(Sender: TObject);
var idade, meses:integer;
begin
  if DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsString <> '' then
  begin
    idade := CalculoIdade(DBDateEdit3.Date);
    DMGERAL.TB_PACIENTEIDADE.AsInteger := idade;
    if DMGERAL.TB_PACIENTEIDADE.AsInteger = 0 then
      begin
        meses := CalculoMeses(DBDateEdit3.Date);
        DMGERAL.TB_PACIENTEMESES.AsInteger := meses;
      end
      else
        DMGERAL.TB_PACIENTEMESES.AsInteger := 0;
  end;
end;

procedure TframPaciente.dxDBEdit3Exit(Sender: TObject);
var nasc:Tdate;  idade:integer;
begin
  if (DMGERAL.TB_PACIENTEIDADE.AsInteger > 0) and
     (DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsString = '') then
  begin
    idade := DMGERAL.TB_PACIENTEIDADE.AsInteger;
    nasc := CalculoNasc(idade);
    DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime:=nasc;
    DMGERAL.TB_PACIENTEMESES.AsInteger := 0;
  end;
end;

procedure TframPaciente.dxDBEdit4Exit(Sender: TObject);
var nasc:Tdate;  meses, idade:integer;
begin
  if (DMGERAL.TB_PACIENTEMESES.AsInteger > 0) then
  begin
    meses := DMGERAL.TB_PACIENTEMESES.AsInteger;
    nasc := CalculoMesesNasc(meses);
    DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime:=nasc;
    if DMGERAL.TB_PACIENTEMESES.AsInteger > 12 then
      begin
        idade := CalculoIdade(DBDateEdit3.Date);
        DMGERAL.TB_PACIENTEIDADE.AsInteger := idade;
      end
      else
        DMGERAL.TB_PACIENTEIDADE.AsInteger := 0;

  end;
end;

procedure TframPaciente.SpeedButton1Click(Sender: TObject);
var nasc:Tdate;  idade:integer;
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if (DMGERAL.TB_PACIENTEIDADE.AsInteger > 0) then
    begin
      idade := DMGERAL.TB_PACIENTEIDADE.AsInteger;
      nasc := CalculoNasc(idade);
      DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime:=nasc;
      DMGERAL.TB_PACIENTEMESES.AsInteger := 0;
    end;
  end;
end;

procedure TframPaciente.SpeedButton2Click(Sender: TObject);
var bmp:TBitmap;
begin
  inherited;
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    bmp := TBitmap.Create;
    try
      if pendereco.Visible = false then
      begin
        ImageList1.GetBitmap(1,bmp);
        SpeedButton2.Hint := 'Retroceder Endereço';
        pendereco.Visible := true;
      end
      else
      begin
        ImageList1.GetBitmap(0,bmp);
        SpeedButton2.Hint := 'Expandir Endereço';
        pendereco.Visible := false;
      end;
      SpeedButton2.Glyph := bmp;
    except
      FreeAndNil(bmp);
    end;
  end;
end;

procedure TframPaciente.btLocProvinciaChange(Sender: TObject);
begin
  if dsPaciente.DataSet.State in [dsEdit, dsInsert] then
  begin
    if btLocProvincia.Text = ''  then
      DMGERAL.TB_PACIENTEDS_PROVINCIA.Clear
    else if btLocProvincia.Modified then
    begin
      try
        DMGERAL.TB_PACIENTEDS_PROVINCIA.AsString :=
          PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
          [btLocProvincia.Text], dmDig.dbDig);
      except
        begin
          DMGERAL.TB_PACIENTEDS_PROVINCIA.Clear;
        end;
      end;
      DMGERAL.TB_PACIENTECD_MUNICIPIO.Clear;
      DMGERAL.TB_PACIENTEDS_MUNICIPIO.Clear;
    end;
  end;
end;

procedure TframPaciente.btLocMunicipioChange(Sender: TObject);
begin
  if btLocMunicipio.Text = '' then
    DMGERAL.TB_PACIENTEDS_MUNICIPIO.Clear
  else if btLocMunicipio.Modified then
  begin
    if btLocProvincia.text <> '' then
    begin
      try
        DMGERAL.TB_PACIENTEDS_MUNICIPIO.AsString :=
          PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
           [btLocMunicipio.Text],nil);
       except
          begin
            DMGERAL.TB_PACIENTEDS_MUNICIPIO.Clear;
          end;
       end;
      end
    else
      begin
        DMGERAL.TB_PACIENTECD_MUNICIPIO.Clear;
        DMGERAL.TB_PACIENTEDS_MUNICIPIO.Clear;
        MessageDlg('É necessário incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;

end;

procedure TframPaciente.btLocPaisChange(Sender: TObject);
begin
  if btLocPais.Text = ''  then
    DMGERAL.TB_PACIENTEDS_PAIS.Clear
  else if btLocPais.Modified then
  begin
    try
      DMGERAL.TB_PACIENTEDS_PAIS.AsString :=
        PegaValor('DS_PAIS','PAIS',['CD_PAIS'],
        [btLocPais.Text],nil);
    except
      begin
        DMGERAL.TB_PACIENTEDS_PAIS.Clear;
      end;
    end;
  end;

end;

procedure TframPaciente.btLocProvinciaMorChange(Sender: TObject);
begin
  if dsPaciente.DataSet.State in [dsEdit, dsInsert] then
  begin
    if btLocProvinciaMor.Text = ''  then
      DMGERAL.TB_PACIENTEDS_PROVINCIA_MORADA.Clear
    else if btLocProvinciaMor.Modified then
    begin
      try
        DMGERAL.TB_PACIENTEDS_PROVINCIA_MORADA.AsString :=
          PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
          [btLocProvinciaMor.Text],nil);
      except
        begin
          DMGERAL.TB_PACIENTEDS_PROVINCIA_MORADA.Clear;
        end;
      end;
      DMGERAL.TB_PACIENTECD_MOR_MUNICIPIO.Clear;
      DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.Clear;
    end;
  end;
end;

procedure TframPaciente.btLocMunicipioMorChange(Sender: TObject);
begin
  if btLocMunicipioMor.Text = '' then
    DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.Clear
  else if btLocMunicipioMor.Modified then
  begin
    if btLocProvinciaMor.text <> '' then
    begin
      try
        DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.AsString :=
          PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
           [btLocMunicipioMor.Text],nil);
       except
          begin
            DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.Clear;
          end;
      end;
      end
    else
      begin
        DMGERAL.TB_PACIENTECD_MOR_MUNICIPIO.Clear;
        DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.Clear;
        MessageDlg('É necessário incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;

end;

procedure TframPaciente.btLocOcupacaoChange(Sender: TObject);
begin
  if btLocOcupacao.Text = ''  then
    DMGERAL.TB_PACIENTEDS_OCUPACAO.Clear
  else if btLocOcupacao.Modified then
  begin
    try
      DMGERAL.TB_PACIENTEDS_OCUPACAO.AsString :=
        PegaValor('DS_OCUPACAO','OCUPACAO',['CD_OCUPACAO'],
        [btLocOcupacao.Text],nil);
    except
      begin
        DMGERAL.TB_PACIENTEDS_OCUPACAO.Clear;
      end;
    end;
  end;

end;

procedure TframPaciente.SpeedButton3Click(Sender: TObject);
begin
  pdica.Visible := true;
end;

procedure TframPaciente.BitBtn1Click(Sender: TObject);
begin
  pdica.Visible := false;
end;

procedure TframPaciente.btLocProvinciaExit(Sender: TObject);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocProvincia.Text <> '' then
      begin
      try
        DMGERAL.TB_PACIENTEDS_PROVINCIA.AsString :=
          PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
          [btLocProvincia.Text],nil);
      except
        begin
          MessageDlg('Provincia não encontrada!',mtWarning,[mbOK],0);
          DMGERAL.TB_PACIENTECD_PROVINCIA.Clear;
          DMGERAL.TB_PACIENTEDS_PROVINCIA.Clear;
        end;
      end;
    end;
  end;  
end;

procedure TframPaciente.btLocMunicipioExit(Sender: TObject);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocMunicipio.Text <> '' then
      begin
        try
          DMGERAL.TB_PACIENTEDS_MUNICIPIO.AsString :=
            PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
             [btLocMunicipio.Text],nil);
         except
            begin
              MessageDlg('Municipio não encontrado!',mtWarning,[mbOK],0);
              DMGERAL.TB_PACIENTECD_MUNICIPIO.Clear;
              DMGERAL.TB_PACIENTEDS_MUNICIPIO.Clear;
            end;
         end;
       end;
  end;
end;

procedure TframPaciente.btLocPaisExit(Sender: TObject);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocPais.Text <> ''  then
      begin
        try
          DMGERAL.TB_PACIENTEDS_PAIS.AsString :=
            PegaValor('DS_PAIS','PAIS',['CD_PAIS'],
            [btLocPais.Text],nil);
        except
          begin
            MessageDlg('Pais não encontrado!',mtWarning,[mbOK],0);
            DMGERAL.TB_PACIENTECD_PAIS.Clear;
            DMGERAL.TB_PACIENTEDS_PAIS.Clear;
          end;
        end;
       end;
  end;
end;

procedure TframPaciente.btLocProvinciaMorExit(Sender: TObject);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocProvinciaMor.Text <> ''  then
      begin
        try
          DMGERAL.TB_PACIENTEDS_PROVINCIA_MORADA.AsString :=
            PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
            [btLocProvinciaMor.Text],nil);
        except
          begin
            MessageDlg('Provincia não encontrada!',mtWarning,[mbOK],0);
            DMGERAL.TB_PACIENTECD_NAR_PROVINCIA.Clear;
            DMGERAL.TB_PACIENTEDS_PROVINCIA_MORADA.Clear;
          end;
        end;
      end;
  end;
end;

procedure TframPaciente.btLocMunicipioMorExit(Sender: TObject);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocMunicipioMor.Text <> '' then
    begin
      try
        DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.AsString :=
          PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
           [btLocMunicipioMor.Text],nil);
       except
          begin
            MessageDlg('Municipio não encontrados!',mtWarning,[mbOK],0);
            DMGERAL.TB_PACIENTECD_MOR_MUNICIPIO.Clear;
            DMGERAL.TB_PACIENTEDS_MUNICIPIO_MORADA.Clear;
          end;
       end;
    end;
  end;
end;

procedure TframPaciente.btLocOcupacaoExit(Sender: TObject);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocOcupacao.Text <> ''  then
    begin
      try
        DMGERAL.TB_PACIENTEDS_OCUPACAO.AsString :=
          PegaValor('DS_OCUPACAO','OCUPACAO',['CD_OCUPACAO'],
          [btLocOcupacao.Text],nil);
      except
        begin
          MessageDlg('Ocupação não encontrada!',mtWarning,[mbOK],0);
          DMGERAL.TB_PACIENTECD_OCUPACAO.Clear;
          DMGERAL.TB_PACIENTEDS_OCUPACAO.Clear;
        end;
      end;
    end;
  end;
end;

procedure TframPaciente.btCriancaExpClick(Sender: TObject);
begin
  inherited;
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
      if pcriancaexp.Visible then
      MostraEscondePCriancaExp(false)
    else
      MostraEscondePCriancaExp(true);
  end;
end;

procedure TframPaciente.btProcuraMaeClick(Sender: TObject);
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    try
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
        DMGERAL.TB_PACIENTECD_PACIENTE_MAE.AsInteger := frmLocalizar.qyDados.FieldByname('cd_paciente').AsInteger;
        DMGERAL.TB_PACIENTENM_MAE.AsString := frmLocalizar.qyDados.FieldByname('nm_paciente').AsString;
      end;
    finally
      frmLocalizar.qyDados.Close;
      FreeAndNil(frmLocalizar);
    end;
  end;
end;

procedure TframPaciente.dsPacienteStateChange(Sender: TObject);
begin
  MostraEscondePCriancaExp(false);
end;

procedure TframPaciente.MostraEscondePCriancaExp(Mostra: Boolean);
var bmp:TBitmap;
begin
  bmp := TBitmap.Create;
  try
    if Mostra then
    begin
      ImageList1.GetBitmap(1,bmp);
      btCriancaExp.Hint := 'Retroceder Criança Exp.';
      pcriancaexp.Visible := true;
      Label6.Visible := false;
    end
    else
    begin
      ImageList1.GetBitmap(0,bmp);
      btCriancaExp.Hint := 'Expandir Criança Exp.';
      pcriancaexp.Visible := false;
      Label6.Visible := true;
    end;
    btCriancaExp.Glyph := bmp;
  except
    FreeAndNil(bmp);
  end;
end;

end.
