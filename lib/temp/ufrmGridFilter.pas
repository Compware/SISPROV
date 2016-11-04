unit ufrmGridFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, DB, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, OleServer,
  Excel97, Buttons, Grids, DBGrids;

type
  TfrmGridFilter = class(TForm)
    Panel1: TPanel;
    btExcel: TSpeedButton;
    ExcelApplication1: TExcelApplication;
    sg: TStringGrid;
    OpenDialog1: TOpenDialog;
    ExcelWorksheet1: TExcelWorksheet;
    Label1: TLabel;
    Save: TButton;
    Load: TButton;
    TB_MAPA_TESTAGEM: TIBDataSet;
    TB_MAPA_TESTAGEMCD_MAPA_TESTAGEM: TIntegerField;
    TB_MAPA_TESTAGEMCD_MUNICIPIO: TIntegerField;
    TB_MAPA_TESTAGEMCD_PROVINCIA: TIntegerField;
    TB_MAPA_TESTAGEMCD_UNIDADE: TIntegerField;
    TB_MAPA_TESTAGEMDS_LOCAL: TIBStringField;
    TB_MAPA_TESTAGEMDT_MAPA: TDateField;
    TB_MAPA_TESTAGEMDS_UNIDADE: TIBStringField;
    TB_MAPA_TESTAGEMDS_MUNICIPIO: TIBStringField;
    TB_MAPA_TESTAGEMDS_PROVINCIA: TIBStringField;
    TB_MAPA_TESTAGEMNR_LIVRO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTE: TIBDataSet;
    TB_MAPA_TESTAGEM_PACIENTECODIGO: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTECD_MAPA_TESTAGEM: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTECD_MAPA_TESTAGEM_PACIENTE: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTEDS_OBSERVACAO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_ACONSELHADO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_GESTANTE_NOVO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_NEGATIVO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_SEXO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENM_PACIENTE: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENR_IDADE: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTECD_MEDICO: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTENM_MEDICO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENR_IDADE_MESES: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTEFL_GESTANTE_RETORNO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENR_LIVRO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDT_REGISTRO: TDateField;
    TB_MAPA_TESTAGEM_PACIENTENM_INVESTIGADOR: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENM_DIGITADOR: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDT_INGRESSO_DIG: TDateField;
    TB_MAPA_TESTAGEM_PACIENTEDS_OBSERVACAO_DIG: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDS_LOCAL: TIBStringField;
    dsMapaTestagem: TDataSource;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    dsMapaTestagemLinha: TDataSource;
    btInsert: TButton;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    TB_MAPA_TESTAGEM_PACIENTENR_REGISTRO: TIntegerField;
    procedure btExcelClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure TB_MAPA_TESTAGEMAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEMAfterPost(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEM_PACIENTEAfterPost(DataSet: TDataSet);
  private
    procedure CarregarPlanilha;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridFilter: TfrmGridFilter;
  WB: _WorkBook;



implementation

{$R *.dfm}

uses
  udm, uGeral;

procedure TfrmGridFilter.btExcelClick(Sender: TObject);
var
  LcId : Integer;
begin
  if not OpenDialog1.Execute then Exit;
  LcId := LOCALE_USER_DEFAULT;
  ExcelApplication1.Connect;
  WB :=
      ExcelApplication1.WorkBooks.Open(OpenDialog1.FileName,
      EmptyParam,EmptyParam,EmptyParam,EmptyParam,
      EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,
      EmptyParam,EmptyParam,EmptyParam,lcid);

  ExcelWorksheet1.ConnectTo(WB.Worksheets[1] as _Worksheet);

  CarregarPlanilha;
  wb.Close(True,EmptyParam, EmptyParam, LcId);
  wb := nil;
  ExcelWorksheet1.Disconnect;
  ExcelApplication1.Disconnect;
  ExcelApplication1.Quit;
end;

procedure TfrmGridFilter.CarregarPlanilha;
var
  c,l,i:integer;
  sValor:string;
begin
  l:=1;
  c:=1;
  repeat
    for i:=Ord('A') to Ord('X') do
    begin
      sValor := ExcelWorksheet1.Range[chr(i)+ inttostr(l),chr(i)+inttostr(l)].Text;
      sg.Cells[c,l] := sValor;
      Label1.Caption := chr(i)+ inttostr(l) + 'valor:' + sValor;
      inc(c);
    end;

    sValor := ExcelWorksheet1.Range['A'+ inttostr(l),'A'+inttostr(l)].Text;
    Label1.Caption := 'A'+ inttostr(l) + 'valor:' + sValor;
    Application.ProcessMessages;

    if l>sg.RowCount then
      sg.RowCount := l;

    if c>sg.ColCount then
      sg.ColCount := c;

    inc(l);
    c:=1;
  until (sValor = '');
end;

// Save a TStringGrid to a file

procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f:    TextFile;
  i, k: Integer;
begin
  AssignFile(f, FileName);
  Rewrite(f);
  with StringGrid do
  begin
    // Write number of Columns/Rows
    Writeln(f, ColCount);
    Writeln(f, RowCount);
    // loop through cells
    for i := 0 to ColCount - 1 do
      for k := 0 to RowCount - 1 do
        Writeln(F, Cells[i, k]);
  end;
  CloseFile(F);
end;

// Load a TStringGrid from a file

procedure LoadStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f:          TextFile;
  iTmp, i, k: Integer;
  strTemp:    String;
begin
  AssignFile(f, FileName);
  Reset(f);
  with StringGrid do
  begin
    // Get number of columns
    Readln(f, iTmp);
    ColCount := iTmp;
    // Get number of rows
    Readln(f, iTmp);
    RowCount := iTmp;
    // loop through cells & fill in values
    for i := 0 to ColCount - 1 do
      for k := 0 to RowCount - 1 do
      begin
        Readln(f, strTemp);
        Cells[i, k] := strTemp;
      end;
  end;
  CloseFile(f);
end;

procedure TfrmGridFilter.SaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  SaveStringGrid(sg, SaveDialog1.FileName);
end;

procedure TfrmGridFilter.LoadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  LoadStringGrid(sg, OpenDialog1.FileName);
end;

procedure TfrmGridFilter.btInsertClick(Sender: TObject);
var
  l:integer;
begin

    for l:=2 to sg.RowCount-1 do
    begin
     sg.Row := l;
     if not(TB_MAPA_TESTAGEM.Active)or
        (TB_MAPA_TESTAGEM.Active and
        (TB_MAPA_TESTAGEMDT_MAPA.AsDateTime <> StrToDate(sg.Cells[3,l]))) then
     begin
       TB_MAPA_TESTAGEM.Close;
       TB_MAPA_TESTAGEM.ParamByName('DT_MAPA').AsDate := StrToDate(sg.Cells[3,l]);
       TB_MAPA_TESTAGEM.Open;
     end;

     if TB_MAPA_TESTAGEM.IsEmpty then
     begin
        TB_MAPA_TESTAGEM.Insert;
        TB_MAPA_TESTAGEM.FieldByName('DT_MAPA').AsDateTime := StrToDate(sg.Cells[3,l]);
        TB_MAPA_TESTAGEM.Post;
     end;

     try
       if not TB_MAPA_TESTAGEM_PACIENTE.Active then
         TB_MAPA_TESTAGEM_PACIENTE.Open;

       TB_MAPA_TESTAGEM_PACIENTE.Insert;
       TB_MAPA_TESTAGEM_PACIENTECD_MAPA_TESTAGEM.AsInteger := TB_MAPA_TESTAGEMCD_MAPA_TESTAGEM.AsInteger;
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NR_LIVRO').AsString := sg.Cells[2,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('DT_REGISTRO').AsDateTime := StrToDate(sg.Cells[3,l]);
       //TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NR_DIA').AsString := StrToDate(sg.Cells[4,l]);
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NR_REGISTRO').AsString := sg.Cells[5,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NM_PACIENTE').AsString := sg.Cells[6,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('FL_SEXO').AsString := sg.Cells[7,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NR_IDADE').AsString := sg.Cells[8,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NR_IDADE_MESES').AsString := sg.Cells[9,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('FL_ACONSELHADO').AsString := sg.Cells[10,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('FL_GESTANTE_NOVO').AsString := sg.Cells[11,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('FL_RESULTADO_NEGATIVO').AsString := sg.Cells[14,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('FL_RESULTADO_POSITIVO').AsString := sg.Cells[15,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('FL_RESULTADO_INDETERMINADO').AsString := sg.Cells[16,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('DS_OBSERVACAO').AsString := sg.Cells[17,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NM_INVESTIGADOR').AsString := sg.Cells[18,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('DS_LOCAL').AsString := sg.Cells[20,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('NM_DIGITADOR').AsString := sg.Cells[22,l];
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('DT_INGRESSO_DIG').AsDateTime := StrToDate(sg.Cells[23,l]);
       TB_MAPA_TESTAGEM_PACIENTE.FieldByName('DS_OBSERVACAO_DIG').AsString := sg.Cells[24,l];
       TB_MAPA_TESTAGEM_PACIENTE.Post;

       Application.ProcessMessages;
     except
       on E:Exception do
       begin
         TB_MAPA_TESTAGEM_PACIENTE.Cancel;
         Memo1.Lines.Add('ID:'+sg.Cells[1,l]+E.Message);
       end;
     end;
    end;
(*
 1	CD_MAPA_TESTAGEM_PACIENTE
 2	NR_LIVRO
 3	DT_REGISTRO
 6	NM_PACIENTE
 7	FL_SEXO
 8	NR_IDADE
 9	NR_IDADE_MESES
10	FL_ACONSELHADO
11	FL_GESTANTE_NOVO
12	FL_GESTANTE_NOVO
13	FL_GESTANTE_RETORNO
14	FL_RESULTADO_NEGATIVO
15	FL_RESULTADO_POSITIVO
16	FL_RESULTADO_INDETERMINADO
17	DS_OBSERVACAO
18	NM_INVESTIGADOR
20	DS_LOCAL
22	NM_DIGITADOR
23	DT_INGRESSO_DIG
24	DS_OBSERVACAO_DIG
*)
end;

procedure TfrmGridFilter.TB_MAPA_TESTAGEMAfterInsert(DataSet: TDataSet);
begin
  TB_MAPA_TESTAGEMDT_MAPA.AsDateTime := DM.GetDate;
  TB_MAPA_TESTAGEMCD_UNIDADE.AsString := prmUnidade;
  TB_MAPA_TESTAGEMCD_PROVINCIA.AsInteger := iProvincia;
  TB_MAPA_TESTAGEMCD_MUNICIPIO.AsInteger := iMunicipio;
end;

procedure TfrmGridFilter.TB_MAPA_TESTAGEMAfterPost(DataSet: TDataSet);
begin
  dm.Commit(DataSet);
end;

procedure TfrmGridFilter.TB_MAPA_TESTAGEM_PACIENTEAfterPost(
  DataSet: TDataSet);
begin
  dm.Commit(DataSet);
end;

end.
