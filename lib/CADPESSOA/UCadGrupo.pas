unit UCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, IBCustomDataSet, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfrmCadGrupo = class(TfrmCadPad)
    tbgrupo: TIBDataSet;
    tbgrupoCD_GRUPO: TIntegerField;
    tbgrupoDS_GRUPO: TIBStringField;
    grDadosCD_GRUPO: TdxDBGridMaskColumn;
    grDadosDS_GRUPO: TdxDBGridMaskColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    tbgrupoCD_EMPRESA: TIntegerField;
    procedure tbgrupoAfterDelete(DataSet: TDataSet);
    procedure tbgrupoAfterPost(DataSet: TDataSet);
    procedure tbgrupoBeforeDelete(DataSet: TDataSet);
    procedure btIncluirClick(Sender: TObject);
    procedure tbgrupoAfterInsert(DataSet: TDataSet);
    procedure btPesquisarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupo: TfrmCadGrupo;

implementation

uses
  UDM, UDMGERAL, UfrmLocalizar, UGeralSQL;

{$R *.dfm}

procedure TfrmCadGrupo.tbgrupoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadGrupo.tbgrupoAfterPost(DataSet: TDataSet);
begin
  inherited;
  DM.Commit(DataSet);
end;

procedure TfrmCadGrupo.tbgrupoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  DM.ConfirmaDelecao;
end;

procedure TfrmCadGrupo.btIncluirClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmCadGrupo.tbgrupoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Empresa Principal
  tbgrupoCD_EMPRESA.AsInteger := DMGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;
end;

procedure TfrmCadGrupo.btPesquisarClick(Sender: TObject);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Grupo';
  frmLocalizar.qyDados:=SelectDadosGrupo;
  try
    frmLocalizar.Where := FALSE;
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
    tbgrupo.Locate('cd_grupo', frmLocalizar.qyDados.FieldByname('cd_grupo').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadGrupo.bteditarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

end.
