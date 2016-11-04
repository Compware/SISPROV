unit UfrmRelEstoqueGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, ExtCtrls, StdCtrls, Buttons, RpRave, RpBase,
  RpSystem, RpDefine, RpCon, RpConDS, DB, IBCustomDataSet, ComCtrls,
  IBQuery;

type
  TfrmRelEstoqueGeral = class(TfrmRelPad)
    TabSheet1: TTabSheet;
    qyGeralCD_EMPRESA: TIntegerField;
    qyGeralCD_PRODUTO: TIntegerField;
    qyGeralDS_PRODUTO: TIBStringField;
    qyGeralVL_PRECO_CUSTO: TIBBCDField;
    qyGeralVL_PRECO_VENDA: TIBBCDField;
    qyGeralVL_SALDO: TIBBCDField;
    qyGeralDT_SALDO: TDateTimeField;
    RvDtCnEstoqueGeralConfRel: TRvDataSetConnection;
    RvDtCnestoqueGeral: TRvDataSetConnection;
    RvSysEstoqueGeral: TRvSystem;
    RvPrjEstoqueGeral: TRvProject;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    btFamilia: TSpeedButton;
    btFamiliaLimpar: TSpeedButton;
    edCodfamilia: TEdit;
    edfamilia: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edCodGrupo: TEdit;
    edgrupo: TEdit;
    rgordenar: TRadioGroup;
    procedure btImprimirClick(Sender: TObject);
    procedure btFamiliaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstoqueGeral: TfrmRelEstoqueGeral;
  strSQL:string;
implementation

uses
  UfrmLocalizar, UDMGERAL, Ugeral;

{$R *.dfm}

procedure TfrmRelEstoqueGeral.btImprimirClick(Sender: TObject);
begin
  inherited;
  try
    begin
      qyGeral.Close;
      qyGeral.SQL.Text := strSQL;

      if edCodfamilia.Text <> '' then
      begin
      qyGeral.SQL.Add('and P.CD_FAMILIA =:CODFAMILIA');
      qyGeral.ParamByName('CODFAMILIA').AsInteger := StrToInt(edCodfamilia.Text);
      end;

      if edCodgrupo.Text <> '' then
      begin
      qyGeral.SQL.Add('and P.CD_GRUPO =:CODGRUPO');
      qyGeral.ParamByName('CODGRUPO').AsInteger := StrToInt(edCodgrupo.Text);
      end;

      if rgordenar.ItemIndex = 0 then
        qyGeral.SQL.Add('order by CD_PRODUTO');

      if rgordenar.ItemIndex = 1 then
        qyGeral.SQL.Add('order by DS_PRODUTO');

      qyGeral.open;
      RvPrjEstoqueGeral.Execute;
      qyGeral.Close;
      close;
    end
  except
    qyGeral.Close;
  end;



end;

procedure TfrmRelEstoqueGeral.btFamiliaClick(Sender: TObject);
begin
  inherited;
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
    edCodfamilia.text := frmLocalizar.qyDados.FieldByname('CD_FAMILIA').AsString;
    edfamilia.text := frmLocalizar.qyDados.FieldByname('DS_FAMILIA').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;


procedure TfrmRelEstoqueGeral.SpeedButton1Click(Sender: TObject);
begin
  inherited;
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
    edCodGrupo.text := frmLocalizar.qyDados.FieldByname('CD_GRUPO').AsString;
    edGrupo.text := frmLocalizar.qyDados.FieldByname('DS_GRUPO').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;

end;

procedure TfrmRelEstoqueGeral.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;
  RvPrjEstoqueGeral.ProjectFile := sPathLayout +'\RelEstoqueGeral.rav';

end;

end.
