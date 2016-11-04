program MetaDados;

uses
  Forms,
  ufrmUpdate in 'ufrmUpdate.pas' {frmUpdate},
  uScripts in '..\CADASTRO\uScripts.pas',
  uMetaDados in '..\CADASTRO\uMetaDados.pas' {frmMetaDados},
  uConstanteScript in '..\CADASTRO\uConstanteScript.pas',
  UDM in '..\DM\UDM.pas' {DM: TDataModule},
  UDMGERAL in '..\DM\UDMGERAL.pas' {DMGERAL: TDataModule},
  uFuncoesWeb in '..\GERAL\uFuncoesWeb.pas',
  uScripts_55 in 'uScripts_55.pas',
  uEmail in '..\email\uEmail.pas' {frmEmail},
  UGeral in '..\GERAL\UGeral.pas',
  UGeralSQL in '..\GERAL\UGeralSQL.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMGERAL, DMGERAL);
  Application.CreateForm(TfrmUpdate, frmUpdate);
  Application.CreateForm(TfrmMetaDados, frmMetaDados);
  Application.Run;
end.
