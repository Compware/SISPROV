unit UCadFamilia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, IBCustomDataSet, StdCtrls, Mask,
  DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCadFamilia = class(TfrmCadPad)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    tbfamilia: TIBDataSet;
    tbfamiliaCD_FAMILIA: TIntegerField;
    tbfamiliaDS_FAMILIA: TIBStringField;
    grDadosCD_FAMILIA: TdxDBGridMaskColumn;
    grDadosDS_FAMILIA: TdxDBGridMaskColumn;
    tbfamiliaCD_EMPRESA: TIntegerField;
    procedure tbfamiliaAfterDelete(DataSet: TDataSet);
    procedure tbfamiliaAfterPost(DataSet: TDataSet);
    procedure tbfamiliaBeforeDelete(DataSet: TDataSet);
    procedure btIncluirClick(Sender: TObject);
    procedure tbfamiliaAfterInsert(DataSet: TDataSet);
    procedure btPesquisarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFamilia: TfrmCadFamilia;

implementation

uses
  UDM, UDMGERAL, UfrmLocalizar, UGeralSQL;

{$R *.dfm}

procedure TfrmCadFamilia.tbfamiliaAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadFamilia.tbfamiliaAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadFamilia.tbfamiliaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  dm.ConfirmaDelecao;
end;

procedure TfrmCadFamilia.btIncluirClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmCadFamilia.tbfamiliaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbfamiliaCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_PESSOA.AsInteger;
end;

procedure TfrmCadFamilia.btPesquisarClick(Sender: TObject);
begin
  inherited;
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Família';
  frmLocalizar.qyDados:=SelectDadosFamilia;
  try
    frmLocalizar.Where := FALSE;
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
    tbfamilia.Locate('cd_familia', frmLocalizar.qyDados.FieldByname('cd_familia').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadFamilia.bteditarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

end.
