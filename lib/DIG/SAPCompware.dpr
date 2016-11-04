program SAPCompware;

uses
  Forms,
  Controls,
  System,
  Windows,
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
  ufrmCadGrupoDoc in 'ufrmCadGrupoDoc.pas' {frmCadGrupoDoc: Unit1},
  ufrmCadModelo in 'ufrmCadModelo.pas' {frmCadModelo},
  ufrmDlgInfoDoc in 'ufrmDlgInfoDoc.pas' {frmDlgInfoDoc},
  uFramePaciente in '..\CADASTRO\uFramePaciente.pas' {framPaciente: TFrame},
  UfrmLogin in '..\GERAL\UfrmLogin.pas' {frmLogin},
  ufrmDlgStatus in 'ufrmDlgStatus.pas' {frmDlgStatus},
  ufrmConvertePDF in 'ufrmConvertePDF.pas' {frmConvertePDF},
  UDMLab in '..\DM\UDMLab.pas' {dmLAB: TDataModule},
  ULogSQL in '..\DM\ULogSQL.pas' {frmLogSQL},
  uFrameMAPA in '..\CADASTRO\uFrameMAPA.pas' {framMapaMedico: TFrame},
  uFrameFicha1 in '..\CADASTRO\uFrameFicha1.pas' {framFicha1: TFrame},
  uFrameFicha2 in '..\CADASTRO\uFrameFicha2.pas' {framFicha2: TFrame},
  uFrameFicha3 in '..\CADASTRO\uFrameFicha3.pas' {framFicha3: TFrame},
  uFrameFicha4 in '..\CADASTRO\uFrameFicha4.pas' {framFicha4: TFrame},
  uCadCID10 in '..\CADASTRO\uCadCID10.pas' {frmCID10},
  UConPad in '..\CADASTRO\UConPad.pas' {frmConPad},
  UfrmConProdutividadeMedico in 'UfrmConProdutividadeMedico.pas' {frmConProdutividadeMedico},
  UfrmFiltroProdutividade in 'UfrmFiltroProdutividade.pas' {frmFiltroProdutividade},
  UfrmConEsquemaTotal in 'UfrmConEsquemaTotal.pas' {frmConEsquemaTotal},
  UfrmFiltroEsquemaTotal in 'UfrmFiltroEsquemaTotal.pas' {frmFiltroEsquemaTotal},
  UfrmConEsquemaProcessoTotal in 'UfrmConEsquemaProcessoTotal.pas' {frmConEsquemaProcessoTotal},
  UfrmFiltroEsquemaProcessoTotal in 'UfrmFiltroEsquemaProcessoTotal.pas' {frmFiltroEsquemaProcessoTotal},
  UfrmRelTransferencia in '..\CADASTRO\UfrmRelTransferencia.pas' {frmRelTransferencia},
  uCadNotificacao in '..\CADASTRO\uCadNotificacao.pas' {frmCadNotificacao};

{$R *.res}

Var
  SAP: THandle;
  SIS: THandle;
  DIGC: THandle;
  
begin

  SAP:= CreateMutex(nil, false, 'SAPCompware');
  if WaitForSingleObject(SAP, 0) = wait_Timeout then
    begin
      Application.MessageBox('Atenção o SAP já está aberto!.','Atenção',MB_ICONINFORMATION);;
      Exit;
    end;

  SIS:= CreateMutex(nil, false, 'SISCompware');
  if WaitForSingleObject(SIS, 0) = wait_Timeout then
    begin
      Application.MessageBox('Atenção o SIS já está aberto!.','Atenção',MB_ICONINFORMATION);;
      Exit;
    end;

  DIGC:= CreateMutex(nil, false, 'DIGCompware');
  if WaitForSingleObject(DIGC, 0) = wait_Timeout then
    begin
      Application.MessageBox('Atenção o DIG já está aberto!.','Atenção',MB_ICONINFORMATION);;
      Exit;
    end;

  CloseHandle(SIS);
  CloseHandle(DIGC);

  Application.Initialize;
  Application.HelpFile := 'SAP';
  Application.Title := 'SAP Compware';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMGeral, DMGeral);
  Application.CreateForm(TdmDIG, dmDIG);
  Application.CreateForm(TdmLAB, dmLAB);
  frmLogin := TfrmLogin.Create(Application);
  frmLogin.Caption := 'SAP - Compware Informática';
  frmLogin.ShowModal;

  Application.CreateForm(TfrmProcessoUtente, frmProcessoUtente);
  Application.CreateForm(TfrmDlgStatus, frmDlgStatus);

  Application.Run;
end.
