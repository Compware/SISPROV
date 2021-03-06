unit UfrmCadPadSG2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Spin, ExtCtrls, JvExForms, JvScrollBox,
  JvExControls, JvLabel, Buttons, Tabs;

type

  TfrmCadPadSG2 = class(TForm)
    sbCentro: TJvScrollBox;
    sgDados: TStringGrid;
    sbTopo: TJvScrollBox;
    pnTituloTop: TPanel;
    sbEsq: TJvScrollBox;
    pnTituloLeft: TPanel;
    Bevel1: TBevel;
    TabSet1: TTabSet;
    sbHor: TScrollBar;
    sbVer: TScrollBar;

    procedure sgDadosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbCentroHorizontalScroll(Sender: TObject);
    procedure sbCentroVerticalScroll(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgDadosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure sbHorScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure sbVerScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    OldW,OldH:integer;
    procedure MontarGrid;
    procedure CriarTitulos;
    function GetWidth(ACol:integer):integer;
    function GetHeight(ARow:integer):integer;
  end;

type
  TMJvLabel = Class(TJvLabel)
  public
   constructor Create(AOwner: TComponent); Override;
end;

type
  TTitulo = Class
    Caption:String;
    Tag:Integer;
    Parent:String;
    Mesclar:Boolean;
    Width:Integer;
    Height:Integer;
    Top:Integer;
    Left:Integer;
    Name:String;
    FCount:Integer;
    Childs:TList;
    Angle:integer;
    Obj:TObject;
    public
     procedure SetCount(pCount:integer);
     property Count:integer read FCount write SetCount;
     constructor Create;
end;


var
  frmCadPadSG2: TfrmCadPadSG2;
  OldPosH,OldPosV, nCols,nRows: integer;
  lsLinha,lsColuna:TList;

implementation

{$R *.dfm}

procedure TfrmCadPadSG2.sgDadosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var w, pos, delta:integer;

  function Coluna(c:integer):string;
  var i,n:integer;
  begin
     Result := '';
     n := c div 26;
     if n>0 then
       for i := 1 to n do
       begin
         Result := Result + Chr(i+64);
         Dec(c,26);
       end;
     Result := Result + Chr(c+65);
  end;
begin

  //Horizontal
  pos := GetWidth(ACol);
  pos := pos - sgDados.Left - sbCentro.Width;
  if pos<0 then pos := 0;
  delta := pos - sbHor.Position;
  if sbHor.Max > pos then
  begin
    sgDados.Left := sgDados.Left - delta;
    pnTituloTop.Left := pnTituloTop.Left - delta;
    sbHor.Position := sbHor.Position + delta;
  end
  else
  begin
    delta := sbHor.Max;
    sgDados.Left := delta * -1;
    pnTituloTop.Left := delta * -1;
    sbHor.Position := delta;
  end;

  //Vertical
  pos := GetHeight(ARow);
  pos := pos - sgDados.Top - sbCentro.Height + sgDados.RowHeights[ARow];
  if pos<0 then pos := 0;
  delta := pos - sbVer.Position;
  if sbVer.Max > pos then
  begin
    sgDados.Top := sgDados.Top - delta;
    pnTituloLeft.Top := pnTituloLeft.Top - delta;
    sbVer.Position := sbVer.Position + delta;
  end
  else
  begin
    delta := sbVer.Max;
    sgDados.Top := delta * -1;
    pnTituloLeft.Top := delta * -1;
    sbVer.Position := delta;
  end;

  //Coordenadas
    Caption := Coluna(ACol) +
               intToStr(ARow+1) ;
end;

function TfrmCadPadSG2.GetWidth(ACol:integer):integer;
var i,w:integer;
begin
   //w :=  sbEsq.Width;
   w := 0;
   for i:=0 To sgDados.FixedCols-1 do
     w :=  w + sgDados.DefaultColWidth;

   for i:=0 To aCol do
     w :=  w + sgDados.ColWidths[i];

   w :=  w + (aCol * sgDados.GridLineWidth);
   //w := w - sbCentro.Width;
   result := w;
end;

function TfrmCadPadSG2.GetHeight(ARow:integer):integer;
var i,h:integer;
begin

   //h :=  sbTopo.Height;
   h :=  0;
   for i:=0 To sgDados.FixedRows-1 do
     h :=  h + sgDados.DefaultRowHeight;

   for i:=0 To aRow do
     h :=  h + sgDados.RowHeights[i];

   h := h - (aRow * sgDados.GridLineWidth);  
   //h := h - sbCentro.Height;
   result := h;
end;

procedure TfrmCadPadSG2.sbCentroHorizontalScroll(Sender: TObject);
var TheRange, DeltaPos:integer;
begin
  TheRange := sbCentro.HorzScrollBar.Position;
  DeltaPos := OldPosH - TheRange;
  pnTituloTop.Left :=  pnTituloTop.Left + DeltaPos;
  OldPosH := TheRange;
end;

{ TMJvLabel }

constructor  TMJvLabel.Create(AOwner: TComponent);
begin
  inherited;
   self.AutoSize := false;
   self.Alignment := taCenter;
   self.Layout := tlCenter;
   self.color := clBtnShadow;
   self.TextEllipsis := tePathEllipsis;
   self.FrameColor := clBlack;
   self.Font.Style := [fsBold];
end;

procedure TfrmCadPadSG2.sbCentroVerticalScroll(Sender: TObject);
var TheRange,DeltaPos:integer;
begin
  TheRange := sbCentro.VertScrollBar.Position;
  DeltaPos := OldPosV - TheRange;
  pnTituloLeft.Top :=  pnTituloLeft.Top + DeltaPos;
  OldPosV := TheRange;
end;

{ TTitulo }

constructor TTitulo.Create;
begin
//
end;

procedure TTitulo.SetCount(pCount:integer);
begin
  FCount := pCount;
end;

procedure TfrmCadPadSG2.CriarTitulos;
var col:TTitulo;  lsChild:TList; i:integer;
begin

   nCols := 0;
   nRows := 0;
   
   //********************************************************
   //*******************Cria Filhos
   lsChild := TList.Create;

   col := TTitulo.Create;
   col.Caption := 'ACOMPANHADO';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'TESTADO';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'POSITIVO';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'OBITO';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'TARV';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'PTV';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'ATV';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'ABANDONO';
   col.Angle := 90;
   col.Height := 100;
   col.Width := 50;
   lsChild.Add(col);

   //*********************Cria Pais
   lsColuna := TList.Create;

   col := TTitulo.Create;
   col.Caption := 'TOTAL';
   col.Height := 22;
   col.Width := 50;
   col.Childs := lsChild;
   inc(nCols, lsChild.Count);
   lsColuna.Add(col);

   col := TTitulo.Create;
   col.Caption := 'CRIAN�AS';
   col.Height := 22;
   col.Width := 50;
   col.Childs := lsChild;
   inc(nCols, lsChild.Count);
   lsColuna.Add(col);

   col := TTitulo.Create;
   col.Caption := 'ADULTOS';
   col.Height := 22;
   col.Width := 50;
   col.Childs := lsChild;
   inc(nCols, lsChild.Count);
   lsColuna.Add(col);

   col := TTitulo.Create;
   col.Caption := 'GESTANTES';
   col.Height := 22;
   col.Width := sgDados.DefaultColWidth;
   col.Childs := lsChild;
   inc(nCols, lsChild.Count);
   lsColuna.Add(col);


   //********************************************************
   //*****************Cria Filhos
   {lsChild := TList.Create;

   col := TTitulo.Create;
   col.Caption := 'JAN';
   col.Height := sgDados.DefaultRowHeight;
   col.Width := 54;
   lsChild.Add(col);

   col := TTitulo.Create;
   col.Caption := 'FEV';
   col.Height := sgDados.DefaultRowHeight;
   col.Width := 54;
   lsChild.Add(col);}

   //*********************Cria Pais
   lsLinha := TList.Create;
   for i:=2004 to 2015 do
   begin
     col := TTitulo.Create;
     col.Caption := intToStr(i);
     col.Height := sgDados.DefaultRowHeight;
     col.Width := 54;
     //col.Angle := 90;
     //col.Childs := lsChild;
     //inc(nRows, lsChild.Count);
     inc(nRows, 1);
     lsLinha.Add(col);
   end;

end;

procedure TfrmCadPadSG2.MontarGrid;
var col:TTitulo;  pn:TMJvLabel; i:integer;

   procedure CriaFilhos(ppn:TMJvLabel;pChild:TList);
   var i,w:integer; pn:TMJvLabel;
   begin
      w := 0;
      pn := nil;

      for i:=0 to pChild.Count-1 do
      begin
        col := TTitulo.Create;
        col := pChild.Items[i];
        pn := TMJvLabel.Create(Application);
        pn.parent := ppn.Parent;
        pn.Left := ppn.Left + ppn.Width;
        pn.Top := ppn.Height;
        pn.Caption := col.Caption;
        pn.Angle := col.Angle;
        pn.Height := col.Height;
        pn.Width := 0;
        col.Obj := pn;
        if col.Childs <> nil then
          CriaFilhos(pn,col.Childs)
        else begin
          pn.Width := col.Width;
          pn.Width := pn.Width + sgDados.GridLineWidth;
        end;
        w := w + pn.Width;
        ppn.Width := w;
        pn := nil;
      end;
   end;

   procedure CriaFilhos2(ppn:TMJvLabel;pChild:TList);
   var i,h:integer; pn:TMJvLabel;
   begin
      h := 0;
      pn := nil;

      for i:=0 to pChild.Count-1 do
      begin
        col := TTitulo.Create;
        col := pChild.Items[i];
        pn := TMJvLabel.Create(Application);
        pn.parent := ppn.Parent;
        pn.Top := ppn.Top + ppn.Height;
        pn.Left := ppn.Width;
        pn.Caption := col.Caption;
        pn.Angle := col.Angle;
        pn.Width := col.Width;
        pn.Height := 0;
        col.Obj := pn;
        if col.Childs <> nil then
          CriaFilhos2(pn,col.Childs)
        else begin
          pn.Height := col.Height;
          pn.Height := pn.Height + sgDados.GridLineWidth;
        end;
        h := h + pn.Height;
        ppn.Height := h;
        pn := nil;
      end;
   end;

begin

   sbEsq.Top := sbTopo.Top + sbTopo.Height;
   sbEsq.Left := sbTopo.Left;
   sbCentro.Top := sbEsq.Top;
   sbCentro.Left := sbEsq.Left + sbEsq.Width;

   pnTituloTop.Height := sbTopo.Height;
   pnTituloTop.Top := 2;
   pnTituloTop.Left := 0;

   pnTituloLeft.Width := sbEsq.Width;
   pnTituloLeft.Top := 0;
   pnTituloLeft.Left := 2;

   //***********************
   pn := TMJvLabel.Create(Application);
   pn.parent := pnTituloTop;
   pn.Left := sbEsq.Width;
   pn.Top := pnTituloTop.Top;
   pn.Height := 0;
   pn.Width := 0;
   CriaFilhos(pn,lsColuna);

   //************************
   //Titulo Esq
   pn := TMJvLabel.Create(Application);
   pn.parent := pnTituloTop;
   pn.Left := 2;
   pn.Width := pnTituloLeft.Width -2;
   pn.Caption := 'ANO';
   pn.Height := 22 + 100;
   pn.Angle := 90;

   //************************
   pn := TMJvLabel.Create(Application);
   pn.parent := pnTituloLeft;
   pn.Left := 0;
   pn.Top := 0;
   pn.Height := 0;
   pn.Width := 0;
   CriaFilhos2(pn,lsLinha);

   //************************
   sgDados.Top      := 0;
   sgDados.Left     := 0;
   sgDados.Width    := 0;
   sgDados.Height   := 0;
   sgDados.ColCount := nCols;
   sgDados.RowCount := nRows;
   for i:=0 To sgDados.ColCount-1 do
     sgDados.Width  :=  sgDados.Width + sgDados.ColWidths[i];

   sgDados.Width  := sgDados.Width  + (sgDados.ColCount * sgDados.GridLineWidth);

   for i:=0 To sgDados.RowCount-1 do
     sgDados.Height :=  sgDados.Height + sgDados.RowHeights[i];

   sgDados.Height := sgDados.Height + (sgDados.RowCount * sgDados.GridLineWidth);

   pnTituloLeft.Height := sgDados.Height;
   pnTituloTop.Width   := sgDados.Width + pnTituloLeft.Width;

   sbHor.Max := sgDados.Width - sbCentro.Width;
   sbVer.Max := sgDados.Height - sbCentro.Height;
   sbHor.LargeChange := sgDados.DefaultColWidth;
   sbVer.LargeChange := sgDados.DefaultRowHeight;

   sgDados.Row := 0;
   sgDados.Col := 0;
   sgDados.SetFocus;
end;

procedure TfrmCadPadSG2.FormShow(Sender: TObject);
begin
    OldW := Width;
    OldH := Height;
    CriarTitulos;
    MontarGrid;

    TabSet1.Tabs.Clear;
    TabSet1.Tabs.Add('TOTAL');
    TabSet1.Tabs.Add('Luanda');
    TabSet1.Tabs.Add('Bengo');
    TabSet1.Tabs.Add('Cabinda');
    TabSet1.Tabs.Add('Kwando Kubango');
    TabSet1.Tabs.Add('Namibe');
    TabSet1.Tabs.Add('Huila');
    TabSet1.Tabs.Add('Kaxito');
    TabSet1.Tabs.Add('Uige');
    TabSet1.Tabs.Add('Huambo');
    TabSet1.Tabs.Add('Zaire');
    TabSet1.Tabs.Add('Benguela');
    TabSet1.Tabs.Add('Bie');
    TabSet1.Tabs.Add('Kwanza Norte');
    TabSet1.Tabs.Add('Kwanza Sul');
    TabSet1.Tabs.Add('Lobito');
    TabSet1.Tabs.Add('Malange');
    TabSet1.TabIndex := 0;
end;

procedure TfrmCadPadSG2.sgDadosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  sgDados.Canvas.TextOut(Rect.Left,Rect.Top,
   intToStr(TabSet1.TabIndex));
end;

procedure TfrmCadPadSG2.FormResize(Sender: TObject);
begin
  sbEsq.Height := sbEsq.Height + (Height-OldH);
  sbCentro.Height := sbEsq.Height;
  OldH := Height;

  sbTopo.Width := sbTopo.Width + (Width-OldW);
  sbCentro.Width := sbTopo.Width;
  OldW := Width;
end;

procedure TfrmCadPadSG2.sbHorScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
var i:integer;
begin
  i:=ScrollPos - sbHor.Position;
  sgDados.Left := sgDados.Left - i;
  pnTituloTop.Left := pnTituloTop.Left - i;
end;

procedure TfrmCadPadSG2.sbVerScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
var i:integer;
begin
  i:=ScrollPos - sbVer.Position;
  sgDados.Top := sgDados.Top - i;
  pnTituloLeft.Top := pnTituloLeft.Top - i;
end;

procedure TfrmCadPadSG2.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  sgDados.Repaint;
end;

end.
