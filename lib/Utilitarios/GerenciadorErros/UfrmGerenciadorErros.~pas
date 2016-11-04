unit UfrmGerenciadorErros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdComponent, IdIOHandler,
   IdSSLOpenSSL, IdIMAP4, IdBaseComponent,
  IdMessage, IdIOHandlerSocket, IdTCPConnection, IdTCPClient,
  IdMessageClient, ComCtrls, IdAntiFreezeBase, IdAntiFreeze, XPMan, DB,
  IBDatabase, IBCustomDataSet, IBQuery, DBCtrls, Grids, DBGrids, dxExEdtr,
  dxDBGrid, dxTL, dxDBCtrl, dxDBTLCl, dxGrClms, dxCntner, dxEditor,
  dxEdLib, dxDBELib, IBSQL, dxDBEdtr;

type
  TfrmGerenciadorErros = class(TForm)
    Panel1: TPanel;
    btIniciarDownload: TButton;
    OpenSSLHandler: TIdSSLIOHandlerSocket;
    IMAPClient: TIdIMAP4;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    memLog: TMemo;
    btPararDownload: TButton;
    XPManifest1: TXPManifest;
    PbBaixarEmails: TProgressBar;
    TabSheet1: TTabSheet;
    memEmail: TMemo;
    BtAnalizar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edData: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edComputador: TEdit;
    edUnidade: TEdit;
    edUsuario: TEdit;
    edSistema: TEdit;
    edLocal: TEdit;
    memMsgPrincipal: TMemo;
    Label7: TLabel;
    edException: TEdit;
    memMsgCompleta: TMemo;
    TabSheet3: TTabSheet;
    DB: TIBDatabase;
    TS: TIBTransaction;
    dsErros: TDataSource;
    dxDBGrid1: TdxDBGrid;
    dxDBMemo1: TdxDBMemo;
    IbSqlUIDExiste: TIBSQL;
    IBQueryErros: TIBQuery;
    IBSQLInseriErro: TIBSQL;
    IBQueryErrosCD_ERRO: TIntegerField;
    IBQueryErrosDT_ERRO: TDateTimeField;
    IBQueryErrosDS_COMPUTADOR: TIBStringField;
    IBQueryErrosDS_UNIDADE: TIBStringField;
    IBQueryErrosDS_USUARIO: TIBStringField;
    IBQueryErrosDS_SISTEMA: TIBStringField;
    IBQueryErrosDS_LOCAL: TIBStringField;
    IBQueryErrosDS_EXCEPTION: TIBStringField;
    IBQueryErrosMSG_PRINCIPAL: TMemoField;
    IBQueryErrosMSG_COMPLETA: TMemoField;
    IBQueryErrosEMAIL_UID: TIBStringField;
    dxDBGrid1CD_ERRO: TdxDBGridMaskColumn;
    dxDBGrid1DT_ERRO: TdxDBGridDateColumn;
    dxDBGrid1DS_COMPUTADOR: TdxDBGridMaskColumn;
    dxDBGrid1DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid1DS_USUARIO: TdxDBGridMaskColumn;
    dxDBGrid1DS_SISTEMA: TdxDBGridMaskColumn;
    dxDBGrid1DS_LOCAL: TdxDBGridMaskColumn;
    dxDBGrid1DS_EXCEPTION: TdxDBGridMaskColumn;
    dxDBGrid1EMAIL_UID: TdxDBGridMaskColumn;
    btAtualizarListaErros: TButton;
    LNErros: TLabel;
    lblStatusDownload: TLabel;
    IBQueryErrosTODOS: TIBStringField;
    Panel2: TPanel;
    Splitter1: TSplitter;
    dtDe: TdxDateEdit;
    dtAte: TdxDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    qyUnidade: TIBQuery;
    qyException: TIBQuery;
    dsException: TDataSource;
    dsUnidade: TDataSource;
    qyExceptionDS_EXCEPTION: TIBStringField;
    qyUnidadeDS_UNIDADE: TIBStringField;
    edErroException: TdxLookupEdit;
    edErroUnidade: TdxLookupEdit;
    IdAntiFreeze1: TIdAntiFreeze;
    IBSQLErroExiste: TIBSQL;
    procedure btIniciarDownloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btPararDownloadClick(Sender: TObject);
    procedure IMAPClientStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure BtAnalizarClick(Sender: TObject);
    procedure DBAfterConnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAtualizarListaErrosClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure IBQueryErrosAfterOpen(DataSet: TDataSet);
    procedure DBAfterDisconnect(Sender: TObject);
    procedure IBQueryErrosBeforeOpen(DataSet: TDataSet);
    procedure dxDBGrid1CalcSummary(Sender: TObject);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure IBEvents1Error(Sender: TObject; ErrorCode: Integer);
  private
    { Private declarations }
    podeBaixar: boolean;
    procedure Log(LogMsg: String);
    procedure IMAPConfigura;
    procedure IMAPConectar;
    function IMAPListMailBoxes:TStringList;
    procedure BaixarEmails;
    function AnalizaEmail(corpoEmail: TStrings; emailUID: String): Boolean;
    procedure AtualizaQuerys;
    function VerificaEmailJaAnalizado(UID: String):Boolean;
    procedure SalvaLog;
    procedure HandleNewException(Sender: TObject; E :Exception);
    procedure CriaMailBox(NMailBox : String);
  public
    { Public declarations }
  end;

