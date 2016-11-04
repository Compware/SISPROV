unit uCadServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls,uFuncaoContraSenha,
  Menus;

type
  TfrmCadServicos = class(TfrmCadPad)
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btgravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadServicos: TfrmCadServicos;

implementation

uses UDMGERAL, UGeral;

{$R *.dfm}

procedure TfrmCadServicos.btgravarClick(Sender: TObject);
var sOperacao:string;
begin
  sOperacao := 'Gravar Servico!';
  if (prmSistemaUnidades=cvNao) then
     inherited
  else if (prmSistemaUnidades=cvSim) and ValidaContraSenha(sOperacao) then
    inherited
  else
    btCancelarClick(Sender);
end;

end.
