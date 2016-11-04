unit UfrmPainelAR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxExEdtr, DB, IBCustomDataSet, IBQuery, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, Buttons, dxEditor, dxEdLib, StdCtrls, Mask,
  ToolEdit, RxLookup, dxDBTLCl, dxGrClms;

type
  TfrmPainelAR = class(TForm)
    Panel1: TPanel;
    Label20: TLabel;
    leProvincia: TRxLookupEdit;
    Label6: TLabel;
    cbAno: TdxPickEdit;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    dxDBGrid1: TdxDBGrid;
    qyATV: TIBQuery;
    qyPTV: TIBQuery;
    qyTARV: TIBQuery;
    qyTARVAcomp: TIBQuery;
    qyTARVEsquema: TIBQuery;
    qyTARVCD4: TIBQuery;
    qyCoinfeccao: TIBQuery;
    qyPrograma: TIBQuery;
    qyATVCD_PROVINCIA: TIntegerField;
    qyATVCD_MUNICIPIO: TIntegerField;
    qyATVCD_UNIDADE: TIntegerField;
    qyATVVL_MESANO: TIBStringField;
    qyATVTOTAL_ACONSELHADOS1: TLargeintField;
    qyATVTOTAL_POSITIVOS1: TLargeintField;
    qyATVTOTAL_NEGATIVOS1: TLargeintField;
    qyATVTOTAL_INDETERMINADO1: TLargeintField;
    qyPTVCD_PROVINCIA: TIntegerField;
    qyPTVCD_MUNICIPIO: TIntegerField;
    qyPTVCD_UNIDADE: TIntegerField;
    qyPTVVL_MESANO: TIBStringField;
    qyPTVTOTAL_ADMITIDAS_PTV1: TLargeintField;
    qyPTVTOTAL_ADMITIDAS_PARTO1: TLargeintField;
    qyPTVTOTAL_ADMITIDAS_POS_PARTO1: TLargeintField;
    qyPTVTOTAL_TERAPIA_COMPLETA1: TLargeintField;
    qyPTVTOTAL_TERAPIA_OUTRO1: TLargeintField;
    qyPTVTOTAL_TERAPIA_NENHUM1: TLargeintField;
    qyPTVTOTAL_CRIANCA1: TLargeintField;
    qyTARVCD_PROVINCIA: TIntegerField;
    qyTARVCD_MUNICIPIO: TIntegerField;
    qyTARVCD_UNIDADE: TIntegerField;
    qyTARVVL_MESANO: TIBStringField;
    qyTARVTOTAL_ACUMULADOS1: TLargeintField;
    qyTARVTOTAL_NOVOS1: TLargeintField;
    qyTARVTOTAL_TRANSFERIDOS1: TLargeintField;
    qyTARVTOTAL_ABANDONOS1: TLargeintField;
    qyTARVTOTAL_TRANSFERIDOS_PARA1: TLargeintField;
    qyTARVTOTAL_OBITOS1: TLargeintField;
    qyTARVAcompCD_PROVINCIA: TIntegerField;
    qyTARVAcompCD_MUNICIPIO: TIntegerField;
    qyTARVAcompCD_UNIDADE: TIntegerField;
    qyTARVAcompVL_MESANO: TIBStringField;
    qyTARVAcompTOTAL_ACUMULADOS1: TLargeintField;
    qyTARVAcompTOTAL_NOVOS1: TLargeintField;
    qyTARVAcompTOTAL_TRANSFERIDOS1: TLargeintField;
    qyTARVAcompTOTAL_ABANDONOS1: TLargeintField;
    qyTARVAcompTOTAL_TRANSFERIDOS_PARA1: TLargeintField;
    qyTARVAcompTOTAL_OBITOS1: TLargeintField;
    qyTARVEsquemaCD_PROVINCIA: TIntegerField;
    qyTARVEsquemaCD_MUNICIPIO: TIntegerField;
    qyTARVEsquemaCD_UNIDADE: TIntegerField;
    qyTARVEsquemaVL_MESANO: TIBStringField;
    qyTARVEsquemaTOTAL_ANTERIOR_CRIANCA1: TLargeintField;
    qyTARVEsquemaTOTAL_ANTERIOR_ADULTO1: TLargeintField;
    qyTARVEsquemaTOTAL_CORRENTE_CRIANCA1: TLargeintField;
    qyTARVEsquemaTOTAL_CORRENTE_ADULTO1: TLargeintField;
    qyTARVCD4CD_PROVINCIA: TIntegerField;
    qyTARVCD4CD_MUNICIPIO: TIntegerField;
    qyTARVCD4CD_UNIDADE: TIntegerField;
    qyTARVCD4VL_MESANO: TIBStringField;
    qyTARVCD4TOTAL_CD4_MENOR_3501: TLargeintField;
    qyTARVCD4TOTAL_CD4_MAIOR_3501: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_11: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_21: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_31: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_41: TLargeintField;
    qyCoinfeccaoCD_PROVINCIA: TIntegerField;
    qyCoinfeccaoCD_MUNICIPIO: TIntegerField;
    qyCoinfeccaoCD_UNIDADE: TIntegerField;
    qyCoinfeccaoVL_MESANO: TIBStringField;
    qyCoinfeccaoTOTAL_VIH_POSITIVOS1: TLargeintField;
    qyCoinfeccaoTOTAL_TRATAMENTO_ARVS1: TLargeintField;
    qyProgramaCD_PROVINCIA: TIntegerField;
    qyProgramaCD_MUNICIPIO: TIntegerField;
    qyProgramaCD_UNIDADE: TIntegerField;
    qyProgramaVL_MESANO: TIBStringField;
    qyProgramaTOTAL_ACONSELHADOS1: TLargeintField;
    qyProgramaTOTAL_POSITIVOS1: TLargeintField;
    qyProgramaTOTAL_NEGATIVOS1: TLargeintField;
    qyProgramaTOTAL_INDETERMINADOS1: TLargeintField;
    qyProgramaTOTAL_FEMININO_21: TLargeintField;
    qyProgramaTOTAL_MASCULINO_21: TLargeintField;
    qyProgramaTOTAL_GESTANTE_31: TLargeintField;
    qyProgramaTOTAL_POS_PARTO_31: TLargeintField;
    qyProgramaTOTAL_PARTOS_31: TLargeintField;
    qyProgramaTOTAL_FEMININO_521: TLargeintField;
    qyProgramaTOTAL_MASCULINO_521: TLargeintField;
    qyGrid: TIBQuery;
    dsGrid: TDataSource;
    qyProvincia: TIBQuery;
    qyProvinciaCD_PAIS: TIntegerField;
    qyProvinciaCD_PROVINCIA: TIntegerField;
    qyProvinciaDS_PROVINCIA: TIBStringField;
    dsProvincia: TDataSource;
    qyGridANO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    qyGridDT_REGISTRO: TDateTimeField;
    qyGridDT_EXP: TDateTimeField;
    qyGridTIPO: TIBStringField;
    dxDBGrid1ANO: TdxDBGridMaskColumn;
    dxDBGrid1DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid1DT_REGISTRO: TdxDBGridDateColumn;
    dxDBGrid1DT_EXP: TdxDBGridDateColumn;
    dxDBGrid1TIPO: TdxDBGridMaskColumn;
    dxDBGrid1Column6: TdxDBGridColumn;
    qyGridCD_PROVINCIA: TIntegerField;
    procedure qyATVBeforeOpen(DataSet: TDataSet);
    procedure qyPTVBeforeOpen(DataSet: TDataSet);
    procedure qyTARVBeforeOpen(DataSet: TDataSet);
    procedure qyTARVAcompBeforeOpen(DataSet: TDataSet);
    procedure qyTARVEsquemaBeforeOpen(DataSet: TDataSet);
    procedure qyTARVCD4BeforeOpen(DataSet: TDataSet);
    procedure qyCoinfeccaoBeforeOpen(DataSet: TDataSet);
    procedure qyProgramaBeforeOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qyGridBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPainelAR: TfrmPainelAR;
  PSQL:String;
