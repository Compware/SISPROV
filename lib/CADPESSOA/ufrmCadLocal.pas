unit ufrmCadLocal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, StdCtrls, Mask, DBCtrls, dxTL, dxDBCtrl,
  dxDBGrid, DB, dxCntner, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCadLocal = class(TfrmCadPad)
    grDadosCD_LOCAL: TdxDBGridColumn;
    grDadosNM_LOCAL: TdxDBGridColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLocal: TfrmCadLocal;

implementation

uses UDMGERAL;

{$R *.dfm}

end.
