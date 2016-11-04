unit UCadPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, IBCustomDataSet, DBCtrls, Mask,
  ExtDlgs, Grids, DBGrids, RpCon, RpConDS, RpBase, RpSystem, RpDefine,
  RpRave, Menus;

type
  TfrmCadPessoa = class(TfrmCadPad)
    tbTelefones: TIBDataSet;
    tbEndereco: TIBDataSet;
    tbDocumento: TIBDataSet;
    tbPessoa: TIBDataSet;
    dsPessoa: TDataSource;
    dsPessoaEnd: TDataSource;
    dsPessoaTel: TDataSource;
    dsPessoaDoc: TDataSource;
    tbTelefonesCD_PESSOA: TIntegerField;
    tbTelefonesCD_TELEFONE: TIntegerField;
    tbTelefonesNR_TELEFONE: TIBStringField;
    tbTelefonesTP_TELEFONE: TIBStringField;
    tbTelefonesFL_PRINCIPAL: TIBStringField;
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    grDadosColumn4: TdxDBGridColumn;
    grDadosColumn6: TdxDBGridColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    ckAtivo: TDBCheckBox;
    GroupBox1: TGroupBox;
    tcDocumento: TTabControl;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    GroupBox2: TGroupBox;
    tcEndereco: TTabControl;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    GroupBox3: TGroupBox;
    DBCheckBox3: TDBCheckBox;
    Panel5: TPanel;
    btImagem: TSpeedButton;
    btClearImagem: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    ckEmpresa: TDBCheckBox;
    DBGrid1: TDBGrid;
    DBCheckBox4: TDBCheckBox;
    DBImage1: TDBImage;
    tbTelefonesCD_EMPRESA: TIntegerField;
    RvPrjCliente: TRvProject;
    RvSysCliente: TRvSystem;
    RvDtCnCliente: TRvDataSetConnection;
    RvDtCnPessoaConfRel: TRvDataSetConnection;
    RvDtCnFornecedor: TRvDataSetConnection;
    RvSysFornecedor: TRvSystem;
    RvPrjFornecedor: TRvProject;
    grDadosColumn7: TdxDBGridColumn;
    grDadosColumn8: TdxDBGridColumn;
    grDadosColumn9: TdxDBGridColumn;
    RvDtCnTransportadora: TRvDataSetConnection;
    RvSysTransportadora: TRvSystem;
    RvPrjTransportadora: TRvProject;
    RvDtCnFuncionario: TRvDataSetConnection;
    RvSysFuncionario: TRvSystem;
    RvPrjFuncionario: TRvProject;
    RvDtCnEmpresa: TRvDataSetConnection;
    RvSysEmpresa: TRvSystem;
    RvPrjEmpresa: TRvProject;
    tbPessoaCD_PESSOA: TIntegerField;
    tbPessoaNM_PESSOA: TIBStringField;
    tbPessoaTP_PESSOA: TIBStringField;
    tbPessoaNR_DOCUMENTO: TIBStringField;
    tbPessoaTP_DOCUMENTO: TIBStringField;
    tbPessoaNR_TELEFONE: TIBStringField;
    tbPessoaTP_TELEFONE: TIBStringField;
    tbPessoaFL_ATIVO: TIBStringField;
    tbPessoaBL_IMAGEM: TBlobField;
    tbPessoaFL_PRINCIPAL: TIBStringField;
    tbPessoaFL_PADRAO: TIBStringField;
    tbPessoaCD_EMPRESA: TIntegerField;
    tbPessoaDS_ENDERECO: TIBStringField;
    tbPessoaDS_BAIRRO: TIBStringField;
    tbPessoaDS_CIDADE: TIBStringField;
    tbEnderecoCD_ENDERECO: TIntegerField;
    tbEnderecoDS_ENDERECO: TIBStringField;
    tbEnderecoDS_BAIRRO: TIBStringField;
    tbEnderecoDS_CIDADE: TIBStringField;
    tbEnderecoDS_COMPLEMENTO: TIBStringField;
    tbEnderecoTP_ENDERECO: TIBStringField;
    tbEnderecoCD_PESSOA: TIntegerField;
    tbEnderecoFL_PRINCIPAL: TIBStringField;
    tbEnderecoCD_EMPRESA: TIntegerField;
    tbDocumentoCD_DOCUMENTO: TIntegerField;
    tbDocumentoTP_DOCUMENTO: TIBStringField;
    tbDocumentoNR_DOCUMENTO: TIBStringField;
    tbDocumentoCD_PESSOA: TIntegerField;
    tbDocumentoFL_PRINCIPAL: TIBStringField;
    tbDocumentoCD_EMPRESA: TIntegerField;
    procedure btImagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tbPessoaAfterInsert(DataSet: TDataSet);
    procedure tbDocumentoBeforeOpen(DataSet: TDataSet);
    procedure tcDocumentoChange(Sender: TObject);
    procedure tbDocumentoAfterInsert(DataSet: TDataSet);
    procedure tcEnderecoChange(Sender: TObject);
    procedure tbEnderecoAfterInsert(DataSet: TDataSet);
    procedure tbEnderecoBeforeOpen(DataSet: TDataSet);
    procedure tbTelefonesAfterInsert(DataSet: TDataSet);
    procedure tbPessoaAfterDelete(DataSet: TDataSet);
    procedure tbPessoaAfterPost(DataSet: TDataSet);
    procedure tbEnderecoAfterPost(DataSet: TDataSet);
    procedure tbEnderecoAfterDelete(DataSet: TDataSet);
    procedure tbDocumentoAfterDelete(DataSet: TDataSet);
    procedure tbDocumentoAfterPost(DataSet: TDataSet);
    procedure tbTelefonesAfterPost(DataSet: TDataSet);
    procedure tbTelefonesAfterDelete(DataSet: TDataSet);
    procedure tbPessoaBeforeDelete(DataSet: TDataSet);
    procedure tbEnderecoBeforeDelete(DataSet: TDataSet);
    procedure tbDocumentoBeforeDelete(DataSet: TDataSet);
    procedure tbTelefonesBeforeDelete(DataSet: TDataSet);
    procedure btIncluirClick(Sender: TObject);
    procedure tbPessoaBeforePost(DataSet: TDataSet);
    procedure btClearImagemClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure RvPrjClienteCreate(Sender: TObject);
    procedure RvPrjFornecedorCreate(Sender: TObject);
    procedure RvPrjTransportadoraCreate(Sender: TObject);
    procedure RvPrjFuncionarioCreate(Sender: TObject);
    procedure RvPrjEmpresaCreate(Sender: TObject);
    procedure tbPessoaAfterOpen(DataSet: TDataSet);
    procedure tbPessoaAfterClose(DataSet: TDataSet);
    procedure tbPessoaBeforeOpen(DataSet: TDataSet);
    procedure dsPessoaStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tpPessoa:String;
    fOperacao:String;
    fPessoa:Integer;
  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

