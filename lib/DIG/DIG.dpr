program DIG;

uses
  Forms,
  Controls,
  System,
  Windows,
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
  ufrmDigitalizar in 'ufrmDigitalizar.pas' {frmDigitalizar},
  UfrmLocPad in '..\PADRAO\UfrmLocPad.pas' {frmLocPad},
  UfrmLocalizar in '..\GERAL\UfrmLocalizar.pas' {frmLocalizar},
  ufrmEditor in 'ufrmEditor.pas' {frmEditor},
  ufrmCadGrupoDoc in 'ufrmCadGrupoDoc.pas' {frmCadGrupoDoc},
  ufrmCadModelo in 'ufrmCadModelo.pas' {frmCadModelo},
  ufrmDlgInfoDoc in 'ufrmDlgInfoDoc.pas' {frmDlgInfoDoc},
  uframeDigPaciente in 'uframeDigPaciente.pas' {framPaciente: TFrame},
  ufrmCadProcesso in 'ufrmCadProcesso.pas' {frmCadProcesso},
  ufrmDlgStatus in 'ufrmDlgStatus.pas' {frmDlgStatus},
  ufrmInfoEstat in 'ufrmInfoEstat.pas' {frmInfoEstat},
  ufrmProcessoDigital in 'ufrmProcessoDigital.pas' {frmProcessoDigital},
  ufrmConvertePDF_JPG in 'ufrmConvertePDF_JPG.pas' {frmConverterPDF_JPG},
  UDMLab in '..\DM\UDMLab.pas' {dmLAB: TDataModule};

{$R *.res}

Var
  DIGC: THandle;
  SAP: THandle;
  SIS: THandle;

begin

  DIGC:= CreateMutex(nil, false, 'DIGCompware');
  if WaitForSingleObject(DIGC, 0) = wait_Timeout then
    begin
      Application.MessageBox('Atenção o DIG já está aberto!.','Atenção',MB_ICONINFORMATION);;
      Exit;
    end;

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

  CloseHandle(SAP);
  CloseHandle(SIS);

  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TdmDIG, dmDIG);
  Application.CreateForm(TdmLAB, dmLAB);
  Application.CreateForm(TfrmProcessoDigital, frmProcessoDigital);
  Application.CreateForm(TfrmDigitalizar, frmDigitalizar);
  Application.CreateForm(TfrmDlgStatus, frmDlgStatus);
  Application.Run;
end.
