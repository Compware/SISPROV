unit uConsProdutividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBClient, DBLocal, DBLocalI, DB, IBCustomDataSet, IBQuery,
  DBCtrls, StdCtrls, Grids, DBGrids;

type
  TfrmConsProdutividade = class(TForm)
    qyAgenda: TIBQuery;
    qyHistorico: TIBQuery;
    TB_PRODUTIVIDADE: TIBClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    TB_PRODUTIVIDADEQTDE: TIntegerField;
    TB_PRODUTIVIDADEMESANO: TIntegerField;
    TB_PRODUTIVIDADECD_MEDICO: TIntegerField;
    TB_PRODUTIVIDADENM_MEDICO: TStringField;
    Button1: TButton;
    qyMedico: TIBQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    dsMedico: TDataSource;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    DBGrid3: TDBGrid;
    DataSource3: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsProdutividade: TfrmConsProdutividade;

implementation

uses UDMDIG, UDM;

{$R *.dfm}

procedure TfrmConsProdutividade.Button1Click(Sender: TObject);
begin
  TB_PRODUTIVIDADE.CreateDataSet;
  while not qyAgenda.Eof do
  begin
    TB_PRODUTIVIDADE.Insert;
    TB_PRODUTIVIDADEQTDE.AsInteger := qyAgenda.FieldByName('CNT').AsInteger;
    TB_PRODUTIVIDADEMESANO.AsInteger := qyAgenda.FieldByName('MESANO').AsInteger;
    TB_PRODUTIVIDADECD_MEDICO.AsInteger := qyAgenda.FieldByName('CD_MEDICO').AsInteger;
    TB_PRODUTIVIDADENM_MEDICO.AsString := qyAgenda.FieldByName('NM_MEDICO').AsString;
    TB_PRODUTIVIDADE.Post;
  end;

  while not qyHistorico.Eof do
  begin
    //qyHistorico
    //TB_PRODUTIVIDADE.Locate('')
    TB_PRODUTIVIDADE.Insert;
    TB_PRODUTIVIDADEQTDE.AsInteger := qyAgenda.FieldByName('CNT').AsInteger;
    TB_PRODUTIVIDADEMESANO.AsInteger := qyAgenda.FieldByName('MESANO').AsInteger;
    TB_PRODUTIVIDADECD_MEDICO.AsInteger := qyAgenda.FieldByName('CD_MEDICO').AsInteger;
    TB_PRODUTIVIDADENM_MEDICO.AsString := qyAgenda.FieldByName('NM_MEDICO').AsString;
    TB_PRODUTIVIDADE.Post;
  end;
end;

end.
