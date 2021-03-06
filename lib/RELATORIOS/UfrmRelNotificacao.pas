unit UfrmRelNotificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, CheckLst, DB, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, ExtCtrls, IBCustomDataSet, IBQuery, uGeral, Mask,
  ToolEdit, RxLookup, ComCtrls, Menus, dxDBTLCl, dxGrClms,uCadNotificacao,
  ufrmDlgStatus;

type
  TfrmRelNotificacao = class(TForm)
    Panel1: TPanel;
    ckComProcesso: TCheckBox;
    grDados: TdxDBGrid;
    DataSource1: TDataSource;
    pnCampos: TPanel;
    ckCampos: TCheckListBox;
    btCampos: TBitBtn;
    btPesquisar: TBitBtn;
    btCsv: TBitBtn;
    SaveDialog1: TSaveDialog;
    lbStatus: TLabel;
    btExcel: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    leProvincia: TRxLookupEdit;
    Label4: TLabel;
    leMunicipio: TRxLookupEdit;
    Label2: TLabel;
    leUnidade: TRxLookupEdit;
    qyProvincia: TIBQuery;
    qyProvinciaCD_PAIS: TIntegerField;
    qyProvinciaCD_PROVINCIA: TIntegerField;
    qyProvinciaDS_PROVINCIA: TIBStringField;
    dsProvincia: TDataSource;
    qyMunicipio: TIBQuery;
    qyMunicipioCD_MUNICIPIO: TIntegerField;
    qyMunicipioCD_PROVINCIA: TIntegerField;
    qyMunicipioDS_MUNICIPIO: TIBStringField;
    dsMunicipio: TDataSource;
    qyUnidade: TIBQuery;
    qyUnidadeCD_UNIDADE: TIntegerField;
    qyUnidadeDS_UNIDADE: TIBStringField;
    qyUnidadeFL_ATIVA: TIBStringField;
    dsUnidade: TDataSource;
    btLimpar: TBitBtn;
    pbStatus: TProgressBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtDe: TDateTimePicker;
    Label5: TLabel;
    dtAte: TDateTimePicker;
    ckPeriodo: TCheckBox;
    PopupMenu1: TPopupMenu;
    MarcarTodos1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Marcar2: TMenuItem;
    Desmarcar2: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    Abrir1: TMenuItem;
    Label6: TLabel;
    qyNotificacao: TIBDataSet;
    qyAtualizaFlagAbandono: TIBQuery;
    procedure btPesquisarClick(Sender: TObject);
    procedure btCamposClick(Sender: TObject);
    procedure ckCamposClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCsvClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
    procedure qyNotificacaoAfterScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
    procedure leMunicipioChange(Sender: TObject);
    procedure leUnidadeChange(Sender: TObject);
    procedure leUnidadeButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MarcarTodos1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure Marcar2Click(Sender: TObject);
    procedure Desmarcar2Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure qyNotificacaoCalcFields(DataSet: TDataSet);
  private
    procedure AbreConsultas;
    procedure FechaConsultas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelNotificacao: TfrmRelNotificacao;
  sSQL:string;
  bExportando:boolean;
  PSQL, MSQL, USQL:string;

implementation

uses UDM, DateUtils, UGeralSQL;

{$R *.dfm}

