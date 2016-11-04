program SAPInterface;

uses
  Forms,
  UDMDIG in '..\DM\UDMDIG.pas' {dmDIG: TDataModule},
  UDM in '..\DM\UDM.pas' {DM: TDataModule},
  UGeral in '..\GERAL\UGeral.pas',
  ufrmInterface in 'ufrmInterface.pas' {frmInterface},
  ufrmInterfaceFacsCount in 'ufrmInterfaceFacsCount.pas' {frmInterfaceFacsCount},
  ufrmInterfaceKX21 in 'ufrmInterfaceKX21.pas' {frmInterfaceKX21},
  ufrmInterfaceDEPARA in 'ufrmInterfaceDEPARA.pas' {frmInterfaceDePara},
  ufrmInterfaceAbacus in 'ufrmInterfaceAbacus.pas' {frmInterfaceAbacus},
  ufrmCadCD4 in '..\CADASTRO\ufrmCadCD4.pas' {frmCadCD4},
  UfrmCadPad in '..\PADRAO\UfrmCadPad.pas' {frmCadPad},
  UfrmCadBase in '..\PADRAO\UfrmCadBase.pas' {frmCadBase},
  uRelatorioWEB in '..\CADASTRO\uRelatorioWEB.pas' {frmRelatorioWEB},
  uFuncaoGrid in '..\GERAL\uFuncaoGrid.pas',
  UDMGERAL in '..\DM\UDMGERAL.pas' {DMGERAL: TDataModule},
  UGeralSQL in '..\GERAL\UGeralSQL.pas',
  UDMLab in '..\DM\UDMLab.pas' {dmLAB: TDataModule},
  ULogSQL in '..\DM\ULogSQL.pas' {frmLogSQL},
  ufrmInterfaceP80 in 'ufrmInterfaceP80.pas' {frmInterfaceP80},
  ufrmInterfaceXT8000 in 'ufrmInterfaceXT8000.pas' {frmInterfaceXT8000},
  ufrmInterfaceConfig in 'ufrmInterfaceConfig.pas' {frmInterfaceConfig},
  ufrmSenha in '..\GERAL\ufrmSenha.pas' {frmSenha},
  UfrmCadPadSG in '..\PADRAO\UfrmCadPadSG.pas' {frmCadPadSG};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TdmDIG, dmDIG);
  Application.CreateForm(TDMGERAL, DMGERAL);
  Application.CreateForm(TdmLAB, dmLAB);
  Application.CreateForm(TfrmInterfaceXT8000, frmInterfaceXT8000);
  {Application.CreateForm(TfrmInterface, frmInterface);
  Application.CreateForm(TfrmInterfaceP80, frmInterfaceP80);
  Application.CreateForm(TfrmInterfaceXT8000, frmInterfaceXT8000);
  Application.CreateForm(TfrmInterfaceFacsCount, frmInterfaceFacsCount);
  Application.CreateForm(TfrmInterfaceKX21, frmInterfaceKX21);
  Application.CreateForm(TfrmInterfaceDePara, frmInterfaceDePara);
  Application.CreateForm(TfrmInterfaceAbacus, frmInterfaceAbacus);
  Application.CreateForm(TfrmCadCD4, frmCadCD4);
  Application.CreateForm(TfrmInterfaceConfig, frmInterfaceConfig);
  Application.CreateForm(TfrmSenha, frmSenha);
  frmCadCD4.FormShow(Application);
  }Application.Run;
end.
