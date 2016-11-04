unit uConsAbandono;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, IBCustomDataSet, IBQuery, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  dxDBTLCl, dxGrClms, DBCtrls, Mask, dxEdLib, dxDBELib, dxEditor, RxLookup, DateUtil,
  Menus, Grids, DBGrids;

type
  TfrmConsAbandono = class(TfrmCadPad)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    qyTipo: TIBQuery;
    qyTipoCD_TIPO_ABANDONO: TIntegerField;
    qyTipoDS_TIPO_ABANDONO: TIBStringField;
    dsTipo: TDataSource;
    Label7: TLabel;
    DBCheckBox1: TDBCheckBox;
    dxDBEdit9: TdxDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dxDBEdit1: TdxDBEdit;
    tabFaltantes: TTabSheet;
    dxDBGrid2: TdxDBGrid;
    qyAgenda: TIBQuery;
    dsAgenda: TDataSource;
    qyAgendaCD_PACIENTE: TIntegerField;
    qyAgendaNM_PACIENTE: TIBStringField;
    qyAgendaNR_PROCESSO: TIntegerField;
    dxDBGrid2CD_PACIENTE: TdxDBGridMaskColumn;
    dxDBGrid2NM_PACIENTE: TdxDBGridMaskColumn;
    dxDBGrid2NR_PROCESSO: TdxDBGridMaskColumn;
    dxDBGrid2ULTIMA_DATA: TdxDBGridDateColumn;
    dxDBGrid2Column5: TdxDBGridColumn;
    qyAbandono: TIBQuery;
    qyAbandonoDT_CONTATO: TDateTimeField;
    qyAbandonoNM_RESP_CONTATO: TIBStringField;
    qyAbandonoDS_DETALHE_ABANDONO: TIBStringField;
    qyAbandonoNM_INFORMANTE: TIBStringField;
    qyAbandonoCD_PACIENTE: TIntegerField;
    qyAbandonoNM_PACIENTE: TIBStringField;
    qyAbandonoDS_TIPO_ABANDONO: TIBStringField;
    grDadosDT_CONTATO: TdxDBGridDateColumn;
    grDadosNM_RESP_CONTATO: TdxDBGridMaskColumn;
    grDadosCD_PACIENTE: TdxDBGridMaskColumn;
    grDadosNM_PACIENTE: TdxDBGridMaskColumn;
    grDadosDS_TIPO_ABANDONO: TdxDBGridMaskColumn;
    qyAgendaNR_TEL_1: TIBStringField;
    qyAgendaNR_TEL_2: TIBStringField;
    dxDBGrid2Column6: TdxDBGridColumn;
    dxDBGrid2Column7: TdxDBGridColumn;
    Label8: TLabel;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    qyAbandonoNR_TEL_1: TIBStringField;
    qyAbandonoNR_TEL_2: TIBStringField;
    qyAbandonoCD_ABANDONO_HIST: TIntegerField;
    qyAgendaULTIMA_DATA: TDateTimeField;
    qyAgendaNR_DIAS: TLargeintField;
    qyAgendaFL_REALIZADO: TIntegerField;
    qyAgendaFL_PARECER: TIntegerField;
    qyAgendaFL_REMARCADO: TIntegerField;
    qyAgendaDS_UNIDADE: TIBStringField;
    dxDBGrid2Column8: TdxDBGridColumn;
    tabHistorico: TTabSheet;
    dxDBGrid1: TdxDBGrid;
    grDadosNM_MEDICO: TdxDBGridMaskColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    grDadosColumn7: TdxDBGridColumn;
    grDadosColumn12: TdxDBGridColumn;
    grDadosDT_AGENDA: TdxDBGridDateColumn;
    grDadosVL_CD4: TdxDBGridMaskColumn;
    grDadosColumn6: TdxDBGridColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    grDadosColumn8: TdxDBGridColumn;
    grDadosColumn9: TdxDBGridColumn;
    grDadosColumn10: TdxDBGridColumn;
    grDadosColumn11: TdxDBGridColumn;
    qyHistorico: TIBQuery;
    qyAgendaCD_AGENDA: TIntegerField;
    IntegerField1: TIntegerField;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaCD_UNIDADE: TIntegerField;
    qyAgendaCD_MEDICO: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    qyAgendaTP_ESQUEMA: TIntegerField;
    qyAgendaVL_CD4: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    qyAgendaNM_MEDICO: TIBStringField;
    qyAgendaCD_UND: TIntegerField;
    qyAgendaDT_REMARCACAO: TDateTimeField;
    qyAgendaCD_BAIRRO: TIntegerField;
    qyAgendaCD_PAIS: TIntegerField;
    qyAgendaCD_MUNICIPIO: TIntegerField;
    qyAgendaCD_MOR_MUNICIPIO: TIntegerField;
    qyAgendaCD_PROVINCIA: TIntegerField;
    qyAgendaCD_COMUNA: TIntegerField;
    qyAgendaDT_NASCIMENTO: TDateField;
    qyAgendaIDADE: TSmallintField;
    qyAgendaNM_MAE: TIBStringField;
    qyAgendaCD_MORADA_PERM: TIBStringField;
    qyAgendaCD_ESCOLARIDADE: TSmallintField;
    qyAgendaDS_ESCOLARIDADE: TIBStringField;
    qyAgendaTP_SEXO: TIBStringField;
    qyAgendaMESES: TIntegerField;
    qyAgendaESTADO_CIVIL: TIntegerField;
    qyAgendaCD_NAR_PROVINCIA: TIntegerField;
    qyAgendaCD_PACIENTE_ORACLE: TIntegerField;
    qyAgendaCD_OCUPACAO: TIntegerField;
    qyAgendaCD_DOCUMENTO: TIntegerField;
    qyAgendaTP_DOCUMENTO: TIBStringField;
    qyAgendaNR_DOCUMENTO: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    qyAgendaDS_ENDERECO: TIBStringField;
    qyAgendaFL_GESTANTE: TIntegerField;
    qyAgendaFL_NOTIFICACAO: TIntegerField;
    qyAgendaNR_MESES_GESTANTE: TIntegerField;
    qyAgendaFL_RESULTADO: TIBStringField;
    qyAgendaDS_ESQUEMA: TIBStringField;
    IntegerField4: TIntegerField;
    qyAgendaFL_CONFIRMADO: TIntegerField;
    qyAgendaFL_TRANSFERIDO: TIntegerField;
    qyAgendaCONFIRMADO: TIBStringField;
    qyAgendaREALIZADO: TIBStringField;
    qyAgendaREMARCADO: TIBStringField;
    qyAgendaTRANSFERIDO: TIBStringField;
    qyAgendaNR_LAB: TIntegerField;
    IntegerField5: TIntegerField;
    dsHistorico: TDataSource;
    qyAgendaCD_UND2: TIntegerField;
    N1: TMenuItem;
    imAbrirNotificacao: TMenuItem;
    dxDBGrid2Column9: TdxDBGridColumn;
    qyAgendaTIPO: TIBStringField;
    tabAbandono: TTabSheet;
    qyAgendaNM_MEDICO2: TIBStringField;
    dxDBGrid2NM_MEDICO: TdxDBGridMaskColumn;
    qyAbandonoTP_ABANDONO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btLocPacienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocPacienteChange(Sender: TObject);
    procedure btLocPacienteExit(Sender: TObject);
    procedure pgGeralChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGrid2Column5CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure bteditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure AbrirNotificao1Click(Sender: TObject);
    procedure qyAgendaBeforeOpen(DataSet: TDataSet);
    procedure grDadosDblClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
  private
    { Private declarations }
    sSQLAgenda:string;
  public
    { Public declarations }
    procuraCD_PACIENTE : Integer;
    edicaoExterna: Boolean;
    procedure InicializaControles;

  end;

