unit UFTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, Buttons, FileCtrl, Grids, DBGrids,
  DB, DBClient, ADODB, dxExEdtr, ZipMstr, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ExtCtrls, dxDBTLCl, dxGrClms;

type
  TfrmFTP = class(TForm)
    btAtualizar: TButton;
    tvFtp: TTreeView;
    edLocal: TEdit;
    edFTP: TEdit;
    btLocal: TSpeedButton;
    btLeft: TSpeedButton;
    btRigth: TSpeedButton;
    OpenDialog1: TOpenDialog;
    flLocal: TFileListBox;
    StatusBar1: TStatusBar;
    btConectar: TButton;
    btDesConectar: TButton;
    btDeleteFTP: TSpeedButton;
    dsVersao: TDataSource;
    btVersao: TButton;
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    edDestino: TEdit;
    Label3: TLabel;
    edTipo: TEdit;
    ckExec: TCheckBox;
    btGravar: TButton;
    edCodigo: TEdit;
    btExcluir: TButton;
    grVersao: TdxDBGrid;
    ZipMaster1: TZipMaster;
    btZip: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btDeleteLOC: TSpeedButton;
    btConfig: TButton;
    grVersaoColumn1: TdxDBGridColumn;
    grVersaoColumn2: TdxDBGridColumn;
    grVersaoColumn3: TdxDBGridColumn;
    grVersaoColumn4: TdxDBGridDateColumn;
    grVersaoColumn5: TdxDBGridCheckColumn;
    grVersaoColumn6: TdxDBGridColumn;
    grVersaoColumn7: TdxDBGridColumn;
    Label4: TLabel;
    edOrdem: TEdit;
    Bevel4: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pnSQL: TPanel;
    mmSQL: TMemo;
    Panel1: TPanel;
    btExec: TButton;
    btPanSQL: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure btAtualizarClick(Sender: TObject);
    procedure btLocalClick(Sender: TObject);
    procedure btLeftClick(Sender: TObject);
    procedure btRigthClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConectarClick(Sender: TObject);
    procedure btDesConectarClick(Sender: TObject);
    procedure btDeleteFTPClick(Sender: TObject);
    procedure btVersaoClick(Sender: TObject);
    procedure dsVersaoDataChange(Sender: TObject; Field: TField);
    procedure btGravarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btZipClick(Sender: TObject);
    procedure btDeleteLOCClick(Sender: TObject);
    procedure btConfigClick(Sender: TObject);
    procedure btPanSQLClick(Sender: TObject);
    procedure btExecClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure IncluirArquivo(sArquivo:string);
    procedure ExcluirArquivo(sArquivo:string);
    procedure AlterarVersao;
    procedure ExcluirVersao;
  public
    { Public declarations }
    function EnviarFTP(psArq:string):boolean;
  end;

var
  frmFTP: TfrmFTP;

implementation

uses uMySqlFTP;

{$R *.dfm}

procedure TfrmFTP.btAtualizarClick(Sender: TObject);
var
  I: Integer;
  PastaExistente: Boolean;
  l:TStringList;
begin

  Try

  l := TStringList.Create;

  //Apaga os Dados que tem em TreeView
  tvFtp.Items.Clear;

  //Realiza a Conexao com FTP...
  if not frmMySqlFTP.FTP.Connected then
    frmMySqlFTP.FTP.Connect;

  //Verifica se foi conectado com sucesso
  if frmMySqlFTP.FTP.Connected then begin

      StatusBar1.SimpleText := 'Conectado!';

      frmMySqlFTP.FTP.ChangeDir(edFTP.Text);
      frmMySqlFTP.FTP.List(l);

  
      //LOOP para jogar o nome dos arquivos e pastas no TREEVIEW...
      for I := 0 to frmMySqlFTP.FTP.DirectoryListing.Count-1 do begin
       tvFtp.Items.Add(nil,frmMySqlFTP.FTP.DirectoryListing.Items[i].FileName);
      end;
  end;
  Finally
    l.Free;
  End;
end;

procedure TfrmFTP.btLocalClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edLocal.Text := ExtractFilePath(OpenDialog1.FileName);
    flLocal.Directory := edLocal.Text;
  end;
end;

procedure TfrmFTP.btLeftClick(Sender: TObject);
var sDe,sPara:string;
begin
  if frmMySqlFTP.ftp.Connected then
  begin
     sDe := tvFTP.Selected.Text;
     sPara := edLocal.Text;
     try
      frmMySqlFTP.ftp.Get(sDe,sPara);
      StatusBar1.SimpleText := 'Download ' + sDe + ' -  ' + sPara + ' - OK';
     except
      StatusBar1.SimpleText := 'Download ' + sDe + ' -  ' + sPara + ' - Erro';
     end;
  end;
