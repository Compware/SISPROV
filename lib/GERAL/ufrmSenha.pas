unit ufrmSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmSenha = class(TForm)
    Label1: TLabel;
    edSenha: TEdit;
    btConfirmar: TButton;
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

{$R *.dfm}

procedure TfrmSenha.btConfirmarClick(Sender: TObject);
begin
  if edSenha.Text = 'admin' then
    ModalResult := mrOk;
end;

end.
