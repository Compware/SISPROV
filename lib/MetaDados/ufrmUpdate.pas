unit ufrmUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, CHILKATUPLOADLib_TLB, CHILKATHTTPLib_TLB,
  DB, IBCustomDataSet;

type
  TfrmUpdate = class(TForm)
    Label1: TLabel;
    lbVersao: TLabel;
    btUpdate: TButton;
    ProgressBar1: TProgressBar;
    lbVersaoAtual: TLabel;
    bt21026: TButton;
    Memo1: TMemo;
    bt21027: TButton;
    IB: TIBDataSet;
    bt21028: TButton;
    bt21029: TButton;
    bt21030: TButton;
    bt21031: TButton;
    bt21032: TButton;
    bt21033: TButton;
    bt21034: TButton;
    bt21035: TButton;
    procedure btUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt21026Click(Sender: TObject);
    procedure bt21027Click(Sender: TObject);
    procedure bt21028Click(Sender: TObject);
    procedure bt21029Click(Sender: TObject);
    procedure bt21030Click(Sender: TObject);
    procedure bt21031Click(Sender: TObject);
    procedure bt21032Click(Sender: TObject);
    procedure bt21033Click(Sender: TObject);
    procedure bt21034Click(Sender: TObject);
    procedure bt21035Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EnviarEmailLOG;
  end;

var
  frmUpdate: TfrmUpdate;

implementation

uses uMetaDados, UDMGERAL, UGeral, uFuncoesWeb, uScripts_55, UDM,
  UGeralSQL, uEmail;

{$R *.dfm}


procedure TfrmUpdate.btUpdateClick(Sender: TObject);
var i,x,z:integer; sVersaoAtual:string;
begin
  Update;
  frmUpdate.Repaint;
  Sleep(3000);

  sVersaoAtual := prmVersao;
  //Update Correcao
  //sVersaoAtual := '2.1.0-23';
  x := frmMetaDados.cbVersao.Items.IndexOf(sVersaoAtual) + 1;
  z := frmMetaDados.cbVersao.Items.IndexOf(lbVersao.Caption);
  ProgressBar1.Min := x;
  if x<=z then
  begin
    ProgressBar1.Max := z;
    for i:= x to z do
    begin
      Application.ProcessMessages;
      ProgressBar1.Position := i;
      frmMetaDados.cbVersao.ItemIndex := i;
      frmMetaDados.cbVersaoChange(sender);
      frmMetaDados.btTodosClick(sender);
    end;
  end;

  //Aqui atualiza a versao no MySQL WEB apos fazer Updates.
  Get(sDominio + '/dbUnidade.php?op=G&versao=' + lbVersao.Caption
               + '&unidade=' + prmUnidade);

  Application.Terminate;
end;

procedure TfrmUpdate.FormCreate(Sender: TObject);
begin
  lbVersaoAtual.Caption := prmVersao;
end;

procedure TfrmUpdate.FormShow(Sender: TObject);
begin
  sLogComputer := NomeDoComputador;
  sLogUnidade  := SelectNomeUnidadeParametro;
  sLogUsuario  := DM.qyLoginCD_USUARIO.AsString + '-' +
    DM.qyLoginNM_USUARIO.AsString;
  sLogSistema  := Application.Name;

  //btUpdateClick(sender);
  //bt21026Click(sender);
  //bt21027Click(sender);
  //bt21028Click(sender);
  //bt21029Click(sender);
  //Application.Terminate;
end;

procedure TfrmUpdate.bt21026Click(Sender: TObject);
var sTMP:string;
begin


