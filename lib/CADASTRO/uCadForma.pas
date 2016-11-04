unit uCadForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, Menus, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, uDmGeral, Mask, DBCtrls;

type
  TfrmCadForma = class(TfrmCadPad)
    gcCD_FORMA: TdxDBGridColumn;
    gcDS_FORMA: TdxDBGridColumn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadForma: TfrmCadForma;

implementation

{$R *.dfm}

end.
