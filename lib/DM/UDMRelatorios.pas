unit UDMRelatorios;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, RpDefine, RpCon, RpConDS,
  IBQuery;

type
  TDMRelatorios = class(TDataModule)
    rvDtConfRel: TRvDataSetConnection;
    rvDtParametros: TRvDataSetConnection;
    tbTmpParametro: TIBTable;
    tbTmpParametroCD_PARAMETRO: TIntegerField;
    tbTmpParametroVL_PARAMETRO1: TIBStringField;
    tbTmpParametroVL_PARAMETRO2: TIBStringField;
    tbTmpParametroVL_PARAMETRO3: TIBStringField;
    tbTmpParametroVL_PARAMETRO4: TIBStringField;
    tbTmpParametroVL_PARAMETRO5: TIBStringField;
    tbTmpParametroVL_PARAMETRO6: TIBStringField;
    tbTmpParametroVL_PARAMETRO7: TIBStringField;
    tbTmpParametroVL_PARAMETRO8: TIBStringField;
    tbTmpParametroVL_PARAMETRO9: TIBStringField;
    tbTmpParametroVL_PARAMETRO10: TIBStringField;
    qyConfRelatorio: TIBQuery;
    qyConfRelatorioCD_CONF_RELATORIO: TIntegerField;
    qyConfRelatorioCD_PESSOA: TIntegerField;
    qyConfRelatorioNM_PESSOA: TIBStringField;
    qyConfRelatorioBL_LOGO: TBlobField;
    qyConfRelatorioNR_DOCUMENTO: TIBStringField;
    qyConfRelatorioDS_ENDERECO: TIBStringField;
    qyConfRelatorioDS_BAIRRO: TIBStringField;
    qyConfRelatorioDS_CIDADE: TIBStringField;
    qyConfRelatorioNR_TELEFONE: TIBStringField;
    qyConfRelatorioCD_EMPRESA: TIntegerField;
    procedure qyConfRelatorioBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorios: TDMRelatorios;

implementation

uses UDM, UDMGERAL;

{$R *.dfm}

procedure TDMRelatorios.qyConfRelatorioBeforeOpen(DataSet: TDataSet);
begin
   qyConfRelatorio.ParamByName('CD_EMPRESA').AsInteger :=
     dmGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
end;

procedure TDMRelatorios.DataModuleCreate(Sender: TObject);
begin
  qyConfRelatorio.Open;
end;

procedure TDMRelatorios.DataModuleDestroy(Sender: TObject);
begin
  qyConfRelatorio.Close;
end;

end.
