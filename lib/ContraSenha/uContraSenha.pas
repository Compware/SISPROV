unit uContraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ExtCtrls;

type
  TfrmContraSenha = class(TForm)
    Label1: TLabel;
    edSenha: TEdit;
    lbContraSenha: TLabel;
    btGerar: TButton;
    Bevel1: TBevel;
    DriveComboBox1: TDriveComboBox;
    lbSerial: TLabel;
    procedure btGerarClick(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContraSenha: TfrmContraSenha;

implementation

uses uFuncaoContraSenha;

{$R *.dfm}

procedure TfrmContraSenha.btGerarClick(Sender: TObject);
begin
  lbContraSenha.Caption := GeraSenha(edSenha.text);
end;

procedure TfrmContraSenha.DriveComboBox1Change(Sender: TObject);
begin
  lbSerial.Caption := SerialNum(DriveComboBox1.Drive);
end;

end.
