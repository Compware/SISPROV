unit UCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, ExtDlgs, DBCtrls, Mask, dxDBTLCl,
  dxGrClms, IBCustomDataSet, dxEditor, dxEdLib, dxDBELib, dxDBEdtr, Grids,
  DBGrids, jpeg, RpBase, RpSystem, RpCon, RpConDS, RpDefine, RpRave;

type
  TfrmCadProduto = class(TfrmCadPad)
    dsProduto: TDataSource;
    tbproduto: TIBDataSet;
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    grDadosColumn3: TdxDBGridColumn;
    grDadosColumn4: TdxDBGridCurrencyColumn;
    grDadosColumn5: TdxDBGridCurrencyColumn;
    Label1: TLabel;
    edCodigo: TDBEdit;
    Label2: TLabel;
    edNome: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ckAtivo: TDBCheckBox;
    pnPhoto: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    btClearImagem: TSpeedButton;
    btImagem: TSpeedButton;
    edPrecoVenda: TdxDBCurrencyEdit;
    edPrecoCusto: TdxDBCurrencyEdit;
    ckSerie: TDBCheckBox;
    edFamilia: TdxDBButtonEdit;
    edGrupo: TdxDBButtonEdit;
    Label6: TLabel;
    Label7: TLabel;
    edUnidade: TdxDBLookupEdit;
    dsUnidade: TDataSource;
    gpNumeros: TGroupBox;
    tbNumeros: TIBDataSet;
    tbNumerosCD_PRODUTO: TIntegerField;
    tbNumerosNR_PRODUTO: TIBStringField;
    tbNumerosFL_PRINCIPAL: TIBStringField;
    tbNumerosTP_NUMERO: TIBStringField;
    dsNumeros: TDataSource;
    tbprodutoCD_PRODUTO: TIntegerField;
    tbprodutoDS_PRODUTO: TIBStringField;
    tbprodutoSG_UNIDADE: TIBStringField;
    tbprodutoCD_FAMILIA: TIntegerField;
    tbprodutoCD_GRUPO: TIntegerField;
    tbprodutoBL_IMAGEM: TBlobField;
    tbprodutoVL_PRECO_VENDA: TIBBCDField;
    tbprodutoVL_PRECO_CUSTO: TIBBCDField;
    tbprodutoFL_ATIVO: TIBStringField;
    tbprodutoFL_SERIE: TIBStringField;
    tbprodutoDS_FAMILIA: TIBStringField;
    tbprodutoDS_GRUPO: TIBStringField;
    tbprodutoTP_NUMERO: TIBStringField;
    tbprodutoNR_PRODUTO: TIBStringField;
    grNumero: TDBGrid;
    ckPrincipalNumero: TDBCheckBox;
    tbprodutoCD_EMPRESA: TIntegerField;
    tbNumerosCD_EMPRESA: TIntegerField;
    grDadosColumn6: TdxDBGridColumn;
    grDadosColumn7: TdxDBGridColumn;
    tbprodutoFL_LOTE: TIBStringField;
    ckLote: TDBCheckBox;
    Photo: TImage;
    btExcluirNumero: TSpeedButton;
    btNovoNumero: TSpeedButton;
    gpFornecedor: TGroupBox;
    btExcluirFornecedor: TSpeedButton;
    btNovoForcecedor: TSpeedButton;
    grFornecedor: TDBGrid;
    ckPrincipalFornecedor: TDBCheckBox;
    tbFornecedor: TIBDataSet;
    tbFornecedorCD_PRODUTO: TIntegerField;
    tbFornecedorCD_FORNECEDOR: TIBStringField;
    tbFornecedorNM_FORNECEDOR: TIBStringField;
    tbFornecedorFL_PRINCIPAL: TIBStringField;
    tbFornecedorCD_EMPRESA: TIntegerField;
    dsFornecedor: TDataSource;
    tbFornecedorCD_PROFOR: TIntegerField;
    rvPrjProdutos: TRvProject;
    rvDsProdutos: TRvDataSetConnection;
    rvSysProdutos: TRvSystem;
    rvDsConfRel: TRvDataSetConnection;
    tbprodutoCD_EMPRESA_ORIGEM: TIntegerField;
    tbprodutoCD_EDI: TIntegerField;
    tbprodutoNM_USUARIO: TIBStringField;
    tbprodutoDT_CADASTRO: TDateTimeField;
    tbprodutoTP_EDI: TIBStringField;
    ckComposto: TDBCheckBox;
    tbprodutoFL_COMPOSTO: TIBStringField;
    DBCheckBox1: TDBCheckBox;
    tbprodutoFL_PRODUCAO: TIBStringField;
    procedure btImagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbprodutoAfterDelete(DataSet: TDataSet);
    procedure tbprodutoAfterPost(DataSet: TDataSet);
    procedure tbprodutoBeforeDelete(DataSet: TDataSet);
    procedure btIncluirClick(Sender: TObject);
    procedure tbNumerosAfterDelete(DataSet: TDataSet);
    procedure tbNumerosAfterPost(DataSet: TDataSet);
    procedure tbNumerosBeforeDelete(DataSet: TDataSet);
    procedure tbNumerosAfterInsert(DataSet: TDataSet);
    procedure edFamiliaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edGrupoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btClearImagemClick(Sender: TObject);
    procedure tbprodutoAfterInsert(DataSet: TDataSet);
    procedure btPesquisarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure tbprodutoAfterOpen(DataSet: TDataSet);
    procedure tbprodutoAfterClose(DataSet: TDataSet);
    procedure tbprodutoAfterScroll(DataSet: TDataSet);
    procedure btNovoNumeroClick(Sender: TObject);
    procedure btExcluirNumeroClick(Sender: TObject);
    procedure btNovoForcecedorClick(Sender: TObject);
    procedure btExcluirFornecedorClick(Sender: TObject);
    procedure tbFornecedorAfterDelete(DataSet: TDataSet);
    procedure tbFornecedorAfterInsert(DataSet: TDataSet);
    procedure tbFornecedorAfterPost(DataSet: TDataSet);
    procedure tbFornecedorBeforeDelete(DataSet: TDataSet);
    procedure ckPrincipalFornecedorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dsFornecedorStateChange(Sender: TObject);
    procedure dsNumerosStateChange(Sender: TObject);
    procedure ckPrincipalNumeroMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btimprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNumerosBeforeEdit(DataSet: TDataSet);
    procedure tbNumerosBeforeInsert(DataSet: TDataSet);
    procedure tbFornecedorBeforeInsert(DataSet: TDataSet);
    procedure tbFornecedorBeforeEdit(DataSet: TDataSet);
    procedure tbNumerosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tbFornecedorPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses
  UDM, UDMGERAL, UfrmLocalizar, UGeralSQL, UGeral, UDMRelatorios;