var
  frmConsAbandono: TfrmConsAbandono;

implementation

uses UDM, UDMGERAL, UfrmLocalizar, UGeralSQL, UGeral, uRelatorioWEB, uFuncaoGrid;

{$R *.dfm}


procedure TfrmConsAbandono.InicializaControles;
begin
  btexcluir.Enabled := true;
  bteditar.Enabled := true;
  btgravar.Enabled := false;
  btCancelar.Enabled := false;
  btimprimir.Enabled := true;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
  btPesquisar.Enabled := true;
end;

procedure TfrmConsAbandono.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qyAgenda.Close;
  qyAbandono.Close;
end;

procedure TfrmConsAbandono.FormShow(Sender: TObject);
begin
  inherited;
  if procuraCD_PACIENTE <> 0 then
  begin
    pgGeral.ActivePage := tabAbandono;
    pgGeralChange(nil);
    //qyAgenda.Open;
    qyAgenda.Locate('CD_PACIENTE', procuraCD_PACIENTE,[]);
  end;
  qyAgenda.Open;
  qyAbandono.Open;
  qyTipo.Open;
  bteditar.Enabled := (pgGeral.ActivePage = tabGeral)and not(dsControle.State in [dsEdit, dsInsert]);
  btIncluir.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
  bteditar.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
  btexcluir.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);

