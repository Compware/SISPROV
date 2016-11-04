program SISCompware;

uses
  ExcMagicGUI,
  Forms,
  Controls,
  System,
  Windows,
  uGeral,
  udm,
  udmGeral,
  UfrmStatus,
  UfrmAdminPermissao in '..\GERAL\UfrmAdminPermissao.pas' {frmAdminPermissao},
  UfrmLogin in '..\GERAL\UfrmLogin.pas' {frmLogin},
  uCadParametro in '..\CADASTRO\uCadParametro.pas' {frmCadParametro},
  UMenuPrin in '..\MENUPRINCIPAL\UMenuPrin.pas' {frmMenuPrin},
  ufrmGridFilter in '..\temp\ufrmGridFilter.pas' {frmGridFilter},
  ufrmCorrecao1 in '..\Utilitarios\ufrmCorrecao1.pas' {frmCorrecao1},
  ufrmCorrecao2 in '..\Utilitarios\ufrmCorrecao2.pas' {frmCorrecao2},
  ufrmCorrecao3 in '..\Utilitarios\ufrmCorrecao3.pas' {frmCorrecao3};

{$R *.res}

var
  int:Integer;
  sVersao:string;
  SIS: THandle;
  SAP: THandle;
  DIGC: THandle;

begin

  SIS:= CreateMutex(nil, false, 'SISCompware');
  if WaitForSingleObject(SIS, 0) = wait_Timeout then
    begin
      Application.MessageBox('Atenção o SIS já está aberto!.','Atenção',MB_ICONINFORMATION);;
      Exit;
    end;

  SAP:= CreateMutex(nil, false, 'SAPCompware');
  if WaitForSingleObject(SAP, 0) = wait_Timeout then
    begin
      Application.MessageBox('Atenção o SAP já está aberto!.','Atenção',MB_ICONINFORMATION);;
      Exit;
    end;

  DIGC:= CreateMutex(nil, false, 'DIGCompware');
  if WaitForSingleObject(DIGC, 0) = wait_Timeout then
    begin
      Application.MessageBox('Atenção o DIG já está aberto!.','Atenção',MB_ICONINFORMATION);;
      Exit;
    end;

  CloseHandle(SAP);
  CloseHandle(DIGC);

  Application.Initialize;
  Application.Title := 'SIS - Sistema de Informações da Saúde - VIH/SIDA';
  Application.HelpFile := '';
  DM := TDM.Create(Application);
  DMGeral := TDMGeral.Create(Application);
  Application.CreateForm(TfrmMenuPrin, frmMenuPrin);
  sVersao := sVersaoSistema+'-'+sRevisao;
  //Login
  frmLogin := TfrmLogin.Create(Application);
  //Status
  if frmLogin.ShowModal = mrok then
  begin
    sLogin := frmLogin.edUsu.Text;

    if (prmVersao <> sVersao) and (sLogin<>'ADMIN') then
    begin
      Application.MessageBox(
         PChar('Versão do Sistema '+sVersao+
               ' diferente da Versão do Banco '+prmVersao+'.'+chr(13)+
               'Por isto não será possível executar aplicação!'),
         PChar('Alerta!'));
      Application.Terminate;
    end;

    frmStatus:=TfrmStatus.Create(Application);
    frmStatus.Show;
    for Int := frmStatus.pbStatus.Min to frmStatus.pbStatus.Max do
    begin
      frmStatus.pbStatus.Position := Int;
      frmstatus.Update;
      frmStatus.lbStatus.caption:='Atualizando dados...';
    end;
    frmStatus.close;
  end
  else
    Application.Terminate;
  Application.Run;
end.
