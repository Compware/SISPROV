unit uMySqlFTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZConnection, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  ZSqlUpdate, ExtCtrls, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP;

type
  TfrmMySqlFTP = class(TForm)
    Connection: TZConnection;
    DataSource1: TDataSource;
    ZQuery1: TZQuery;
    pgGeral: TPageControl;
    tabConexao: TTabSheet;
    tabFTP: TTabSheet;
    btCon: TButton;
    ckDB: TCheckBox;
    Label3: TLabel;
    edHost: TEdit;
    Label4: TLabel;
    edUsu: TEdit;
    Label5: TLabel;
    edSenha: TEdit;
    Label6: TLabel;
    edBase: TEdit;
    ZQuery2: TZQuery;
    DataSource2: TDataSource;
    ckFTP: TCheckBox;
    btConFTP: TButton;
    Label1: TLabel;
    edHostFtp: TEdit;
    edUsuFTP: TEdit;
    Label2: TLabel;
    edSenhaFTP: TEdit;
    Label7: TLabel;
    FTP: TIdFTP;
    procedure btConClick(Sender: TObject);
    procedure ConnectionAfterConnect(Sender: TObject);
    procedure btConFTPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMySqlFTP: TfrmMySqlFTP;

implementation

{$R *.dfm}

procedure TfrmMySqlFTP.btConClick(Sender: TObject);
begin
  Connection.Disconnect;
  Connection.Protocol := 'mysql';
  Connection.HostName := edHost.Text;
  Connection.Database := edBase.Text;
  Connection.User := edUsu.Text;
  Connection.Password := edSenha.Text;
  Connection.Connect;
end;

procedure TfrmMySqlFTP.ConnectionAfterConnect(Sender: TObject);
begin
   ckDB.Checked := Connection.Connected;
end;

procedure TfrmMySqlFTP.btConFTPClick(Sender: TObject);
begin
  //Setando os dados do Servidor FTP...

  FTP.Host    := edHostFtp.Text;
  FTP.Username:= edUsuFTP.Text;
  FTP.Password:= edSenhaFTP.Text;
  {
  FTP.Host    := 'ftp.vertrou.info';
  FTP.Username:= 'vertrou';
  FTP.Password:= 'lilian';
  }
  FTP.Connect;
  ckFTP.Checked := FTP.Connected;
end;

end.
