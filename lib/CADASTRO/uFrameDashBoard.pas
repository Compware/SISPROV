unit uFrameDashBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, dxExEdtr, IBCustomDataSet, DBCtrls, StdCtrls, Mask,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, TeeProcs, TeEngine, Chart,
  DbChart, DB, IBQuery, Buttons, Grids, ValEdit, series, iniFiles, DBGrids,
  ImgList, RxDBComb, ib_parse, Menus;

type
  TframeDashBoard = class(TFrame)
    qyConsulta: TIBQuery;
    dsConsulta: TDataSource;
    TB_DASH: TIBDataSet;
    dsDash: TDataSource;
    TB_DASHCD_DASHBOARD: TIntegerField;
    TB_DASHNM_DASHBOARD: TIBStringField;
    TB_DASHTX_DASHBOARD: TIBStringField;
    TB_DASHNM_CAMPO_CHAVE: TIBStringField;
    TB_DASHTX_CAMPOS: TIBStringField;
    TB_DASHTX_TABELA: TIBStringField;
    TB_DASHTX_GRAFICO: TIBStringField;
    pnTitulo: TPanel;
    DBText1: TDBText;
    ImageList1: TImageList;
    TB_DASHFL_REL_GERENCIAL: TIntegerField;
    TB_DASHVL_ORDEM: TIntegerField;
    TB_DASHCD_UND: TIntegerField;
    TB_DASHTP_DASHBOARD: TIntegerField;
    TB_DASHTP_TABELA: TIBStringField;
    TB_DASHTX_OBS: TIBStringField;
    PopupMenu1: TPopupMenu;
    Excel1: TMenuItem;
    SaveDialog1: TSaveDialog;
    otal1: TMenuItem;
    Media1: TMenuItem;
    Soma1: TMenuItem;
    Contagem1: TMenuItem;
    N1: TMenuItem;
    Nenhum1: TMenuItem;
    lbView: TLabel;
    pnGeral: TPanel;
    pgDashBoard: TPageControl;
    tsGrafico: TTabSheet;
    grafico: TDBChart;
    pnGrafico: TPanel;
    btAddSerie: TSpeedButton;
    btGrafico: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    cbColunas2: TComboBox;
    cbColunas3: TComboBox;
    pnConfig: TPanel;
    rgEstilo: TRadioGroup;
    rgTipoGrafico: TRadioGroup;
    ck3d: TCheckBox;
    tsTabela: TTabSheet;
    pnTabela: TPanel;
    btAddColuna: TSpeedButton;
    btAddAll: TSpeedButton;
    btTabela: TSpeedButton;
    cbColunas: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DBCheckBox2: TDBCheckBox;
    tabela: TdxDBGrid;
    tsDados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    PageControl1: TPageControl;
    tabConf: TTabSheet;
    DBMemo1: TDBMemo;
    tabCampos: TTabSheet;
    edCampos: TValueListEditor;
    tabTXCampo: TTabSheet;
    DBTX_CAMPOS: TDBMemo;
    tabTXTabela: TTabSheet;
    DBMemo3: TDBMemo;
    mmTabela: TMemo;
    tabTXGrafico: TTabSheet;
    DBMemo4: TDBMemo;
    mmGrafico: TMemo;
    tabTeste: TTabSheet;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    tabOutros: TTabSheet;
    Label6: TLabel;
    cbTipoDashboard: TRxDBComboBox;
    DBCheckBox1: TDBCheckBox;
    DBEdit4: TDBEdit;
    tabObservacao: TTabSheet;
    DBRichEdit1: TDBRichEdit;
    btDelAll: TSpeedButton;
    Grupo1: TMenuItem;
    Lerini1: TMenuItem;
    SalvarIni1: TMenuItem;
    procedure TB_DASHAfterPost(DataSet: TDataSet);
    procedure qyConsultaAfterOpen(DataSet: TDataSet);
    procedure btAddColunaClick(Sender: TObject);
    procedure btAddAllClick(Sender: TObject);
    procedure TB_DASHAfterInsert(DataSet: TDataSet);
    procedure TB_DASHAfterDelete(DataSet: TDataSet);
    procedure TB_DASHBeforeDelete(DataSet: TDataSet);
    procedure btTabelaClick(Sender: TObject);
    procedure TB_DASHAfterScroll(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure btAddSerieClick(Sender: TObject);
    procedure qyConsultaBeforeOpen(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure dsDashStateChange(Sender: TObject);
    procedure edCamposKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btGraficoClick(Sender: TObject);
    procedure qyConsultaAfterClose(DataSet: TDataSet);
    procedure btMostrar2Click(Sender: TObject);
    procedure ck3dClick(Sender: TObject);
    procedure rgEstiloClick(Sender: TObject);
    procedure rgTipoGraficoClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Media1Click(Sender: TObject);
    procedure Soma1Click(Sender: TObject);
    procedure Contagem1Click(Sender: TObject);
    procedure Nenhum1Click(Sender: TObject);
    procedure lbViewClick(Sender: TObject);
    procedure btDelAllClick(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure SalvarIni1Click(Sender: TObject);
    procedure Lerini1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bPrepare: boolean;
    bAtualizaControles: boolean;
    bModoView:boolean;
    procedure CarregaTabela;
    procedure LimpaDados;
    procedure CarregaCbColunas;
    procedure CapturaCampos;
    procedure PreparaConsulta;
    procedure CriaGrafico;
    procedure View;
    procedure Total(id:integer);
  end;

implementation

uses UDM, UGeral;

{$R *.dfm}

procedure TframeDashBoard.TB_DASHAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TframeDashBoard.qyConsultaAfterOpen(DataSet: TDataSet);
begin
  tabela.KeyField := DBEdit3.Text;
  Memo1.Text := qyConsulta.sql.Text;
end;


procedure TframeDashBoard.CapturaCampos;
var i,x:integer; nmCampo:String;
begin
  edCampos.Strings := DBTX_CAMPOS.Lines;
  PreparaConsulta;
  for i:=0 to qyConsulta.Fields.Count-1 do
  begin
     nmCampo := qyConsulta.Fields[i].FieldName;
     if not edCampos.FindRow(qyConsulta.Fields[i].FieldName,x) then
       edCampos.InsertRow(nmCampo,nmCampo,true);
  end;
  CarregaCbColunas;
end;

procedure TframeDashBoard.btAddColunaClick(Sender: TObject);
Var i,x:integer;
    col: TdxDBTreeListColumn;
begin
  i := cbColunas.ItemIndex+1;
  try
    col := tabela.ColumnByFieldName(edCampos.Keys[i]);
  except
    col := nil;
  end;
  if(col=nil)then
  begin
    col := tabela.CreateColumn(TdxDBGridColumn);
    col.FieldName := edCampos.Keys[i];
    col.Caption := edCampos.Values[col.FieldName];
  end;
end;

procedure TframeDashBoard.CarregaCbColunas;
var i:integer;
begin
  cbColunas.Items.Clear;
  for i:=1 to edCampos.RowCount -1 do
    cbColunas.Items.Add(edCampos.Values[edCampos.Keys[i]]);
  cbColunas2.Items := cbColunas.Items;
  cbColunas3.Items := cbColunas.Items;
end;

procedure TframeDashBoard.btAddAllClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to cbColunas.Items.Count-1 do
  begin
    cbColunas.ItemIndex := i;
    btAddColunaClick(sender);
  end;
end;

procedure TframeDashBoard.TB_DASHAfterInsert(DataSet: TDataSet);
begin
  TB_DASHCD_DASHBOARD.AsInteger := dm.GeraCodigo('GEN_DASHBOARD');
  TB_DASHCD_UND.AsString := prmUnidade;
end;

procedure TframeDashBoard.TB_DASHAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TframeDashBoard.TB_DASHBeforeDelete(DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TframeDashBoard.btTabelaClick(Sender: TObject);
var dir, arq:string;
begin
  dir := sPathGrid + '\DashBoard';
  if not DirectoryExists(dir) then
     MkDir(dir);

  arq := dir + '\Tabela'+ stringReplace(DBEdit2.Text,' ','_',[rfReplaceAll]) + '.ini';
  //if FileExists(arq) then
  begin
    tabela.SaveToIniFile(arq);
    mmTabela.Lines.LoadFromFile(arq);
    TB_DASHTX_TABELA.AsString := mmTabela.Lines.Text;
  end;
end;

procedure TframeDashBoard.CarregaTabela;
var dir, arq:string;
begin
  {TODO: O Ini aparentemente nao esta funcionando, mudar para ler arquivo e atribuir valores manualmente}
  //Deve adicionar campos na tabela
  btAddAllClick(self);

  dir := sPathGrid + '\DashBoard';
  if not DirectoryExists(dir) then
     MkDir(dir);

  arq := dir + '\Tabela'+ stringReplace(DBEdit2.Text,' ','_',[rfReplaceAll]) + '.ini';
  DBMemo3.Lines.SaveToFile(arq);
  if FileExists(arq) then
  begin
    //tabela.IniFileName := arq;
    tabela.LoadFromIniFile(arq);
    tabela.Repaint;
  end;
end;

procedure TframeDashBoard.LimpaDados;
begin
  //
end;

procedure TframeDashBoard.TB_DASHAfterScroll(DataSet: TDataSet);
begin
  if bAtualizaControles and not(TB_DASH.state in dsEditModes) then
  begin
    edCampos.Strings := DBTX_CAMPOS.Lines;
    CarregaCbColunas;
    CarregaTabela;
    CriaGrafico;
  end;
end;

procedure TframeDashBoard.CheckBox1Click(Sender: TObject);
begin
  tabela.ShowGroupPanel := CheckBox1.Checked;
end;

procedure TframeDashBoard.CheckBox2Click(Sender: TObject);
begin
  tabela.ShowSummaryFooter := CheckBox2.Checked;
end;

procedure TframeDashBoard.btAddSerieClick(Sender: TObject);
var sb: TBarSeries;
    sp: TPieSeries;
    sl: TLineSeries;
    sc: TChartSeries;
    i,x:integer;
    tp:string;
begin
   grafico.SeriesList.Clear;
   sc := TChartSeries.Create(self);

   if rgTipoGrafico.ItemIndex = 0 then
   begin
     tp := 'TBarSeries';
     sb := TBarSeries.Create(self);
     sc := sb;
   end;

   if rgTipoGrafico.ItemIndex = 1 then
   begin
     tp := 'TPieSeries';
     sp := TPieSeries.Create(self);
     sc := sp;
   end;

   if rgTipoGrafico.ItemIndex = 2 then
   begin
     tp := 'TLineSeries';
     sl := TLineSeries.Create(self);
     sc := sl;
   end;

   case rgEstilo.ItemIndex of
     0: sc.Marks.Style := smsLabel;
     1: sc.Marks.Style := smsValue;
     2: sc.Marks.Style := smsPercent;
     3: sc.Marks.Style := smsLabelValue;
     4: sc.Marks.Style := smsLabelPercent;
     5: sc.Marks.Style := smsLabelPercentTotal;
   end;

   i:=cbColunas2.ItemIndex+1;
   x:=cbColunas3.ItemIndex+1;

   sc.ParentChart := grafico;

   PreparaConsulta;
   sc.DataSource := qyConsulta;
   sc.XLabelsSource := edCampos.Keys[i];
   sc.YValues.ValueSource:= edCampos.Keys[x];
   grafico.View3D := ck3d.Checked;

   mmGrafico.Clear;
   mmGrafico.Lines.Add('[Serie]');
   mmGrafico.Lines.Add('Tipo='+tp);
   mmGrafico.Lines.Add('XLabelsSource='+sc.XLabelsSource);
   mmGrafico.Lines.Add('YValues.ValueSource='+sc.YValues.ValueSource);
   mmGrafico.Lines.Add('Estilo=' + intToStr(rgEstilo.ItemIndex));
   if ck3d.Checked then
     mmGrafico.Lines.Add('3D=Sim')
   else
     mmGrafico.Lines.Add('3D=Nao');

end;

procedure TframeDashBoard.qyConsultaBeforeOpen(DataSet: TDataSet);
begin
  if not bPrepare then
     qyConsulta.SQL.Text := DBMemo1.text;
end;

procedure TframeDashBoard.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.ActivePageIndex = 1) then
    CapturaCampos;
end;

procedure TframeDashBoard.PreparaConsulta;
var sSQLWhere, sSQL, sW:String; nB,nE:Integer;
begin
  bPrepare := true;
  try
    if not(qyConsulta.Active) and (DBMemo1.text<>'') then
    begin
      sSQL := DBMemo1.text;
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      sSQLWhere := 'where (1=2)';
      SetSQLWhere(sSQL, sSQLWhere);
      qyConsulta.sql.Text := sSQL;
      {sW := 'WHERE';
      if pos(sW,UpperCase(DBMemo1.text))>0 then
         qyConsulta.sql.Text := StringReplace(
           UpperCase(DBMemo1.text),sW,' WHERE (1=2) AND',[])
      else
        qyConsulta.sql.Add('WHERE (1=2)');}
      qyConsulta.Open;
    end;
  finally
    bPrepare := false;
  end;
end;

procedure TframeDashBoard.dsDashStateChange(Sender: TObject);
begin
   edCampos.Enabled := (TB_DASH.State in dsEditModes);
end;

procedure TframeDashBoard.edCamposKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if edCampos.Enabled then
      TB_DASHTX_CAMPOS.AsString := edCampos.Strings.Text;
end;

procedure TframeDashBoard.btGraficoClick(Sender: TObject);
begin
  TB_DASHTX_GRAFICO.AsString := mmGrafico.Lines.Text;
end;

procedure TframeDashBoard.CriaGrafico;
var sb: TBarSeries;
    sp: TPieSeries;
    sl: TLineSeries;
    sc: TChartSeries;
    i,x:integer;
    tp,aux,arq:string;
    ini:TIniFile;
begin
   arq := sPathGrid+'\Grafico';
   if not DirectoryExists(arq) then
     MkDir(arq);
   arq := arq + '\DashBoard';
   if not DirectoryExists(arq) then
     MkDir(arq);
   arq := arq + '\'+DBEdit1.Text+'.ini';
   DBMemo4.Lines.SaveToFile(arq);
   sc := TChartSeries.Create(self);
   ini := TIniFile.Create(arq);
   try
     grafico.SeriesList.Clear;
     tp  := ini.ReadString('Serie','Tipo','');
     if (tp = 'TBarSeries') then
     begin
       sb := TBarSeries.Create(self);
       sc := sb;
     end;
     if (tp = 'TPieSeries') then
     begin
       sp := TPieSeries.Create(self);
       sc := sp;
     end;
     if (tp = 'TLineSeries') then
     begin
       sl := TLineSeries.Create(self);
       sc := sl;
     end;

     aux  := ini.ReadString('Serie','Estilo','0');
     i := strToInt(aux);
     case i of
       0: sc.Marks.Style := smsLabel;
       1: sc.Marks.Style := smsValue;
       2: sc.Marks.Style := smsPercent;
       3: sc.Marks.Style := smsLabelValue;
       4: sc.Marks.Style := smsLabelPercent;
       5: sc.Marks.Style := smsLabelPercentTotal;
     end;

     sc.ParentChart := grafico;

     PreparaConsulta;
     sc.DataSource := qyConsulta;

     aux  := ini.ReadString('Serie','XLabelsSource','');
     sc.XLabelsSource := aux;
     aux  := ini.ReadString('Serie','YValues.ValueSource','');
     sc.YValues.ValueSource := aux;
     aux  := ini.ReadString('Serie','3D','');
     grafico.View3D := (aux='Sim');
   finally
     FreeAndNil(ini);
   end;
end;

procedure TframeDashBoard.qyConsultaAfterClose(DataSet: TDataSet);
begin
//
end;

procedure TframeDashBoard.View;
begin
  bModoView := true;
  bAtualizaControles := bModoView;
  pnTabela.Visible := not bModoView;
  pnGrafico.Visible := not bModoView;
  pnConfig.Visible := not bModoView;
  pnTitulo.Visible := bModoView;
  //tsDados.Visible := false;
  //tsDados.TabVisible := not bModoView;
end;

procedure TframeDashBoard.btMostrar2Click(Sender: TObject);
begin
  pgDashBoard.Visible := not pgDashBoard.Visible;
end;

procedure TframeDashBoard.ck3dClick(Sender: TObject);
begin
  grafico.View3D := ck3d.Checked;
end;

procedure TframeDashBoard.rgEstiloClick(Sender: TObject);
var i:integer; sc:TChartSeries;
begin
   for i := 0 to grafico.SeriesCount -1 do
   begin
     sc := grafico.Series[i];
     case rgEstilo.ItemIndex of
       0: sc.Marks.Style := smsLabel;
       1: sc.Marks.Style := smsValue;
       2: sc.Marks.Style := smsPercent;
       3: sc.Marks.Style := smsLabelValue;
       4: sc.Marks.Style := smsLabelPercent;
       5: sc.Marks.Style := smsLabelPercentTotal;
     end;
   end;
end;

procedure TframeDashBoard.rgTipoGraficoClick(Sender: TObject);
begin
   btAddSerieClick(sender);
end;

procedure TframeDashBoard.Excel1Click(Sender: TObject);
var sNome:string;
begin
  SaveDialog1.InitialDir := 'c:\temp';
  sNome := StringReplace(DBText1.Caption,' ','_',[rfReplaceAll]);
  SaveDialog1.FileName := sNome;
  if SaveDialog1.Execute then
    tabela.SaveToXLS(SaveDialog1.FileName,true);
end;

procedure TframeDashBoard.Media1Click(Sender: TObject);
begin
  Total(1);
end;

procedure TframeDashBoard.Soma1Click(Sender: TObject);
begin
  Total(2);
end;

procedure TframeDashBoard.Contagem1Click(Sender: TObject);
begin
  Total(3);
end;

procedure TframeDashBoard.Total(id: integer);
var sCampo:string;
begin
  sCampo := tabela.Columns[tabela.FocusedColumn].FieldName;
  tabela.Columns[tabela.FocusedColumn].SummaryFooterField := sCampo;
  case id of
   1:tabela.Columns[tabela.FocusedColumn].SummaryFooterType := cstAvg;
   2:tabela.Columns[tabela.FocusedColumn].SummaryFooterType := cstSum;
   3:tabela.Columns[tabela.FocusedColumn].SummaryFooterType := cstCount;
  end;
  tabela.OptionsDB := tabela.OptionsDB + [edgoLoadAllRecords];
  tabela.DataSource.DataSet.Last;
  tabela.DataSource.DataSet.First;
  tabela.ShowSummaryFooter := true;
end;

procedure TframeDashBoard.Nenhum1Click(Sender: TObject);
begin
  tabela.ShowSummaryFooter := false;
  tabela.Columns[tabela.FocusedColumn].SummaryFooterType := cstNone;
end;

procedure TframeDashBoard.lbViewClick(Sender: TObject);
begin
  pnGeral.Visible := not pnGeral.Visible;
  if lbView.Caption = '<<' then
    lbView.Caption := '>>'
  else
    lbView.Caption := '<<';

  if pgDashBoard.Visible then
    pnGeral.Height := 350;
end;

procedure TframeDashBoard.btDelAllClick(Sender: TObject);
var i:integer;
begin
  for i:= tabela.ColumnCount-1 downto 0 do
  begin
    tabela.Columns[i].Destroy;
  end;
end;

procedure TframeDashBoard.Grupo1Click(Sender: TObject);
begin
  TdxDBGridColumn(tabela.Columns[tabela.FocusedColumn]).GroupIndex := 0;
  tabela.ShowGroupPanel := true;
end;

procedure TframeDashBoard.SalvarIni1Click(Sender: TObject);
var dir, arq:string;
begin
  dir := sPathGrid + '\DashBoard';
  if not DirectoryExists(dir) then
     MkDir(dir);

  arq := dir + '\Tabela'+ stringReplace(DBEdit2.Text,' ','_',[rfReplaceAll]) + '.ini';
  tabela.SaveToIniFile(arq);
end;

procedure TframeDashBoard.Lerini1Click(Sender: TObject);
var dir, arq:string;
begin
  dir := sPathGrid + '\DashBoard';
  if not DirectoryExists(dir) then
     MkDir(dir);

  arq := dir + '\Tabela'+ stringReplace(DBEdit2.Text,' ','_',[rfReplaceAll]) + '.ini';
  tabela.LoadFromIniFile(arq);
end;

end.