procedure TfrmRelNotificacao.btPesquisarClick(Sender: TObject);
begin
  qyNotificacao.Close;
  qyNotificacao.SelectSQL.Text := sSQL;
  qyNotificacao.SelectSQL.Add('where 1=1');

 { qyAtualizaFlagAbandono.Close;
  qyAtualizaFlagAbandono.SQL.Text :=
    StringReplace(qyAtualizaFlagAbandono.SQL.Text, '/*nDiasAbandono*/', '-'+IntToStr(nDiasAbandono), []);
  qyAtualizaFlagAbandono.ExecSQL;
  qyAtualizaFlagAbandono.Close; }
  AtualizaTodosAbandono;

  if ckPeriodo.Checked then
   qyNotificacao.SelectSQL.Add('and N.DT_NOTIFICACAO Between :DE and :ATE');

  if ckComProcesso.Checked then
   qyNotificacao.SelectSQL.Add('and p2.nr_processo is not null');

  if leUnidade.LookupValue <> '' then
    qyNotificacao.SelectSQL.Add('and N.CD_UNIDADE = :CD_UNIDADE');

  if leProvincia.LookupValue <> '' then
    qyNotificacao.SelectSQL.Add('and N.CD_PROVINCIA_NOT = :CD_PROVINCIA');

  if leMunicipio.LookupValue <> '' then
    qyNotificacao.SelectSQL.Add('and N.CD_MUNICIPIO = :CD_MUNICIPIO');

  if (leProvincia.LookupValue <> '') then
    qyNotificacao.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
  if (leMunicipio.LookupValue <> '') then
    qyNotificacao.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
  if (leUnidade.LookupValue <> '') then
    qyNotificacao.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);

  if ckPeriodo.Checked then
  begin
     qyNotificacao.ParamByName('DE').AsDate := dtDe.Date;
     qyNotificacao.ParamByName('ATE').AsDate := dtAte.Date;
  end;
  qyNotificacao.Active := true;
  qyNotificacao.Last;
  qyNotificacao.Prior;
end;

procedure TfrmRelNotificacao.btCamposClick(Sender: TObject);
var i:integer;
begin
  pnCampos.Visible := Not pnCampos.Visible;
  if pnCampos.Visible then
    qyNotificacao.GetFieldNames(ckCampos.Items);

  for i:=0 to ckCampos.Items.Count -1 do
  begin
    ckCampos.Checked[i] := grDados.ColumnByFieldName(ckCampos.Items[i]).Visible;
  end;
end;

procedure TfrmRelNotificacao.ckCamposClick(Sender: TObject);
var i:integer; bSel:Boolean;
begin
  i := ckCampos.ItemIndex;
  bSel := ckCampos.Checked[i];
  grDados.ColumnByFieldName(ckCampos.Items[i]).Visible := bSel;
end;

procedure TfrmRelNotificacao.FormCreate(Sender: TObject);
Var i:integer;
    col: TdxDBTreeListColumn;
begin
  sSQL:=qyNotificacao.SelectSQL.Text;
  qyNotificacao.Prepare;
  qyNotificacao.GetFieldNames(ckCampos.Items);
  for i:=0 to ckCampos.Items.Count -1 do
  begin
     ckCampos.Checked[i] := true;
     if ckCampos.Items[i] = 'SEL' then
     begin
       col := grDados.CreateColumn(TdxDBGridCheckColumn);
       TdxDBGridCheckColumn(col).ValueChecked := 'S';
       TdxDBGridCheckColumn(col).ValueUnchecked := 'N';
     end
     else
       col := grDados.CreateColumn(TdxDBGridColumn);
     col.FieldName := ckCampos.Items[i];
     col.Caption := ckCampos.Items[i];
     if (col.FieldName = 'TODOS') then
        grDados.AddGroupColumn(col);
  end;
  AbreConsultas;

  grDados.IniFileName := sPathGrid + '\' + self.Name + '.ini';
end;

procedure TfrmRelNotificacao.btCsvClick(Sender: TObject);
var sLinha:String; i:integer; f:TextFile;
begin
  SaveDialog1.FileName := sPath + 'Temp\Todos.csv';
  if SaveDialog1.Execute then
  begin
    //grDados.SaveToXLS(SaveDialog1.FileName,true);
    qyNotificacao.First;
    AssignFile(f, SaveDialog1.FileName);
    Rewrite(f);

    for i:=0 to grDados.ColumnCount-1 do
      if grDados.Columns[i].Visible then
        sLinha := sLinha + '"'+grDados.Columns[i].Caption + '";' ;
    writeLn(f,sLinha);
    sLinha := '';
    pbStatus.Position := 0;
    pbStatus.Max := qyNotificacao.RecordCount;
    qyNotificacao.DisableControls;
    while not qyNotificacao.Eof do
    begin
      pbStatus.Position := qyNotificacao.RecNo;
      for i:=0 to grDados.ColumnCount-1 do
        if grDados.Columns[i].Visible then
          sLinha := sLinha + '"'+grDados.Columns[i].Field.AsString + '";' ;
      writeLn(f,sLinha);
      sLinha := '';
      qyNotificacao.Next;
      lbStatus.Caption := 'Total:'+ intToStr(qyNotificacao.RecordCount) + ' Atual:' +  intToStr(qyNotificacao.RecNo);
      Application.ProcessMessages;
    end;
    CloseFile(f);
    qyNotificacao.EnableControls;
  end;