try
  sTMP := cvDROP_MAPA_LAB+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_LAB_PACIENTE+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTAGEM+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTAGEM_PACIENTE+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTE_RAPIDO+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTE_RAPIDO_PACIENTE+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_MEDICO+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_MEDICO_LINHA+'_TMP';
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_LAB,
   'MAPA_LAB','MAPA_LAB_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_LAB_PACIENTE,
   'MAPA_LAB_PACIENTE','MAPA_LAB_PACIENTE_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_TESTAGEM,
   'MAPA_TESTAGEM','MAPA_TESTAGEM_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_TESTAGEM_PACIENTE,
   'MAPA_TESTAGEM_PACIENTE','MAPA_TESTAGEM_PACIENTE_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_TESTE_RAPIDO,
   'MAPA_TESTE_RAPIDO','MAPA_TESTE_RAPIDO_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_TESTE_RAPIDO_PACIENTE,
   'MAPA_TESTE_RAPIDO_PACIENTE','MAPA_TESTE_RAPIDO_PACIENTE_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_MEDICO,
   'MAPA_MEDICO','MAPA_MEDICO_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := StringReplace(cvCREATE_MAPA_MEDICO_LINHA,
   'MAPA_MEDICO_LINHA','MAPA_MEDICO_LINHA_TMP',[]);
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  dm.DB.Close; dm.DB.Open; dm.TS.Active := true;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_MEDICO','MAPA_MEDICO_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_MEDICO_LINHA','MAPA_MEDICO_LINHA_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTAGEM','MAPA_TESTAGEM_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTAGEM_PACIENTE','MAPA_TESTAGEM_PACIENTE_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTE_RAPIDO','MAPA_TESTE_RAPIDO_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTE_RAPIDO_PACIENTE','MAPA_TESTE_RAPIDO_PACIENTE_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_LAB','MAPA_LAB_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_LAB_PACIENTE','MAPA_LAB_PACIENTE_TMP');
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  dm.DB.Close; dm.DB.Open; dm.TS.Active := true;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_LAB;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_LAB_PACIENTE;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTAGEM;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTAGEM_PACIENTE;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTE_RAPIDO;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_TESTE_RAPIDO_PACIENTE;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_MEDICO;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvDROP_MAPA_MEDICO_LINHA;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_LAB;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_LAB_PACIENTE;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_TESTAGEM;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_TESTAGEM_PACIENTE;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_TESTE_RAPIDO;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_TESTE_RAPIDO_PACIENTE;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_MEDICO;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  sTMP := cvCREATE_MAPA_MEDICO_LINHA;
  frmMetaDados.IBSQL.SQL.Text := sTMP;
  frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    dm.DB.Close; dm.DB.Open; dm.TS.Active := true;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_MEDICO_TMP','MAPA_MEDICO', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_MEDICO_LINHA_TMP','MAPA_MEDICO_LINHA', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTAGEM_TMP','MAPA_TESTAGEM', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTAGEM_PACIENTE_TMP','MAPA_TESTAGEM_PACIENTE', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTE_RAPIDO_TMP','MAPA_TESTE_RAPIDO', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_TESTE_RAPIDO_PACIENTE_TMP','MAPA_TESTE_RAPIDO_PACIENTE', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_LAB_TMP','MAPA_LAB', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
  frmMetaDados.CopiarDePara('MAPA_LAB_PACIENTE_TMP','MAPA_LAB_PACIENTE', true);
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;


  try
    sTMP := cvCREATE_GEN_MAPA_MEDICO;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_MAPA_LINHA;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_MAPA_PACIENTE;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_MAPA_TESTAGEM;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_MAPA_LAB;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_MAPA_LAB_PACIENTE;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_MAPA_TESTE_RAPIDO;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_TESTE_RAPIDO_PACIENTE;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    dm.DB.Close; dm.DB.Open; dm.TS.Active := true;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.EnviarEmailLOG;
begin
   frmEmail := TfrmEmail.Create(nil);
   frmEmail.mmMsg.Lines.Clear;
   frmEmail.mmMsg.Lines.LoadFromFile(frmMetaDados.sDir);
   frmEmail.mmMsg.Lines.Add('Computer:' + NomeDoComputador);
   frmEmail.mmMsg.Lines.Add('Unidade:'  + prmUnidade);
   frmEmail.mmMsg.Lines.Add('Usuário:'  + sLogUsuario);
   frmEmail.mmMsg.Lines.Add('Sistema:'  + sLogSistema);
   frmEmail.mmMsg.Lines.Add('Local:'    + sPath);
   frmEmail.sSubject := 'SIS PROV - Erro';
   if frmEmail.Enviar then
     DeleteFile(frmMetaDados.sDir)
   else
     frmEmail.mmMsg.Lines.SaveToFile(frmMetaDados.sDir);
   frmEmail.Free;
