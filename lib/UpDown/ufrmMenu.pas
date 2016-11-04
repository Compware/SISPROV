unit ufrmMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtrls, CHILKATUPLOADLib_TLB, CHILKATHTTPLib_TLB, Grids,
  DBGrids, Db, DBClient, SHDocVw, ExtCtrls, ImgList, Menus, ComCtrls,
  RXCtrls, jpeg, DBLocal, DBLocalI, FileCtrl, shellApi;

type
  TfrmMenuEDI = class(TForm)
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    RxLabel1: TRxLabel;
    pbGeral: TProgressBar;
    PopupMenu1: TPopupMenu;
    Enviar1: TMenuItem;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    FileListBox1: TFileListBox;
    procedure Enviar1Click(Sender: TObject);
  private
    { Private declarations }
    function EnviarArquivo(sFName:String):string;
  public
    { Public declarations }
  end;

var
  frmMenuEDI: TfrmMenuEDI;

implementation

{$R *.DFM}

function TfrmMenuEDI.EnviarArquivo(sFName:String):string;
var
  upload: TChilkatUpload;
  success: integer;
begin
  upload := TChilkatUpload.Create(Self);
  //  Specify the page (ASP, ASP.NET, Perl, Python, Ruby, CGI, etc)
  //  that will process the HTTP Upload.
  upload.Hostname := 'www.vertrou.info';
  upload.Path := '/edi/dados/ReceiveUpload.aspx';
  upload.Login := 'vertrou';
  upload.Password := 'lilian';

  //  Add one or more files to be uploaded.
  upload.AddFileReference('file1', sFName);

  //  Do the upload.  The method returns when the upload
  //  is completed.
  //  This component also includes asynchronous upload capability,
  //  which is demonstrated in another example.
  success := upload.BlockingUpload();
  if (success <> 1) then
  begin
    frmMenuEDI.StatusBar1.Panels[2].Text := upload.LastErrorText;
    Result := 'Erro';
  end
  else
  begin
    frmMenuEDI.StatusBar1.Panels[2].Text := 'Arquivo enviado com sucesso!';
    Result := 'OK';
  end;
end;

procedure TfrmMenuEDI.Enviar1Click(Sender: TObject);
var i:integer; rs, fn, fnl:string;
begin
   if OpenDialog1.Execute then
   begin
     FileListBox1.Directory := ExtractFilePath(OpenDialog1.FileName);
     fnl := FileListBox1.Directory+'\Lista.log';
     if FileExists(fnl) then
       memo1.Lines.LoadFromFile(fnl);
     for i:=0 to FileListBox1.Count-1 do
     begin
       fn := FileListBox1.Items[i];
       if (fn <> fnl) then
       begin
         if memo1.Lines.IndexOf(fn)=-1 then
         begin
           rs := EnviarArquivo(fn);
           if rs = 'OK' then
           begin
             memo1.Lines.Add(fn);
             memo1.Lines.SaveToFile(fnl);
           end;
         end;
       end;
     end;
   end;
end;


end.