end;

procedure TfrmRelNotificacao.btExcelClick(Sender: TObject);
begin
  if not qyNotificacao.Active then
    btPesquisarClick(Sender);

  qyNotificacao.Prior;
  qyNotificacao.First;
  SaveDialog1.FileName := sPath + 'Temp\Todos.xls';
  if SaveDialog1.Execute then
  begin
    bExportando := true;
    grDados.SaveToXLS(SaveDialog1.FileName,true);
  end;
  bExportando := false;
end;

procedure TfrmRelNotificacao.qyNotificacaoAfterScroll(DataSet: TDataSet);
begin
  if bExportando then
  begin
    Label6.Caption := 'Total:'+ intToStr(qyNotificacao.RecordCount) +
     ' Atual:' +  intToStr(qyNotificacao.RecNo);
    Application.ProcessMessages;
  end;
end;

procedure TfrmRelNotificacao.SpeedButton1Click(Sender: TObject);
begin
  ckCampos.Items.SaveToFile(sPath+'Temp\Campos.txt');
end;

procedure TfrmRelNotificacao.SpeedButton2Click(Sender: TObject);
begin
  ckCampos.Items.LoadFromFile(sPath+'Temp\Campos.txt');
end;

procedure TfrmRelNotificacao.leProvinciaChange(Sender: TObject);
begin
  if leProvincia.Modified then
  begin
    qyProvincia.Close;
    qyProvincia.SQL.Text := PSQL;
    qyProvincia.SQL.Add('where Upper(ds_provincia) like(''' + '%' + UpperCase(leProvincia.Text) + '%'')');
    qyProvincia.Open;
  end
  else
  begin
    qyProvincia.SQL.Text := PSQL;
    qyProvincia.Open;
  end;
end;

procedure TfrmRelNotificacao.leMunicipioChange(Sender: TObject);
begin
  if leMunicipio.Modified then
  begin
    qyMunicipio.Close;
    qyMunicipio.SQL.Text := MSQL;
    qyMunicipio.SQL.Add('and Upper(ds_municipio) like(''' + '%' + UpperCase(leMunicipio.Text) + '%'')');
    qyMunicipio.Open;
  end
  else
  begin
    qyMunicipio.SQL.Text := MSQL;
    qyMunicipio.Open;
  end;
end;

procedure TfrmRelNotificacao.leUnidadeChange(Sender: TObject);
begin
  if leUnidade.Modified then
  begin
    qyUnidade.Close;
    qyUnidade.SQL.Text := USQL;
    qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');
    //qyUnidade.SQL.Add('and fl_ativa = ''S'' ');

    qyUnidade.SQL.Add('order by ds_unidade');
    qyUnidade.Open;
  end
  else
  begin
    qyUnidade.SQL.Text := USQL;
    if leUnidade.Text <> '' then
      qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');

    //qyUnidade.SQL.Add('and fl_ativa = ''S'' ');

    qyUnidade.SQL.Add('order by ds_unidade');
    qyUnidade.Open;
  end;
end;

procedure TfrmRelNotificacao.leUnidadeButtonClick(Sender: TObject);
begin
  qyUnidade.Close;
  qyUnidade.SQL.Text := USQL;
  if leUnidade.Text <> '' then
    qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');

  //qyUnidade.SQL.Add('and fl_ativa = ''S'' ');

  qyUnidade.SQL.Add('order by ds_unidade');
  qyUnidade.Open;
end;

procedure TfrmRelNotificacao.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmRelNotificacao.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmRelNotificacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FechaConsultas;
end;

procedure TfrmRelNotificacao.btLimparClick(Sender: TObject);
begin
  leProvincia.Clear;
  leMunicipio.clear;
  leUnidade.clear;
end;