implementation

Uses UDM, udmgeral;

{$R *.dfm}

procedure TfrmPainelAR.qyATVBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyATV.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyATV.ParamByName('ANO').AsString := '%' + cbAno.Text;
end;

procedure TfrmPainelAR.qyPTVBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyPTV.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyPTV.ParamByName('ANO').AsString := '%' + cbAno.Text;

end;

procedure TfrmPainelAR.qyTARVBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyTARV.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyTARV.ParamByName('ANO').AsString := '%' + cbAno.Text;

end;

procedure TfrmPainelAR.qyTARVAcompBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyTARVAcomp.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyTARVAcomp.ParamByName('ANO').AsString := '%' + cbAno.Text;

end;

procedure TfrmPainelAR.qyTARVEsquemaBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyTARVEsquema.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyTARVEsquema.ParamByName('ANO').AsString := '%' + cbAno.Text;

end;

procedure TfrmPainelAR.qyTARVCD4BeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyTARVCD4.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyTARVCD4.ParamByName('ANO').AsString := '%' + cbAno.Text;

end;

procedure TfrmPainelAR.qyCoinfeccaoBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyCoinfeccao.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyCoinfeccao.ParamByName('ANO').AsString := '%' + cbAno.Text;

end;

procedure TfrmPainelAR.qyProgramaBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyPrograma.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

  if (cbAno.Text <> '') then
    qyPrograma.ParamByName('ANO').AsString := '%' + cbAno.Text;

