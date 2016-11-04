unit UfrmCadUsuarioxlocal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmCadUsuarioxLocal = class(TfrmCadPad)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    grDadosCD_USUARIO: TdxDBGridMaskColumn;
    grDadosNM_USUARIO: TdxDBGridMaskColumn;
    DBGrid1: TDBGrid;
    btIncLoc: TSpeedButton;
    btDelLoc: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btDelLocClick(Sender: TObject);
    procedure btIncLocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarioxLocal: TfrmCadUsuarioxLocal;

implementation

uses UDMGERAL, UfrmLocalizar, UDM;

{$R *.dfm}
procedure TfrmCadUsuarioxLocal.btIncLocClick(Sender: TObject);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Local';
  frmLocalizar.qyDados.sql.add('select cd_Local, nm_Local from Local');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='cd_local';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Local';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dsControle.DataSet.Insert;
    DMGERAL.TB_USUARIO_LOCALCD_LOCAL.AsInteger := frmLocalizar.qyDados.FieldByname('cd_Local').Asinteger;
    DMGERAL.TB_USUARIO_LOCALNM_LOCAL.AsString := frmLocalizar.qyDados.FieldByname('nm_Local').AsString;
    dsControle.DataSet.Post;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadUsuarioxLocal.FormShow(Sender: TObject);
begin
  inherited;
  dsGrid.DataSet.Open;
end;

procedure TfrmCadUsuarioxLocal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsGrid.DataSet.Close;
end;

procedure TfrmCadUsuarioxLocal.btDelLocClick(Sender: TObject);
begin
  inherited;
  dsControle.DataSet.Delete;
end;

end.