procedure TfrmRelNotificacao.FormShow(Sender: TObject);
begin
  grDados.LoadFromIniFile(grDados.IniFileName);
  dtDe.Date := Date;
  dtAte.Date := Date;
end;

procedure TfrmRelNotificacao.MarcarTodos1Click(Sender: TObject);
var i:integer;
begin
   for i:=0 to ckCampos.Count-1 do
   begin
    ckCampos.Checked[i] := True;
    ckCampos.ItemIndex := i;
    ckCamposClick(sender);
   end;
end;

procedure TfrmRelNotificacao.DesmarcarTodos1Click(Sender: TObject);
var i:integer;
begin
   for i:=0 to ckCampos.Count-1 do
   begin
    ckCampos.Checked[i] := False;
    ckCampos.ItemIndex := i;
    ckCamposClick(sender);
   end;
end;

procedure TfrmRelNotificacao.Marcar2Click(Sender: TObject);
begin
  qyNotificacao.Edit;
  qyNotificacao.FieldByName('SEL').AsString := 'S';
  qyNotificacao.Post;
end;

procedure TfrmRelNotificacao.Desmarcar2Click(Sender: TObject);
begin
  qyNotificacao.Edit;
  qyNotificacao.FieldByName('SEL').AsString := 'N';
  qyNotificacao.Post;
end;

procedure TfrmRelNotificacao.Excluir1Click(Sender: TObject);

   procedure Excluir(sTabela : string);
   begin
      try
        dm.qyGeral.Sql.Clear;
        dm.qyGeral.Sql.Add('delete from ' + sTabela);
        dm.qyGeral.Sql.Add('where CD_FICHA = :CD_FICHA');
        dm.qyGeral.Sql.Add('and   CD_UND   = :CD_UND');
        dm.qyGeral.Prepare;
        dm.qyGeral.ParamByName('CD_FICHA').AsString :=
          qyNotificacao.FieldByName('CD_FICHA').AsString;
        dm.qyGeral.ParamByName('CD_UND').AsString :=
          qyNotificacao.FieldByName('CD_UND').AsString;
        dm.qyGeral.ExecSQL;
      except
        on E:Exception do
          ShowMessage(E.Message);
      end;
   end;

begin
  frmDlgStatus := TfrmDlgStatus.Create(application);
  frmDlgStatus.Caption := 'Ecluindo Notificações!';
  frmDlgStatus.pbStatus.Max := qyNotificacao.RecordCount;
  frmDlgStatus.Show;
  qyNotificacao.First;
  while not qyNotificacao.Eof do
  begin
    frmDlgStatus.pbStatus.Position := qyNotificacao.RecNo;
    Application.ProcessMessages;
    if qyNotificacao.FieldByName('SEL').AsString = 'S' then
    begin
      Excluir('ASPECTO_NOTIFICACAO');
      Excluir('CIRCUNCISAO');
      Excluir('DENTARIO');
      Excluir('EXCECAO_IMPORTAR');
      Excluir('INTERV_CIRURGICA');
      Excluir('PERFURACAO');
      Excluir('TATUAGEM');
      Excluir('TRANSFUSAO');
      qyNotificacao.Delete;
      dm.Commit(qyNotificacao);
    end
    else
      qyNotificacao.Next;
  end;
  frmDlgStatus.Free;
end;

procedure TfrmRelNotificacao.Abrir1Click(Sender: TObject);
begin
   frmCadNotificacao := TfrmCadNotificacao.Create(Application);
   frmCadNotificacao.fsNotificacao := qyNotificacao.FieldByName('CD_NOTIFICACAO').AsString;
   frmCadNotificacao.fbIncluir := false;
   frmCadNotificacao.ShowModal;
   frmCadNotificacao.Free;
end;

procedure TfrmRelNotificacao.qyNotificacaoCalcFields(DataSet: TDataSet);
begin
  qyNotificacao.FieldByName('NR_IDADE_IDENTIFICACAO').AsInteger :=
    YearsBetween(qyNotificacao.FieldByName('DT_NOTIFICACAO').AsDateTime,
                 qyNotificacao.FieldByName('DT_NASCIMENTO').AsDateTime);
end;

end.