var
  frmGerenciadorErros: TfrmGerenciadorErros;


implementation

uses Math, UIMAPGetUID, DateUtils;

var
  SSQL : String;

{$R *.dfm}

procedure TfrmGerenciadorErros.HandleNewException(Sender: TObject; E :Exception); 
begin
  ShowMessage(e.Message);
end;

procedure TfrmGerenciadorErros.Log( LogMsg: string );
begin
  memLog.Lines.Add( LogMsg );
  Application.ProcessMessages;
end;


procedure TfrmGerenciadorErros.btIniciarDownloadClick(Sender: TObject);
begin
  btIniciarDownload.Enabled := False;
  btPararDownload.Enabled := True;
  try
    BaixarEmails;
  finally
    btIniciarDownload.Enabled := True;
    btPararDownload.Enabled := False;
  end;
end;

procedure TfrmGerenciadorErros.IMAPConfigura;
begin
  IMAPClient.Host := 'email-ssl.com.br';
  IMAPClient.Port := 993;
  IMAPClient.Username := 'leandro@inovit.co.ao';
  IMAPClient.Password := 'Lilian97';

  OpenSSLHandler.SSLOptions.Method := sslvSSLv3;
  IMAPClient.IOHandler := OpenSSLHandler;
  IMAPClient.RetrieveOnSelect := rsDisabled;
end;

procedure TfrmGerenciadorErros.FormCreate(Sender: TObject);
begin
  // implementar tratamento de erro para problema de conexao com servidor
  //Application.onException := HandleNewException;
  SSQL := IBQueryErros.SQL.Text;
  dtDe.Date := Date;
  dtAte.Date := Date;
  StatusBar1.Panels.Items[0].Text := 'IMAP Status: Disconnected';
  StatusBar1.Panels.Items[1].Text := 'DB Desconectada';
  IMAPConfigura;
  DB.Open;
end;

procedure TfrmGerenciadorErros.IMAPConectar;
begin
  try
    Log('Conectando no servidor IMAP');
    IMAPClient.Connect(10000);
    if not IMAPClient.Connected then begin
      Log( 'Unsuccessful connection.' );
      exit;
    end;
    Application.ProcessMessages;
  except
    on e: Exception do begin
      Log( 'Unsuccessful connection: '+ Trim( e.Message ));
      Abort;
    end;
  end;
end;


