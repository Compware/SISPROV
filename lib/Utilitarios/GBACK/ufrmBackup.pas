unit ufrmBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, IBDatabase, DB, IBServices, ComCtrls,
  IBSQLMonitor, ZipMstr, IdMessage, IniFiles, ExtCtrls, Registry;

type
  TBackup = class(TForm)
    bkp: TIBBackupService;
    rst: TIBRestoreService;
    OpenDialog1: TOpenDialog;
    mmLog: TMemo;
    pb: TProgressBar;
    ZipMaster1: TZipMaster;
    Panel1: TPanel;
    btBackupFTP: TButton;
    rgTipoBackup: TRadioGroup;
    btRestaurar: TButton;
    dbConfig: TIBConfigService;
    procedure FormCreate(Sender: TObject);
    procedure btBackupFTPClick(Sender: TObject);
    procedure btRestaurarClick(Sender: TObject);
  private
    { Private declarations }
    FsDB:String;
    FsBK:String;
    FsBKZip:String;
    sServer:String;
    sDB:String;
    FirebirdDir: String;
    procedure Backup;
    //procedure CarregaIni;
    procedure EnviarEmail;
    procedure Compactar;
    procedure EnviarFTP;
    procedure GravarPendrive;
    procedure Restaurar;
    function extrairArquivo(nomeArquivo: string) : string;
    procedure EstadoControles(enabled : boolean);
    procedure ShutdownDB;
    procedure OnlineDB;
    function GetFirebirdDir: string;
  public
    { Public declarations }
  end;

var
  Backup: TBackup;

implementation

uses uEmail, UFTP, UGeral, UDM, UOpenDir;

{$R *.dfm}

procedure TBackup.Compactar;
var ext,name,nZip:string;
begin
  mmLog.Lines.Add('Compactar!');
  ext := ExtractFileExt(FsBK);
  name := FsBK;
  nZip := '_' + prmUnidade + '_' + FormatDateTime('ddmmyyhhnnss',Now) +'.zip'  ;

  //nZip := StringReplace(name,ext,FsBKZip,[]);
  FsBKZip := sPathTemp + ExtractFileName(name);
  FsBKZip := StringReplace(FsBKZip,ext,nZip,[]);
  ZipMaster1.ZipFileName := FsBKZip;
  ZipMaster1.FSpecArgs.Text := name;
  ZipMaster1.Add;
  mmLog.Lines.Add('Compactado! ' + FsBKZip);
  mmLog.Lines.SaveToFile(sPath+'\Log.txt');
end;

procedure TBackup.EnviarEmail;
begin
   frmEmail := TfrmEmail.Create(nil);
   try
     frmEmail.mmMsg.Lines.Clear;
     frmEmail.mmMsg.Lines.Add('Computer:' + NomeDoComputador);
     frmEmail.mmMsg.Lines.Add('Unidade:'  + prmUnidade);
     frmEmail.mmMsg.Lines.Add('Usuário:'  + sLogUsuario);
     frmEmail.mmMsg.Lines.Add('Sistema:'  + sLogSistema);
     frmEmail.mmMsg.Lines.Add('Local:'    + sPath);
     frmEmail.mmMsg.Lines.Add('Backup:' + FsBKZip);
     frmEmail.mmMsg.Lines.Add('**********************************');
     frmEmail.mmMsg.Lines.Add(mmLog.Lines.Text);
     frmEmail.sSubject := 'SIS - Backup';
     //if FileExists(FsBKZip) then
     //   TIdAttachment.Create(frmEmail.MailMessage.MessageParts, FsBKZip) ;
     if frmEmail.Enviar then
       DeleteFile(FsBKZip);
   finally
    frmEmail.mmMsg.Lines.SaveToFile(sPath+'\Log.txt');
    frmEmail.Free;
   end;
end;

{procedure TBackup.CarregaIni;
var ini:TiniFile; Arq:String;
begin
  Arq := ExtractFilePath(Application.ExeName) + 'ris.ini';
  ini := TIniFile.Create(Arq);
  FsDB := ini.ReadString('Geral','DB','');
  ini.Free;
end;}

procedure TBackup.Backup;
begin
  try
    FsBK := StringReplace(bkp.DatabaseName,'.GDB','.GBK',[]);
    bkp.ServerName := sServer;
    mmLog.Lines.Add('Conectando ao servidor: ' + sServer);
    bkp.Attach;

    if bkp.Active = true then
    begin
      bkp.BackupFile.Text := FsBK;
      bkp.DatabaseName := UpperCase(sDB);
      bkp.ServiceStart;
		
      while not bkp.Eof do
      begin
        Application.ProcessMessages;
        mmLog.Lines.Add(bkp.GetNextLine);

        if (pb.Position = pb.Max) then
          pb.Position := 0;

        pb.Position := pb.Position + 1;
      end;
      pb.Position := pb.Max;
    end
    else
    begin
      mmLog.Lines.Add('Não foi possível conectar ao servidor. Operação abortada.');
      Abort;
    end;
  finally
    if bkp.Active then
	    bkp.Detach;
    mmLog.Lines.SaveToFile(sPath+'\Log.txt');
  end;