end;

procedure TfrmConsAbandono.btLocPacienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
{  if dsControle.DataSet.State in [dsEdit, dsInsert] then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Utente';
    frmLocalizar.qyDados := SelectDadosPaciente;
    try
      frmLocalizar.Where := false;
      SetLength(VCampo,4);
      frmLocalizar.KeyField := 'cd_paciente';
      VCampo[0].Titulo  := 'Cód.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome Utente';
      VCampo[1].Width := 25;
      VCampo[2].Titulo  := 'Nome Mae';
      VCampo[2].Width := 25;
      VCampo[3].Titulo  := 'Data Nasc.';
      VCampo[3].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := True;
      VCampo[3].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      DMGERAL.TB_ABANDONONM_PACIENTE.AsString := frmLocalizar.qyDados.FieldByname('nm_paciente').AsString;
      DMGERAL.TB_ABANDONOCD_PACIENTE.AsInteger := frmLocalizar.qyDados.FieldByname('cd_paciente').Asinteger;
    end;
    frmLocalizar.qyDados.Close;
    frmLocalizar.Free;
  end;
}
end;

procedure TfrmConsAbandono.btLocPacienteChange(Sender: TObject);
begin
  inherited;
{  if dsControle.DataSet.State in [dsEdit,dsInsert] then
  begin
    if btLocPaciente.Text = '' then
      DMGERAL.TB_ABANDONONM_PACIENTE.Clear
    else if btLocPaciente.Modified then
    begin
      try
        DMGERAL.TB_ABANDONONM_PACIENTE.AsString := PegaValor('NM_PACIENTE','PACIENTE',['CD_PACIENTE'],
          [btLocPaciente.Text]);
      except
        begin
          DMGERAL.TB_ABANDONONM_PACIENTE.Clear;
        end;
      end;
    end;
  end;
}
end;

procedure TfrmConsAbandono.btLocPacienteExit(Sender: TObject);
begin
  inherited;
{  if dsControle.DataSet.State in [dsEdit,dsInsert] then
  begin
    if btLocPaciente.Text <> '' then
    begin
      try
        DMGERAL.TB_ABANDONONM_PACIENTE.AsString := PegaValor('NM_PACIENTE','PACIENTE',['CD_PACIENTE'],
          [btLocPaciente.Text]);
      except
        begin
          MessageDlg('Utente não encontrado!',mtWarning,[mbOK],0);
          DMGERAL.TB_ABANDONOCD_PACIENTE.Clear;
          DMGERAL.TB_ABANDONONM_PACIENTE.Clear;
        end;
      end;
    end;
  end;
}
end;

