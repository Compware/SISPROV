unit UfrmConfRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmConfPad, Buttons, DBCtrls, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, dxDBELib, StdCtrls, Mask, ComCtrls, ExtCtrls, DB,
  IBCustomDataSet, ExtDlgs;

type
  TfrmConfRelatorio = class(TfrmConfPad)
    TabSheet1: TTabSheet;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    edPessoa: TdxDBButtonEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    DBImage1: TDBImage;
    btImagem: TSpeedButton;
    btClearImagem: TSpeedButton;
    tbConfRelatorio: TIBDataSet;
    dsConfRelatorio: TDataSource;
    tbConfRelatorioCD_CONF_RELATORIO: TIntegerField;
    tbConfRelatorioCD_PESSOA: TIntegerField;
    tbConfRelatorioNM_PESSOA: TIBStringField;
    tbConfRelatorioBL_LOGO: TBlobField;
    tbConfRelatorioNR_DOCUMENTO: TIBStringField;
    tbConfRelatorioDS_ENDERECO: TIBStringField;
    tbConfRelatorioDS_BAIRRO: TIBStringField;
    tbConfRelatorioDS_CIDADE: TIBStringField;
    tbConfRelatorioNR_TELEFONE: TIBStringField;
    tbConfRelatorioCD_EMPRESA: TIntegerField;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure tbConfRelatorioAfterDelete(DataSet: TDataSet);
    procedure tbConfRelatorioAfterPost(DataSet: TDataSet);
    procedure tbConfRelatorioAfterInsert(DataSet: TDataSet);
    procedure edPessoaButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btImagemClick(Sender: TObject);
    procedure btClearImagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfRelatorio: TfrmConfRelatorio;

implementation

Uses
  UDM, UDMGERAL, UfrmLocalizar;

{$R *.dfm}

procedure TfrmConfRelatorio.tbConfRelatorioAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmConfRelatorio.tbConfRelatorioAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmConfRelatorio.tbConfRelatorioAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbConfRelatorioCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;

end;

procedure TfrmConfRelatorio.edPessoaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Empresa';
  frmLocalizar.qyDados.sql.add('select EMP.DS_EMPRESA,P.CD_PESSOA, P.NM_PESSOA, D.NR_DOCUMENTO, E.DS_ENDERECO, E.DS_BAIRRO, E.DS_CIDADE, T.NR_TELEFONE from EMPRESA EMP');
  frmLocalizar.qyDados.sql.add('left outer join PESSOA P on(P.CD_PESSOA = P.CD_PESSOA)');
  frmLocalizar.qyDados.sql.add('left outer join DOCUMENTO D on(P.CD_PESSOA = D.CD_PESSOA and D.FL_PRINCIPAL = '''+('S')+''')');
  frmLocalizar.qyDados.sql.add('Left outer join ENDERECO E on(P.CD_PESSOA = E.CD_PESSOA and E.FL_PRINCIPAL = '''+('S')+''')');
  frmLocalizar.qyDados.sql.add('left outer join TELEFONE T on(P.CD_PESSOA = T.CD_PESSOA and T.FL_PRINCIPAL = '''+('S')+''')');
  frmLocalizar.qyDados.sql.add('where EMP.CD_PESSOA = P.CD_PESSOA');

  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,8);
    VCampo[0].Titulo  := 'Empresa';
    VCampo[1].Titulo  := 'C�digo';
    VCampo[2].Titulo  := 'Nome';
    VCampo[3].Titulo  := 'N� BI';
    VCampo[4].Titulo  := 'Endere�o';
    VCampo[5].Titulo  := 'Bairro';
    VCampo[6].Titulo  := 'Cidade';
    VCampo[7].Titulo  := 'Telefone';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := True;
    VCampo[3].Visivel := True;
    VCampo[4].Visivel := True;
    VCampo[5].Visivel := True;
    VCampo[6].Visivel := True;
    VCampo[7].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    tbConfRelatorioCD_PESSOA.ASInteger := frmLocalizar.qyDados.FieldByname('CD_PESSOA').AsInteger;
    tbConfRelatorioNM_PESSOA.ASString := frmLocalizar.qyDados.FieldByname('NM_PESSOA').AsString;
    tbConfRelatorioNR_DOCUMENTO.ASString := frmLocalizar.qyDados.FieldByname('NR_DOCUMENTO').AsString;
    tbConfRelatorioDS_ENDERECO.ASString := frmLocalizar.qyDados.FieldByname('DS_ENDERECO').AsString;
    tbConfRelatorioDS_BAIRRO.ASString := frmLocalizar.qyDados.FieldByname('DS_BAIRRO').AsString;
    tbConfRelatorioDS_CIDADE.ASString := frmLocalizar.qyDados.FieldByname('DS_CIDADE').AsString;
    tbConfRelatorioNR_TELEFONE.ASString := frmLocalizar.qyDados.FieldByname('NR_TELEFONE').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmConfRelatorio.FormShow(Sender: TObject);
begin
  inherited;
  tbConfRelatorio.Open;
  if tbConfRelatorio.Locate('cd_empresa',DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger, [loCaseInsensitive]) then
  tbConfRelatorio.Edit
  else
  tbConfRelatorio.Insert;

end;

procedure TfrmConfRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tbConfRelatorio.Close;
end;

procedure TfrmConfRelatorio.btCancelarClick(Sender: TObject);
begin
  inherited;
  tbConfRelatorio.Cancel;
end;

procedure TfrmConfRelatorio.btConfirmarClick(Sender: TObject);
begin
  inherited;
  tbConfRelatorio.Post;
end;

procedure TfrmConfRelatorio.btImagemClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
    tbConfRelatorioBL_LOGO.LoadFromFile(OpenPictureDialog1.FileName);

end;

procedure TfrmConfRelatorio.btClearImagemClick(Sender: TObject);
begin
  inherited;
  tbConfRelatorioBL_LOGO.Clear;
  DBImage1.Picture := nil;

end;

end.