end;

procedure TBackup.FormCreate(Sender: TObject);
begin
  //Parametros

  InicializaParametros;

  FirebirdDir := GetFirebirdDir;
  sPathTemp := sPath+'Temp\';

  if not DirectoryExists(sPathTemp) then
   MkDir(sPathTemp);

  FsDB := DM.DB.DatabaseName;

  // Disconecta o DM da base para não gerar erros
  DM.DB.Connected := False;

  sServer := 'localhost';
  sDB := FsDB;
  if pos(':',FsDB)>0 then
  begin
    sDB := Copy(FsDB,pos(':',FsDB)+1,Length(FsDB));
    sServer := Copy(FsDB,1,pos(':',FsDB)-1);
  end;

  pb.Min := 0;
  pb.Max := 5000;
  pb.Smooth := true;

end;

procedure TBackup.EnviarFTP;
begin
  try
    mmLog.Lines.Add('Enviando arquivo ' + FsBKZip + ' por FTP...');
    if frmFTP.EnviarFTP(FsBKZip) then
      mmLog.Lines.Add('Não foi possível enviar o arquivo por FTP')
    else
      mmLog.Lines.Add('Arquivo enviado por FTP');
  finally
    mmLog.Lines.SaveToFile(sPath+'\Log.txt');
  end;
end;

procedure TBackup.btBackupFTPClick(Sender: TObject);
begin
  EstadoControles(False);
  Backup;
  Compactar;
  case rgTipoBackup.ItemIndex of
    0: GravarPendrive;
    1: begin
        EnviarFTP;
        EnviarEmail;
       end;
    2: begin
        GravarPendrive;
        EnviarFTP;
        EnviarEmail;
      end;
  end;
  mmLog.Lines.Add('');
  mmLog.Lines.Add('Operação finalizada');
  mmLog.Lines.SaveToFile(sPath+'\Log.txt');
  EstadoControles(True);
  //Application.Terminate;
end;

procedure TBackup.EstadoControles(enabled: boolean);
begin
  btBackupFTP.Enabled := enabled;
  btRestaurar.Enabled := enabled;
  rgTipoBackup.Enabled := enabled;
end;

procedure TBackup.GravarPendrive;
var
  dir: string;
  arquivoPara: string;
begin
  try
    mmLog.Lines.Add('');
    mmLog.Lines.Add('Gravando no Pendrive');
    if PegaDiretorio(dir) then
    begin
      arquivoPara := dir + ExtractFileName(FsBKZip);
      if CopyFile(PChar(FsBKZip), PChar(arquivoPara), false) then
        mmLog.Lines.Add('Arquivo copiado para ' + arquivoPara)
      else
        mmLog.Lines.Add('Erro ao copiar arquivo para ' + arquivoPara);
    end
    else
      mmLog.Lines.Add('Operação cancelada pelo usuário');
  finally
    mmLog.Lines.SaveToFile(sPath+'\Log.txt');
  end;
end;

procedure TBackup.Restaurar;
var
  arquivoRestaura, extensao, caminhoTemp: string;