procedure TfrmConsAbandono.pgGeralChange(Sender: TObject);
begin
  inherited;

  if pgGeral.ActivePage = tabFaltantes then
  begin
     qyAgenda.Close;
     dxDBGrid2.Parent := tabFaltantes;
     Screen.Cursor := crHourGlass;
     Application.ProcessMessages;
     qyAgenda.Open;
     Screen.Cursor := crDefault;
  end;

  if pgGeral.ActivePage = tabAbandono then
  begin
     qyAgenda.Close;
     dxDBGrid2.Parent := tabAbandono;
     Screen.Cursor := crHourGlass;
     Application.ProcessMessages;
     qyAgenda.Open;
     Screen.Cursor := crDefault;
  end;

  qyAbandono.Active := (pgGeral.ActivePage = tabLista);
  qyHistorico.Active := (pgGeral.ActivePage = tabHistorico);
  bteditar.Enabled := (pgGeral.ActivePage = tabGeral)and not(dsControle.State in [dsEdit, dsInsert]);
  bteditar.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
  btexcluir.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
end;

procedure TfrmConsAbandono.FormCreate(Sender: TObject);
begin
  inherited;
  procuraCD_PACIENTE := 0;
  edicaoExterna := False;
  DMGERAL.TB_ABANDONO.DataSource := dsGrid;
  tabHistorico.TabVisible := false;
  sSQLAgenda := qyAgenda.SQL.Text;
end;

procedure TfrmConsAbandono.dxDBGrid2Column5CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  inherited;
  dxDBGrid2.Canvas.Font.Color:= clRed;
  dxDBGrid2.Canvas.Font.Style := [fsBold];

end;

procedure TfrmConsAbandono.bteditarClick(Sender: TObject);
begin
//  inherited;
  if not(dsControle.DataSet.State in [dsEdit, dsInsert]) and
    (dsControle.DataSet.RecordCount > 0) then
  begin
    btexcluir.Enabled := false;
    bteditar.Enabled := false;
    btgravar.Enabled := true;
    btCancelar.Enabled := true;
    btimprimir.Enabled := false;
    btAnterior.Enabled := false;
    btProximo.Enabled := false;
    btPesquisar.Enabled := false;
    dm.Transacao(dsControle.DataSet);
    dsControle.DataSet.Edit;
  end
  else
    Abort;

end;

procedure TfrmConsAbandono.btCancelarClick(Sender: TObject);
begin
//  inherited;
  InicializaControles;
  if dsControle.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsControle.DataSet.Cancel;
    DM.Rollback(dsControle.DataSet);
  end;

end;

procedure TfrmConsAbandono.btexcluirClick(Sender: TObject);
begin
//  inherited;
  if not (dsControle.DataSet.State in [dsEdit, dsInsert]) and
    (dsControle.DataSet.RecordCount > 0) then
  begin
    DM.Transacao(dsControle.DataSet);
    dsControle.DataSet.Delete;
    InicializaControles;
    DM.Commit(dsControle.DataSet);
  end;

end;

procedure TfrmConsAbandono.btgravarClick(Sender: TObject);
var qy:TIBQuery;
begin
//  inherited;
  InicializaControles;
  if dsControle.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsControle.DataSet.Post;
    if VerificaUtenteAbandono(dsControle.DataSet.FieldByName('CD_PACIENTE').AsInteger) then
    begin
      if Application.MessageBox('O paciente esta com status Abandono, deseja mudar o status para ACTIVO?','Atenção!', MB_YESNO+MB_ICONQUESTION) = IDYES then
      begin
        try
          qy := TIBQuery.Create(nil);
          with qy do
          begin
            Database := DM.DB;
            Transaction := DM.TS;
            SQL.Add('UPDATE NOTIFICACAO');
            SQL.Add('SET CD_EVOLUCAO = 1, DT_EVOLUCAO_2 = Cast(''now'' as timeStamp)');
            SQL.Add('WHERE CD_PACIENTE = :CD_PACIENTE AND CD_UND = :CD_UND');
            ParamByName('CD_UND').AsString := prmUnidade;
            ParamByName('CD_PACIENTE').AsInteger :=
              dsControle.DataSet.FieldByName('CD_PACIENTE').AsInteger;
            ExecSQL;
            ShowMessage('Operação realizada com sucesso!');
            if edicaoExterna then
              ModalResult := mrOk;
          end;
        finally
          FreeAndNil(qy);
        end;
      end
      else if edicaoExterna then
        ModalResult := mrCancel;
    end;
  end;
