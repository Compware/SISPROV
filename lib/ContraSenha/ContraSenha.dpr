program ContraSenha;

uses
  Forms,
  uContraSenha in 'uContraSenha.pas' {frmContraSenha},
  uFuncaoContraSenha in 'uFuncaoContraSenha.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmContraSenha, frmContraSenha);
  Application.Run;
end.
