unit ufrmEDI_Pen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngextra, StdCtrls, FileCtrl, ComCtrls, jpeg, ExtCtrls, iniFiles;

type
  TfrmEDI_Pen = class(TForm)
    Label1: TLabel;
    DriveComboBox1: TDriveComboBox;
    btReceber: TPNGButton;
    btEnviar: TPNGButton;
    pb: TProgressBar;
    procedure btEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btReceberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EnviarArquivoPen(sDir:String);
    procedure CopiarArquivoPen(sDir:String);
  end;

var
  frmEDI_Pen: TfrmEDI_Pen;

implementation

uses ufrmEDI, UGeral, ufrmMenuEDI;

{$R *.dfm}

procedure TfrmEDI_Pen.EnviarArquivoPen(sDir:String);
var i:Integer; sNome,sNomeTo,sNomePen,sPath:string;    fl:TFileListBox;
begin
  fl := TFileListBox.Create(Application);
  try
    fl.Parent := self;
    fl.Directory := sPathOut;
    pb.Max := fl.Items.Count;
    for i := fl.Items.Count-1 downto 0 do
    begin
      pb.Position := i;
      sNome := fl.Items[i];
      sNomeTo := StringReplace(sNome,'.xml','.bkp',[]);
      sNomePen := sDir + '\' + ExtractFileName(sNome);
      sPath := sPathOut + FormatDateTime('ddmmyy',date) + '\';
      if not DirectoryExists(sPath) then
         CreateDir(sPath);
      sNomeTo := sPath + ExtractFileName(sNomeTo);
      if CopyFile(pchar(sNome),pchar(sNomePen),False) then
      begin
        //Rename
        MoveFile(pchar(sNome), pchar(sNomeTo));
      end;
    end;
    ShowMessage('Arquivos Enviados com Sucesso!');
    pb.Position := 0;
  finally
    FreeAndNil(fl);
  end;
end;

procedure TfrmEDI_Pen.btEnviarClick(Sender: TObject);
var sDir,sFile,sArq:String; i:integer; ini:TiniFile;
begin
  sDir := DriveComboBox1.Drive + ':\Compware\EDI\Out';
  ValidaDiretorio(sDir);
  frmEDI.btExportarClick(Sender);
  EnviarArquivoPen(sDir);

  sArq := DriveComboBox1.Drive + ':\' + 'edi.ini';
  ini := TIniFile.Create(sArq);
  ini.WriteString('EDI','Unidade',prmUnidade);
  ini.Free;

  sFile := ExtractFilePath(Application.ExeName)+'\SincPen.exe';
  sArq := DriveComboBox1.Drive + ':\SincPen.exe';
  CopyFile(pchar(sFile),pchar(sArq),false);
end;

procedure TfrmEDI_Pen.FormCreate(Sender: TObject);
begin
  frmMenuEdi := TfrmMenuEdi.Create(self);
  frmEDI := TfrmEDI.Create(self);
end;

procedure TfrmEDI_Pen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMenuEdi.Free;
  frmEDI.Free;
end;

procedure TfrmEDI_Pen.btReceberClick(Sender: TObject);
var sDir,sFile:String; i:integer;
begin
  sDir := DriveComboBox1.Drive + ':\Compware\EDI\In';
  if DirectoryExists(sDir) then
  begin
    CopiarArquivoPen(sDir);
    frmEDI.btImportarClick(Sender);
  end;
end;

procedure TfrmEDI_Pen.CopiarArquivoPen(sDir:String);
var i:Integer; sNome,sNomeTo,sNomePen,sPath:string;    fl:TFileListBox;
begin
  fl := TFileListBox.Create(Application);
  try
    fl.Parent := self;
    fl.Directory := sDir;
    pb.Max := fl.Items.Count;
    for i := fl.Items.Count-1 downto 0 do
    begin
      pb.Position := i;
      sNome := fl.Items[i];
      sNomeTo := StringReplace(sNome,'.xml','.bkp',[]);
      sNomePen := sDir + '\' + ExtractFileName(sNome);
      sPath := sDir + '\' + FormatDateTime('ddmmyy',date) + '\';
      if not DirectoryExists(sPath) then
         CreateDir(sPath);
      sNomeTo := sPath + ExtractFileName(sNomeTo);
      sNome := sPathIn + sNome;
      if CopyFile(pchar(sNomePen),pchar(sNome),False) then
      begin
        //Rename
        MoveFile(pchar(sNomePen), pchar(sNomeTo));
      end;
    end;
    ShowMessage('Arquivos Recebidos com Sucesso!');
    pb.Position := 0;
  finally
    FreeAndNil(fl);
  end;
end;

end.