uses
  UDM, UDMGERAL, UfrmLocalizar, Math, Ugeral, UGeralSQL, UDMRelatorios;

{$R *.dfm}

procedure TfrmCadPessoa.btImagemClick(Sender: TObject);
begin
  inherited;
  if not (tbpessoa.State in [dsEdit,dsInsert]) then
    tbpessoa.Edit;

  if OpenPictureDialog1.Execute then
    tbpessoaBL_IMAGEM.LoadFromFile(OpenPictureDialog1.FileName);

end;

procedure TfrmCadPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fPessoa := tbPessoaCD_PESSOA.AsInteger;
  if fOperacao <> 'I' then
    inherited;
  fOperacao := '';
end;

procedure TfrmCadPessoa.FormShow(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := false;
  btClearImagem.Enabled := false;
  ckEmpresa.Visible := (tpPessoa = cvEmpresa);
  if fOperacao = 'I' then
    btIncluirClick(Sender);
end;

procedure TfrmCadPessoa.tbPessoaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tbPessoaTP_PESSOA.AsString := tpPessoa;
  //Empresa Principal
  tbPessoaCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  tbPessoaFL_ATIVO.AsString := 'S';
end;

procedure TfrmCadPessoa.tbDocumentoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tbDocumento.Params.ByName('TP_DOC').AsString :=
    tcDocumento.Tabs.Strings[tcDocumento.TabIndex];
end;

procedure TfrmCadPessoa.tcDocumentoChange(Sender: TObject);
begin
  inherited;
  if dsPessoaDoc.State in [dsEdit, dsInsert] then
    tbDocumento.Post;
  tbDocumento.Close;
  tbDocumento.Open;
end;

procedure TfrmCadPessoa.tbDocumentoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbDocumentoCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  tbDocumentoCD_PESSOA.AsInteger := tbPessoaCD_PESSOA.AsInteger;
  tbDocumentoTP_DOCUMENTO.AsString :=
    tcDocumento.Tabs.Strings[tcDocumento.TabIndex];
  if tcDocumento.TabIndex = 0 then
    tbDocumentoFL_PRINCIPAL.AsString := cvSim
  else
    tbDocumentoFL_PRINCIPAL.AsString := cvNao;
end;

procedure TfrmCadPessoa.tcEnderecoChange(Sender: TObject);
begin
  inherited;
  if dsPessoaEnd.State in [dsEdit, dsInsert] then
    tbEndereco.Post;

  tbEndereco.Close;
  tbEndereco.Open;
end;

procedure TfrmCadPessoa.tbEnderecoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbEnderecoCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  tbEnderecoCD_PESSOA.AsInteger := tbPessoaCD_PESSOA.AsInteger;
  tbEnderecoTP_ENDERECO.AsString :=
    tcEndereco.Tabs.Strings[tcEndereco.TabIndex];
  if tcEndereco.TabIndex = 0 then
    tbEnderecoFL_PRINCIPAL.AsString := cvSim
  else
    tbEnderecoFL_PRINCIPAL.AsString := cvNao;
end;

procedure TfrmCadPessoa.tbEnderecoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tbEndereco.ParamByName('TP_ENDERECO').AsString :=
    tcEndereco.Tabs.Strings[tcEndereco.TabIndex];
end;

procedure TfrmCadPessoa.tbTelefonesAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbTelefonesCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
  tbTelefonesCD_PESSOA.AsInteger := tbPessoaCD_PESSOA.AsInteger;
  if tbTelefones.RecNo = 1 then
    tbTelefonesFL_PRINCIPAL.AsString := cvSim
  else
    tbTelefonesFL_PRINCIPAL.AsString := cvNao;
end;

procedure TfrmCadPessoa.tbPessoaAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbPessoaAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbEnderecoAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbEnderecoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbDocumentoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbDocumentoAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbTelefonesAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbTelefonesAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DATASET);
end;

