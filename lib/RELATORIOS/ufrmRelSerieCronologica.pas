unit ufrmRelSerieCronologica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, IBCustomDataSet, IBQuery, Grids, StdCtrls,
  ufrmCadBase, ExtCtrls;

type
  TfrmRelSerieCronologica = class(TfrmCadBase)
    TabControl1: TTabControl;
    lbProvincia: TLabel;
    qyDados: TIBQuery;
    Button1: TButton;
    sgDados: TStringGrid;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgDadosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TabControl1Change(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaDados;
    procedure Inicializar;
    procedure MontaGrid;
    procedure CarregaGrid(id:integer);
  end;

var
  frmRelSerieCronologica: TfrmRelSerieCronologica;
  lsIndicador,lsAno,lsProvincia:TStringList;

  Tabela : array of array [0..18] of
                 array [1..4]  of
                 array [1..10] of string;
  Posicao : array [1..4] of array [0..1] of TRect;

implementation

uses UDM, UGeral, DateUtils, uSQLPrograma, Types;

{$R *.dfm}

{ TfrmRelSerieCronologica }

procedure TfrmRelSerieCronologica.Inicializar;
var i,n:integer;
begin
  lsIndicador := TStringList.Create;
  lsAno := TStringList.Create;
  lsProvincia := TStringList.Create;

  qyDados.SQL.Text := 'select * from provincia';
  qyDados.Open;
  While Not qyDados.Eof do
  begin
    lsProvincia.add(UpperCase(qyDados.FieldByName('DS_PROVINCIA').AsString));
    qyDados.Next;
  end;
  qyDados.Close;
  
  lsIndicador.Add('Aconselhado');
  lsIndicador.Add('Testado');
  lsIndicador.Add('Positivo');
  lsIndicador.Add('Acompanhado');
  lsIndicador.Add('Tarv');
  lsIndicador.Add('Ptv');
  lsIndicador.Add('Obito');

  for i:= 2004 to YearOf(Now) do
    lsAno.Add(intToStr(i));

  SetLength(Tabela,lsAno.Count);

  n := lsAno.Count;
  sgDados.RowCount := n+3;
  sgDados.ColCount := 41;
  sgDados.FixedRows := 2;
end;

procedure TfrmRelSerieCronologica.CarregaDados;
var i,j,nAno,nTipo,nProv:integer; sAux:string; nValor1,nValor2:integer;
begin
  qyDados.Close;
  qyDados.SQL.Clear;
  sAux := Format(sSQLAconTestPosProvinciaAno,['']);
  qyDados.SQL.Add(sAux);
  qyDados.Open;

  while not qyDados.Eof do
  begin
     //TIPO (Crianca, Adulto, Gestante)
     //ANO,PROVINCIA,ACONS,TEST,POSIT
     //qyDados.FieldBYName('TIPO').asString;

     nAno := qyDados.FieldBYName('ANO').AsInteger - 2004;
     qyDados.FieldBYName('ANO').asString;

     sAux := UpperCase(qyDados.FieldBYName('PROVINCIA').asString);
     nProv := lsProvincia.IndexOf(sAux);
     if nProv = -1 then
       nProv := lsProvincia.Add(sAux);
     nProv := nProv + 1;
     nTipo := qyDados.FieldBYName('TIPO').AsInteger;
     Tabela[nAno][nProv][nTipo][1] := qyDados.FieldBYName('ACONS').asString;
     Tabela[nAno][nProv][nTipo][2] := qyDados.FieldBYName('TEST').asString;
     Tabela[nAno][nProv][nTipo][3] := qyDados.FieldBYName('POSIT').asString;

     //Total
     for i:=1 to lsIndicador.Count do
     for j:=1 to 3 do
     begin
       nValor1 := ValorInt(Tabela[nAno][0][j][i]);
       nValor2 := ValorInt(Tabela[nAno][nProv][j][i]);
       Tabela[nAno][0][j][i] := IntToStr(nValor1+nValor2);
     end;

     qyDados.Next;
  end;

end;

procedure TfrmRelSerieCronologica.Button1Click(Sender: TObject);
begin
  CarregaDados;
end;

procedure TfrmRelSerieCronologica.FormCreate(Sender: TObject);
begin
  Inicializar;
  MontaGrid;
end;

procedure TfrmRelSerieCronologica.sgDadosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
//var Conteudo:String; i,x,y,t,hf:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
{
   hf := sgDados.Canvas.TextHeight('Lj');

  //Mesclar: Negrito, Centro, Borda
  if (ARow = 0) then // and (ACol in [1..10]) then
  begin

      Case ACol of
        1: begin Posicao[1][0] := Rect; Conteudo := sgDados.Cells[ 1,0]; end;
       11: begin Posicao[2][0] := Rect; Conteudo := sgDados.Cells[11,0]; end;
       21: begin Posicao[3][0] := Rect; Conteudo := sgDados.Cells[21,0]; end;
       31: begin Posicao[4][0] := Rect; Conteudo := sgDados.Cells[31,0]; end;
      end;

      Case ACol of
       10: begin Posicao[1][1] := Rect; end;
       20: begin Posicao[2][1] := Rect; end;
       30: begin Posicao[3][1] := Rect; end;
       40: begin Posicao[4][1] := Rect; end;
      end;

      Case ACol of
       10: i:=1;
       20: i:=2;
       30: i:=3;
       40: i:=4;
      end;

      begin
        r.Left := Posicao[i][0].Left;
        r.Top := Posicao[i][0].Top;
        r.Bottom := Posicao[i][0].Bottom;
        r.Right := Posicao[i][1].Right;
      end;

      //if (ACol in [10,20,30,40]) then
      begin
        sgDados.Canvas.Font.Style:=[fsbold];
        sgDados.Canvas.FillRect(r);
        t := sgDados.Canvas.TextWidth(Conteudo);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgDados.Canvas.TextRect(r,x,y,Conteudo);
        DesenhaBordas(sgDados.Canvas,r);
      end;
  end;
}
end;

procedure TfrmRelSerieCronologica.MontaGrid;
var i:integer;
begin
  for i:=1 to lsAno.Count do
     sgDados.Cells[0,i+1] := lsAno.Strings[i-1];

  sgDados.Cells[1,0]  :=  'Total';
  sgDados.Cells[0,sgDados.RowCount-1]  :=  'Total';
  sgDados.Cells[11,0] :=  'Crian�a';
  sgDados.Cells[21,0] :=  'Adulto';
  sgDados.Cells[31,0] :=  'Gestante';

  for i:=1 to lsIndicador.Count do
  begin
     sgDados.Cells[i,1] := lsIndicador.Strings[i-1];
     sgDados.Cells[i+10,1] := lsIndicador.Strings[i-1];
     sgDados.Cells[i+20,1] := lsIndicador.Strings[i-1];
     sgDados.Cells[i+30,1] := lsIndicador.Strings[i-1];
  end;

  sgDados.ScrollBy(1000,0);
end;

procedure TfrmRelSerieCronologica.TabControl1Change(Sender: TObject);
begin
  CarregaGrid(TabControl1.TabIndex);
end;

procedure TfrmRelSerieCronologica.CarregaGrid(id: integer);
var r,c,i:integer;
begin

   lbProvincia.Caption := 'PROVINCIA:';

   if id > 0 then
    lbProvincia.Caption := 'PROVINCIA:' + lsProvincia.Strings[id-1];

   //Limpar;
   for r:=2 to sgDados.RowCount-1 do
     for c:=1 to sgDados.ColCount-1 do
         sgDados.Cells[c,r] := '';

   //Popular
   for r:= 1 to lsAno.Count do
    for i:=1 to lsIndicador.Count do
   begin
     sgDados.Cells[i+10,r+1] := Tabela[r-1][id][1][i];
     sgDados.Cells[i+20,r+1] := Tabela[r-1][id][2][i];
     sgDados.Cells[i+30,r+1] := Tabela[r-1][id][3][i];
     //sgDados.Cells[01,r+1] := Tabela[r-1][id][1][i]; total
   end;
end;

procedure TfrmRelSerieCronologica.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  //i := GetScrollPos(sgDados.Handle,SB_HORZ);
  SetScrollPos(sgDados.Handle,SB_HORZ,ScrollPos,true);
  SetScrollPos(ScrollBox1.Handle,SB_HORZ,ScrollPos,true);
end;

procedure TfrmRelSerieCronologica.Button2Click(Sender: TObject);
var scrollsize,pagesize:integer;
    scrollproportion,pageproportion:double;
    SI:tagSCROLLINFO;
begin

 with sgDados do
 begin
   si.cbsize := sizeof(si);
   si.fMask := SIF_PAGE or SIF_POS or SIF_RANGE;
   getscrollinfo(Handle, SB_HORZ, SI);
   SI.fMask := SIF_PAGE or SIF_RANGE;
   scrollsize := RowCount-FixedRows;
   pagesize := VisibleRowCount-FixedRows;
   if pagesize <> 0 then
     scrollproportion := (scrollsize / pagesize) -1
   else
     scrollproportion:=0;

   if scrollproportion > 0.00001 then
   begin
     pageproportion:= (127 / scrollproportion)+127;
     si.nMax := Round(pageproportion);
     Si.nMin := 0;
     Si.nPage := Si.nMax - 126;
   end
   else
   begin
     Si.nMin := 0;
     Si.nMax := 127;
     Si.nPage := 0;
   end;
   //else
   // SI.nPage := 0;

   SetScrollInfo(Handle, SB_VERT, SI, true);
 end;
end;

end.
