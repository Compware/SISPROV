unit UViewDashBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, IBCustomDataSet, IBQuery, uFrameDashBoard, Buttons;

type
  TfrmViewDash = class(TForm)
    qyDash: TIBQuery;
    scrEsquerda: TScrollBox;
    Splitter1: TSplitter;
    scrDireita: TScrollBox;
    qyDashCD_DASHBOARD: TIntegerField;
    qyDashNM_DASHBOARD: TIBStringField;
    Panel1: TPanel;
    btPainelDireito: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btPainelDireitoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigo:integer;
    procedure CriaDash;
    procedure DestroiDash;
  end;

var
  frmViewDash: TfrmViewDash;
  frameDashBoards:array of TframeDashBoard;
implementation

uses UDM;

{$R *.dfm}

procedure TfrmViewDash.CriaDash;
var  i,h:integer;
     frameDashBoard:TframeDashBoard;
begin
   qyDash.ParamByName('CODIGO').AsInteger := codigo;
   qyDash.Open;
   qyDash.Last;
   qyDash.First;
   SetLength(frameDashBoards,qyDash.RecordCount);
   i:=0;
   while not qyDash.Eof do
   begin
     frameDashBoards[i]:= TframeDashBoard.Create(frmViewDash);
     try
        frameDashBoard := frameDashBoards[i];
        frameDashBoard.Name := 'frameDashBoard'+inttostr(i);

       if (qyDash.RecNo mod 2)>0 then
         frameDashBoard.Parent := scrEsquerda
       else
         frameDashBoard.Parent := scrDireita;

       frameDashBoard.Align := alTop;
       frameDashBoard.dsDash.AutoEdit := false;
       frameDashBoard.View;
       frameDashBoard.TB_DASH.ParamByName('CD_DASHBOARD').AsInteger :=
         qyDashCD_DASHBOARD.AsInteger;
       frameDashBoard.TB_DASH.Open;
       frameDashBoard.qyConsulta.Close;
       frameDashBoard.qyConsulta.Open;

       h := frameDashBoard.Height;
       inc(i);
     except
       on E:Exception do
         ShowMessage('Erro ao carregar a Frame!' + chr(10) + e.Message );
     end;
     qyDash.Next;
   end;
   qyDash.Close;

   scrEsquerda.VertScrollBar.Position := 0;
   scrEsquerda.VertScrollBar.Increment :=  h;
   scrDireita.VertScrollBar.Position := 0;
   scrDireita.VertScrollBar.Increment :=  h;
end;

procedure TfrmViewDash.DestroiDash;
var i:integer;
begin
  if Length(frameDashBoards)>0 then
    for i:=Length(frameDashBoards) to 0 do
        frameDashBoards[i].Free;
end;

procedure TfrmViewDash.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DestroiDash;
end;

procedure TfrmViewDash.FormShow(Sender: TObject);
begin
  CriaDash;
end;

procedure TfrmViewDash.btPainelDireitoClick(Sender: TObject);
begin
    scrDireita.Visible := not scrDireita.Visible; 
end;

end.