{$R *.dfm}

procedure TfrmCadProduto.btImagemClick(Sender: TObject);
var
  FileStream: TFileStream;
  BlobStream: TStream;

  //Converte BMP para JPG.
  //Acrescente JPeg na Lista de Uses do Form.
  procedure ConverteBMPparaJPG(NomeArq: String; QualidadeJPG: Integer);
  Var BitMap: TBitMap;
      JPeg : TJPegImage;
  begin
    BitMap:=TBitMap.Create;
    JPeg:=TJpegImage.Create;
    Try
      BitMap.LoadFromFile(NomeArq);
      With JPeg do begin
        CompressionQuality :=QualidadeJPG; //100=Sem compactacao(Maior Qualidade, 0=Compactacao Maxima(Menor qualidade)
        Assign(BitMap);
        Compress;
        SaveToStream(BlobStream);
      end;
    Finally
      BitMap.Free;
      JPeg.Free;
    end;
  end;
begin
  inherited;
  if not (tbProduto.State in [dsEdit,dsInsert]) then
    tbProduto.Edit;

  if OpenPictureDialog1.Execute then
  begin
     BlobStream := tbProduto.CreateBlobStream(tbProdutoBL_IMAGEM,bmWrite);
     if UpperCase(ExtractFileExt(OpenPictureDialog1.FileName))='.JPG' then
     begin
       FileStream := TFileStream.Create(OpenPictureDialog1.FileName,fmOpenRead or fmShareDenyNone);
       BlobStream.CopyFrom(FileStream,FileStream.Size);
       FileStream.Free;
     end;

     if UpperCase(ExtractFileExt(OpenPictureDialog1.FileName))='.BMP' then
       ConverteBMPparaJPG(OpenPictureDialog1.FileName,100);

     BlobStream.Free;
     tbprodutoAfterScroll(tbProduto);
  end;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;

  btIncluir.Enabled := true;
  btexcluir.Enabled := true;
  bteditar.Enabled := true;
  btgravar.Enabled := false;
  btimprimir.Enabled := true;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
  btPesquisar.Enabled := true;
  btImagem.Enabled := false;
  btClearImagem.Enabled := false;
  edFamilia.Buttons[0].Visible := false;
  edgrupo.Buttons[0].Visible := false;
  dsControle.AutoEdit := false;
  dsProduto.AutoEdit := false;
  //dsNumeros.AutoEdit := false;
  //dsFornecedor.AutoEdit := false;
  tabLista.TabVisible := true;

  btNovoForcecedor.Enabled := false;
  btExcluirFornecedor.Enabled := false;
  btNovoNumero.Enabled := false;
  btExcluirNumero.Enabled := false;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsProduto.DataSet.Close;
  dsUnidade.DataSet.close;
  dsNumeros.DataSet.close;
  dsFornecedor.DataSet.close;

