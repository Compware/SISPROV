unit UDMProducao;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmProducao = class(TDataModule)
    TB_OPERACAO_PRODUCAO: TIBDataSet;
    TB_OPERACAO_PRODUCAOCD_OPERACAO_PRODUCAO: TIntegerField;
    TB_OPERACAO_PRODUCAODS_OPERACAO: TIBStringField;
    TB_OPERACAO_PRODUCAOFL_ATIVO: TIBStringField;
    TB_OPERACAO_PRODUCAOCD_EMPRESA: TIntegerField;
    TB_OPERACAO_PRODUTO: TIBDataSet;
    TB_OPERACAO_PRODUTOCD_OPERACAO_PRODUTO: TIntegerField;
    TB_OPERACAO_PRODUTOCD_PRODUTO: TIntegerField;
    TB_OPERACAO_PRODUTOCD_OPERACAO: TIntegerField;
    TB_OPERACAO_PRODUTONR_SEQUENCIA: TIntegerField;
    TB_OPERACAO_PRODUTOVL_TEMPO: TIntegerField;
    TB_OPERACAO_PRODUTONM_RESPONSAVEL: TIBStringField;
    TB_OPERACAO_PRODUTOFL_ATIVO: TIBStringField;
    TB_OPERACAO_PRODUTOCD_EMPRESA: TIntegerField;
    TB_OPERACAO_PRODUTODS_PRODUTO: TIBStringField;
    TB_OPERACAO_PRODUTODS_OPERACAO: TIBStringField;
    dsProducao: TDataSource;
    TB_OPERACAO_PRODUTO_MAT: TIBDataSet;
    TB_OPERACAO_PRODUTO_MATCD_OPERACAO_PRODUTO_MAT: TIntegerField;
    TB_OPERACAO_PRODUTO_MATCD_OPERACAO_PRODUTO: TIntegerField;
    TB_OPERACAO_PRODUTO_MATCD_PRODUTO: TIntegerField;
    TB_OPERACAO_PRODUTO_MATNR_QUANTIDADE: TIntegerField;
    TB_OPERACAO_PRODUTO_MATCD_EMPRESA: TIntegerField;
    TB_OPERACAO_PRODUTO_MATDS_PRODUTO: TIBStringField;
    TB_ORDEM_SERVICO: TIBDataSet;
    TB_ORDEM_SERVICOCD_ORDEM_SERVICO: TIntegerField;
    TB_ORDEM_SERVICODT_ORDEM: TDateField;
    TB_ORDEM_SERVICODT_INICIO_PREVISTO: TDateField;
    TB_ORDEM_SERVICODT_INICIO_REAL: TDateTimeField;
    TB_ORDEM_SERVICOCD_PEDIDO: TIntegerField;
    TB_ORDEM_SERVICOCD_STATUS: TIntegerField;
    TB_ORDEM_SERVICOCD_EMPRESA: TIntegerField;
    TB_OPERACAO_OS: TIBDataSet;
    TB_OPERACAO_OSCD_OPERACAO_OS: TIntegerField;
    TB_OPERACAO_OSCD_OS: TIntegerField;
    TB_OPERACAO_OSCD_OPERACAO_PRODUTO: TIntegerField;
    TB_OPERACAO_OSNR_SEQUENCIA: TIntegerField;
    TB_OPERACAO_OSCD_EMPRESA: TIntegerField;
    TB_MATERIAL_OS: TIBDataSet;
    TB_MATERIAL_OSCD_MATERIAL_OS: TIntegerField;
    TB_MATERIAL_OSCD_OPERACAO_OS: TIntegerField;
    TB_MATERIAL_OSCD_OS: TIntegerField;
    TB_MATERIAL_OSCD_PRODUTO: TIntegerField;
    TB_MATERIAL_OSNR_QUANTIDADE: TIntegerField;
    TB_MATERIAL_OSCD_EMPRESA: TIntegerField;
    qyProducao: TIBQuery;
    dsOperacaoProduto: TDataSource;
    TB_ESTRUTURA: TIBDataSet;
    TB_ESTRUTURACD_PRODUTO: TIntegerField;
    TB_ESTRUTURACD_PRODUTO_PAI: TIntegerField;
    TB_ESTRUTURADS_PRODUTO: TIBStringField;
    TB_ESTRUTURADS_PRODUTO_PAI: TIBStringField;
    TB_ESTRUTURACD_UNIDADE: TIBStringField;
    TB_ESTRUTURASG_UNIDADE: TIBStringField;
    TB_ESTRUTURAQT_PRODUTO: TFloatField;
    TB_ESTRUTURANR_NIVEL: TIntegerField;
    qyEstrutura: TIBQuery;
    qyEstruturaCD_PRODUTO: TIntegerField;
    qyEstruturaDS_PRODUTO: TIBStringField;
    TB_OS_PRODUTO: TIBDataSet;
    dsOs: TDataSource;
    TB_OS_PRODUTOCD_ORDEM_SERVICO: TIntegerField;
    TB_OS_PRODUTOCD_OS_PRODUTO: TIntegerField;
    TB_OS_PRODUTOCD_PRODUTO: TIntegerField;
    TB_OS_PRODUTODS_PRODUTO: TIBStringField;
    qyProducaoCD_PRODUTO: TIntegerField;
    qyProducaoDS_PRODUTO: TIBStringField;
    TB_OPERACAO_OSDS_OPERACAO: TIBStringField;
    dsOsProduto: TDataSource;
    dsOperacaoOS: TDataSource;
    TB_MATERIAL_OSDS_PRODUTO: TIBStringField;
    TB_OPERACAO_OSCD_OPERACAO: TIntegerField;
    TB_OPERACAO_OSCD_PRODUTO: TIntegerField;
    TB_OPERACAO_OSCD_USU_RESP: TIntegerField;
    TB_OPERACAO_OSNM_USUARIO: TIBStringField;
    TB_OPERACAO_PRODUCAOCD_LOCAL: TIntegerField;
    TB_OPERACAO_PRODUCAOFL_MOVIMENTA_ESTOQUE: TIBStringField;
    TB_OPERACAO_PRODUCAONM_LOCAL: TIBStringField;
    TB_OPERACAO_PRODUTOCD_USU_RESP: TIntegerField;
    TB_OPERACAO_PRODUTOCD_LOCAL: TIntegerField;
    TB_OPERACAO_PRODUTOFL_MOVIMENTA_ESTOQUE: TIBStringField;
    TB_OPERACAO_PRODUTONM_LOCAL: TIBStringField;
    TB_OPERACAO_OSCD_LOCAL: TIntegerField;
    TB_OPERACAO_OSFL_MOVIMENTA_ESTOQUE: TIBStringField;
    TB_OPERACAO_OSNM_LOCAL: TIBStringField;
    TB_OPERACAO_PRODUCAOCD_USU_RESP: TIntegerField;
    TB_OPERACAO_PRODUCAONM_USUARIO: TIBStringField;
    TB_ORDEM_SERVICODS_STATUS: TIBStringField;
    TB_OPERACAO_OSCD_STATUS: TIntegerField;
    qyProdutosNF: TIBQuery;
    qyProdutosNFCD_PRODUTO: TIntegerField;
    qyProdutosNFDS_PRODUTO: TIBStringField;
    TB_COMPOSTO: TIBDataSet;
    TB_COMPOSTOCD_COMPOSTO: TIntegerField;
    TB_COMPOSTODS_COMPOSTO: TIBStringField;
    TB_COMPOSTOCD_PRODUTO: TIntegerField;
    TB_COMPOSTODT_CADASTRO: TDateField;
    TB_COMPOSTOQT_QTDE: TFloatField;
    TB_COMPOSTOCD_EMPRESA: TIntegerField;
    qyEstruturaCompleta: TIBQuery;
    qyEstruturaCompletaCD_PRODUTO: TIntegerField;
    qyEstruturaCompletaCD_PRODUTO_PAI: TIntegerField;
    qyEstruturaCompletaDS_PRODUTO: TIBStringField;
    qyEstruturaCompletaDS_PRODUTO_PAI: TIBStringField;
    qyEstruturaCompletaCD_UNIDADE: TIBStringField;
    qyEstruturaCompletaSG_UNIDADE: TIBStringField;
    qyEstruturaCompletaQT_PRODUTO: TFloatField;
    qyEstruturaCompletaQT_TOTAL: TFloatField;
    qyEstruturaCompletaNR_NIVEL: TIntegerField;
    TB_OPERACAO_PRODUCAOFL_PRODUCAO: TIBStringField;
    TB_ORDEM_SERVICOQT_ORDEM: TFloatField;
    tbApontamentoOS: TIBDataSet;
    tbApontamentoOSCD_EMPRESA: TIntegerField;
    tbApontamentoOSCD_LOCAL: TIntegerField;
    tbApontamentoOSCD_OPERACAO: TIntegerField;
    tbApontamentoOSCD_OPERACAO_OS: TIntegerField;
    tbApontamentoOSCD_OPERACAO_PRODUTO: TIntegerField;
    tbApontamentoOSCD_OS: TIntegerField;
    tbApontamentoOSCD_PRODUTO: TIntegerField;
    tbApontamentoOSCD_STATUS: TIntegerField;
    tbApontamentoOSCD_USU_RESP: TIntegerField;
    tbApontamentoOSFL_MOVIMENTA_ESTOQUE: TIBStringField;
    tbApontamentoOSNR_SEQUENCIA: TIntegerField;
    tbApontamentoOSDS_STATUS: TIBStringField;
    tbApontamentoOSDS_OPERACAO: TIBStringField;
    tbApontamentoOSNM_USUARIO: TIBStringField;
    tbApontamentoOSNM_LOCAL: TIBStringField;
    tbApontamentoOSCD_PEDIDO: TIntegerField;
    tbApontamentoOSDT_INICIO_PREVISTO: TDateField;
    tbApontamentoOSDT_INICIO_REAL: TDateTimeField;
    tbApontamentoOSCD_ORDEM_SERVICO: TIntegerField;
    tbApontamentoOSDT_ORDEM: TDateField;
    tbApontamentoOSFL_PRODUCAO: TIBStringField;
    tbApontamentoOSQT_ORDEM: TFloatField;
    TB_MATERIAL_OSFL_PRODUCAO: TIBStringField;
    TB_COMPOSTOCD_PEDIDO: TIntegerField;
    qyProdutosNFQT_PRODUTO: TIntegerField;
    TB_OS_PRODUTOQT_PRODUTO: TFloatField;
    TB_OPERACAO_OSQT_PRODUTO: TFloatField;
    tbApontamentoOSQT_PRODUTO: TFloatField;
    procedure TB_OPERACAO_PRODUCAOAfterDelete(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUCAOAfterInsert(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUCAOAfterPost(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUCAOBeforeDelete(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTOAfterDelete(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTOAfterInsert(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTOAfterPost(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTOBeforeDelete(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTO_MATAfterDelete(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTO_MATAfterInsert(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTO_MATAfterPost(DataSet: TDataSet);
    procedure TB_OPERACAO_PRODUTO_MATBeforeDelete(DataSet: TDataSet);
    procedure TB_ORDEM_SERVICOAfterDelete(DataSet: TDataSet);
    procedure TB_ORDEM_SERVICOAfterInsert(DataSet: TDataSet);
    procedure TB_ORDEM_SERVICOAfterPost(DataSet: TDataSet);
    procedure TB_ORDEM_SERVICOBeforeDelete(DataSet: TDataSet);
    procedure TB_OPERACAO_OSAfterDelete(DataSet: TDataSet);
    procedure TB_OPERACAO_OSAfterInsert(DataSet: TDataSet);
    procedure TB_OPERACAO_OSAfterPost(DataSet: TDataSet);
    procedure TB_OPERACAO_OSBeforeDelete(DataSet: TDataSet);
    procedure TB_MATERIAL_OSAfterDelete(DataSet: TDataSet);
    procedure TB_MATERIAL_OSAfterInsert(DataSet: TDataSet);
    procedure TB_MATERIAL_OSAfterPost(DataSet: TDataSet);
    procedure TB_MATERIAL_OSBeforeDelete(DataSet: TDataSet);
    procedure TB_ESTRUTURAAfterDelete(DataSet: TDataSet);
    procedure TB_ESTRUTURAAfterPost(DataSet: TDataSet);
    procedure TB_OS_PRODUTOAfterDelete(DataSet: TDataSet);
    procedure TB_OS_PRODUTOAfterInsert(DataSet: TDataSet);
    procedure TB_COMPOSTOAfterDelete(DataSet: TDataSet);
    procedure TB_COMPOSTOAfterInsert(DataSet: TDataSet);
    procedure TB_COMPOSTOAfterPost(DataSet: TDataSet);
    procedure TB_COMPOSTOBeforeDelete(DataSet: TDataSet);
    procedure tbApontamentoOSAfterPost(DataSet: TDataSet);
    procedure tbApontamentoOSBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdicionaOperacoesOS;
    procedure AdicionaMaterialOs;
    procedure GeraOrdemServicoNF;
    procedure GeraMovimentoEstoquePC;
    procedure LancaProducao;
  end;

var
  dmProducao: TdmProducao;

implementation

uses UDMGERAL, UDM, UGeral, UGeralSQL;

{$R *.dfm}

procedure TdmProducao.TB_OPERACAO_PRODUCAOAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_PRODUCAOAfterInsert(DataSet: TDataSet);
begin
  //Empresa Principal
  TB_OPERACAO_PRODUCAOCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  TB_OPERACAO_PRODUCAOFL_ATIVO.AsString := cvSim;
  TB_OPERACAO_PRODUCAOFL_MOVIMENTA_ESTOQUE.AsString := cvNao;
  TB_OPERACAO_PRODUCAOFL_PRODUCAO.AsString := cvNao;
end;

procedure TdmProducao.TB_OPERACAO_PRODUCAOAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_PRODUCAOBeforeDelete(DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TdmProducao.TB_OPERACAO_PRODUTOAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_PRODUTOAfterInsert(DataSet: TDataSet);
begin
  TB_OPERACAO_PRODUTOCD_PRODUTO.AsInteger := qyProducao.FieldByname('CD_PRODUTO').AsInteger;
  //Empresa Principal
  TB_OPERACAO_PRODUTOCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  TB_OPERACAO_PRODUTOFL_ATIVO.AsString := cvSim;
end;

procedure TdmProducao.TB_OPERACAO_PRODUTOAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_PRODUTOBeforeDelete(DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TdmProducao.TB_OPERACAO_PRODUTO_MATAfterDelete(
  DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_PRODUTO_MATAfterInsert(
  DataSet: TDataSet);
begin
  TB_OPERACAO_PRODUTO_MATCD_OPERACAO_PRODUTO.AsInteger := TB_OPERACAO_PRODUTOCD_OPERACAO_PRODUTO.AsInteger;
  TB_OPERACAO_PRODUTO_MATCD_OPERACAO_PRODUTO_MAT.AsInteger := dm.GeraCodigo('GEN_OPERACAO_PRODUTO_MAT');
  //Empresa Principal
  TB_OPERACAO_PRODUTO_MATCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
end;

procedure TdmProducao.TB_OPERACAO_PRODUTO_MATAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_PRODUTO_MATBeforeDelete(
  DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TdmProducao.TB_ORDEM_SERVICOAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_ORDEM_SERVICOAfterInsert(DataSet: TDataSet);
begin
  //Empresa Principal
  TB_ORDEM_SERVICOCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  TB_ORDEM_SERVICOCD_STATUS.AsInteger := 1;
  TB_ORDEM_SERVICODS_STATUS.AsString := 'ABERTO';
  TB_ORDEM_SERVICODT_ORDEM.AsDateTime := Date;
end;

procedure TdmProducao.TB_ORDEM_SERVICOAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_ORDEM_SERVICOBeforeDelete(DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TdmProducao.TB_OPERACAO_OSAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_OSAfterInsert(DataSet: TDataSet);
begin
  TB_OPERACAO_OSCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  TB_OPERACAO_OSCD_OS.AsInteger := TB_OS_PRODUTOCD_ORDEM_SERVICO.AsInteger;
  TB_OPERACAO_OSCD_PRODUTO.AsInteger := TB_OS_PRODUTOCD_PRODUTO.AsInteger;
  TB_OPERACAO_OSCD_STATUS.AsInteger := 1;
end;

procedure TdmProducao.TB_OPERACAO_OSAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OPERACAO_OSBeforeDelete(DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TdmProducao.TB_MATERIAL_OSAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_MATERIAL_OSAfterInsert(DataSet: TDataSet);
begin
  //Empresa Principal
  TB_MATERIAL_OSCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  TB_MATERIAL_OSCD_OS.AsInteger := TB_OPERACAO_OSCD_OS.AsInteger;
  TB_MATERIAL_OSCD_OPERACAO_OS.AsInteger := TB_OPERACAO_OSCD_OPERACAO_OS.AsInteger;
end;

procedure TdmProducao.TB_MATERIAL_OSAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_MATERIAL_OSBeforeDelete(DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TdmProducao.TB_ESTRUTURAAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(Dataset);
end;

procedure TdmProducao.TB_ESTRUTURAAfterPost(DataSet: TDataSet);
begin
  DM.Commit(Dataset);
end;

procedure TdmProducao.TB_OS_PRODUTOAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_OS_PRODUTOAfterInsert(DataSet: TDataSet);
begin
  TB_OS_PRODUTOCD_ORDEM_SERVICO.AsInteger := TB_ORDEM_SERVICOCD_ORDEM_SERVICO.AsInteger;
end;

procedure TdmProducao.AdicionaOperacoesOS;
begin
  TB_OPERACAO_PRODUTO.Close;
  TB_OPERACAO_PRODUTO.DataSource := nil;
  try
    TB_OPERACAO_PRODUTO.Params.ByName('CD_PRODUTO').AsInteger := TB_OS_PRODUTOCD_PRODUTO.AsInteger;
    TB_OPERACAO_PRODUTO.Open;
    while not TB_OPERACAO_PRODUTO.Eof do
    begin
      try
        TB_OPERACAO_OS.Insert;
        TB_OPERACAO_OSCD_OPERACAO_PRODUTO.AsInteger := TB_OPERACAO_PRODUTOCD_OPERACAO_PRODUTO.AsInteger;
        TB_OPERACAO_OSNR_SEQUENCIA.AsInteger := TB_OPERACAO_PRODUTONR_SEQUENCIA.AsInteger;
        TB_OPERACAO_OSCD_USU_RESP.AsInteger := TB_OPERACAO_PRODUTOCD_USU_RESP.AsInteger;
        TB_OPERACAO_OSNM_USUARIO.AsString := TB_OPERACAO_PRODUTONM_RESPONSAVEL.AsString;
        TB_OPERACAO_OSCD_OPERACAO.AsInteger := TB_OPERACAO_PRODUTOCD_OPERACAO.AsInteger;
        TB_OPERACAO_OSDS_OPERACAO.AsString := TB_OPERACAO_PRODUTODS_OPERACAO.AsString;
        TB_OPERACAO_OSFL_MOVIMENTA_ESTOQUE.AsString := TB_OPERACAO_PRODUTOFL_MOVIMENTA_ESTOQUE.AsString;
        TB_OPERACAO_OSCD_LOCAL.AsInteger := TB_OPERACAO_PRODUTOCD_LOCAL.AsInteger;
        TB_OPERACAO_OSNM_LOCAL.AsString := TB_OPERACAO_PRODUTONM_LOCAL.AsString;
        TB_OPERACAO_OSQT_PRODUTO.AsFloat := TB_OS_PRODUTOQT_PRODUTO.AsFloat;
        TB_OPERACAO_OS.Post;
        AdicionaMaterialOs;
      except
        TB_OPERACAO_OS.Cancel;
      end;
      TB_OPERACAO_PRODUTO.Next;
    end;
  finally
    TB_OPERACAO_PRODUTO.Close;
    TB_OPERACAO_PRODUTO.DataSource := dsProducao;
  end;
end;

procedure TdmProducao.AdicionaMaterialOs;
begin
  try
    TB_OPERACAO_PRODUTO_MAT.Close;
    TB_OPERACAO_PRODUTO_MAT.Open;
    while not TB_OPERACAO_PRODUTO_MAT.Eof do
    begin
      try
        TB_MATERIAL_OS.Insert;
        TB_MATERIAL_OSCD_PRODUTO.AsInteger := TB_OPERACAO_PRODUTO_MATCD_PRODUTO.AsInteger;
        TB_MATERIAL_OSDS_PRODUTO.AsString := TB_OPERACAO_PRODUTO_MATDS_PRODUTO.AsString;
        TB_MATERIAL_OSNR_QUANTIDADE.AsFloat := (TB_OPERACAO_PRODUTO_MATNR_QUANTIDADE.AsFloat *
          TB_OPERACAO_OSQT_PRODUTO.AsFloat);
        TB_MATERIAL_OS.Post;
      except
        TB_MATERIAL_OS.Cancel;
      end;
      TB_OPERACAO_PRODUTO_MAT.Next;
    end;
  finally
    TB_OPERACAO_PRODUTO_MAT.Close;
  end;
end;

procedure TdmProducao.GeraOrdemServicoNF;
begin
  TB_ORDEM_SERVICO.Open;
  TB_OS_PRODUTO.Open;
  TB_OPERACAO_OS.Open;
  TB_MATERIAL_OS.Open;

  TB_ORDEM_SERVICO.Insert;
  TB_ORDEM_SERVICODT_ORDEM.AsDateTime := Date;
  TB_ORDEM_SERVICODT_INICIO_PREVISTO.AsDateTime := Date;
  TB_ORDEM_SERVICOCD_PEDIDO.AsInteger := dmGeral.TB_NFCD_NF.AsInteger;
  TB_ORDEM_SERVICO.Post;

  qyProdutosNF.Close;
  qyProdutosNF.ParamByName('CD_NF').AsInteger := dmGeral.TB_NFCD_NF.AsInteger;
  qyProdutosNF.Open;
  while not qyProdutosNF.Eof do
  begin
    dsOSProduto.DataSet.Insert;
    TB_OS_PRODUTOCD_PRODUTO.AsInteger := qyProdutosNFCD_PRODUTO.AsInteger;
    TB_OS_PRODUTOQT_PRODUTO.AsFloat := qyProdutosNFQT_PRODUTO.AsFloat;
    dsOSProduto.DataSet.Post;
    AdicionaOperacoesOS;
    qyProdutosNF.Next;
  end;

  qyProdutosNF.Close;
  TB_MATERIAL_OS.Close;
  TB_OPERACAO_OS.Close;
  TB_OS_PRODUTO.Close;
  TB_ORDEM_SERVICO.Close;
end;

procedure TdmProducao.TB_COMPOSTOAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_COMPOSTOAfterInsert(DataSet: TDataSet);
begin
  TB_COMPOSTOCD_EMPRESA.AsInteger := DMGERAL.qyDadosEmpresaCD_EMPRESA.AsInteger;
  TB_COMPOSTODT_CADASTRO.AsDateTime := DM.GetDate;
end;

procedure TdmProducao.TB_COMPOSTOAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmProducao.TB_COMPOSTOBeforeDelete(DataSet: TDataSet);
begin
  DM.ConfirmaDelecao;
end;

procedure TdmProducao.GeraMovimentoEstoquePC;
var
  int, calc, qtdeProduto:integer;
begin
  dmGeral.TB_ESTOQUE.Open;
  qyEstruturaCompleta.Close;
  qyEstruturaCompleta.ParamByName('CD_PRODUTO').AsInteger := TB_COMPOSTOCD_PRODUTO.AsInteger;
  qyEstruturaCompleta.ParamByName('QT_PRODUTO').AsFloat := TB_COMPOSTOQT_QTDE.AsFloat;
  qyEstruturaCompleta.Open;
  try
    //Da entrada do Pai no Estoque
    try
       dmGeral.TB_ESTOQUE.Insert;
       dmGeral.TB_ESTOQUECD_DOCUMENTO.AsInteger := TB_COMPOSTOCD_COMPOSTO.AsInteger;
       dmGeral.TB_ESTOQUETP_DOCUMENTO.AsString := cvDocProComposto;
       dmGeral.TB_ESTOQUECD_PRODUTO.AsInteger := TB_COMPOSTOCD_PRODUTO.asInteger;
       dmGeral.TB_ESTOQUEDS_PRODUTO.AsString := TB_COMPOSTODS_COMPOSTO.AsString;
       dmGeral.TB_ESTOQUEQT_ESTOQUE.AsFloat :=  TB_COMPOSTOQT_QTDE.AsFloat;
       dmGeral.TB_ESTOQUETP_MOVIMENTO.AsString := cvMovEntrada;
       {TODO:Tratar Local}
       dmGeral.TB_ESTOQUECD_LOCAL.AsInteger := 0;
       dmGeral.TB_ESTOQUE.Post;
    except
       dmGeral.TB_ESTOQUE.Cancel;
    end;

    //Da saida dos filhos do Estoque
    while Not qyEstruturaCompleta.Eof do
    begin
       try
         dmGeral.TB_ESTOQUE.Insert;
         dmGeral.TB_ESTOQUECD_DOCUMENTO.AsInteger := TB_COMPOSTOCD_COMPOSTO.AsInteger;
         dmGeral.TB_ESTOQUETP_DOCUMENTO.AsString := cvDocProComposto;
         dmGeral.TB_ESTOQUECD_PRODUTO.AsInteger := qyEstruturaCompletaCD_PRODUTO.asInteger;
         dmGeral.TB_ESTOQUEDS_PRODUTO.AsString := qyEstruturaCompletaDS_PRODUTO.AsString;
         dmGeral.TB_ESTOQUEQT_ESTOQUE.AsFloat :=  qyEstruturaCompletaQT_TOTAL.AsInteger;
         dmGeral.TB_ESTOQUETP_MOVIMENTO.AsString := cvMovSaida;
         {TODO:Tratar Local}
         dmGeral.TB_ESTOQUECD_LOCAL.AsInteger := 0;
         dmGeral.TB_ESTOQUE.Post;
       except
         dmGeral.TB_ESTOQUE.Cancel;
       end;
       qyEstruturaCompleta.Next;
    end;
  finally
      dmGeral.TB_ESTOQUE.Close;
      qyEstruturaCompleta.Close;
  end;
end;

procedure TdmProducao.LancaProducao;
begin
  try
    dsOperacaoOS.DataSet := tbApontamentoOS;
    TB_COMPOSTO.Open;
    TB_MATERIAL_OS.Open;
    while not TB_MATERIAL_OS.Eof do
    begin
      if (TB_MATERIAL_OSFL_PRODUCAO.AsString =  cvSim) then
      begin
        TB_COMPOSTO.Insert;
        TB_COMPOSTOCD_PRODUTO.AsInteger := TB_MATERIAL_OSCD_PRODUTO.AsInteger;
        TB_COMPOSTODS_COMPOSTO.AsString := TB_MATERIAL_OSDS_PRODUTO.AsString;
        TB_COMPOSTOQT_QTDE.AsFloat := (TB_MATERIAL_OSNR_QUANTIDADE.AsFloat);
        TB_COMPOSTOCD_PEDIDO.AsInteger := tbApontamentoOSCD_OPERACAO_OS.AsInteger;
        TB_COMPOSTO.Post;
        GeraMovimentoEstoquePC;
      end;
      TB_MATERIAL_OS.Next;
    end;
  finally
    TB_MATERIAL_OS.Close;
    TB_COMPOSTO.Close;
    dsOperacaoOS.DataSet := TB_OPERACAO_OS;
  end;
end;

procedure TdmProducao.tbApontamentoOSAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DATASET);
end;

procedure TdmProducao.tbApontamentoOSBeforeOpen(DataSet: TDataSet);
begin
  tbApontamentoOS.Params.ByName('CD_USUARIO').AsInteger := dm.qyLoginCD_USUARIO.AsInteger;
end;

end.
