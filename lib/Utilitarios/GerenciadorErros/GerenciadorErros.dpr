program GerenciadorErros;

uses
  Forms,
  UfrmGerenciadorErros in 'UfrmGerenciadorErros.pas' {frmGerenciadorErros},
  UIMAPGetUID in 'UIMAPGetUID.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGerenciadorErros, frmGerenciadorErros);
  Application.Run;
end.