end;

procedure TfrmUpdate.bt21027Click(Sender: TObject);
begin
   IB.SelectSQL.Text :=
'select                                                          ' + chr(13) +
'       MAPA_MEDICO_LINHA.NR_PROCESSO                            ' + chr(13) +
'     , MAPA_MEDICO_LINHA.CD_PACIENTE                            ' + chr(13) +
'     , PACIENTE.CD_PACIENTE CC_PACIENTE                         ' + chr(13) +
'from MAPA_MEDICO_LINHA                                          ' + chr(13) +
'  left outer join PACIENTE on                                   ' + chr(13) +
'  MAPA_MEDICO_LINHA.NR_PROCESSO = PACIENTE.NR_PROCESSO          ' + chr(13) +
'where                                                           ' + chr(13) +
'  MAPA_MEDICO_LINHA.CD_PACIENTE  is null                        ';

   IB.ModifySQL.Text :=
'update MAPA_MEDICO_LINHA                                        ' + chr(13) +
'set CD_PACIENTE = :CC_PACIENTE                                  ' + chr(13) +
'where NR_PROCESSO = :NR_PROCESSO                                ';

   dm.Transacao(IB);
   IB.Open;
   IB.First;
   ProgressBar1.Max := IB.RecordCount;
   ProgressBar1.Position := 0;
   while not IB.Eof do
   begin
     try
       ProgressBar1.Position := IB.RecNo;
       IB.Edit;
       IB.Post;
     except
       on E:Exception do
         Memo1.Lines.Insert(0,E.Message);
     end;
     IB.Next;
   end;
   dm.Commit(IB);

  frmMetaDados.mLog.Text := Memo1.Lines.Text;
  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.bt21028Click(Sender: TObject);
var
 sTMP:string;
begin
   try
    sTMP := cvCREATE_GEN_MAPA_FARMACIA_LINHA;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GEN_MAPA_FARMACIA;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_ESQUEMA;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_TABLE_MAPA_FARMACIA;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_TABLE_MAPA_FARMACIA_LINHA;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.bt21029Click(Sender: TObject);
var
 sTMP, sProcesso:string;
begin
  try
    sTMP := cvALTER_TABLE_MAPA_MEDICO_LINHA_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_MAPA_LAB_PACIENTE_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_MAPA_FARMACIA_LINHA_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_MAPA_TESTE_RAPIDO_PACIENTE_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_MAPA_LAB_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;


  try
    sTMP := cvALTER_TABLE_MAPA_FARMACIA_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_MAPA_TESTE_RAPIDO_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvINSERT_PARAMETRO_21029_1;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvINSERT_PARAMETRO_21029_2;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvINSERT_PARAMETRO_21029_3;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvUPDATE_ULTIMO_ESQUEMA_21029;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvUPDATE_MAPA_MEDICO_LINHA_21029;
    frmMetaDados.IBSQL.Close;
    frmMetaDados.IBSQL.SQL.Text := sTMP;

    sTMP := cvSELECT_MAPA_MEDICO_LINHA_21029;
    frmMetaDados.IBQ.Close;
    frmMetaDados.IBQ.SQL.Text := sTMP;
    frmMetaDados.IBQ.Open;
    while not frmMetaDados.IBQ.Eof do
    begin
      if not frmMetaDados.IBQ.BOF then
      begin
        sProcesso := frmMetaDados.IBQ.FieldByName('NR_PROCESSO').AsString;
        frmMetaDados.IBQ.Prior;
        if frmMetaDados.IBQ.FieldByName('NR_PROCESSO').AsString =
           sProcesso then
        begin
           if frmMetaDados.IBQ.FieldByName('VL_TARV_PADRAO').AsString<>'' then
           begin
             frmMetaDados.IBSQL.ParamByName('ESQUEMA').AsString :=
                frmMetaDados.IBQ.FieldByName('VL_TARV_PADRAO').AsString;
             frmMetaDados.IBSQL.ParamByName('CD_MAPA_LINHA').AsString :=
                frmMetaDados.IBQ.FieldByName('CD_MAPA_LINHA').AsString;
             frmMetaDados.IBSQL.ExecQuery;
           end;
        end;
        frmMetaDados.IBQ.Next;
      end;
      frmMetaDados.IBQ.Next;
    end;
    frmMetaDados.IBQ.Close;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  dm.Commit(frmMetaDados.IBQ);

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.bt21030Click(Sender: TObject);
var
 sTMP:string; i:integer;
