unit uEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient,
  IdSMTP, IdBaseComponent, IdMessage, StdCtrls;

type
  TfrmEmail = class(TForm)
    Label1: TLabel;
    edDe: TEdit;
    Label2: TLabel;
    edPara: TEdit;
    Label3: TLabel;
    mmMsg: TMemo;
    edUsuario: TEdit;
    Label4: TLabel;
    edSenha: TEdit;
    Label5: TLabel;
    edHost: TEdit;
    Label6: TLabel;
    edPort: TEdit;
    btEnviar: TButton;
    mmLog: TMemo;
    MailMessage: TIdMessage;
    SMTP: TIdSMTP;
    procedure btEnviarClick(Sender: TObject);
    procedure AddAttachment(sAttachment:string);
    procedure AddBodyHtml(sHtml:string);
    procedure AddBody(sBody:string);
  private
    { Private declarations }
  public
    { Public declarations }
    sSubject:string;
    function Enviar:boolean;
  end;

var
  frmEmail: TfrmEmail;

implementation

{$R *.dfm}

procedure TfrmEmail.AddAttachment(sAttachment: string);
begin
  if FileExists(sAttachment) then
    TIdAttachment.Create(MailMessage.MessageParts, sAttachment);
end;

procedure TfrmEmail.AddBody(sBody: string);
begin
   mmMsg.Lines.Text := sBody;
   MailMessage.SetBody(mmMsg.Lines);
   MailMessage.ContentType:='text/html';
end;

procedure TfrmEmail.AddBodyHtml(sHtml: string);
//var newText:TIdText;
begin

  if FileExists(sHtml) then
  begin
    {newText:=TIdText.Create(MailMessage.MessageParts,nil);
    newText.ContentType:='text/html';
    newText.Body.LoadFromFile(sHTML);}
    mmMsg.Lines.LoadFromFile(sHTML);
    MailMessage.SetBody(mmMsg.Lines);
    MailMessage.ContentType:='text/html';
  end;

{
   // Adiciona uma parte texto ao corpo
   newText := TIdText.Create(IdMessage.MessageParts,nil);
   newText.ContentType := 'text/plain';
   newText.Body.Add('Este email só será visualizado em padrão HTML');

   // Anexa a primeira imagem
   newAttach := TIdAttachment.Create(IdMessage.MessageParts,imgName1);
   newAttach.ContentType        := 'image/jpeg';
   newAttach.ContentDisposition := 'inline';
   newAttach.ExtraHeaders.Values['Content-ID'] := '<'+imgId1+'>';

   // Anexa a segunda imagem
   newAttach := TIdAttachment.Create(IdMessage.MessageParts,imgName2);
   newAttach.ContentType        := 'image/jpeg';
   newAttach.ContentDisposition := 'inline';
   newAttach.ExtraHeaders.Values['Content-ID'] := '<'+imgId2+'>';
}
end;

procedure TfrmEmail.btEnviarClick(Sender: TObject);
begin
 Enviar;
end;

function TfrmEmail.Enviar:Boolean;
begin
  SMTP.Port := strToInt(edPort.Text);
  SMTP.Host := edHost.Text;
  SMTP.Username := edUsuario.Text;
  SMTP.Password := edSenha.Text;
  MailMessage.SetBody(mmMsg.Lines);
  MailMessage.From.Address := edDe.Text;
  MailMessage.Recipients.EMailAddresses := edPara.Text;
  MailMessage.Subject := sSubject;
  try
   if not SMTP.Connected then
     SMTP.Connect(1000);
   SMTP.Send(MailMessage);
   Result := True;
  except on E:Exception do
    begin
     mmLog.Lines.Insert(0, 'ERROR: ' + E.Message) ;
     Result := false;
    end;
  end;
end;

{
procedure TForm1.Button1Click(Sender: TObject);
var
mailman: HCkMailMan;
success: Boolean;
email: HCkEmail;
contentType: PWideChar;
contentIdDude: PWideChar;
html: PWideChar;

begin
//  Create a MailMan for the purpose
//  of unlocking the component.
mailman := CkMailMan_Create();
success := CkMailMan_UnlockComponent(mailman,'anything for 30-day trial');

email := CkEmail_Create();

//  Adding attachments, HTML/plain-text bodies, etc can be done
//  in any order:

//  Add an attachment

contentType := CkEmail__addFileAttachment(email,'hamlet.zip');
if (Length(contentType) = 0 ) then
  begin
    Memo1.Lines.Add(CkEmail__lastErrorText(email));
    Exit;
  end;

//  Add some headers:
CkEmail_putSubject(email,'This is a complex email');
success := CkEmail_AddTo(email,'Chilkat Support','support@chilkatsoft.com');
CkEmail_putFrom(email,'Matt <matt@chilkatsoft.com>');

//  Add a plain-text body:
success := CkEmail_AddPlainTextAlternativeBody(email,'This is the plain-text body');

//  Add an image that will be embedded in the HTML body.
contentIdDude := CkEmail__addRelatedFile(email,'dude.gif');
if (Length(contentIdDude) = 0 ) then
  begin
    Memo1.Lines.Add(CkEmail__lastErrorText(email));
    Exit;
  end;
//  Update the CONTENT_ID_DUDE to the actual content ID when sending the email.
success := CkEmail_SetReplacePattern(email,'CONTENT_ID_DUDE',contentIdDude);

//  Add an HTML body:

html := '<html><body><b>This is the HTML body</b><br><img src="cid:CONTENT_ID_DUDE"></body></html>';

success := CkEmail_AddHtmlAlternativeBody(email,html);

//  Save the email as a .eml

success := CkEmail_SaveEml(email,'complex.eml');
if (success <> True) then
  begin
    Memo1.Lines.Add(CkEmail__lastErrorText(email));
  end
else
  begin
    Memo1.Lines.Add('Created email!');
  end;


CkMailMan_Dispose(mailman);
CkEmail_Dispose(email);

end;

}

end.