begin
  try
    if OpenDialog1.Execute then
    begin
      arquivoRestaura := OpenDialog1.FileName;
      extensao := UpperCase(ExtractFileExt(arquivoRestaura));

      if (extensao = '.ZIP') or (extensao = '.GBK') then
      begin
        if extensao = '.ZIP' then
        begin
          arquivoRestaura := extrairArquivo(arquivoRestaura); // retorna nome do arquivo extraido ou -1 se erro
          if arquivoRestaura = '-1' then
            Exit;

          extensao := UpperCase(ExtractFileExt(arquivoRestaura));
        end;

        if extensao <> '.GBK' then
        begin
          mmLog.Lines.Add('Formato de arquivo não suportado');
          Exit;
        end;

        mmLog.Lines.Add('');
        mmLog.Lines.Add('Iniciando restauração');
        mmLog.Lines.Add('Arquivo: ' + arquivoRestaura);
        mmLog.Lines.Add('Nome servidor: '+ sServer);
        mmLog.Lines.Add('Nome Banco: '+ UpperCase(sDB));
        mmLog.Lines.Add('');

        // move o arquivo .gbk para uma pasta TEMP, isso evita erros do
        // firebird fazer a restauração

        caminhoTemp := GetEnvironmentVariable('TEMP')+'\restauracao.GBK';
        CopyFile(Pchar(arquivoRestaura), PChar(caminhoTemp), False);

        // resolver problema onde o banco nao permite restaurar arquivos que
        // que estao salvos em certas pastas
        // utilizar o dbConfig para dar shutdown na base
        //dbConfig.ShutdownDatabase(Forced, 0);
        mmLog.Lines.Add('Desativando a base...');
        try
          OnlineDB;
          Sleep(2000);
          ShutdownDB;
          Sleep(2000);
        except
        end;

        rst.ServerName := sServer;

        try
          rst.Attach;
          if rst.Active = true then
          begin
            //rst.BackupFile.Text := arquivoRestaura;
            rst.BackupFile.Text := caminhoTemp;
            rst.DatabaseName.Text := UpperCase(sDB);
            rst.ServiceStart;
            
            while not rst.Eof do
            begin
              Application.ProcessMessages;
              mmLog.Lines.Add(rst.GetNextLine);

              if (pb.Position = pb.Max) then
                pb.Position := 0;
              pb.Position := pb.Position + 1;
            end;
            pb.Position := pb.Max;

            try
              OnlineDB;
            except
            end;
            mmLog.Lines.Add('Restauração finalizada!');
          end
          else
          begin
            mmLog.Lines.Add('Não foi possível conectar ao servidor. Operação abortada.');
            Abort;
          end;
        except
          on E: Exception do
            mmLog.Lines.Add('Erro: ' + E.Message);
        end;
      end
      else
        mmLog.Lines.Add('Formato de arquivo não suportado');
    end;
  finally
    if rst.Active then
      rst.Detach;
    mmLog.Lines.SaveToFile(sPath+'\Log.txt');
  end;
end;

procedure TBackup.btRestaurarClick(Sender: TObject);
begin
  EstadoControles(false);

  try
    if FirebirdDir = '' then
    begin
      mmLog.Lines.Add('Não foi possível encontrar a pasta de instalação do Firebird');
      Exit;
    end;

    Restaurar;
  finally
    EstadoControles(true);
    mmLog.Lines.SaveToFile(sPath+'\Log.txt');
  end;
end;

function TBackup.extrairArquivo(nomeArquivo: string): string;
var
  dirEntry : TZMDirEntry;
  i, nArquivos : integer;
  nomeExtracao : string;
begin
  mmLog.Lines.Add('');
  mmLog.Lines.Add('Extraindo arquivo '+ nomeArquivo);
  ZipMaster1.ZipFileName := nomearquivo;
  nArquivos := 0;
  for i := 0 to ZipMaster1.Count-1 do
  begin
    dirEntry := ZipMaster1.DirEntry[i];
    if UpperCase(ExtractFileExt(dirEntry.FileName)) = '.GBK' then
    begin
      Inc(nArquivos);
      nomeExtracao := dirEntry.FileName;
    end;
  end;

  if nArquivos = 0 then
  begin
    mmLog.Lines.Add('Erro: Nenhum arquivo de backup encontrado no .zip');
    result := '-1';
  end
  else if nArquivos > 1 then
  begin
    mmLog.Lines.Add('Erro: mais do que um arquivo de backup encontrado no .zip');
    Result := '-1';
  end
  else
  begin
    ZipMaster1.ExtrBaseDir := sPathTemp;
    ZipMaster1.FSpecArgs.Text := nomeExtracao;
    if ZipMaster1.Extract = 0 then
    begin
      mmLog.Lines.Add('Arquivo extraido '+ sPathTemp + nomeExtracao);
      Result := sPathTemp + nomeExtracao;
    end
    else
    begin
      mmLog.Lines.Add('Erro ao extrair arquivo');
      Result := '-1';
    end;
  end;
end;

function TBackup.GetFirebirdDir: string;
var
  lReg : TRegistry;
  lStr : String;
begin
  lReg := TRegistry.Create;
  Try
    lReg.RootKey := HKEY_LOCAL_MACHINE;
    If lReg.OpenKey('Software\Firebird Project\Firebird Server\Instances', False) Then
      lStr := lReg.ReadString('DefaultInstance');
    lReg.CloseKey;
    Result := lStr;
  Finally
    FreeAndNil(lReg);
  End;
end;

procedure TBackup.OnlineDB;
var
  parametros, comando: String;
begin
  parametros := '-online "'+ sDB+ '" -user sysdba -pass masterkey';
  comando := '"'+FirebirdDir+'\bin\gfix.exe" ' + parametros;
  WinExec(PChar(comando), SW_HIDE);
  //mmLog.Lines.Add(comando);
end;

procedure TBackup.ShutdownDB;
var
  parametros, comando: String;
begin
  parametros := '-shut -force 0 "'+ sDB+ '" -user sysdba -pass masterkey';
  comando := '"'+FirebirdDir+'\bin\gfix.exe" ' + parametros;
  WinExec(PChar(comando), SW_HIDE);
  //mmLog.Lines.Add(comando);
end;

end.
