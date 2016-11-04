unit uPermissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TfrmPermissao = class(TForm)
    Panel2: TPanel;
    Image1: TImage;
    Image5: TImage;
    Label2: TLabel;
    edSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPermissao: TfrmPermissao;

implementation

{$R *.dfm}

procedure TfrmPermissao.BitBtn1Click(Sender: TObject);
begin
  if edSenha.Text = 'MASTERKEYCOMPWARE' then
    ModalResult := mrOk
  else
    begin
      MessageDlg('Senha incorreta!',mtWarning,[mbOK],0);
      edSenha.Clear;
    end;


end;

end.
