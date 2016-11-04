unit uCadParametro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Menus;

type
  TfrmCadParametro = class(TfrmCadPad)
    grDadosCD_PARAMETRO: TdxDBGridMaskColumn;
    grDadosDS_PARAMETRO: TdxDBGridMaskColumn;
    grDadosVALOR: TdxDBGridMaskColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParametro: TfrmCadParametro;

implementation

Uses UDMGERAL, UDM;

{$R *.dfm}

end.
