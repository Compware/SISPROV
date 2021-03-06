program EDI;

uses
  ExcMagicGUI,
  Forms,
  ufrmMenuEDI in '..\EDI\ufrmMenuEDI.pas' {frmMenuEDI},
  UDM in '..\DM\UDM.pas' {DM: TDataModule},
  UGeral in '..\GERAL\UGeral.pas',
  UDMGERAL in '..\DM\UDMGERAL.pas' {DMGERAL: TDataModule},
  UGeralSQL in '..\GERAL\UGeralSQL.pas',
  uConstanteScript in '..\CADASTRO\uConstanteScript.pas',
  ufrmSQLWeb in '..\EDI\ufrmSQLWeb.pas' {frmSQL},
  ULogSQL in '..\DM\ULogSQL.pas' {frmLogSQL},
  uEmail in '..\email\uEmail.pas' {frmEmail},
  uRelatorioWEB in '..\CADASTRO\uRelatorioWEB.pas' {frmRelatorioWEB},
  ufrmProtocoloEnvio in '..\CADASTRO\ufrmProtocoloEnvio.pas' {frmProtocoloEnvio},
  ufrmDePara in '..\EDI\ufrmDePara.pas' {frmDePara},
  ufrmEDI in '..\EDI\ufrmEDI.pas' {frmEDI},
  uFuncoesWeb in '..\GERAL\uFuncoesWeb.pas',
  EDI_TLB in 'EDI_TLB.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'EDI - Data Interchange';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMGERAL, DMGERAL);
  Application.CreateForm(TfrmMenuEDI, frmMenuEDI);
  Application.CreateForm(TfrmSQL, frmSQL);
  Application.CreateForm(TfrmLogSQL, frmLogSQL);
  Application.CreateForm(TfrmRelatorioWEB, frmRelatorioWEB);
  Application.CreateForm(TfrmDePara, frmDePara);
  Application.CreateForm(TfrmEDI, frmEDI);
  Application.Run;
end.
