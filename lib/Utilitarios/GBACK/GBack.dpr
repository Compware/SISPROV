program GBack;

uses
  Forms,
  ufrmBackup in 'ufrmBackup.pas' {Backup},
  uEmail in 'Q:\lib\email\uEmail.pas' {frmEmail},
  uMySqlFTP in 'Q:\lib\ftp\uMySqlFTP.pas' {frmMySqlFTP},
  UFTP in 'Q:\lib\ftp\UFTP.pas' {frmFTP},
  UDM in 'Q:\lib\DM\UDM.pas' {DM: TDataModule},
  UGeral in 'Q:\lib\GERAL\UGeral.pas',
  UOpenDir in 'Q:\lib\GERAL\UOpenDir.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TDM, DM);
  Application.CreateForm(TBackup, Backup);
  // Application.CreateForm(TfrmEmail, frmEmail);
  Application.CreateForm(TfrmMySqlFTP, frmMySqlFTP);
  Application.CreateForm(TfrmFTP, frmFTP);

  Application.Run;
end.
