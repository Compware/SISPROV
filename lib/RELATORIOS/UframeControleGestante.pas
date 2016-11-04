unit UframeControleGestante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxCntner,
  dxDBGrid, Buttons, ExtCtrls, DB, IBCustomDataSet, DBClient, DBLocal,
  DBLocalI;

type
  TframeControleGestante = class(TFrame)
    Panel1: TPanel;
    btExcluir: TSpeedButton;
    btInserir: TSpeedButton;
    grGestante: TdxDBGrid;
    grGestanteDT_GESTANTE: TdxDBGridDateColumn;
    grGestanteFimGestacao: TdxDBGridDateColumn;
    grGestanteFL_Gestante: TdxDBGridCheckColumn;
    grGestanteNrMeses: TdxDBGridColumn;
    qyGestante: TIBDataSet;
    dsGestante: TDataSource;
    qyGestanteCD_GESTANTE: TIntegerField;
    qyGestanteDT_INICIO_GESTACAO: TDateField;
    qyGestanteNR_PROCESSO: TIBStringField;
    qyGestanteCD_PACIENTE: TIntegerField;
    qyGestanteNR_MESES: TIntegerField;
    qyGestanteCD_USUARIO: TIntegerField;
    qyGestanteFL_GESTANTE: TIntegerField;
    qyGestanteDT_FIM_GESTACAO: TDateField;
    qyGestanteCODIGO: TIntegerField;
    grGestanteColumn5: TdxDBGridColumn;
    procedure btInserirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure qyGestanteAfterInsert(DataSet: TDataSet);
    procedure qyGestanteDT_FIM_GESTACAOValidate(Sender: TField);
    procedure qyGestanteNR_MESESValidate(Sender: TField);
    procedure qyGestanteAfterPost(DataSet: TDataSet);
    procedure qyGestanteAfterDelete(DataSet: TDataSet);
    procedure qyGestanteCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    function CalculoMeses(dataInicio: TDate; dataFim: TDate): integer;
    function CalculoDataFim(dataInicio: TDate; meses: integer): TDate;
    procedure atualizaFlGestante(cdPaciente: integer; flGestante: integer);
    procedure verificaSeGestante;
  public
    { Public declarations }
    dtBaseCalculo: TDate;
    constructor Create(AOwner: TComponent) ; override;
    procedure Cancelar;
    procedure Editar;
    procedure Gravar;
  end;

implementation

uses UDM, DateUtils, UGeralSQL, IBQuery;

{$R *.dfm}

procedure TframeControleGestante.btInserirClick(Sender: TObject);
begin
 if dsGestante.AutoEdit then
 begin
    dsGestante.DataSet.Append;
    grGestante.RefreshSorting;
  end;

end;

procedure TframeControleGestante.btExcluirClick(Sender: TObject);
begin
  if dsGestante.AutoEdit and (not qyGestante.IsEmpty) then
    dsGestante.DataSet.Delete;
end;

procedure TframeControleGestante.qyGestanteAfterInsert(DataSet: TDataSet);
begin
  qyGestante.FieldByName('NR_PROCESSO').AsInteger := qyGestante.DataSource.DataSet.fieldByName('NR_PROCESSO').AsInteger;
  qyGestante.FieldByName('CD_PACIENTE').AsInteger := qyGestante.DataSource.DataSet.fieldByName('CD_PACIENTE').AsInteger;
  qyGestante.FieldByName('CD_USUARIO').AsInteger := DM.qyLoginCD_USUARIO.AsInteger;
  qyGestante.FieldByName('FL_GESTANTE').AsInteger := 1;
end;

procedure TframeControleGestante.qyGestanteDT_FIM_GESTACAOValidate(
  Sender: TField);
var
  evento : TFieldNotifyEvent;
begin
  if (not qyGestanteDT_INICIO_GESTACAO.IsNull) and
      (not qyGestanteDT_FIM_GESTACAO.IsNull) then
  begin
    evento := qyGestanteNR_MESES.OnValidate;
    qyGestanteNR_MESES.OnValidate := nil;
    if qyGestanteDT_FIM_GESTACAO.AsDateTime < dtBaseCalculo then
      qyGestanteNR_MESES.AsInteger := CalculoMeses(qyGestanteDT_INICIO_GESTACAO.AsDateTime, qyGestanteDT_FIM_GESTACAO.AsDateTime)
    else
    begin
      qyGestanteNR_MESES.AsInteger := CalculoMeses(qyGestanteDT_INICIO_GESTACAO.AsDateTime, dtBaseCalculo);
      if qyGestanteNR_MESES.AsInteger > 9 then
        qyGestanteNR_MESES.AsInteger := 9;
    end;
    qyGestanteNR_MESES.OnValidate := evento;
  end;