{ Uso da funcao IMAPListMailBoxes
  UsersFolders := IMAPListMailBoxes;
  if UsersFolders <> nil then
  begin
    Log( 'User folders: ' + IntToStr( UsersFolders.Count ) );
    for i := 0 to UsersFolders.Count - 1 do begin
      Log( '  [' + inttostr( i + 1 ) + '/' + inttostr( UsersFolders.Count ) + '] Folder: "' + UsersFolders[ i ] + '"' );
    end;
  end;}
function TfrmGerenciadorErros.IMAPListMailBoxes: TStringList;
var
  UsersFolders: TStringList;
begin
  UsersFolders := TStringList.Create;
  try
    if not IMAPClient.ListMailBoxes( UsersFolders ) then begin
      Log( 'ListMailBoxes error.' );
      Result := nil;
      Exit;
    end;
  except
    on e: Exception do begin
      Log( 'ListMailBoxes error: ' + Trim( e.Message ));
      Result := nil;
      exit;
    end;
  end;
  Result := UsersFolders;
end;

procedure TfrmGerenciadorErros.BaixarEmails;
var
  i: integer;
  currUID, pastaLogsAtualizacoes: string;
  totalMsg: integer;
  msg: TIdMessage;
  SearchInfo: array of TIdIMAP4SearchRec;
begin
  podeBaixar := true;
  PbBaixarEmails.Position := 0;
  try
    if not IMAPClient.Connected then
      IMAPConectar;

    pastaLogsAtualizacoes := 'INBOX.LogsAtualizacoes';
    // verifica se exista a pasta 'INBOX.LogsAtualizacoes', se nao cria a pasta
    CriaMailBox(pastaLogsAtualizacoes);

    // abre a caixa de entrada
    Log('Abrindo Caixa de Entrada');
    if not IMAPClient.SelectMailBox('INBOX') then
    begin
      Log('Erro ao abrir a Caixa de Entrada');
      Exit;
    end;

    SetLength(SearchInfo, 1);
    SearchInfo[0].SearchKey := skSubject;
    SearchInfo[0].Text := 'SIS PROV - Erro';

    Log('Pesquisando mensagens com assunto: '+ SearchInfo[0].Text);
    if not IMAPClient.SearchMailBox(SearchInfo) then
    begin
      Log('Erro ao fazer pesquisa na Caixa de Entrada');
      Exit;
    end;

    totalMsg := High(IMAPClient.MailBox.SearchResult)+1;
    Log('Total de mensagens: '+ IntToStr(totalMsg));
    PbBaixarEmails.Min := 0;
    if totalMsg > 0 then
      PbBaixarEmails.Max := totalMsg-1
    else
      PbBaixarEmails.Max := 0;

    for I := 0 to totalMsg-1 do
    begin
      PbBaixarEmails.Position := I;
      lblStatusDownload.Caption := 'Baixando email '+IntToStr(I+1)+'/'+IntToStr(totalMsg);

      if (podeBaixar = False) or (not IMAPClient.Connected) then
        Break;
      msg := TIdMessage.Create(nil);
      try
        try
          if IMAPClient.Retrieve(IMAPClient.MailBox.SearchResult[I], msg) then
          begin
            if msg.Subject = '' then
            begin
              Log('Erro ao buscar a mensagem no servidor');
              Continue;
            end;
            IMAPGetUID(IMAPClient, IMAPClient.MailBox.SearchResult[I], currUID);
            msg.UID := currUID;
            
            Log('['+IntToStr(I+1)+'/'+IntToStr(totalMsg)+'] ' + msg.Subject  + ' UID: '+msg.UID);

            if Pos('Pronto!', msg.Body.Text) > 0 then
            begin
              Log('Este é um log de atualização, movendo para outra pasta...');
              if IMAPClient.CopyMsgs([IMAPClient.MailBox.SearchResult[I]], pastaLogsAtualizacoes) then
              begin
                IMAPClient.UIDDeleteMsg(msg.UID);
                Log('Mensagem movida.');
              end
              else
                Log('Erro ao mover mensagem');
              Continue;
            end;

            if AnalizaEmail(msg.Body, msg.UID) then
            begin
              if IMAPClient.UIDDeleteMsg(msg.UID) then
                Log('Email deletado!')
              else
                Log('Erro ao deletar email');
            end
            else
              Log('Não foi possível analisar email com UID: '+msg.UID);
          end;
          Application.ProcessMessages;
        except
          on e: Exception do begin
            Log( 'Erro ao analisar email: ' + Trim( e.Message ));
          end;
        end;
      finally
        msg.Free;
      end;
    end;

  finally
    if IMAPClient.Connected then
    begin
      try
        IMAPClient.ExpungeMailBox;
      except
        on e : Exception do
          Log('ExpungeMailBox erro: '+ e.Message);
      end;
      IMAPClient.Disconnect;
    end;
    PbBaixarEmails.Position := PbBaixarEmails.Max;
    AtualizaQuerys;
    SalvaLog;
  end;
