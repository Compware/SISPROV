unit ufrmDlgInfoDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  DBCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls;

type
  TfrmDlgInfoDoc = class(TForm)
    rgDocumento: TRadioGroup;
    rbVazio: TRadioButton;
    rbModelo: TRadioButton;
    qyModelo: TIBQuery;
    qyGrupo: TIBQuery;
    dsGrupo: TDataSource;
    grDados: TdxDBGrid;
    btSelecionar: TBitBtn;
    btCancelar: TBitBtn;
    Label1: TLabel;
    dsModelo: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    qyGrupoCD_GRUPO: TIntegerField;
    qyGrupoDS_GRUPO: TIBStringField;
    qyModeloCD_DOCUMENTO: TIntegerField;
    qyModeloCD_GRUPO: TIntegerField;
    qyModeloCD_MODELO: TIntegerField;
    qyModeloDS_MODELO: TIBStringField;
    procedure rbModeloClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Documento: integer;
  end;

var
  frmDlgInfoDoc: TfrmDlgInfoDoc;

implementation

uses UDMDIG;

{$R *.dfm}

procedure TfrmDlgInfoDoc.rbModeloClick(Sender: TObject);
begin
  qyGrupo.Active := rbModelo.Checked;
  qyModelo.Active := rbModelo.Checked;
end;

procedure TfrmDlgInfoDoc.btSelecionarClick(Sender: TObject);
begin
  if rbModelo.Checked then
    Documento := qyModelo.FieldByName('CD_DOCUMENTO').AsInteger;
end;

end.
