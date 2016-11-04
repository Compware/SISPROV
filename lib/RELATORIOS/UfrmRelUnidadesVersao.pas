unit UfrmRelUnidadesVersao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, StdCtrls, dxEdLib, dxCntner, dxEditor, dxExEdtr,
  ComCtrls, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, DB,
  IBCustomDataSet, IBQuery, Buttons, ExtCtrls, frxClass, frxDBSet,IB_PARSE,
  frxExportPDF, frxExportXLS, RpRenderRTF, RpRenderHTML, RpRender,
  RpRenderPDF;

type
  TfrmRelUnidadesVersao = class(TfrmRelPad)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    btLocProvincia: TdxButtonEdit;
    edProvincia: TdxEdit;
    btLocMunicipio: TdxButtonEdit;
    edMunicipio: TdxEdit;
    cbTodos: TCheckBox;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    qyUnidades: TIBQuery;
    qyUnidadesCD_PROVINCIA: TIntegerField;
    qyUnidadesDS_PROVINCIA: TIBStringField;
    qyUnidadesCD_MUNICIPIO: TIntegerField;
    qyUnidadesDS_MUNICIPIO: TIBStringField;
    qyUnidadesCD_UNIDADE: TIntegerField;
    qyUnidadesDS_UNIDADE: TIBStringField;
    qyUnidadesSTATUS: TIBStringField;
    qyUnidadesATIP: TIBStringField;
    qyUnidadesPTV: TIBStringField;
    qyUnidadesTARV_INFANTIL: TIBStringField;
    qyUnidadesTARV_ADULTO: TIBStringField;
    GroupBox2: TGroupBox;
    cbAtivas: TCheckBox;
    cbInativas: TCheckBox;
    qyUnidadesDTATIP: TDateField;
    qyUnidadesDTPTV: TDateField;
    qyUnidadesDTTARV_INFANTIL: TDateField;
    qyUnidadesDTTARV_ADULTO: TDateField;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    qyUnidadesCOINF: TIBStringField;
    qyUnidadesDTCOINF: TDateField;
    procedure cbTodosClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvinciaChange(Sender: TObject);
    procedure btLocProvinciaExit(Sender: TObject);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioChange(Sender: TObject);
    procedure btLocMunicipioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbAtivasClick(Sender: TObject);
    procedure cbInativasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaVersao;
  end;

var
  frmRelUnidadesVersao: TfrmRelUnidadesVersao;
  strSQL:String;

implementation

Uses UDM, Ugeral, UGeralSQL, uFuncoesWeb, UfrmLocalizar;
{$R *.dfm}

procedure TfrmRelUnidadesVersao.cbTodosClick(Sender: TObject);
begin
  inherited;
  if cbTodos.Checked = true then
  begin
    btLocProvincia.Clear;
    btLocProvincia.Enabled := false;
    btLocMunicipio.Clear;
    btLocMunicipio.Enabled := false;
    cbAtivas.Checked := false;
    cbAtivas.Enabled := false;
    cbInativas.Checked := false;
    cbInativas.Enabled := false;
  end;

  if cbTodos.Checked = false then
  begin
    btLocProvincia.Enabled := true;
    btLocMunicipio.Enabled := true;
    cbAtivas.Enabled := true;
    cbInativas.Enabled := true;
  end;

end;

procedure TfrmRelUnidadesVersao.btImprimirClick(Sender: TObject);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
//AtualizaVersao
  sWhereCONDICAO := TStringList.Create;
  qyUnidades.SQL.Text := strSQL;
  sSQL := qyUnidades.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (btLocProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'u.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (btLocMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'u.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (cbAtivas.Checked) then
      begin
        sWhereCONDICAO.Add(sWA + 'u.fl_ativa = ''S''');
        sWA := 'and ';
      end;

      if (cbInativas.Checked) then
      begin
        sWhereCONDICAO.Add(sWA + 'u.fl_ativa = ''N''');
        sWA := 'and ';
      end;


      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyUnidades.SQL.Text := sAux;
      end;

      //Parametros
      if (btLocProvincia.Text <> '') then
        qyUnidades.ParamByName('PROVINCIA').AsString := btLocProvincia.Text;

      if (btLocMunicipio.Text <> '') then
        qyUnidades.ParamByName('MUNICIPIO').AsString := btLocMunicipio.Text;

     except
        qyUnidades.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

  qyUnidades.Open;
  frxReport1.LoadFromFile(sPathLayOut + '\RelUnidades.fr3');
  frxReport1.ShowReport;
  qyUnidades.Close;
end;

procedure TfrmRelUnidadesVersao.btLocProvinciaButtonClick(Sender: TObject;
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
    btLocMunicipio.Clear;
    edMunicipio.Clear;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmRelUnidadesVersao.btLocProvinciaChange(Sender: TObject);
begin
  inherited;
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
    btLocMunicipio.Clear;
    edMunicipio.Clear;
  end;
end;

procedure TfrmRelUnidadesVersao.btLocProvinciaExit(Sender: TObject);
begin
  inherited;
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

procedure TfrmRelUnidadesVersao.btLocMunicipioButtonClick(Sender: TObject;
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
  frmLocalizar.Free;
end;

procedure TfrmRelUnidadesVersao.btLocMunicipioChange(Sender: TObject);
begin
  inherited;
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

procedure TfrmRelUnidadesVersao.btLocMunicipioExit(Sender: TObject);
begin
  inherited;
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

procedure TfrmRelUnidadesVersao.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyUnidades.SQL.Text;
end;

procedure TfrmRelUnidadesVersao.cbAtivasClick(Sender: TObject);
begin
  inherited;
  if cbAtivas.Checked then
    cbInativas.Checked := false;

end;

procedure TfrmRelUnidadesVersao.cbInativasClick(Sender: TObject);
begin
  inherited;
  if cbInativas.Checked then
    cbAtivas.Checked := false;
end;

procedure TfrmRelUnidadesVersao.AtualizaVersao;
var sFile:string;  str:TStrings;
begin
  //Gera o arquivos.xml
  //WebBrowser1.Navigate
  str := TStringList.Create;
  str.Text := Get(sDominio + '/dbUnidade.php?op=S);
  sFile := sPathTemp + 'Unidades.xml';
  str.SaveToFile(sFile);
  cds.LoadFromFile(sFile);
  while not cds.Eof do
  begin
    sFile := cds.Fields[1].AsString;

    cds.Next;
  end;
  str.Free;
end;
end;

end.
