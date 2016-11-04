unit UfrmConProdutividadeMedico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConPad, dxExEdtr, DB, StdCtrls, Buttons, ComCtrls, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, IBCustomDataSet, IBQuery, dxDBTLCl,
  dxGrClms;

type
  TfrmConProdutividadeMedico = class(TfrmConPad)
    qyAgenda: TIBQuery;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaFL_CONFIRMADO: TIntegerField;
    qyAgendaFL_REALIZADO: TIntegerField;
    qyAgendaNR_PROCESSO: TIntegerField;
    qyAgendaNM_PACIENTE: TIBStringField;
    qyAgendaIDADE: TSmallintField;
    qyAgendaTP_SEXO: TIBStringField;
    qyAgendaDS_PROVINCIA: TIBStringField;
    qyAgendaDS_MUNICIPIO: TIBStringField;
    qyAgendaDS_UNIDADE: TIBStringField;
    qyAgendaCD_AGENDA: TIntegerField;
    grDadosCD_AGENDA: TdxDBGridColumn;
    grDadosDS_UNIDADE: TdxDBGridColumn;
    grDadosDT_AGENDA: TdxDBGridDateColumn;
    grDadosNR_PROCESSO: TdxDBGridMaskColumn;
    grDadosNM_PACIENTE: TdxDBGridMaskColumn;
    grDadosIDADE: TdxDBGridMaskColumn;
    grDadosTP_SEXO: TdxDBGridMaskColumn;
    grDadosDS_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosDS_PROVINCIA: TdxDBGridMaskColumn;
    qyAgendaNM_MEDICO: TIBStringField;
    grDadosColumn10: TdxDBGridColumn;
    procedure btPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConProdutividadeMedico: TfrmConProdutividadeMedico;
  sSQLAGENDA:String;
implementation

Uses
  UDM, UDMGeral, UfrmFiltroProdutividade;
{$R *.dfm}

procedure TfrmConProdutividadeMedico.btPesquisarClick(Sender: TObject);
begin
  inherited;
    StatusBar1.Panels[0].Text := 'Filtro Ativado!';
    frmFiltroProdutividade := TfrmFiltroProdutividade.Create(self);
    frmFiltroProdutividade.ShowModal;
    frmFiltroProdutividade.Free;

end;

procedure TfrmConProdutividadeMedico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qyAgenda.Close;
end;

procedure TfrmConProdutividadeMedico.FormCreate(Sender: TObject);
begin
  inherited;
  sSQLAGENDA := qyAgenda.SQL.Text;
end;

end.