end;

procedure TfrmCadProduto.tbprodutoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadProduto.tbprodutoAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadProduto.tbprodutoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  DM.ConfirmaDelecao;
end;

procedure TfrmCadProduto.btIncluirClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := true;
  btClearImagem.Enabled := true;
  edFamilia.Buttons[0].Visible := true;
  edgrupo.Buttons[0].Visible := true;

  btNovoForcecedor.Enabled := true;
  btExcluirFornecedor.Enabled := true;
  btNovoNumero.Enabled := true;
  btExcluirNumero.Enabled := true;

  edNome.SetFocus;
end;

procedure TfrmCadProduto.tbNumerosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadProduto.tbNumerosAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadProduto.tbNumerosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if not(dsControle.State in dsEditModes) then
    Abort;  
  DM.ConfirmaDelecao;
end;

procedure TfrmCadProduto.tbNumerosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbNumerosCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  tbNumerosCD_PRODUTO.AsInteger := tbProdutoCD_PRODUTO.AsInteger;
  if tbNumeros.RecNo = 1 then
    tbNumerosFL_PRINCIPAL.AsString := 'S'
  else
    tbNumerosFL_PRINCIPAL.AsString := 'N';
end;

procedure TfrmCadProduto.edFamiliaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if not (tbProduto.State in [dsEdit,dsInsert]) then
    tbProduto.Edit;

  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Família';
  frmLocalizar.qyDados.sql.add('select CD_Familia, DS_Familia from FAMILIA');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='CD_FAMILIA';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Família';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbprodutoCD_FAMILIA.AsInteger := frmLocalizar.qyDados.FieldByname('CD_FAMILIA').AsInteger;
    tbprodutoDS_FAMILIA.AsString := frmLocalizar.qyDados.FieldByname('DS_FAMILIA').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadProduto.edGrupoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if not (tbProduto.State in [dsEdit,dsInsert]) then
    tbProduto.Edit;

  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Grupo';
  frmLocalizar.qyDados.sql.add('select CD_GRUPO, DS_GRUPO from GRUPO');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='CD_GRUPO';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Grupo';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbprodutoCD_GRUPO.AsInteger := frmLocalizar.qyDados.FieldByname('CD_GRUPO').AsInteger;
    tbprodutoDS_GRUPO.AsString := frmLocalizar.qyDados.FieldByname('DS_GRUPO').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadProduto.btClearImagemClick(Sender: TObject);
begin
  inherited;
  tbProdutoBL_IMAGEM.Clear;
  Photo.Picture := nil;
end;