procedure TfrmCadPessoa.tbPessoaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  DM.ConfirmaDelecao;
end;

procedure TfrmCadPessoa.tbEnderecoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  DM.ConfirmaDelecao;
end;

procedure TfrmCadPessoa.tbDocumentoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  DM.ConfirmaDelecao;
end;

procedure TfrmCadPessoa.tbTelefonesBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  DM.ConfirmaDelecao;
end;

procedure TfrmCadPessoa.btIncluirClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := true;
  btClearImagem.Enabled := true;
  ckAtivo.SetFocus;
end;

procedure TfrmCadPessoa.tbPessoaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if tbPessoaFL_PRINCIPAL.AsString = cvSim then
  begin
    DMGERAL.TB_PESSOA.Open;
    if DMGERAL.TB_PESSOA.Locate('fl_Principal', cvSim, [loCaseInsensitive]) then
    begin
      if not (DMGERAL.TB_PESSOANM_PESSOA.asstring = tbPessoaNM_PESSOA.AsString) then
      begin
        MessageDlg('Já Existe uma Empresa selecionada como Principal!'+#13#10+
        'Empresa Principal: '+ DMGERAL.TB_PESSOANM_PESSOA.AsString ,mtInformation,
        [mbOk],0);
          begin
            tbPessoaFL_PRINCIPAL.AsString := cvNao;
            CkEmpresa.Checked := false;
          end;
      end;
    end;
    DMGERAL.TB_PESSOA.close;
  end;
end;

procedure TfrmCadPessoa.btClearImagemClick(Sender: TObject);
begin
  inherited;
  tbpessoaBL_IMAGEM.Clear;
  DBImage1.Picture := nil;
end;

