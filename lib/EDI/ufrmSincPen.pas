unit ufrmSincPen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngextra, StdCtrls, FileCtrl, ComCtrls, jpeg, ExtCtrls, iniFiles;

type
  TfrmSincPen = class(TForm)
    Label1: TLabel;
    DriveComboBox1: TDriveComboBox;
    pb: TProgressBar;
    btSinc: TPNGButton;
    procedure btSincClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmSincPen: TfrmSincPen;

implementation

uses ufrmImpExp;

{$R *.dfm}

function ValidaDiretorio(sDir:string):boolean;
var i:integer; sAux:string;
begin
  sAux := '';
  for i:=1 to length(sDir) do
  begin
    sAux := sAux + sDir[i];
    if (sDir[i]='\')or(i=length(sDir)) then
     if not DirectoryExists(sAux) then
        mkDir(sAux);
  end;
end;

procedure TfrmSincPen.btSincClick(Sender: TObject);
var sUnidade,sI,sO,sArq:String; i:integer; ini:TiniFile;
begin
  try
    sUnidade := prmUnidade;
    sI := sPathIn;
    sO := sPathOut;
    sArq := DriveComboBox1.Drive + ':\' + 'edi.ini';
    if not FileExists(sArq) then
    begin
      ShowMessage('Este PENDRIVE deve ser preparado para Sincronização!'+chr(13)+
                  'Você deve enviar dados para PENDRIVE através do Sistema SIS.');
      Exit;
    end;
    sPathIn := DriveComboBox1.Drive + ':\Compware\EDI\In\';
    ValidaDiretorio(sPathIn);
    sPathOut := DriveComboBox1.Drive + ':\Compware\EDI\Out\';
    ini := TIniFile.Create(sArq);
    prmUnidade := ini.ReadString('EDI','Unidade',sUnidade);
    ini.Free;
    frmImpExp.Receber1Click(Sender);
    frmImpExp.Enviar1Click(Sender);
    ShowMessage('Sincronizacao concluida com sucesso!');
  finally
    prmUnidade := sUnidade;
    sPathIn := sI;
    sPathOut := sO;
  end;
end;

end.
