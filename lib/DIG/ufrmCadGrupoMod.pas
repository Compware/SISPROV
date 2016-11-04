unit ufrmCadGrupoMod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfrmCadGrupoMod = class(TfrmCadPad)
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
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
  frmCadGrupoMod: TfrmCadGrupoMod;

implementation

uses UDMDIG;

{$R *.dfm}

end.
