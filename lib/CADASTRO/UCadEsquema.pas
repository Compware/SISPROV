unit UCadEsquema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, StdCtrls, Mask, DBCtrls, dxTL, dxDBCtrl,
  dxDBGrid, DB, dxCntner, ComCtrls, Buttons, ExtCtrls, Menus;

type
  TfrmCadEsquema = class(TfrmCadPad)
    grDadosCD_ESQUEMA: TdxDBGridMaskColumn;
    grDadosDS_NOME_MEDICAMENTO: TdxDBGridMaskColumn;
    grDadosDS_SIGLA: TdxDBGridMaskColumn;
    grDadosDS_APRESENTACAO: TdxDBGridMaskColumn;
    grDadosDS_NOME_COMERCIAL: TdxDBGridMaskColumn;
    grDadosCD_UND: TdxDBGridMaskColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    grDadosVL_ARV: TdxDBGridColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEsquema: TfrmCadEsquema;

implementation

{$R *.dfm}

Uses
  UDM, UDMGERAL;

end.
 