procedure TfrmCadProduto.tbprodutoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbprodutoCD_EMPRESA.AsInteger := DMGERAL.qyDadosEmpresaCD_EMPRESA.AsInteger;
  tbprodutoFL_ATIVO.AsString := cvSim;
  tbprodutoFL_SERIE.AsString := cvNao;
  tbprodutoFL_LOTE.AsString := cvNao;
  tbprodutoFL_COMPOSTO.AsString := cvNao;
  tbprodutoFL_PRODUCAO.AsString := cvNao;
  tbprodutoCD_EDI.AsInteger := 0;
  tbprodutoTP_EDI.AsString := 'I';
  tbNumeros.Insert;
  tbNumerosNR_PRODUTO.AsInteger := tbProdutoCD_PRODUTO.AsInteger;
  tbNumerosTP_NUMERO.AsString := cvTNChamada;
  tbNumeros.Post;
end;

procedure TfrmCadProduto.btPesquisarClick(Sender: TObject);
begin
  inherited;
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Produto';
  frmLocalizar.qyDados:=SelectDadosProduto;
  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='CD_PRODUTO';
    SetLength(VCampo,5);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Produto';
    VCampo[2].Titulo  := 'Unidade';
    VCampo[3].Titulo  := 'Família';
    VCampo[4].Titulo  := 'Grupo';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := True;
    VCampo[3].Visivel := True;
    VCampo[4].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbProduto.Locate('cd_produto', frmLocalizar.qyDados.FieldByname('cd_produto').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadProduto.btexcluirClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := false;
  btClearImagem.Enabled := false;
  edFamilia.Buttons[0].Visible := false;
  edgrupo.Buttons[0].Visible := false;

  btNovoForcecedor.Enabled := false;
  btExcluirFornecedor.Enabled := false;
  btNovoNumero.Enabled := false;
  btExcluirNumero.Enabled := false;  
end;

procedure TfrmCadProduto.bteditarClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := true;
  btClearImagem.Enabled := true;
  edFamilia.Buttons[0].Visible := true;
  edgrupo.Buttons[0].Visible := true;

  btNovoForcecedor.Enabled := true;
  btExcluirFornecedor.Enabled := true;
  btNovoNumero.Enabled := true;
  btExcluirNumero.Enabled := true;

  edNome.SetFocus;
end;

procedure TfrmCadProduto.btgravarClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := false;
  btClearImagem.Enabled := false;
  edFamilia.Buttons[0].Visible := false;
  edgrupo.Buttons[0].Visible := false;

  btNovoForcecedor.Enabled := false;
  btExcluirFornecedor.Enabled := false;
  btNovoNumero.Enabled := false;
  btExcluirNumero.Enabled := false;
end;

procedure TfrmCadProduto.tbprodutoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsUnidade.DataSet.Open;
  dsNumeros.DataSet.Open;
  dsFornecedor.DataSet.Open;
end;

procedure TfrmCadProduto.tbprodutoAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsUnidade.DataSet.Close;
  dsNumeros.DataSet.Close;
  dsFornecedor.DataSet.Close;
end;

procedure TfrmCadProduto.tbprodutoAfterScroll(DataSet: TDataSet);
var
  JpegImage: TJPEGImage;
  BlobStream: TStream;
begin
  inherited;
  if (not tbProdutoBL_IMAGEM.IsNull) then
    begin
      try
        BlobStream := tbProduto.CreateBlobStream(tbProdutoBL_IMAGEM,bmRead);

        JpegImage := TJPEGImage.Create;
        try
          JpegImage.LoadFromStream(BlobStream);
          Photo.Picture.Assign(JpegImage);
          Photo.Visible := True;
        finally
          JpegImage.Free;
        end;

      finally
        BlobStream.Free;
      end;
    end
  else
    Photo.Visible := False;
end;

procedure TfrmCadProduto.btNovoNumeroClick(Sender: TObject);
begin
  inherited;
  tbNumeros.Insert;
end;

procedure TfrmCadProduto.btExcluirNumeroClick(Sender: TObject);
begin
  inherited;
  tbNumeros.delete;
end;

procedure TfrmCadProduto.btNovoForcecedorClick(Sender: TObject);
begin
  inherited;
  tbFornecedor.Insert;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Fornecedor';
  frmLocalizar.qyDados.sql.add('select CD_PESSOA, NM_PESSOA from PESSOA');
  frmLocalizar.qyDados.sql.add('where FL_ATIVO = '+ quotedStr(cvSim));
  frmLocalizar.qyDados.sql.add('and TP_PESSOA = '+ quotedStr(cvFornecedor));

  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Fornecedor';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbFornecedorCD_FORNECEDOR.ASInteger := frmLocalizar.qyDados.FieldByname('CD_PESSOA').AsInteger;
    tbFornecedorNM_FORNECEDOR.ASString := frmLocalizar.qyDados.FieldByname('NM_PESSOA').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;

end;

procedure TfrmCadProduto.btExcluirFornecedorClick(Sender: TObject);
begin
  inherited;
  tbFornecedor.Delete;
end;

procedure TfrmCadProduto.tbFornecedorAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadProduto.tbFornecedorAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbFornecedorCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  tbFornecedorCD_PRODUTO.AsInteger := tbProdutoCD_PRODUTO.AsInteger;
  if tbFornecedor.RecNo = 1 then
    tbFornecedorFL_PRINCIPAL.AsString := 'S'
  else
    tbFornecedorFL_PRINCIPAL.AsString := 'N';

end;

procedure TfrmCadProduto.tbFornecedorAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadProduto.tbFornecedorBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if not(dsControle.State in dsEditModes) then
    Abort;  
  DM.ConfirmaDelecao;
end;

procedure TfrmCadProduto.ckPrincipalFornecedorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var bk : TBookmark;
begin
  inherited;

  //Percorre a lista aplicando Principal
  bk := tbFornecedor.GetBookmark;
  tbFornecedor.DisableControls;
  tbFornecedor.First;
  while not tbFornecedor.Eof do
  begin
     if tbFornecedorFL_PRINCIPAL.AsString = 'S' then
     begin
        tbFornecedor.Edit;
        tbFornecedorFL_PRINCIPAL.AsString := 'N';
     end;
     tbFornecedor.Next;
  end;
  tbFornecedor.GotoBookmark(bk);
  tbFornecedor.Edit;
  tbFornecedorFL_PRINCIPAL.AsString := 'S';
  tbFornecedor.EnableControls;
end;

procedure TfrmCadProduto.dsFornecedorStateChange(Sender: TObject);
begin
  inherited;
  //if (dsFornecedor.State in dsEditModes) then
  //   bteditarClick(Sender);
end;

procedure TfrmCadProduto.dsNumerosStateChange(Sender: TObject);
begin
  inherited;
  //if (dsNumeros.State in dsEditModes) then
  //   bteditarClick(Sender);
end;

procedure TfrmCadProduto.ckPrincipalNumeroMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var bk : TBookmark;
begin
  inherited;

  //Percorre a lista aplicando Principal
  bk := tbNumeros.GetBookmark;
  tbNumeros.DisableControls;
  tbNumeros.First;
  while not tbNumeros.Eof do
  begin
     if tbNumerosFL_PRINCIPAL.AsString = 'S' then
     begin
        tbNumeros.Edit;
        tbNumerosFL_PRINCIPAL.AsString := 'N';
     end;
     tbNumeros.Next;
  end;
  tbNumeros.GotoBookmark(bk);
  tbNumeros.Edit;
  tbNumerosFL_PRINCIPAL.AsString := 'S';
  tbNumeros.EnableControls;
end;

procedure TfrmCadProduto.btimprimirClick(Sender: TObject);
begin
  inherited;
  rvPrjProdutos.Execute;
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  RvPrjProdutos.ProjectFile := sPathLayout +'\RelListagemProdutos.rav';
end;

procedure TfrmCadProduto.tbNumerosBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if not(dsControle.State in dsEditModes) then
    Abort;
end;

procedure TfrmCadProduto.tbNumerosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not(dsControle.State in dsEditModes) then
    Abort;
end;

procedure TfrmCadProduto.tbFornecedorBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not(dsControle.State in dsEditModes) then
    Abort;
end;

procedure TfrmCadProduto.tbFornecedorBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if not(dsControle.State in dsEditModes) then
    Abort;
end;

procedure TfrmCadProduto.tbNumerosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  Action := daAbort;
  DataSet.Cancel;
end;

procedure TfrmCadProduto.tbFornecedorPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  Action := daAbort;
  DataSet.Cancel;
end;

end.
