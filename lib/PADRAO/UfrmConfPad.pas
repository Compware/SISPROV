unit UfrmConfPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmConfPad = class(TForm)
    pgFiltros: TPageControl;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfPad: TfrmConfPad;

implementation

Uses
  UDM, UDMGERAL, UGeral;

{$R *.dfm}

end.
