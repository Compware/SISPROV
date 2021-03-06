unit UCadOcupacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, StdCtrls, Mask, DBCtrls, DB, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ComCtrls, Buttons, ExtCtrls, Menus;

type
  TfrmCadOcupacao = class(TfrmCadPad)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    grDadosCD_OCUPACAO: TdxDBGridMaskColumn;
    grDadosDS_OCUPACAO: TdxDBGridMaskColumn;
    Label2: TLabel;
    edCodigo: TDBEdit;
    procedure btgravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadOcupacao: TfrmCadOcupacao;

implementation

uses UDM, UDMGERAL, UgeralSQL, uFuncaoContraSenha, UGeral;

{$R *.dfm}

procedure TfrmCadOcupacao.btgravarClick(Sender: TObject);
var sOperacao:string;
begin
  if DMGERAL.TB_OCUPACAO.State in [dsInsert] then
  begin
    if PegaValor('CD_OCUPACAO','OCUPACAO',['CD_OCUPACAO'],
            [DMGERAL.TB_OCUPACAOCD_OCUPACAO.AsInteger],nil) > 0 then
    begin
      MessageDlg('C�digo Existente!',mtInformation,
       [mbOK],0);

      edCodigo.SetFocus;
      abort;
    end
    else
      if DMGERAL.TB_OCUPACAOCD_OCUPACAO.AsInteger < 1 then
      begin
        MessageDlg('� necess�rio incluir o C�digo da Ocupa��o!',mtInformation,
         [mbOK],0);

        edCodigo.SetFocus;
        abort;
      end;
  end;

  sOperacao := 'Gravar Ocupa��o!';
  if (prmSistemaUnidades=cvNao) then
     inherited
  else if (prmSistemaUnidades=cvSim) and ValidaContraSenha(sOperacao) then
    inherited
  else
    btCancelarClick(Sender);

end;

end.
