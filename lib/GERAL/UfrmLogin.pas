unit UfrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RXCtrls, jpeg, DB, DBCtrls;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    RxLabel1: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    btCancela: TBitBtn;
    btConfirma: TBitBtn;
    edUsu: TEdit;
    edSenha: TEdit;
    Image4: TImage;
    Image5: TImage;
    Image2: TImage;
    Label3: TLabel;
    dbEmpresa: TDBLookupComboBox;
    dsEmpresa: TDataSource;
    lbVersao: TRxLabel;
    procedure btConfirmaClick(Sender: TObject);
    procedure edUsuKeyPress(Sender: TObject; var Key: Char);
    procedure edSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbEmpresaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  cnt:integer;
  sLogin, sSenha:string;

implementation

uses uGeral, uDm;

{$R *.dfm}

procedure TfrmLogin.btConfirmaClick(Sender: TObject);
begin
   sLogin := edUsu.Text;
   sSenha := edSenha.Text;

    with dm.qyLogin do
    begin
      Close;
      ParamByName('nm_login').AsString := sLogin;
      Open;
      if not(RecordCount>0) then
      begin
        Application.MessageBox('Login não cadastrado!', 'Atenção',
                                                        mb_ok + mb_iconExclamation);
        edUsu.SetFocus;
        ModalResult:=mrNone;
        inc(Cnt);
        if (cnt=3) and (tag<>1) then
          begin
          Application.Terminate;
          end;
      end
      else
      begin
        if sSenha <> FieldByName('ds_senha').AsString then
        begin
          Application.MessageBox('Senha incorreta!', 'Atenção',
                                                          mb_ok + mb_iconExclamation);
          edSenha.SetFocus;
          ModalResult:=mrNone;
          inc(Cnt);
          if (cnt=3) and (tag<>1) then
           begin
            Application.Terminate;
           end;
        end
      end;
    end;
end;

procedure TfrmLogin.edUsuKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
     keybd_event(9,0,0,0);
  end;

end;

procedure TfrmLogin.edSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
     keybd_event(9,0,0,0);
  end;
end;

procedure TfrmLogin.btCancelaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   lbVersao.Caption := 'Versão ' + prmVersao;
end;

procedure TfrmLogin.dbEmpresaExit(Sender: TObject);
begin
  btConfirma.SetFocus;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edUsu.Text := sLoginAuto;
  edSenha.Text := sSenhaAuto;
end;

end.
