unit UCadAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, dxDBTLCl,
  dxGrClms, IBCustomDataSet, IBQuery, DBCtrls, Menus;

type
  TfrmCadAtendimentos = class(TfrmCadPad)
    qyAtendimento: TIBQuery;
    qyAtendimentoCD_ATENDIMENTO: TIntegerField;
    qyAtendimentoCD_UND: TIntegerField;
    qyAtendimentoCD_MEDICO: TIntegerField;
    qyAtendimentoDT_ATENDIMENTO: TDateTimeField;
    qyAtendimentoNM_MEDICO: TIBStringField;
    grDadosCD_ATENDIMENTO: TdxDBGridMaskColumn;
    grDadosCD_UND: TdxDBGridMaskColumn;
    grDadosCD_MEDICO: TdxDBGridMaskColumn;
    grDadosDT_ATENDIMENTO: TdxDBGridDateColumn;
    grDadosNM_MEDICO: TdxDBGridMaskColumn;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Calendario: TMonthCalendar;
    DBRadioGroup1: TDBRadioGroup;
    dsMedico: TDataSource;
    DBGrid1: TDBGrid;
    qyAtendimentoTP_PERIODO: TIntegerField;
    grDadosColumn6: TdxDBGridColumn;
    qyAtendimentoDS_PERIODO: TStringField;
    qyMedico: TIBQuery;
    qyMedicoCD_MEDICO: TIntegerField;
    qyMedicoNM_MEDICO: TIBStringField;
    qyAtendimentoDia: TIBQuery;
    procedure btIncluirClick(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgGeralChange(Sender: TObject);
    procedure qyAtendimentoCalcFields(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure grDadosDblClick(Sender: TObject);
    procedure dsControleStateChange(Sender: TObject);
  private
    { Private declarations }
    function ValidaImpedimento(pncd_medico:string):Boolean;
  public
    { Public declarations }
    FbPermiteMudarPagina: boolean;
    procedure SetNavegaAgenda(bNavega: boolean);

  end;

var
  frmCadAtendimentos: TfrmCadAtendimentos;
  strSQL:String;
  gDataCalendario:TDate;

implementation

uses
  UDM, UDMGERAL, UfrmLocalizar, UGERALSQL, DateUtils;

{$R *.dfm}

function TfrmCadAtendimentos.ValidaImpedimento(pncd_medico:string):Boolean;
begin
  qyAtendimentoDia.Close;
  qyAtendimentoDia.ParamByName('CD_MEDICO').AsString := pncd_medico;
  qyAtendimentoDia.ParamByName('DATA').AsDate := Calendario.Date;
  qyAtendimentoDia.Open;
  result := qyAtendimentoDia.FieldByName('CD_ATENDIMENTO').AsInteger >= 1;
end;


procedure TfrmCadAtendimentos.SetNavegaAgenda(bNavega: boolean);
begin
  //Nao permite navegar se esta em modo de Edicao/Insercao
end;


procedure TfrmCadAtendimentos.btIncluirClick(Sender: TObject);
begin
  if DayOfTheWeek(Calendario.Date) in [6,7] then
  begin
    ShowMessage('Não pode ser realizado agendamento no ' + FormatDateTime('dddd',Calendario.Date) + '!');
    Calendario.Date := gDataCalendario;
    Exit;
  end;

  SetNavegaAgenda(false);
  inherited;

  pgGeral.ActivePage := tabGeral;
  if FbPermiteMudarPagina then
    pgGeral.ActivePage := tabGeral;

  Calendario.Enabled := false;

end;

procedure TfrmCadAtendimentos.CalendarioClick(Sender: TObject);
begin
  inherited;
  if not (DMGERAL.TB_ATENDIMENTO.State in [dsEdit, dsInsert]) then
  begin
    dmGeral.TB_ATENDIMENTO.Close;
    dmGeral.TB_ATENDIMENTO.ParamByName('DT_DE').AsDate := trunc(Calendario.Date);
    dmGeral.TB_ATENDIMENTO.ParamByName('DT_ATE').AsDate := trunc(Calendario.Date)+1;
    dmGeral.TB_ATENDIMENTO.ParamByName('MEDICO').Asinteger := qyMedicoCD_MEDICO.AsInteger;
    dmGeral.TB_ATENDIMENTO.Open;
  end;

  gDataCalendario := Calendario.Date;
  
end;

procedure TfrmCadAtendimentos.btexcluirClick(Sender: TObject);
begin
  inherited;
  Calendario.Enabled := true;
  SetNavegaAgenda(true);
  if FbPermiteMudarPagina then
    pgGeral.ActivePage := tabLista;

end;

procedure TfrmCadAtendimentos.btCancelarClick(Sender: TObject);
begin
  inherited;
  InicializaControles;
  Calendario.Enabled := true;
  SetNavegaAgenda(true);
  pgGeral.ActivePage := tabGeral;
  qyAtendimento.Close; qyAtendimento.Open;
  if FbPermiteMudarPagina then
    pgGeral.ActivePage := tabLista;

end;

procedure TfrmCadAtendimentos.bteditarClick(Sender: TObject);
begin
  SetNavegaAgenda(false);
  pgGeral.ActivePage := tabGeral;
  if FbPermiteMudarPagina then
      pgGeral.ActivePage := tabLista;

  inherited;
  Calendario.Enabled := false;

end;

procedure TfrmCadAtendimentos.btgravarClick(Sender: TObject);
var
  Manha, Tarde: boolean;
begin
  dmGeral.TB_ATENDIMENTODT_ATENDIMENTO.AsDateTime := trunc(Calendario.Date);
  dmGeral.TB_ATENDIMENTOCD_MEDICO.AsInteger := qyMedicoCD_MEDICO.AsInteger;

  if (dmGeral.TB_ATENDIMENTO.State in [dsInsert, dsEdit]) then
  begin
    if ValidaImpedimento(qyMedicoCD_MEDICO.AsString) then
    begin

      if not qyAtendimentoDia.Eof then
      begin

        Manha := false;
        Tarde := false;
        if qyAtendimentoDia.Locate('tp_periodo', '1', []) then
          manha := true;

        if qyAtendimentoDia.Locate('tp_periodo', '2', []) then
          tarde := true;

        if manha and tarde then
        begin
          MessageDlg('Este médico ja possui atendimentos para o período da Manha e Tarde!',
          mtConfirmation,[mbOk], 0);
          abort;
        end;

      end;

      if qyAtendimentoDia.FieldByName('tp_periodo').AsString = '1' then
      begin
        if DMGERAL.TB_ATENDIMENTOTP_PERIODO.AsInteger in [1,3,4] then
        begin
          MessageDlg('Este médico ja possui atendimento para o período da Manha!' + #10#13 +
            'Os periodos (Manha/Triagem/Não Atende) não podem ser vinculados para esta data.',
          mtInformation,[mbOk], 0);
          abort;
        end;

        if MessageDlg('Este médico ja possui atendimento para o período da Manha, deseja continuar!',
        mtConfirmation, [mbNo, mbYes], 0) = mrNo then
          abort;
      end;

      if qyAtendimentoDia.FieldByName('tp_periodo').AsString = '2' then
      begin
        if DMGERAL.TB_ATENDIMENTOTP_PERIODO.AsInteger in [2,3,4] then
        begin
          MessageDlg('Este médico ja possui atendimento para o período da Tarde!' + #10#13 +
            'Os periodos (Tarde/Triagem/Não Atende) não podem ser vinculados para esta data.',
          mtInformation,[mbOk], 0);
          abort;
        end;

        if MessageDlg('Este médico ja possui atendimento para o período da Tarde, deseja continuar!',
        mtConfirmation, [mbNo, mbYes], 0) = mrNo then
          abort;
      end;

      if qyAtendimentoDia.FieldByName('tp_periodo').AsString = '3' then
      begin
        MessageDlg('Este médico ja possui atendimento para Triagem!',
        mtInformation,[mbOk], 0);
        abort;
      end;

      if qyAtendimentoDia.FieldByName('tp_periodo').AsString = '4' then
      begin
        MessageDlg('Este médico não esta atendendo nesta data!',
        mtInformation,[mbOk], 0);
        abort;
      end;
    end;
  end;

  inherited;
  InicializaControles;
  Calendario.Enabled := true;
  SetNavegaAgenda(true);
  pgGeral.ActivePage := tabGeral;
end;

procedure TfrmCadAtendimentos.FormCreate(Sender: TObject);
begin
  inherited;
  Calendario.Date := dm.GetDateTime;
  FbPermiteMudarPagina := True;
  dsMedico.DataSet.Open;

end;

procedure TfrmCadAtendimentos.FormShow(Sender: TObject);
begin
  inherited;
  strSQL := qyAtendimento.SQL.Text;
  pgGeral.ActivePage := tabGeral;
  CalendarioClick(Sender);

end;

procedure TfrmCadAtendimentos.btimprimirClick(Sender: TObject);
begin
  pgGeral.TabIndex := 0;
  inherited;

end;

procedure TfrmCadAtendimentos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
    DBGrid1.Canvas.Brush.Color:= clmenubar
  else
    DBGrid1.Canvas.Brush.Color:= clCream;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
      begin
      Brush.Color := clmoneygreen;
      FillRect(Rect);
      Font.Style := [fsbold]
      end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure TfrmCadAtendimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsMedico.DataSet.Close;

  end;

procedure TfrmCadAtendimentos.pgGeralChange(Sender: TObject);
begin
  inherited;
  qyAtendimento.Active := (pgGeral.ActivePage = tabLista);
  btexcluir.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
  bteditar.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
end;

procedure TfrmCadAtendimentos.qyAtendimentoCalcFields(DataSet: TDataSet);
begin
  inherited;
  case qyAtendimentoTP_PERIODO.AsInteger of
    1:qyAtendimentoDS_PERIODO.AsString := 'MANHA';
    2:qyAtendimentoDS_PERIODO.AsString := 'TARDE';
    3:qyAtendimentoDS_PERIODO.AsString := 'TRIAGEM';
    4:qyAtendimentoDS_PERIODO.AsString := 'NÃO ATENDE';
  end;

end;

procedure TfrmCadAtendimentos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if not (DMGERAL.TB_ATENDIMENTO.State in [dsEdit, dsInsert]) then
  begin
    dmGeral.TB_ATENDIMENTO.Close;
    dmGeral.TB_ATENDIMENTO.ParamByName('MEDICO').Asinteger := qyMedicoCD_MEDICO.AsInteger;
    dmGeral.TB_ATENDIMENTO.ParamByName('DT_DE').AsDate := trunc(Calendario.Date);
    dmGeral.TB_ATENDIMENTO.ParamByName('DT_ATE').AsDate := trunc(Calendario.Date)+1;
    dmGeral.TB_ATENDIMENTO.Open;
  end;

end;

procedure TfrmCadAtendimentos.grDadosDblClick(Sender: TObject);
begin
  inherited;
  Calendario.date := qyAtendimentoDT_ATENDIMENTO.AsDateTime;
  CalendarioClick(Sender);
  qyMedico.Locate('cd_medico', qyAtendimentoCD_MEDICO.AsInteger, []);
  if not (DMGERAL.TB_ATENDIMENTO.State in [dsEdit, dsInsert]) then
  begin
    dmGeral.TB_ATENDIMENTO.Close;
    dmGeral.TB_ATENDIMENTO.ParamByName('MEDICO').Asinteger := qyMedicoCD_MEDICO.AsInteger;
    dmGeral.TB_ATENDIMENTO.ParamByName('DT_DE').AsDate := trunc(Calendario.Date);
    dmGeral.TB_ATENDIMENTO.ParamByName('DT_ATE').AsDate := trunc(Calendario.Date)+1;
    dmGeral.TB_ATENDIMENTO.Open;
  end;


end;

procedure TfrmCadAtendimentos.dsControleStateChange(Sender: TObject);
begin
  inherited;
  btexcluir.Enabled := (pgGeral.ActivePage = tabGeral) and not (dsControle.State in [dsEdit, dsInsert]);
  bteditar.Enabled := (pgGeral.ActivePage = tabGeral) and not (dsControle.State in [dsEdit, dsInsert]);

end;

end.