end;

procedure TfrmFTP.btRigthClick(Sender: TObject);
  var sDe,sPara:string;
begin
  if frmMySqlFTP.ftp.Connected then
  begin
     sPara := ExtractFileName(flLocal.FileName);
     sDe := flLocal.FileName;

     try
      //ftp.Put(sDe, sPara);
      IncluirArquivo(sDe);
      StatusBar1.SimpleText := 'Upload ' + sDe  + ' -  ' + sPara + ' - OK';
     except
      StatusBar1.SimpleText := 'Upload ' + sDe  + ' -  ' + sPara + ' - Erro';
     end;
  end;
end;

procedure TfrmFTP.FormCreate(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Desconectado!';
  edLocal.Text := flLocal.Directory;
end;

procedure TfrmFTP.btConectarClick(Sender: TObject);
begin
  Try
    frmMySqlFTP.btConFTP.Click;
    StatusBar1.SimpleText := 'Conectado!';
  Except
    StatusBar1.SimpleText := 'Desconectado!';
  End;
end;

procedure TfrmFTP.btDesConectarClick(Sender: TObject);
begin
  Try
    if frmMySqlFTP.FTP.Connected then
      frmMySqlFTP.FTP.Disconnect;
    StatusBar1.SimpleText := 'Desconectado!';
  Except
    if frmMySqlFTP.FTP.Connected then
      StatusBar1.SimpleText := 'Conectado!';
  End;
end;

procedure TfrmFTP.btDeleteFTPClick(Sender: TObject);
var sArq:string;
begin
  if frmMySqlFTP.ftp.Connected then
  begin
     sArq := tvFtp.Selected.Text;

     try
      //ftp.Delete(sArq);
      ExcluirArquivo(sArq);
      StatusBar1.SimpleText := 'Excluindo ' + sArq + ' - OK';
     except
      StatusBar1.SimpleText := 'Excluindo ' + sArq + ' - Erro';
     end;
  end;
end;

procedure TfrmFTP.btVersaoClick(Sender: TObject);
begin
   frmMySqlFTP.btCon.Click;
   frmMySqlFTP.ZQuery1.SQL.Text := 'SELECT * FROM VERSAO';
   frmMySqlFTP.ZQuery1.Open;
end;

procedure TfrmFTP.IncluirArquivo(sArquivo: string);
var sSQL,sNome:string;
begin
  sNome := ExtractFileName(sArquivo);
  sNome := StringReplace(sNome,ExtractFileExt(sArquivo),'',[]);
  sSQL := 'INSERT INTO VERSAO(CD_VERSAO, NM_ARQUIVO, NM_DESTINO, TP_ARQUIVO, DT_ARQUIVO)VALUES(';
  sSQL := sSQL + '0,' +
  QuotedStr(sNome) + ',' +
  QuotedStr('/*APP*/'+ExtractFileName(sArquivo)) +
  ',1,' +
  QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',Now)) +
  ')';

  try
    frmMySqlFTP.Connection.Disconnect;
    frmMySqlFTP.Connection.Connect;

    frmMySqlFTP.ZQuery2.SQL.Text := sSQL;
    frmMySqlFTP.ZQuery2.ExecSQL;

    frmMySqlFTP.ZQuery1.Close;
    frmMySqlFTP.ZQuery1.Open;
    StatusBar1.SimpleText := 'Sucesso!';
  except
    on E:Exception do
      StatusBar1.SimpleText := E.Message;
  end;
end;

procedure TfrmFTP.ExcluirArquivo(sArquivo: string);
var sSQL:string;
begin
  sSQL := 'DELETE VERSAO WHERE NM_ARQUIVO = ';
    QuotedStr(ExtractFileName(sArquivo));

  try

    frmMySqlFTP.Connection.Disconnect;
    frmMySqlFTP.Connection.Connect;

    frmMySqlFTP.ZQuery2.SQL.Text := sSQL;
    frmMySqlFTP.ZQuery2.ExecSQL;

    frmMySqlFTP.ZQuery1.Close;
    frmMySqlFTP.ZQuery1.Open;
    StatusBar1.SimpleText := 'Sucesso!';
  except
    on E:Exception do
      StatusBar1.SimpleText := E.Message;
  end;
end;

procedure TfrmFTP.dsVersaoDataChange(Sender: TObject; Field: TField);
begin
  edNome.Text := dsVersao.DataSet.FieldByName('NM_ARQUIVO').AsString;
  edCodigo.Text := dsVersao.DataSet.FieldByName('CD_VERSAO').AsString;
  edDestino.Text := dsVersao.DataSet.FieldByName('NM_DESTINO').AsString;
  edTipo.Text := dsVersao.DataSet.FieldByName('TP_ARQUIVO').AsString;
  edOrdem.Text := dsVersao.DataSet.FieldByName('NR_ORDEM').AsString;
  ckExec.Checked := dsVersao.DataSet.FieldByName('FL_EXECUTAR').AsInteger = 1;
end;

procedure TfrmFTP.AlterarVersao;
var sSQL,sE:string;
begin
  sE := '0';
  if ckExec.Checked then
    sE := '1';

  sSQL := 'UPDATE VERSAO SET ' +
  ' NM_ARQUIVO = ' + QuotedStr(edNome.Text) +
  ' , NM_DESTINO  = ' + QuotedStr(edDestino.Text) +
  ' , TP_ARQUIVO  = ' + QuotedStr(edTipo.Text) +
  ' , NR_ORDEM  = ' + edOrdem.Text  +
  ' , FL_EXECUTAR  = ' +  sE +
  ' WHERE CD_VERSAO = ' + edCodigo.Text ;

  try
    frmMySqlFTP.Connection.Disconnect;
    frmMySqlFTP.Connection.Connect;

    frmMySqlFTP.ZQuery2.SQL.Text := sSQL;
    frmMySqlFTP.ZQuery2.ExecSQL;

    frmMySqlFTP.ZQuery1.Close;
    frmMySqlFTP.ZQuery1.Open;

    StatusBar1.SimpleText := 'Sucesso!';
  except
    on E:Exception do
      StatusBar1.SimpleText := E.Message;
  end;
end;

procedure TfrmFTP.ExcluirVersao;
var sSQL:string;
begin

  sSQL := 'DELETE FROM VERSAO ' +
  ' WHERE CD_VERSAO = ' + edCodigo.Text ;

  try
    frmMySqlFTP.Connection.Disconnect;
    frmMySqlFTP.Connection.Connect;

    frmMySqlFTP.ZQuery2.SQL.Text := sSQL;
    frmMySqlFTP.ZQuery2.ExecSQL;

    frmMySqlFTP.ZQuery1.Close;
    frmMySqlFTP.ZQuery1.Open;

    StatusBar1.SimpleText := 'Sucesso!';
  except
    on E:Exception do
      StatusBar1.SimpleText := E.Message;
  end;

end;

procedure TfrmFTP.btGravarClick(Sender: TObject);
begin
  AlterarVersao;
end;

procedure TfrmFTP.btExcluirClick(Sender: TObject);
begin
  ExcluirVersao;
end;

procedure TfrmFTP.btZipClick(Sender: TObject);
var ext,name,nZip:string;
begin
  ext := ExtractFileExt(flLocal.FileName);
  name := flLocal.FileName;
  nZip := StringReplace(name,ext,'.zip',[]);
  ZipMaster1.ZipFileName := nZip;
  ZipMaster1.FSpecArgs.Add(name);
  ZipMaster1.Add;
  flLocal.Update;
end;

procedure TfrmFTP.btDeleteLOCClick(Sender: TObject);
begin
  DeleteFile(flLocal.FileName);
  flLocal.Update;
end;

procedure TfrmFTP.btConfigClick(Sender: TObject);
begin
  frmMySqlFTP.Show;
end;

procedure TfrmFTP.btPanSQLClick(Sender: TObject);
begin
  pnSQL.Visible := btPanSQL.Down;
end;

procedure TfrmFTP.btExecClick(Sender: TObject);
begin
 try
    frmMySqlFTP.Connection.Disconnect;
    frmMySqlFTP.Connection.Connect;

    frmMySqlFTP.ZQuery2.Close;
    frmMySqlFTP.ZQuery2.SQL.Text := mmSQL.Text;
    frmMySqlFTP.ZQuery2.ExecSQL;

    StatusBar1.SimpleText := 'Sucesso!';
  except
    on E:Exception do
      StatusBar1.SimpleText := E.Message;
  end;
end;

function TfrmFTP.EnviarFTP(psArq:string):boolean;
  var sDe,sPara,sDir:string;
begin
  try
    frmMySqlFTP.btConFTP.Click;
    if frmMySqlFTP.ftp.Connected then
    begin
      sPara := ExtractFileName(psArq);
      sDe := psArq;
      sDir:='/Web/edi/central/bkp/';
      frmMySqlFTP.FTP.ChangeDir(sDir);
      frmMySqlFTP.ftp.Put(sDe, sPara);
      result := true;
    end;
  except
    result := false;
  end;
end;

procedure TfrmFTP.SpeedButton1Click(Sender: TObject);
begin
  EnviarFTP(flLocal.FileName);
end;

end.
