unit uCadDashBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, uFrameDashBoard, IBCustomDataSet,
  IBQuery, ImgList, Menus;

type
  TfrmCadDashBoard = class(TfrmCadPad)
    qyDashBoard: TIBQuery;
    qyDashBoardCD_DASHBOARD: TIntegerField;
    qyDashBoardNM_DASHBOARD: TIBStringField;
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    btExecutar: TBitBtn;
    ImageList1: TImageList;
    btParar: TBitBtn;
    qyDashBoardTIPO: TIBStringField;
    grDadosColumn3: TdxDBGridColumn;
    procedure btIncluirClick(Sender: TObject);
    procedure tabGeralEnter(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure pgGeralChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btexcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure qyDashBoardAfterScroll(DataSet: TDataSet);
    procedure btExecutarClick(Sender: TObject);
    procedure AfterOpen(DataSet: TDataSet);
    procedure AfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaFrame(bAtualizaControles:Boolean);
    procedure DestroiFrame;
    procedure FiguraBotaoExecutar(id:integer);
  end;

var
  frmCadDashBoard: TfrmCadDashBoard;
  frameDashBoard: TframeDashBoard;

implementation

uses UDM;

{$R *.dfm}

procedure TfrmCadDashBoard.btIncluirClick(Sender: TObject);
begin
  CarregaFrame(false);
  inherited;
end;

procedure TfrmCadDashBoard.CarregaFrame(bAtualizaControles:Boolean);
begin
   if (frameDashBoard <> nil) then
      DestroiFrame;
      
   frameDashBoard := TframeDashBoard.Create(frmCadDashBoard);
   try

     frameDashBoard.Parent := Panel4;
     frameDashBoard.pnGeral.Visible := true;
     frameDashBoard.tsDados.TabVisible := true;
     frameDashBoard.Align := alClient;
     dsControle.DataSet := frameDashBoard.TB_DASH;
     frameDashBoard.dsDash.AutoEdit := false;
     frameDashBoard.qyConsulta.AfterClose := AfterClose;
     frameDashBoard.qyConsulta.AfterOpen := AfterOpen;
     frameDashBoard.TB_DASH.DataSource := dsGrid;
     frameDashBoard.bAtualizaControles := bAtualizaControles;
     frameDashBoard.TB_DASH.Open;
     frameDashBoard.bAtualizaControles := true;

   except
     on E:Exception do
       ShowMessage('Erro ao carregar a Frame!' + chr(10) + e.Message );
   end;
end;

procedure TfrmCadDashBoard.DestroiFrame;
begin
   frameDashBoard.qyConsulta.close;
   frameDashBoard.TB_DASH.Close;
   FreeAndNil(frameDashBoard);
end;

procedure TfrmCadDashBoard.tabGeralEnter(Sender: TObject);
begin
  inherited;
  if (frameDashBoard = nil) or
     ((frameDashBoard.TB_DASHCD_DASHBOARD.AsInteger <>
      qyDashBoardCD_DASHBOARD.AsInteger)and
      (frameDashBoard.TB_DASH.state<>dsInsert)) then
      CarregaFrame(true);
end;

procedure TfrmCadDashBoard.grDadosDblClick(Sender: TObject);
begin
  //if (frameDashBoard <> nil) then
    inherited;
end;

procedure TfrmCadDashBoard.pgGeralChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange :=(frameDashBoard <> nil);
end;

procedure TfrmCadDashBoard.btexcluirClick(Sender: TObject);
begin
  if (frameDashBoard <> nil) then
  begin
    inherited;
    pgGeral.ActivePageIndex := 0;
    DestroiFrame;
    qyDashBoard.Close;
    qyDashBoard.Open;
  end;
end;

procedure TfrmCadDashBoard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frameDashBoard<>nil then
  begin
    inherited;
    FreeAndNil(frameDashBoard);
  end;
end;

procedure TfrmCadDashBoard.btCancelarClick(Sender: TObject);
begin
  if (frameDashBoard <> nil) then
  begin
    inherited;
    DestroiFrame;
  end;
end;

procedure TfrmCadDashBoard.bteditarClick(Sender: TObject);
begin
  if (frameDashBoard <> nil) then
    inherited;
end;

procedure TfrmCadDashBoard.btgravarClick(Sender: TObject);
begin
  if (frameDashBoard <> nil) then
  begin
    inherited;
    qyDashBoard.Close;
    qyDashBoard.Open;
    qyDashBoard.Locate('CD_DASHBOARD',
       frameDashBoard.TB_DASHCD_DASHBOARD.AsInteger,[]);
  end;
end;

procedure TfrmCadDashBoard.btAnteriorClick(Sender: TObject);
begin
  if (frameDashBoard <> nil) then
    inherited;
end;

procedure TfrmCadDashBoard.btProximoClick(Sender: TObject);
begin
  if (frameDashBoard <> nil) then
    inherited;
end;

procedure TfrmCadDashBoard.qyDashBoardAfterScroll(DataSet: TDataSet);
begin
  //CarregaFrame(true);
  inherited;
end;

procedure TfrmCadDashBoard.btExecutarClick(Sender: TObject);
begin
  inherited;
  if (frameDashBoard <> nil) then
    frameDashBoard.qyConsulta.Active := not frameDashBoard.qyConsulta.Active;
end;

procedure TfrmCadDashBoard.AfterOpen(DataSet: TDataSet);
begin
  frameDashBoard.qyConsultaAfterOpen(DataSet);
  btExecutar.Visible := false;
  btParar.Visible := true;
end;

procedure TfrmCadDashBoard.AfterClose(DataSet: TDataSet);
begin
  frameDashBoard.qyConsultaAfterClose(DataSet);
  btExecutar.Visible := true;
  btParar.Visible := false;
end;

procedure TfrmCadDashBoard.FiguraBotaoExecutar(id: integer);
begin
end;

end.
