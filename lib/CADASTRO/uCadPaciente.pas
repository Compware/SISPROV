unit uCadPaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, StdCtrls, DB,
  IBCustomDataSet, IBQuery, dxCntner, ComCtrls, Buttons, ExtCtrls, Mask,
  DBCtrls, uFramePaciente, ImgList, Menus;

type
  TfrmCadPaciente = class(TfrmCadPad)
    qyPaciente: TIBQuery;
    qyPacienteCD_PACIENTE: TIntegerField;
    qyPacienteCD_BAIRRO: TIntegerField;
    qyPacienteCD_PAIS: TIntegerField;
    qyPacienteCD_MUNICIPIO: TIntegerField;
    qyPacienteCD_MOR_MUNICIPIO: TIntegerField;
    qyPacienteCD_PROVINCIA: TIntegerField;
    qyPacienteCD_COMUNA: TIntegerField;
    qyPacienteNM_PACIENTE: TIBStringField;
    qyPacienteDT_NASCIMENTO: TDateField;
    qyPacienteIDADE: TSmallintField;
    qyPacienteNM_MAE: TIBStringField;
    qyPacienteCD_MORADA_PERM: TIBStringField;
    qyPacienteCD_ESCOLARIDADE: TSmallintField;
    qyPacienteDS_ESCOLARIDADE: TIBStringField;
    qyPacienteTP_SEXO: TIBStringField;
    qyPacienteMESES: TIntegerField;
    qyPacienteESTADO_CIVIL: TIntegerField;
    qyPacienteCD_NAR_PROVINCIA: TIntegerField;
    qyPacienteCD_PACIENTE_ORACLE: TIntegerField;
    qyPacienteDS_MUNICIPIO: TIBStringField;
    qyPacienteDS_PROVINCIA: TIBStringField;
    Label1: TLabel;
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    grDadosColumn3: TdxDBGridColumn;
    grDadosColumn4: TdxDBGridColumn;
    grDadosColumn5: TdxDBGridColumn;
    grDadosColumn6: TdxDBGridColumn;
    framPaciente1: TframPaciente;
    ImageList1: TImageList;
    grDadosColumn7: TdxDBGridColumn;
    grDadosColumn8: TdxDBGridColumn;
    qyPacienteDS_MUNICIPIO_MORADA: TIBStringField;
    qyPacienteDS_PROVINCIA_MORADA: TIBStringField;
    btflGestante: TBitBtn;
    qySQL: TIBQuery;
    qyPacienteExistente: TIBQuery;
    qyPacienteExistenteCD_PACIENTE: TIntegerField;
    qyPacienteExistenteNM_PACIENTE: TIBStringField;
    qyPacienteExistenteDT_NASCIMENTO: TDateField;
    qyPacienteExistenteNM_MAE: TIBStringField;
    dsPacienteExistente: TDataSource;
    qyPacienteCD_UND: TIntegerField;
    qyPacienteCD_OCUPACAO: TIntegerField;
    qyPacienteCD_DOCUMENTO: TIntegerField;
    qyPacienteTP_DOCUMENTO: TIBStringField;
    qyPacienteNR_DOCUMENTO: TIBStringField;
    qyPacienteNR_TEL_1: TIBStringField;
    qyPacienteNR_TEL_2: TIBStringField;
    qyPacienteDS_ENDERECO: TIBStringField;
    qyPacienteFL_GESTANTE: TIntegerField;
    qyPacienteFL_NOTIFICACAO: TIntegerField;
    qyPacienteNR_MESES_GESTANTE: TIntegerField;
    qyPacienteFL_RESULTADO: TIBStringField;
    qyPacienteDT_EXP: TDateTimeField;
    qyPacienteCD_EDI: TIntegerField;
    qyPacienteNR_PROCESSO: TIntegerField;
    qyPacienteExistenteNR_PROCESSO_CRIANCA_EXP: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btgravarClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure btPesquisarClick(Sender: TObject);
    procedure tabListaShow(Sender: TObject);
    procedure btflGestanteClick(Sender: TObject);
    procedure framPaciente1dxDBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure framPaciente1dsPacienteDataChange(Sender: TObject;
      Field: TField);
    procedure framPaciente1dxDBEdit2Exit(Sender: TObject);
    procedure framPaciente1DBDateEdit3Exit(Sender: TObject);
    procedure framPaciente1dxDBEdit5Exit(Sender: TObject);
    procedure framPaciente1dxDBEdit16Exit(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure framPaciente1dxDBEdit16Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FocoControle; override;
    procedure AtualizarFLGestante;
    function VerificarNrProcesso:Double;
    procedure ConsultaPaciente;
    procedure PacienteExistente;
  end;

var
  frmCadPaciente: TfrmCadPaciente;
  sPSQL, sPSQL2: String;

implementation

uses UDM, UDMGERAL, uFrmLocPaciente, UGeral, UProcessoExistente;

{$R *.dfm}

procedure TfrmCadPaciente.ConsultaPaciente;
var sWhere:string;
begin
  if (DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert]) then
  begin
    try
      sWhere := 'WHERE';
      qyPacienteExistente.Close;
      qyPacienteExistente.SQL.Text := sPSQL2;
      if (DMGERAL.TB_PACIENTENM_PACIENTE.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere + ' Upper(NM_PACIENTE) like('''+ UpperCase(DMGERAL.TB_PACIENTENM_PACIENTE.AsString) + '%'')');
         sWhere := 'AND';
      end;

      if (DMGERAL.TB_PACIENTENM_MAE.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere +' Upper(NM_MAE) like('''+ UpperCase(DMGERAL.TB_PACIENTENM_MAE.AsString)+ '%'')');
         sWhere := 'AND';
      end;

      if (DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere + ' DT_NASCIMENTO = :DATA');
         qyPacienteExistente.ParamByName('DATA').AsDate := DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime;
         sWhere := 'AND';
      end;

      qyPacienteExistente.Open;
      PacienteExistente;
    except
      qyPacienteExistente.close;
    end;
  end;
