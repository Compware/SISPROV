program SAP;

uses
  Forms,
  Controls,
  ufrmProcessoUtente in 'ufrmProcessoUtente.pas' {frmProcessoUtente},
  UDM in '..\DM\UDM.pas' {DM: TDataModule},
  UDMDIG in '..\DM\UDMDIG.pas' {dmDIG: TDataModule},
  uframArvore in 'uframArvore.pas' {framArvore: TFrame},
  UDMGERAL in '..\DM\UDMGERAL.pas' {DMGERAL: TDataModule},
  UGeral in '..\GERAL\UGeral.pas',
  UGeralSQL in '..\GERAL\UGeralSQL.pas',
  UfrmCadPad in '..\PADRAO\UfrmCadPad.pas' {frmCadPad},
  ufrmCadGrupoMod in 'ufrmCadGrupoMod.pas' {frmCadGrupoMod},
  UfrmCadBase in '..\PADRAO\UfrmCadBase.pas' {frmCadBase},
  uRelatorioWEB in '..\CADASTRO\uRelatorioWEB.pas' {frmRelatorioWEB},
  uFuncaoGrid in '..\GERAL\uFuncaoGrid.pas',
  UfrmLocPad in '..\PADRAO\UfrmLocPad.pas' {frmLocPad},
  UfrmLocalizar in '..\GERAL\UfrmLocalizar.pas' {frmLocalizar},
  ufrmEditor in 'ufrmEditor.pas' {frmEditor},
  ufrmCadGrupoDoc in 'ufrmCadGrupoDoc.pas' {frmCadGrupoDoc},
  ufrmCadModelo in 'ufrmCadModelo.pas' {frmCadModelo},
  ufrmDlgInfoDoc in 'ufrmDlgInfoDoc.pas' {frmDlgInfoDoc},
  uFramePaciente in '..\CADASTRO\uFramePaciente.pas' {framPaciente: TFrame},
  UfrmLogin in '..\GERAL\UfrmLogin.pas' {frmLogin},
  ufrmDlgStatus in 'ufrmDlgStatus.pas' {frmDlgStatus},
  ufrmConvertePDF in 'ufrmConvertePDF.pas' {frmConvertePDF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMGeral, DMGeral);
  Application.CreateForm(TdmDIG, dmDIG);
  frmLogin := TfrmLogin.Create(Application);
  frmLogin.Caption := 'SAP - Compware Informática';
  frmLogin.ShowModal;
  Application.CreateForm(TfrmProcessoUtente, frmProcessoUtente);
  Application.CreateForm(TfrmDlgStatus, frmDlgStatus);
  Application.CreateForm(TfrmConvertePDF, frmConvertePDF);
  Application.Run;
end.