end;

procedure TfrmPainelAR.SpeedButton1Click(Sender: TObject);

  procedure ExcluirRegistros(stabela:string);
  begin
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('DELETE FROM ' + stabela);
      sql.Add('WHERE CD_PROVINCIA = ' + leProvincia.LookupValue);
      ExecSQL;
      close;
      free;
    end;
  end;
begin
  //Excluir existentes
  ExcluirRegistros('REGISTRO_ATV_ARE');
  ExcluirRegistros('REGISTRO_PTV_ARE');
  ExcluirRegistros('REGISTRO_TARV_ARE');
  ExcluirRegistros('REGISTRO_TARV_ACOMP_ARE');
  ExcluirRegistros('REGISTRO_TARV_ESQUEMA_ARE');
  ExcluirRegistros('REGISTRO_TARV_CD4_ARE');
  ExcluirRegistros('REGISTRO_COINFECCAO_ARE');
  ExcluirRegistros('REGISTRO_PROGRAMA_ARE');

  qyATV.Close;
  qyATV.Open;
  qyATV.First;
  DMGERAL.TB_ATV_ARE.Open;
  while not qyATV.eof do
  begin
    DMGERAL.TB_ATV_ARE.Insert;
    DMGERAL.TB_ATV_ARECD_PROVINCIA.AsInteger := qyATVCD_PROVINCIA.AsInteger;
    DMGERAL.TB_ATV_ARECD_MUNICIPIO.AsInteger := qyATVCD_MUNICIPIO.AsInteger;
    DMGERAL.TB_ATV_ARECD_UNIDADE.AsInteger := qyATVCD_UNIDADE.AsInteger;
    DMGERAL.TB_ATV_AREVL_MESANO.AsString := qyATVVL_MESANO.AsString;
    DMGERAL.TB_ATV_AREVL_ACONSELHADOS.AsInteger := qyATVTOTAL_ACONSELHADOS1.AsInteger;
    DMGERAL.TB_ATV_AREVL_POSITIVOS.AsInteger := qyATVTOTAL_POSITIVOS1.AsInteger;
    DMGERAL.TB_ATV_AREVL_NEGATIVOS.AsInteger := qyATVTOTAL_NEGATIVOS1.AsInteger;
    DMGERAL.TB_ATV_AREVL_INDETERMINADOS.AsInteger := qyATVTOTAL_INDETERMINADO1.AsInteger;
    DMGERAL.TB_ATV_ARE.Post;
    qyATV.Next;
  end;
  DMGERAL.TB_ATV_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;

  qyPTV.Close;
  qyPTV.Open;
  qyPTV.First;
  DMGERAL.TB_PTV_ARE.Open;
  while not qyPTV.eof do
  begin
    DMGERAL.TB_PTV_ARE.Insert;
    DMGERAL.TB_PTV_ARECD_PROVINCIA.AsInteger := qyPTVCD_PROVINCIA.AsInteger;
    DMGERAL.TB_PTV_ARECD_MUNICIPIO.AsInteger := qyPTVCD_MUNICIPIO.AsInteger;
    DMGERAL.TB_PTV_ARECD_UNIDADE.AsInteger := qyPTVCD_UNIDADE.AsInteger;
    DMGERAL.TB_PTV_AREVL_MESANO.AsString := qyPTVVL_MESANO.AsString;
    DMGERAL.TB_PTV_AREVL_ADMITIDAS_PTV.AsInteger := qyPTVTOTAL_ADMITIDAS_PTV1.AsInteger;
    DMGERAL.TB_PTV_AREVL_ADMITIDAS_PARTO.AsInteger := qyPTVTOTAL_ADMITIDAS_PARTO1.AsInteger;
    DMGERAL.TB_PTV_AREVL_ADMITIDAS_POS_PARTO.AsInteger := qyPTVTOTAL_ADMITIDAS_POS_PARTO1.AsInteger;
    DMGERAL.TB_PTV_AREVL_TERAPIA_COMPLETA.AsInteger := qyPTVTOTAL_TERAPIA_COMPLETA1.AsInteger;
    DMGERAL.TB_PTV_AREVL_TERAPIA_OUTRO.AsInteger := qyPTVTOTAL_TERAPIA_OUTRO1.AsInteger;
    DMGERAL.TB_PTV_AREVL_TERAPIA_NENHUM.AsInteger := qyPTVTOTAL_TERAPIA_NENHUM1.AsInteger;
    DMGERAL.TB_PTV_AREVL_TOTAL_CRIANCA.AsInteger := qyPTVTOTAL_CRIANCA1.AsInteger;
    DMGERAL.TB_PTV_ARE.Post;
    qyPTV.Next;
  end;
  DMGERAL.TB_PTV_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;

  qyTARV.Close;
  qyTARV.Open;
  qyTARV.First;
  DMGERAL.TB_TARV_ARE.Open;
  while not qyTARV.eof do
  begin
    DMGERAL.TB_TARV_ARE.Insert;
    DMGERAL.TB_TARV_ARECD_PROVINCIA.AsInteger := qyTARVCD_PROVINCIA.AsInteger;
    DMGERAL.TB_TARV_ARECD_MUNICIPIO.AsInteger := qyTARVCD_MUNICIPIO.AsInteger;
    DMGERAL.TB_TARV_ARECD_UNIDADE.AsInteger := qyTARVCD_UNIDADE.AsInteger;
    DMGERAL.TB_TARV_AREVL_MESANO.AsString := qyTARVVL_MESANO.AsString;

    DMGERAL.TB_TARV_AREVL_ACUMULADOS.AsInteger := qyTARVTOTAL_ACUMULADOS1.AsInteger;
    DMGERAL.TB_TARV_AREVL_NOVOS.AsInteger := qyTARVTOTAL_NOVOS1.AsInteger;
    DMGERAL.TB_TARV_AREVL_TRANSFERIDOS.AsInteger := qyTARVTOTAL_TRANSFERIDOS1.AsInteger;
    DMGERAL.TB_TARV_AREVL_ABANDONOS.AsInteger := qyTARVTOTAL_ABANDONOS1.AsInteger;
    DMGERAL.TB_TARV_AREVL_TRANSFERIDOS_PARA.AsInteger := qyTARVTOTAL_TRANSFERIDOS_PARA1.AsInteger;
    DMGERAL.TB_TARV_AREVL_OBITOS.AsInteger := qyTARVTOTAL_OBITOS1.AsInteger;

    DMGERAL.TB_TARV_ARE.Post;
    qyTARV.Next;
  end;
  DMGERAL.TB_TARV_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;

  qyTARVAcomp.Close;
  qyTARVAcomp.Open;
  qyTARVACOMP.First;
  DMGERAL.TB_TARV_ACOMP_ARE.Open;
  while not qyTARVACOMP.eof do
  begin
    DMGERAL.TB_TARV_ACOMP_ARE.Insert;
    DMGERAL.TB_TARV_ACOMP_ARECD_PROVINCIA.AsInteger := qyTARVACOMPCD_PROVINCIA.AsInteger;
    DMGERAL.TB_TARV_ACOMP_ARECD_MUNICIPIO.AsInteger := qyTARVACOMPCD_MUNICIPIO.AsInteger;
    DMGERAL.TB_TARV_ACOMP_ARECD_UNIDADE.AsInteger := qyTARVACOMPCD_UNIDADE.AsInteger;
    DMGERAL.TB_TARV_ACOMP_AREVL_MESANO.AsString := qyTARVACOMPVL_MESANO.AsString;

    DMGERAL.TB_TARV_ACOMP_AREVL_ACUMULADOS.AsInteger := qyTARVAcompTOTAL_ACUMULADOS1.AsInteger;
    DMGERAL.TB_TARV_ACOMP_AREVL_NOVOS.AsInteger := qyTARVAcompTOTAL_NOVOS1.AsInteger;
    DMGERAL.TB_TARV_ACOMP_AREVL_TRANSFERIDOS.AsInteger := qyTARVAcompTOTAL_TRANSFERIDOS1.AsInteger;
    DMGERAL.TB_TARV_ACOMP_AREVL_ABANDONOS.AsInteger := qyTARVAcompTOTAL_ABANDONOS1.AsInteger;
    DMGERAL.TB_TARV_ACOMP_AREVL_TRANSFERIDOS_PARA.AsInteger := qyTARVAcompTOTAL_TRANSFERIDOS_PARA1.AsInteger;
    DMGERAL.TB_TARV_ACOMP_AREVL_OBITOS.AsInteger := qyTARVAcompTOTAL_OBITOS1.AsInteger;

    DMGERAL.TB_TARV_ACOMP_ARE.Post;
    qyTARVAcomp.Next;
  end;
  DMGERAL.TB_TARV_ACOMP_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;

  qyTARVEsquema.Close;
  qyTARVEsquema.Open;
  qyTARVEsquema.First;
  DMGERAL.TB_TARV_ESQUEMA_ARE.Open;
  while not qyTARVEsquema.eof do
  begin
    DMGERAL.TB_TARV_ESQUEMA_ARE.Insert;
    DMGERAL.TB_TARV_ESQUEMA_ARECD_PROVINCIA.AsInteger := qyTARVESQUEMACD_PROVINCIA.AsInteger;
    DMGERAL.TB_TARV_ESQUEMA_ARECD_MUNICIPIO.AsInteger := qyTARVESQUEMACD_MUNICIPIO.AsInteger;
    DMGERAL.TB_TARV_ESQUEMA_ARECD_UNIDADE.AsInteger := qyTARVESQUEMACD_UNIDADE.AsInteger;
    DMGERAL.TB_TARV_ESQUEMA_AREVL_MESANO.AsString := qyTARVESQUEMAVL_MESANO.AsString;

    DMGERAL.TB_TARV_ESQUEMA_AREVL_ANTERIOR_CRIANCA.AsInteger := qyTARVEsquemaTOTAL_ANTERIOR_CRIANCA1.AsInteger;
    DMGERAL.TB_TARV_ESQUEMA_AREVL_ANTERIOR_ADULTO.AsInteger := qyTARVEsquemaTOTAL_ANTERIOR_ADULTO1.AsInteger;
    DMGERAL.TB_TARV_ESQUEMA_AREVL_CORRENTE_CRIANCA.AsInteger := qyTARVEsquemaTOTAL_CORRENTE_CRIANCA1.AsInteger;
    DMGERAL.TB_TARV_ESQUEMA_AREVL_CORRENTE_ADULTO.AsInteger := qyTARVEsquemaTOTAL_CORRENTE_ADULTO1.AsInteger;

    DMGERAL.TB_TARV_ESQUEMA_ARE.Post;
    qyTARVEsquema.Next;
  end;
  DMGERAL.TB_TARV_ESQUEMA_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;

  qyTARVCD4.Close;
  qyTARVCD4.Open;
  qyTARVCD4.First;
  DMGERAL.TB_TARV_CD4_ARE.Open;
  while not qyTARVCD4.eof do
  begin
    DMGERAL.TB_TARV_CD4_ARE.Insert;
    DMGERAL.TB_TARV_CD4_ARECD_PROVINCIA.AsInteger := qyTARVCD4CD_PROVINCIA.AsInteger;
    DMGERAL.TB_TARV_CD4_ARECD_MUNICIPIO.AsInteger := qyTARVCD4CD_MUNICIPIO.AsInteger;
    DMGERAL.TB_TARV_CD4_ARECD_UNIDADE.AsInteger := qyTARVCD4CD_UNIDADE.AsInteger;
    DMGERAL.TB_TARV_CD4_AREVL_MESANO.AsString := qyTARVCD4VL_MESANO.AsString;

    DMGERAL.TB_TARV_CD4_AREVL_CD4_MENOR_350.AsInteger := qyTARVCD4TOTAL_CD4_MENOR_3501.AsInteger;
    DMGERAL.TB_TARV_CD4_AREVL_CD4_MAIOR_350.AsInteger := qyTARVCD4TOTAL_CD4_MAIOR_3501.AsInteger;
    DMGERAL.TB_TARV_CD4_AREVL_ESTADO_CLINICO_1.AsInteger := qyTARVCD4TOTAL_ESTADO_CLINICO_11.AsInteger;
    DMGERAL.TB_TARV_CD4_AREVL_ESTADO_CLINICO_2.AsInteger := qyTARVCD4TOTAL_ESTADO_CLINICO_21.AsInteger;
    DMGERAL.TB_TARV_CD4_AREVL_ESTADO_CLINICO_3.AsInteger := qyTARVCD4TOTAL_ESTADO_CLINICO_31.AsInteger;
    DMGERAL.TB_TARV_CD4_AREVL_ESTADO_CLINICO_4.AsInteger := qyTARVCD4TOTAL_ESTADO_CLINICO_41.AsInteger;

    DMGERAL.TB_TARV_CD4_ARE.Post;
    qyTARVCD4.Next;
  end;
  DMGERAL.TB_TARV_CD4_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;

  qyCoinfeccao.Close;
  qyCoinfeccao.Open;
  qyCoinfeccao.First;
  DMGERAL.TB_COINFECCAO_ARE.Open;
  while not qyCoinfeccao.eof do
  begin
    DMGERAL.TB_COINFECCAO_ARE.Insert;
    DMGERAL.TB_COINFECCAO_ARECD_PROVINCIA.AsInteger := qyCOINFECCAOCD_PROVINCIA.AsInteger;
    DMGERAL.TB_COINFECCAO_ARECD_MUNICIPIO.AsInteger := qyCOINFECCAOCD_MUNICIPIO.AsInteger;
    DMGERAL.TB_COINFECCAO_ARECD_UNIDADE.AsInteger := qyCOINFECCAOCD_UNIDADE.AsInteger;
    DMGERAL.TB_COINFECCAO_AREVL_MESANO.AsString := qyCOINFECCAOVL_MESANO.AsString;

    DMGERAL.TB_COINFECCAO_AREVL_VIH_POSITIVOS.AsInteger := qyCoinfeccaoTOTAL_VIH_POSITIVOS1.AsInteger;
    DMGERAL.TB_COINFECCAO_AREVL_TRATAMENTO_ARVS.AsInteger := qyCoinfeccaoTOTAL_TRATAMENTO_ARVS1.AsInteger;

    DMGERAL.TB_COINFECCAO_ARE.Post;
    qyCoinfeccao.Next;
  end;
  DMGERAL.TB_COINFECCAO_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;

  qyPrograma.Close;
  qyPrograma.Open;
  qyPrograma.First;
  DMGERAL.TB_PROGRAMA_ARE.Open;
  while not qyPrograma.eof do
  begin
    DMGERAL.TB_PROGRAMA_ARE.Insert;
    DMGERAL.TB_PROGRAMA_ARECD_PROVINCIA.AsInteger := qyPROGRAMACD_PROVINCIA.AsInteger;
    DMGERAL.TB_PROGRAMA_ARECD_MUNICIPIO.AsInteger := qyPROGRAMACD_MUNICIPIO.AsInteger;
    DMGERAL.TB_PROGRAMA_ARECD_UNIDADE.AsInteger := qyPROGRAMACD_UNIDADE.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_MESANO.AsString := qyPROGRAMAVL_MESANO.AsString;

    DMGERAL.TB_PROGRAMA_AREVL_ACONSELHADOS.AsInteger := qyProgramaTOTAL_ACONSELHADOS1.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_POSITIVOS.AsInteger := qyProgramaTOTAL_POSITIVOS1.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_NEGATIVOS.AsInteger := qyProgramaTOTAL_NEGATIVOS1.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_INDETERMINADOS.AsInteger := qyProgramaTOTAL_INDETERMINADOS1.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_FEMININO_2.AsInteger := qyProgramaTOTAL_FEMININO_21.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_MASCULINO_2.AsInteger := qyProgramaTOTAL_MASCULINO_21.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_GESTANTE_3.AsInteger := qyProgramaTOTAL_GESTANTE_31.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_POS_PARTO_3.AsInteger := qyProgramaTOTAL_POS_PARTO_31.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_PARTOS_3.AsInteger := qyProgramaTOTAL_PARTOS_31.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_FEMININO_52.AsInteger := qyProgramaTOTAL_FEMININO_521.AsInteger;
    DMGERAL.TB_PROGRAMA_AREVL_MASCULINO_52.AsInteger := qyProgramaTOTAL_MASCULINO_521.AsInteger;

    DMGERAL.TB_PROGRAMA_ARE.Post;
    qyPrograma.Next;
  end;
  DMGERAL.TB_PROGRAMA_ARE.Close;
  qyGrid.Close;
  qyGrid.Open;
end;

procedure TfrmPainelAR.qyGridBeforeOpen(DataSet: TDataSet);
begin
  if (leProvincia.Text <> '') then
    qyGrid.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

end;

procedure TfrmPainelAR.FormCreate(Sender: TObject);
begin
  PSQL := qyProvincia.sql.text;
  qyProvincia.Open;
  dmgeral.qyUnidade.Open;
  leProvincia.LookupValue := dmgeral.qyUnidadeCD_PROVINCIA.AsString;
  dmgeral.qyUnidade.Close;
  qyGrid.Open;

end;

procedure TfrmPainelAR.leProvinciaChange(Sender: TObject);
begin
  if leProvincia.Modified then
  begin
    qyProvincia.Close;
    qyProvincia.SQL.Text := PSQL;
    qyProvincia.SQL.Add('where Upper(ds_provincia) like(''' + '%' + UpperCase(leProvincia.Text) + '%'')');
    qyProvincia.Open;
  end
  else
  begin
    qyProvincia.SQL.Text := PSQL;
    qyProvincia.Open;
  end;

end;

end.
