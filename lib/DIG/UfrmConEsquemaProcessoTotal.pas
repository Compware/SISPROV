unit UfrmConEsquemaProcessoTotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConPad, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB,
  IBCustomDataSet, IBQuery, StdCtrls, Buttons, ComCtrls, dxCntner, ExtCtrls;

type
  TfrmConEsquemaProcessoTotal = class(TfrmConPad)
    qyAgenda: TIBQuery;
    qyAgendaCOUNT: TIntegerField;
    qyAgendaNR_PROCESSO: TIntegerField;
    qyAgendaESQUEMA: TIBStringField;
    grDadosNR_PROCESSO: TdxDBGridMaskColumn;
    grDadosESQUEMA: TdxDBGridMaskColumn;
    grDadosCOUNT: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConEsquemaProcessoTotal: TfrmConEsquemaProcessoTotal;
  sSQL1:String;
implementation

uses UfrmFiltroEsquemaProcessoTotal;

{$R *.dfm}

procedure TfrmConEsquemaProcessoTotal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qyAgenda.Close;
end;

procedure TfrmConEsquemaProcessoTotal.btPesquisarClick(Sender: TObject);
begin
  inherited;
    StatusBar1.Panels[0].Text := 'Filtro Ativado!';
    frmFiltroEsquemaProcessoTotal := TfrmFiltroEsquemaProcessoTotal.Create(self);
    frmFiltroEsquemaProcessoTotal.ShowModal;
    frmFiltroEsquemaProcessoTotal.Free;

end;

procedure TfrmConEsquemaProcessoTotal.FormCreate(Sender: TObject);
begin
  inherited;
  sSQL1:= qyAgenda.SQL.Text;
end;

end.