end;

function TfrmCadPaciente.VerificarNrProcesso:Double;
var
  bLibera, bEXIT:Boolean;
begin
  if DMGERAL.TB_PACIENTENR_PROCESSO.AsString <> '' then
  begin
    bLibera := false;
    bEXIT := true;
    Result := 0;

    qyPacienteExistente.Close;
    qyPacienteExistente.SQL.Text := sPSQL2;
    if (DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger <> null) then
    begin
       qyPacienteExistente.SQL.Add('WHERE NR_PROCESSO =:processo');
       qyPacienteExistente.ParamByName('processo').AsInteger :=
          DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger;

    end;
    qyPacienteExistente.Open;
    qyPacienteExistente.First;

    while not qyPacienteExistente.Eof do
    begin
      bEXIT := false;
      if qyPacienteExistenteCD_PACIENTE.AsInteger = DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger then
      begin
        bLibera := true;
        qyPacienteExistente.Next;
      end
      else
        qyPacienteExistente.Next;
    end;

    if bLibera then
      bEXIT := true;

    if not bEXIT then
    begin
      framPaciente1dxDBEdit16Exit(Self);
      Result := 1;
    end;

  end;
end;

procedure TfrmCadPaciente.PacienteExistente;
begin
  if not qyPacienteExistente.Eof then
  begin
    frmProcessoExistente := TfrmProcessoExistente.Create(application);
    frmProcessoExistente.DBGrid1.DataSource := dsPacienteExistente;
    if frmProcessoExistente.ShowModal=mrok then
      begin
        DMGERAL.TB_PACIENTE.Cancel;
        DMGERAL.TB_PACIENTE.close;
        qyPaciente.Locate('CD_PACIENTE',qyPacienteExistente.FieldByname('cd_paciente').AsInteger,[]);
        DMGERAL.TB_PACIENTE.Open;
        DMGERAL.TB_PACIENTE.Edit;
        framPaciente1.RxDBLookupCombo1.SetFocus;
      end;
    qyPacienteExistente.Close;
    frmProcessoExistente.Free;
  end;
end;

procedure TfrmCadPaciente.AtualizarFLGestante;
var calc:integer;
begin
  try
    btflGestante.Caption := 'Aguarde a msg...';
    calc := 0;
    DMGERAL.TB_TESTE.Open;
    DMGERAL.TB_TESTE.First;
    while not DMGERAL.TB_TESTE.Eof do
    begin
      try
        if DMGERAL.TB_TESTEFL_GESTANTE.AsString = '' then
          begin
            DMGERAL.TB_TESTE.Edit;
            DMGERAL.TB_TESTEFL_GESTANTE.AsInteger := 0;
            DMGERAL.TB_TESTE.Post;
            calc := calc + 1;
          end;
      finally
         DMGERAL.TB_TESTE.Next;
      end;
    end;
    btflGestante.Caption := 'Atualização concluida';
    MessageDlg('Total de Campos atualizados:' + IntToStr(calc) ,mtInformation,
     [mbOK],0);

    DMGERAL.TB_TESTE.Close; 
  except
   MessageDlg('Erro na procedure AtualizarFLGestante!',mtError,
    [mbOK],0);
  end;

   btflGestante.Visible := false;
end;

procedure TfrmCadPaciente.FormCreate(Sender: TObject);
begin
  inherited;
  DMGERAL.TB_PACIENTE.DataSource := dsGrid;
  sPSQL := qyPaciente.SQL.Text;
  sPSQL2 := qyPacienteExistente.SQL.Text;
end;

procedure TfrmCadPaciente.FormShow(Sender: TObject);
begin
  inherited;
  if sCadastroPaciente then
    pgGeral.ActivePage := tabGeral;

  if sListagemPaciente then
    pgGeral.ActivePage := tabLista;

  qyPaciente.Open;
  framPaciente1.AbreConsultas;
end;

procedure TfrmCadPaciente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  framPaciente1.FechaConsultas;
end;

procedure TfrmCadPaciente.btgravarClick(Sender: TObject);
begin
  if VerificarNrProcesso = 1  then
    abort;

  framPaciente1.VerificarCampos;
  inherited;
