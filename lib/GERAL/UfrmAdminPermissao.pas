unit UfrmAdminPermissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, IBTable, DBCtrls, Grids, DBGrids,
  StdCtrls, ExtCtrls;

type
  TfrmAdminPermissao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBLookupListBox1: TDBLookupListBox;
    Permissao: TDataSource;
    Modulos: TDataSource;
    tbpermissao: TIBTable;
    qymodulo: TIBQuery;
    tbpermissaoCD_PERMISSAO: TIntegerField;
    tbpermissaoCD_UND: TIntegerField;
    tbpermissaoDS_MODULO: TIBStringField;
    tbpermissaoDS_PERMISSAO: TIBStringField;
    tbpermissaoDT_EXP: TDateTimeField;
    tbpermissaoCD_EDI: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure tbpermissaoAfterDelete(DataSet: TDataSet);
    procedure tbpermissaoAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbpermissaoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminPermissao: TfrmAdminPermissao;

implementation

Uses
  UDM,UDMGERAL, UGERAL;

{$R *.dfm}

procedure TfrmAdminPermissao.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAdminPermissao.tbpermissaoAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TfrmAdminPermissao.tbpermissaoAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TfrmAdminPermissao.FormCreate(Sender: TObject);
begin
  tbPermissao.Open;
  qyModulo.Open;
end;

procedure TfrmAdminPermissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tbPermissao.Close;
  qyModulo.Close;
end;

procedure TfrmAdminPermissao.tbpermissaoAfterInsert(DataSet: TDataSet);
begin
  tbpermissao.FieldByName('CD_UND').AsString := prmUnidade;
end;

end.