end;

procedure TfrmConsAbandono.AbrirNotificao1Click(Sender: TObject);
begin
  inherited;
  if not (DMGERAL.TB_ABANDONO.State in [dsEdit, dsInsert]) then
  begin
    DMGERAL.TB_ABANDONO.Insert;
    DMGERAL.TB_ABANDONOCD_PACIENTE.AsInteger :=
      qyAgendaCD_PACIENTE.AsInteger;
    DMGERAL.TB_ABANDONONM_PACIENTE.AsString :=
      qyAgendaNM_PACIENTE.AsString;

    DMGERAL.TB_ABANDONONR_TEL_1.AsString :=
      qyAgendaNR_TEL_1.AsString;

    DMGERAL.TB_ABANDONONR_TEL_2.AsString :=
      qyAgendaNR_TEL_2.AsString;


    pgGeral.ActivePage := tabGeral;
    DBEdit5.SetFocus;
    btexcluir.Enabled := false;
    bteditar.Enabled := false;
    btgravar.Enabled := true;
    btCancelar.Enabled := true;
    btimprimir.Enabled := false;
    btAnterior.Enabled := false;
    btProximo.Enabled := false;
    btPesquisar.Enabled := false;
    //if FbPermiteMudarPagina then  pgGeral.ActivePageIndex := 2;

  end;

end;

procedure TfrmConsAbandono.qyAgendaBeforeOpen(DataSet: TDataSet);
var sTipo:string;
begin
  inherited;

  if pgGeral.ActivePage = tabFaltantes then
    sTipo := 'and A.DT_AGENDA > (cast(''now'' as timestamp)-'+ IntToStr(nDiasAbandono) +')';
    //sTipo := 'and trunc(cast(''now'' as timestamp) - A.DT_AGENDA) <' + IntToStr(nDiasAbandono); // query alterada para melhorar performance

  if pgGeral.ActivePage = tabAbandono then
    sTipo := 'and A.DT_AGENDA <= (cast(''now'' as timestamp)-' + IntToStr(nDiasAbandono) +')';
    //sTipo := 'and trunc(cast(''now'' as timestamp) - A.DT_AGENDA) >= ' + IntToStr(nDiasAbandono);

  qyAgenda.Sql.Text := StringReplace(sSQLAgenda,'/*TIPO*/',sTipo,[]);
  qyAgenda.ParamByName('nDiasAbandono').AsInteger := nDiasAbandono;
  qyAgenda.ParamByName('cd_unidade').AsString := prmUnidade;

end;

procedure TfrmConsAbandono.grDadosDblClick(Sender: TObject);
begin
  inherited;
  DMGERAL.TB_ABANDONO.Locate('cd_abandono_hist', qyAbandonoCD_ABANDONO_HIST.AsInteger, []);

end;

procedure TfrmConsAbandono.btimprimirClick(Sender: TObject);
var sArq, sExt, sAuxDe, sAuxPara:string; s:TStringList;
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  s := TStringList.Create;
  try
    sExt := '.html';
    sArq := sPathConsulta + FormatDateTime('ddmmyyhhnnss',now) + sExt;
    sArqGridHtml := sArq;
    dxDBGrid2.SaveToHTML(sArq, false);
    s.LoadFromFile(sArq);
    sAuxDe := '<TITLE>grDados</TITLE>';
    sAuxPara := '<TITLE>'+caption+'</TITLE>';
    s.text := StringReplace(s.Text,sAuxDe,sAuxPara,[]);
    sAuxDe := '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=1 BGCOLOR=#C0C0C0>';
    sAuxPara := sAuxDe +
       '<TR class="Header"><TD HEIGHT=30 COLSPAN="'+intToStr(grDados.ColumnCount)
       +'" ALIGN="CENTER" BGCOLOR=#ECE9D8><b>'+Caption+'</b></TD></TR>';
    s.text := StringReplace(s.Text,sAuxDe,sAuxPara,[]);
    s.SaveToFile(sArq);
    //ImprimeGrid(grDados, Self.Caption);
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
    FreeAndNil(s);
  end;
end;

end.