end;

procedure TfrmCadPaciente.btAnteriorClick(Sender: TObject);
begin
  inherited;
  dsGrid.DataSet.Prior;
end;

procedure TfrmCadPaciente.btProximoClick(Sender: TObject);
begin
  inherited;
  dsGrid.DataSet.Next;
end;

procedure TfrmCadPaciente.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  inherited;
  sbPadrao.Canvas.Brush.Color:=$00FFEECC;
  sbPadrao.Canvas.FillRect(Rect);
  sbPadrao.Canvas.TextOut(Rect.Left+18,Rect.Top,'Todos os campos que estiverem com * são obrigatórios.');
  ImageList1.Draw(StatusBar.Canvas,Rect.Left,Rect.top, 2);

end;

procedure TfrmCadPaciente.btPesquisarClick(Sender: TObject);
begin
  inherited;
  frmLocPaciente := TfrmLocPaciente.Create(self);
  frmLocPaciente.ShowModal;
  frmLocPaciente.Free;
  pgGeral.ActivePage := tabLista;
end;

procedure TfrmCadPaciente.tabListaShow(Sender: TObject);
var chave:integer;
begin
  inherited;
  if not (DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert]) then
    begin
      chave := DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
      qyPaciente.Close;
      qyPaciente.Open;
      qyPaciente.Locate('CD_PACIENTE', chave, []);
    end;
end;

procedure TfrmCadPaciente.FocoControle;
begin
  inherited;
  framPaciente1.dxDBEdit2.SetFocus;
end;

procedure TfrmCadPaciente.btflGestanteClick(Sender: TObject);
begin
  inherited;
  AtualizarFLGestante;
end;

procedure TfrmCadPaciente.framPaciente1dxDBEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) and (chr(Key) in ['G', 'g']) then
    btflGestante.Visible := true;

end;

procedure TfrmCadPaciente.framPaciente1dsPacienteDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  framPaciente1.dsPacienteDataChange(Sender, Field);

end;

procedure TfrmCadPaciente.framPaciente1dxDBEdit2Exit(Sender: TObject);
begin
  if DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert] then
  begin
    if DMGERAL.TB_PACIENTENM_PACIENTE.AsString <> '' then
      ConsultaPaciente;
  end;

end;

procedure TfrmCadPaciente.framPaciente1DBDateEdit3Exit(Sender: TObject);
begin
  inherited;
  inherited;
  if DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert] then
  begin
    framPaciente1.DBDateEdit3Exit(Sender);
    ConsultaPaciente;
  end;

end;

procedure TfrmCadPaciente.framPaciente1dxDBEdit5Exit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert] then
  begin
    ConsultaPaciente;
  end;


end;

procedure TfrmCadPaciente.framPaciente1dxDBEdit16Exit(Sender: TObject);
begin
  //inherited;
  if (DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert]) then
  begin
    try
      qyPacienteExistente.Close;
      qyPacienteExistente.SQL.Text := sPSQL;

      if (DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger <> null) then
      begin
         qyPacienteExistente.SQL.Add('WHERE NR_PROCESSO =:processo');
         qyPacienteExistente.ParamByName('processo').AsInteger :=
            DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger;

      end;
      qyPacienteExistente.Open;
      PacienteExistente;
    except
      qyPacienteExistente.close;
    end;
  end;
end;

procedure TfrmCadPaciente.btIncluirClick(Sender: TObject);
begin
  inherited;
  framPaciente1.RxDBComboBox4.SetFocus;
end;

procedure TfrmCadPaciente.bteditarClick(Sender: TObject);
begin
  inherited;
  framPaciente1.RxDBComboBox4.SetFocus;
end;

procedure TfrmCadPaciente.grDadosDblClick(Sender: TObject);
begin
  inherited;
  DMGERAL.TB_PACIENTE.Locate('CD_PACIENTE',
    qyPacienteCD_PACIENTE.AsInteger,[]);
end;

procedure TfrmCadPaciente.framPaciente1dxDBEdit16Change(Sender: TObject);
begin
  inherited;
  if Pos('-', framPaciente1.dxDBEdit16.Text) > 0 then
  begin
    if (DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert]) then
    begin
      try
        qyPacienteExistente.Close;
        qyPacienteExistente.SQL.Text := sPSQL;

       qyPacienteExistente.SQL.Add('WHERE NR_PROCESSO_CRIANCA_EXP like :processo');
       qyPacienteExistente.ParamByName('processo').AsString :=
          framPaciente1.dxDBEdit16.Text +'%';

        qyPacienteExistente.Open;
        if qyPacienteExistente.RecordCount > 0 then
          PacienteExistente
        else
        begin
          ShowMessage('Nenhum registro de criança exposta que começe com '+ framPaciente1.dxDBEdit16.Text +' encontrado');
          qyPacienteExistente.Close;
        end;
      except
        qyPacienteExistente.close;
      end;
    end;
    frampaciente1.dxDBEdit16.Clear;
  end;
end;

end.