end;

procedure TfrmGerenciadorErros.btPararDownloadClick(Sender: TObject);
begin
  podeBaixar := false;
end;

procedure TfrmGerenciadorErros.IMAPClientStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
  Log('IMAPClientStatus: '+ AStatusText);
  StatusBar1.Panels.Items[0].Text := 'IMAP Status: ' + AStatusText;
end;

procedure TfrmGerenciadorErros.BtAnalizarClick(Sender: TObject);
begin
  AnalizaEmail(memEmail.Lines, '123');
end;

function TfrmGerenciadorErros.AnalizaEmail(corpoEmail: TStrings; emailUID: String): Boolean;
type
   TEstado = (pComeco, pData, pMsgPrincipal, pDetalhes, pSalvaBanco);
var
  estado : TEstado;
  email, msgPrincipal, msgCompleta : TStringList;
  I, X, inicioMsgPrinc, fimMsgPrinc: integer;
  data, computador, unidade, usuario, sistema, local, exception : String;
begin
  Result := False;
  email := TStringList.Create;
  msgPrincipal := TStringList.Create;
  msgCompleta := TStringList.Create;
  inicioMsgPrinc := -1;
  fimMsgPrinc := -1;

  if emailUID = '' then
    Exit;

  if VerificaEmailJaAnalizado(emailUID) then
  begin
    //Log('Pulando email com UID: ' + emailUID + ' pois já foi analisado!');
    Log('Email com UID: ' + emailUID + ' pois já foi analisado, deletando...');
    IMAPClient.UIDDeleteMsg(emailUID);
    Log('Email deletado!');
    Exit;
  end;

  try
    if not TS.InTransaction then
      TS.StartTransaction;
    email.Assign(corpoEmail);
    estado := pComeco;
    try
      for I := 0 to email.Count-1 do
      begin
        if estado = pComeco then
        begin
          data := ''; computador := ''; unidade := '';
          usuario := ''; sistema := ''; local := ''; exception := '';
          msgPrincipal.Clear;
          msgCompleta.Clear;
          estado := pData;
          inicioMsgPrinc := -1;
          fimMsgPrinc := -1;
        end;
        if estado = pData then
        begin
          if Pos('---------------------------', email[I]) > 0 then
          begin
            data := Copy(email[I], 28, 19);
            data := StringReplace(data,'-','/',[rfReplaceAll]);
            estado := pMsgPrincipal;
          end;
        end
        else if estado = pMsgPrincipal then
        begin
          if inicioMsgPrinc = -1 then
            inicioMsgPrinc := I;
          if (fimMsgPrinc = -1) and (inicioMsgPrinc <> -1) and (email[I] = '') then
            fimMsgPrinc := I-1;
          if Pos('Computer:', email[I]) > 0 then
          begin
            for X:=inicioMsgPrinc to fimMsgPrinc do
              msgPrincipal.Add(email[X]);

            for X:=inicioMsgPrinc to I-1 do
              msgCompleta.Add(email[X]);

            if Pos('Exception ''', email[inicioMsgPrinc]) > 0 then
            begin
              exception := Copy(email[inicioMsgPrinc], 12, MaxInt);
              exception := Copy(exception, 1, Pos('''', exception)-1);
            end;
            estado := pDetalhes;
          end;
        end;

        if estado = pDetalhes then
        begin
          if Pos('Computer:', email[I]) > 0 then
            computador := Copy(email[I], 10, MaxInt)
          else if Pos('Unidade:', email[I]) > 0 then
            unidade := Copy(email[I], 9, MaxInt)
          else if Pos('Usuário:', email[I]) > 0 then
            usuario := Copy(email[I], 9, MaxInt)
          else if Pos('Sistema:', email[I]) > 0 then
            sistema := Copy(email[I], 9, MaxInt)
          else if Pos('Local:', email[I]) > 0 then
          begin
            local := Copy(email[I], 7, MaxInt);
            estado := pSalvaBanco;
          end;
        end;

        // salva as informações no banco
        if estado = pSalvaBanco then
        begin
          {edData.Text := data;
          edComputador.Text := computador;
          edUnidade.Text := unidade;
          edUsuario.Text := usuario;
          edSistema.Text := sistema;
          edLocal.Text := local;
          edException.Text := exception;
          memMsgPrincipal.Lines.Assign(msgPrincipal);
          memMsgCompleta.Lines.Assign(msgCompleta);}

          if (data = '') or (exception = '') then
          begin
            Result := False;
            Exit;
          end;

          // verifica se não é duplicada
          IBSQLErroExiste.Close;
          IBSQLErroExiste.ParamByName('DT_ERRO').AsDateTime := StrToDateTime(data);
          IBSQLErroExiste.ParamByName('MSG_PRINCIPAL').AsString := msgPrincipal.Text;
          IBSQLErroExiste.ExecQuery;
          if IBSQLErroExiste.RecordCount > 0 then
          begin
            Result := True;
            Exit;
          end;
          
          IBSQLInseriErro.Close;
          IBSQLInseriErro.ParamByName('DT_ERRO').AsDateTime := StrToDateTime(data);
          IBSQLInseriErro.ParamByName('DS_COMPUTADOR').AsString := computador;
          IBSQLInseriErro.ParamByName('DS_UNIDADE').AsString := unidade;
          IBSQLInseriErro.ParamByName('DS_USUARIO').AsString := usuario;
          IBSQLInseriErro.ParamByName('DS_SISTEMA').AsString := sistema;
          IBSQLInseriErro.ParamByName('DS_LOCAL').AsString := local;
          IBSQLInseriErro.ParamByName('DS_EXCEPTION').AsString := exception;
          IBSQLInseriErro.ParamByName('MSG_PRINCIPAL').AsString := msgPrincipal.Text;
          IBSQLInseriErro.ParamByName('MSG_COMPLETA').AsString := msgCompleta.Text;
          IBSQLInseriErro.ParamByName('EMAIL_UID').AsString := emailUID;
          IBSQLInseriErro.ExecQuery;
          IBSQLInseriErro.Close;
          Result:=True;
          estado := pComeco;
        end;
      end;
    except
      Result := False;
    end;
  finally
    if Result = True then
      TS.CommitRetaining
    else
      TS.RollbackRetaining;
    email.Free;
    msgPrincipal.Free;
    msgCompleta.Free;
  end;
end;

procedure TfrmGerenciadorErros.DBAfterConnect(Sender: TObject);
begin
  StatusBar1.Panels.Items[1].Text := 'DB Conectada';
  AtualizaQuerys;
end;

procedure TfrmGerenciadorErros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DB.Close;
end;

procedure TfrmGerenciadorErros.btAtualizarListaErrosClick(Sender: TObject);
begin
  if not DB.Connected then
    DB.Open;
  IBQueryErros.Close;
  IBQueryErros.Open;
end;

procedure TfrmGerenciadorErros.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := PageControl1.ActivePage.TabVisible;
end;

procedure TfrmGerenciadorErros.IBQueryErrosAfterOpen(DataSet: TDataSet);
begin
  IBQueryErros.Last;
  IBQueryErros.First;
end;

procedure TfrmGerenciadorErros.DBAfterDisconnect(Sender: TObject);
begin
  StatusBar1.Panels.Items[1].Text := 'DB Desconectada';
end;

procedure TfrmGerenciadorErros.IBQueryErrosBeforeOpen(DataSet: TDataSet);
var
  sWhere : String;
begin
  IBQueryErros.ParamByName('DE').AsDate := dtDe.Date;
  IBQueryErros.ParamByName('ATE').AsDate := IncDay(dtAte.Date);

  if edErroException.Text <> '' then
    sWhere := sWhere + ' and DS_EXCEPTION = :exception';

  if edErroUnidade.Text <> '' then
    sWhere := sWhere + ' and DS_UNIDADE = :unidade';

  IBQueryErros.SQL.Text := StringReplace(SSQL, '/* WHERE */', sWhere, []);
  IBQueryErros.Prepare;

  if edErroException.Text <> '' then
    IBQueryErros.ParamByName('exception').AsString := edErroException.Text;

  if edErroUnidade.Text <> '' then
    IBQueryErros.ParamByName('unidade').AsString := edErroUnidade.Text;

end;

procedure TfrmGerenciadorErros.AtualizaQuerys;
begin
  IBQueryErros.Close;
  qyUnidade.Close;
  qyException.Close;

  qyUnidade.Open;
  qyException.Open;
  IBQueryErros.Open;

end;

procedure TfrmGerenciadorErros.dxDBGrid1CalcSummary(Sender: TObject);
begin
  LNErros.Caption := 'Número de erros: ' + IntToStr(dxDBGrid1.Count);
end;

function TfrmGerenciadorErros.VerificaEmailJaAnalizado(
  UID: String): Boolean;
begin
  Result := True;
  IbSqlUIDExiste.Close;
  IbSqlUIDExiste.Params[0].AsString := UID;
  IbSqlUIDExiste.ExecQuery;
  if IbSqlUIDExiste.RecordCount = 0 then
    Result := False;
end;

procedure TfrmGerenciadorErros.SalvaLog;
var mmLog:TStringList;
  sDir : String;
begin
  sDir := ExtractFilePath(Application.ExeName)+'\Log';
  if not DirectoryExists(sDir) then
   CreateDir(sDir);
  sDir := sDir + '\Log'+FormatDateTime('ddmmyy',Date)+'.txt' ;
  mmLog := TStringList.Create;
  try
    if FileExists(sDir) then
      mmLog.LoadFromFile(sDir);
    mmLog.Add(memLog.Lines.Text);
    mmLog.SaveToFile(sDir);
  finally
    mmLog.Free;
  end;
end;

procedure TfrmGerenciadorErros.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
  ShowMessage('Alert: ' + EventName + ' Count: '+IntToStr(EventCount));
end;

procedure TfrmGerenciadorErros.IBEvents1Error(Sender: TObject;
  ErrorCode: Integer);
begin
  ShowMessage('Erro: ' +IntToStr(ErrorCode));
end;

procedure TfrmGerenciadorErros.CriaMailBox(NMailBox: String);
var
  UsersFolders : TStringList;
  existe : Boolean;
  i : Integer;
begin
  if NMailBox = '' then
    raise Exception.Create('Erro ao criar MailBox, nome vazio');

  if not IMAPClient.Connected then
    raise Exception.Create('Erro ao criar MailBox, IMAP não conectado');

  try
    UsersFolders := IMAPListMailBoxes;
    existe := False;

    if UsersFolders <> nil then
    begin
      for i := 0 to UsersFolders.Count - 1 do begin
        if Pos(NMailBox, UsersFolders[i]) > 0 then
          existe := true;
      end;
    end;
    FreeAndNil(UsersFolders);

    if not existe then
    begin
      if IMAPClient.CreateMailBox(NMailBox) then
        Log('Pasta ' + NMailBox + ' criada')
      else
        raise Exception.Create('Erro ao criar pasta ' +NMailBox);
    end;
  finally
    FreeAndNil(UsersFolders);
  end;
end;

end.
