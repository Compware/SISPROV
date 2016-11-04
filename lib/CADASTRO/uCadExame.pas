unit uCadExame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, ComCtrls, Grids, DBGrids,
  StdCtrls, DBCtrls, ExtCtrls, RxDBComb, Mask;

type
  TfrmCadExame = class(TForm)
    TB_EXAME: TIBTable;
    TB_CONF_EXAME: TIBTable;
    TB_TIPO_RESULTADO: TIBTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    DBRichEdit1: TDBRichEdit;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    DBRichEdit2: TDBRichEdit;
    DBMemo1: TDBMemo;
    Splitter1: TSplitter;
    DBNavigator2: TDBNavigator;
    Label1: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    DBNavigator3: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadExame: TfrmCadExame;

implementation

uses UDM;

{$R *.dfm}

procedure TfrmCadExame.FormCreate(Sender: TObject);
begin
  TB_EXAME.Open;
  TB_TIPO_RESULTADO.Open;
  TB_CONF_EXAME.Open;
end;

procedure TfrmCadExame.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TB_EXAME.Close;
  TB_TIPO_RESULTADO.Close;
  TB_CONF_EXAME.Close;
end;

end.
