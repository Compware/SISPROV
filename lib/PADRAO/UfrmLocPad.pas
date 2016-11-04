unit UfrmLocPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, IBCustomDataSet, IBQuery, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmLocPad = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    edLocalizar: TEdit;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    dsGrid: TDataSource;
    qyDados: TIBQuery;
    TabControl1: TTabControl;
    grDados: TdxDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocPad: TfrmLocPad;

implementation

uses
  UDM, UGeral;

{$R *.dfm}

procedure TfrmLocPad.FormCreate(Sender: TObject);
begin
  //grDados.IniFileName := sPathGrid + '\' + self.Name + '.ini';
end;

procedure TfrmLocPad.FormShow(Sender: TObject);
begin
  //grDados.LoadFromIniFile(grDados.IniFileName);
end;

procedure TfrmLocPad.grDadosDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
