unit UfrmConEsquemaTotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConPad, dxExEdtr, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, ComCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls;

type
  TfrmConEsquemaTotal = class(TfrmConPad)
    qyAgenda: TIBQuery;
    qyAgendaCOUNT: TIntegerField;
    qyAgendaESQUEMA: TIBStringField;
    grDadosCOUNT: TdxDBGridMaskColumn;
    grDadosESQUEMA: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConEsquemaTotal: TfrmConEsquemaTotal;
  sSQL1:String;

implementation

Uses
  UDM, UDMGeral, UfrmFiltroEsquemaTotal;

{$R *.dfm}

procedure TfrmConEsquemaTotal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qyAgenda.Close;

end;

procedure TfrmConEsquemaTotal.btPesquisarClick(Sender: TObject);
begin
  inherited;
    StatusBar1.Panels[0].Text := 'Filtro Ativado!';
    frmFiltroEsquemaTotal := TfrmFiltroEsquemaTotal.Create(self);
    frmFiltroEsquemaTotal.ShowModal;
    frmFiltroEsquemaTotal.Free;

end;

procedure TfrmConEsquemaTotal.FormCreate(Sender: TObject);
begin
  inherited;
  sSQL1:= qyAgenda.SQL.Text;
end;

end.
