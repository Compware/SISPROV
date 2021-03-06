unit UCadTipoDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, StdCtrls, Mask, DBCtrls, DB, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ComCtrls, Buttons, ExtCtrls, Menus;

type
  TfrmCadTipoDocumento = class(TfrmCadPad)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    grDadosCD_TIPO_DOCUMENTO: TdxDBGridMaskColumn;
    grDadosDS_TIPO_DOCUMENTO: TdxDBGridMaskColumn;
    Label2: TLabel;
    edCodigo: TDBEdit;
    procedure btgravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoDocumento: TfrmCadTipoDocumento;

implementation

uses  UDM, UDMGERAL, UGeralSQL, uFuncaoContraSenha, UGeral;

{$R *.dfm}

procedure TfrmCadTipoDocumento.btgravarClick(Sender: TObject);
var sOperacao:string;
begin
  sOperacao := 'Gravar Tipo Documento!';
  if (prmSistemaUnidades=cvNao) then
     inherited
  else if (prmSistemaUnidades=cvSim) and ValidaContraSenha(sOperacao) then
    inherited
  else
    btCancelarClick(Sender);
end;

procedure TfrmCadTipoDocumento.FormCreate(Sender: TObject);
begin

  if (prmSistemaUnidades=cvSim) then
  begin
    edCodigo.ReadOnly := false;
    edCodigo.TabStop := true;
    edCodigo.Color := clWhite;
  end
  else
  begin
    edCodigo.ReadOnly := true;
    edCodigo.TabStop := false;
    edCodigo.Color := cl3DLight;
  end;

end;

end.