procedure TfrmCadPessoa.btPesquisarClick(Sender: TObject);
begin
  inherited;
 //Cliente
 if tpPessoa = cvCliente then
 begin
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Cliente';
  frmLocalizar.qyDados:=SelectDadosPessoaAtiva;
  frmLocalizar.qyDados.ParamByName('TP_PESSOA').AsString:=cvCliente;

  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Cliente';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[1].Width := 20;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbPessoa.Locate('cd_Pessoa', frmLocalizar.qyDados.FieldByname('cd_Pessoa').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
 end;

 //Fornecedor
 if tpPessoa = cvFornecedor then
 begin
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Fornecedor';
  frmLocalizar.qyDados:=SelectDadosPessoaAtiva;
  frmLocalizar.qyDados.ParamByName('TP_PESSOA').AsString:=cvFornecedor;
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
    tbPessoa.Locate('cd_Pessoa', frmLocalizar.qyDados.FieldByname('cd_Pessoa').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
 end;

 //Transportadora
 if tpPessoa = cvTransportadora then
 begin
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Transportadora';
  frmLocalizar.qyDados:=SelectDadosPessoaAtiva;
  frmLocalizar.qyDados.ParamByName('TP_PESSOA').AsString:=cvTransportadora;
  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Transportadora';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbPessoa.Locate('cd_Pessoa', frmLocalizar.qyDados.FieldByname('cd_Pessoa').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
 end;

 //Funcionário
 if tpPessoa = cvFuncionario then
 begin
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Funcionário';
  frmLocalizar.qyDados:=SelectDadosPessoaAtiva;
  frmLocalizar.qyDados.ParamByName('TP_PESSOA').AsString:=cvFuncionario;
  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Funcionário';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbPessoa.Locate('cd_Pessoa', frmLocalizar.qyDados.FieldByname('cd_Pessoa').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
 end;

 //Empresa
 if tpPessoa = cvEmpresa then
 begin
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Empresa';
  frmLocalizar.qyDados:=SelectDadosPessoaAtiva;
  frmLocalizar.qyDados.ParamByName('TP_PESSOA').AsString:=cvEmpresa;
  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Empresa';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbPessoa.Locate('cd_Pessoa', frmLocalizar.qyDados.FieldByname('cd_Pessoa').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
 end;

end;

procedure TfrmCadPessoa.btexcluirClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := false;
  btClearImagem.Enabled := false;
end;

procedure TfrmCadPessoa.bteditarClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := true;
  btClearImagem.Enabled := true;
  ckAtivo.SetFocus;
end;

procedure TfrmCadPessoa.btgravarClick(Sender: TObject);
begin
  inherited;
  btImagem.Enabled := false;
  btClearImagem.Enabled := false;
end;

procedure TfrmCadPessoa.btimprimirClick(Sender: TObject);
begin
  inherited;
  if frmCadPessoa.tpPessoa = cvCliente then
  begin
    RvPrjCliente.Execute;
  end;

  if frmCadPessoa.tpPessoa = cvFornecedor then
  begin
    RvPrjFornecedor.Execute;
  end;

  if frmCadPessoa.tpPessoa = cvTransportadora then
  begin
    RvPrjTransportadora.Execute;
  end;

  if frmCadPessoa.tpPessoa = cvFuncionario then
  begin
    RvPrjFuncionario.Execute;
  end;

  if frmCadPessoa.tpPessoa = cvEmpresa then
  begin
    RvPrjEmpresa.Execute;
  end;
end;

procedure TfrmCadPessoa.RvPrjClienteCreate(Sender: TObject);
begin
  inherited;
  RvPrjCliente.ProjectFile := sPathLayout +'\RelCliente.rav';
end;

procedure TfrmCadPessoa.RvPrjFornecedorCreate(Sender: TObject);
begin
  inherited;
  RvPrjFornecedor.ProjectFile := sPathLayout +'\RelFornecedor.rav';
end;

procedure TfrmCadPessoa.RvPrjTransportadoraCreate(Sender: TObject);
begin
  inherited;
  RvPrjTransportadora.ProjectFile := sPathLayout +'\RelTransportadora.rav';
end;

procedure TfrmCadPessoa.RvPrjFuncionarioCreate(Sender: TObject);
begin
  inherited;
  RvPrjFuncionario.ProjectFile := sPathLayout +'\RelFuncionario.rav';
end;

procedure TfrmCadPessoa.RvPrjEmpresaCreate(Sender: TObject);
begin
  inherited;
  RvPrjEmpresa.ProjectFile := sPathLayout +'\RelEmpresa.rav';
end;

procedure TfrmCadPessoa.tbPessoaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dsPessoaDoc.DataSet.Open;
  dsPessoaEnd.DataSet.Open;
  dsPessoaTel.DataSet.Open;
end;

procedure TfrmCadPessoa.tbPessoaAfterClose(DataSet: TDataSet);
begin
  inherited;
  dsPessoaDoc.DataSet.Close;
  dsPessoaEnd.DataSet.Close;
  dsPessoaTel.DataSet.Close;
end;

procedure TfrmCadPessoa.tbPessoaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  tbPessoa.ParamByName('TP_PESSOA').AsString := tpPessoa;
end;

procedure TfrmCadPessoa.dsPessoaStateChange(Sender: TObject);
var bControle:Boolean;
begin
  inherited;
  bControle := dsPessoa.State in [dsEdit,dsInsert];
  dsPessoaDoc.AutoEdit := bControle;
  dsPessoaEnd.AutoEdit := bControle;
  dsPessoaTel.AutoEdit := bControle;
end;

end.