begin
  try
    sTMP := cvALTER_TABLE_NOTIFICACAO_21030;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvINSERT_PERMISSAO_21030;
    for i:=42 to 46 do
    begin
      frmMetaDados.IBSQL.SQL.Text := sTMP;
      frmMetaDados.IBSQL.Prepare;
      frmMetaDados.IBSQL.ParamByName('CD_PERMISSAO').AsInteger := i;
      frmMetaDados.IBSQL.ParamByName('CD_UND').AsString := prmUnidade;
      frmMetaDados.IBSQL.ExecQuery;
    end;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  dm.Commit(frmMetaDados.IBQ);

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.bt21031Click(Sender: TObject);
var
 sTMP:string;
begin
  try
    sTMP := cvCREATE_FORMA_21031;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GENERATOR_21031;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_PACIENTE_21031;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

    try
    sTMP := cvALTER_TABLE_MAPA_FARMACIA_LINHA_21031;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  dm.Commit(frmMetaDados.IBQ);

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.bt21032Click(Sender: TObject);
var
 sTMP:string;
begin
  try
    sTMP := cvCREATE_TABLE_GESTANTE_21032;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GENERATOR_GESTANTE_21032;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  dm.Commit(frmMetaDados.IBQ);

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;

end;

procedure TfrmUpdate.bt21033Click(Sender: TObject);
var
 sTMP:string;
begin
  try
    sTMP := cvCREATE_TABLE_MAPA_CRIANCA_EXPOSTA_21033;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GENERATOR_MAPA_CRIANCA_EXPOSTA_21033;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_TABLE_MAPA_CRIANCA_EXPOSTA_LINHA_21033;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvCREATE_GENERATOR_MAPA_CRIANCA_EXPOSTA_LINHA_21033;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_PACIENTE_21033;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_MAPA_MEDICO_LINHA_21033;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvINSERT_PARAMETRO_21033;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  dm.Commit(frmMetaDados.IBQ);

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.bt21034Click(Sender: TObject);
var
 sTMP:string; i:integer;
begin
  try
    sTMP := cvINSERT_PERMISSAO_21034;
    for i:=47 to 59 do
    begin
      frmMetaDados.IBSQL.SQL.Text := sTMP;
      frmMetaDados.IBSQL.Prepare;
      frmMetaDados.IBSQL.ParamByName('CD_PERMISSAO').AsInteger := i;
      frmMetaDados.IBSQL.ParamByName('CD_UND').AsString := prmUnidade;
      frmMetaDados.IBSQL.ExecQuery;
    end;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  dm.Commit(frmMetaDados.IBQ);

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

procedure TfrmUpdate.bt21035Click(Sender: TObject);
var
 sTMP:string;
begin
  try
    sTMP := cvALTER_TABLE_MAPA_MEDICO_LINHA_21035;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  try
    sTMP := cvALTER_TABLE_MAPA_LAB_PACIENTE_21035;
    frmMetaDados.IBSQL.SQL.Text := sTMP;
    frmMetaDados.IBSQL.ExecQuery;
  except
    on E:Exception do
      frmMetaDados.mLog.Lines.add(E.Message);
  end;

  dm.Commit(frmMetaDados.IBQ);

  frmMetaDados.mLog.Lines.add('Pronto!');
  frmMetaDados.btLogClick(sender);
  EnviarEmailLOG;
end;

end.