end;

function TframeControleGestante.CalculoMeses(dataInicio: TDate; dataFim: TDate): integer;
begin
  result := MonthsBetween (dataFim,dataInicio);
end;

function TframeControleGestante.CalculoDataFim(dataInicio: TDate; meses: integer): TDate;
begin
  result := IncMonth(dataInicio, meses);
end;

procedure TframeControleGestante.qyGestanteNR_MESESValidate(
  Sender: TField);
var
  evento : TFieldNotifyEvent;
begin
 if (qyGestanteDT_INICIO_GESTACAO.IsNull) and
      (not qyGestanteNR_MESES.IsNull) and
      (qyGestanteDT_FIM_GESTACAO.IsNull)  then
 begin
   qyGestanteDT_INICIO_GESTACAO.AsDateTime := IncMonth(dtBaseCalculo, -qyGestanteNR_MESES.AsInteger);
 end;

 if (not qyGestanteDT_INICIO_GESTACAO.IsNull) and
      (not qyGestanteNR_MESES.IsNull) then
 begin
  evento := qyGestanteDT_FIM_GESTACAO.OnValidate;
  qyGestanteDT_FIM_GESTACAO.OnValidate := nil;
  //qyGestanteDT_FIM_GESTACAO.AsDateTime := CalculoDataFim(qyGestanteDT_INICIO_GESTACAO.AsDateTime, qyGestanteNR_MESES.AsInteger);
  qyGestanteDT_FIM_GESTACAO.AsDateTime := CalculoDataFim(qyGestanteDT_INICIO_GESTACAO.AsDateTime, 9);
  qyGestanteDT_FIM_GESTACAO.OnValidate := evento;
 end;
end;

procedure TframeControleGestante.Cancelar;
begin
  if dsGestante.DataSet.State in [dsInsert, dsEdit] then
    dsGestante.DataSet.Cancel;
  DM.Rollback(dsGestante.DataSet);
  dsGestante.AutoEdit := false;
end;

procedure TframeControleGestante.Editar;
begin
  if not(dsGestante.DataSet.State in [dsEdit, dsInsert]) and dsGestante.DataSet.Active then
  begin
    dm.Transacao(dsGestante.DataSet);
    if dsGestante.DataSet.IsEmpty then
      dsGestante.DataSet.Insert;
    dsGestante.AutoEdit := true;
  end
  else
    Abort;
end;

procedure TframeControleGestante.Gravar;
begin
  if dsGestante.DataSet.State in [dsEdit, dsInsert] then
    dsGestante.DataSet.Post;
  DM.Commit(dsGestante.DataSet);
  dsGestante.AutoEdit := false;
end;

procedure TframeControleGestante.atualizaFlGestante(cdPaciente: integer;
  flGestante: integer);
var
  qy: TIBQuery;
begin
  qy := TIBQuery.Create(nil);
  with qy do
  begin
    try
      Database := dm.DB;
      Transaction := dm.TS;
      SQl.Add('UPDATE PACIENTE SET FL_GESTANTE = :FL_GESTANTE');
      SQl.Add('WHERE CD_PACIENTE = :CD_PACIENTE' );
      qy := ExecutaSQL(qy, ['CD_PACIENTE', 'FL_GESTANTE'], [cdPaciente, flGestante]);
    finally
      Close;
      Free;
    end;
  end;
end;

procedure TframeControleGestante.qyGestanteAfterPost(DataSet: TDataSet);
begin
  verificaSeGestante;
end;

procedure TframeControleGestante.verificaSeGestante;
var
  flGestante : integer;
  pos : integer;
begin
  flGestante := 0;
  if not qyGestante.IsEmpty then
  begin
    pos := qyGestante.RecNo;
    qyGestante.First;

    while not qyGestante.Eof do
    begin
      if qyGestanteFL_GESTANTE.AsInteger = 1 then
        flGestante := 1;
      qyGestante.Next;
    end;
    
    qyGestante.RecNo := pos;
  end;
  atualizaFlGestante(qyGestante.DataSource.DataSet.FieldByName('CD_PACIENTE').AsInteger, flGestante);
end;

procedure TframeControleGestante.qyGestanteAfterDelete(DataSet: TDataSet);
begin
  verificaSeGestante;
end;

procedure TframeControleGestante.qyGestanteCalcFields(DataSet: TDataSet);
begin
  qyGestanteCODIGO.AsInteger := qyGestante.RecNo;
end;

constructor TframeControleGestante.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  dtBaseCalculo:= Date;
end;

end.
