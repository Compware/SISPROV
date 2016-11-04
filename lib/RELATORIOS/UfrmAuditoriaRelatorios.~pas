unit UfrmAuditoriaRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls, Mask,
  ToolEdit, RxLookup, pngimage, ExtCtrls, ComCtrls, dxTL, dxDBCtrl,
  dxDBGrid, DB, IBCustomDataSet, IBQuery, IB_PARSE, ImgList, dxDBTLCl,
  dxGrClms;

type
  TfrmAuditoriaRelatorios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    leProvincia: TRxLookupEdit;
    Label21: TLabel;
    leMunicipio: TRxLookupEdit;
    Label1: TLabel;
    leUnidade: TRxLookupEdit;
    cbAno: TdxPickEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    dxDBGrid1: TdxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qyATV: TIBQuery;
    dsATV: TDataSource;
    qyATVDS_PROVINCIA: TIBStringField;
    qyATVDS_MUNICIPIO: TIBStringField;
    qyATVDS_UNIDADE: TIBStringField;
    qyATVVL_MESANO: TIBStringField;
    qyATVTOTAL_ACONSELHADOS1: TLargeintField;
    qyATVTOTAL_POSITIVOS1: TLargeintField;
    qyATVTOTAL_NEGATIVOS1: TLargeintField;
    qyATVTOTAL_INDETERMINADO1: TLargeintField;
    qyATVTOTAL_ACONSELHADOS2: TLargeintField;
    qyATVTOTAL_POSITIVOS2: TLargeintField;
    qyATVTOTAL_NEGATIVOS2: TLargeintField;
    qyATVTOTAL_INDETERMINADO2: TLargeintField;
    dxDBGrid1DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid1DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid1DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid1VL_MESANO: TdxDBGridColumn;
    dxDBGrid1TOTAL_ACONSELHADOS1: TdxDBGridColumn;
    dxDBGrid1TOTAL_POSITIVOS1: TdxDBGridColumn;
    dxDBGrid1TOTAL_NEGATIVOS1: TdxDBGridColumn;
    dxDBGrid1TOTAL_INDETERMINADO1: TdxDBGridColumn;
    dxDBGrid1TOTAL_ACONSELHADOS2: TdxDBGridColumn;
    dxDBGrid1TOTAL_POSITIVOS2: TdxDBGridColumn;
    dxDBGrid1TOTAL_NEGATIVOS2: TdxDBGridColumn;
    dxDBGrid1TOTAL_INDETERMINADO2: TdxDBGridColumn;
    qyProvincia: TIBQuery;
    qyProvinciaCD_PAIS: TIntegerField;
    qyProvinciaCD_PROVINCIA: TIntegerField;
    qyProvinciaDS_PROVINCIA: TIBStringField;
    dsProvincia: TDataSource;
    qyMunicipio: TIBQuery;
    qyMunicipioCD_MUNICIPIO: TIntegerField;
    qyMunicipioCD_PROVINCIA: TIntegerField;
    qyMunicipioDS_MUNICIPIO: TIBStringField;
    dsMunicipio: TDataSource;
    qyUnidade: TIBQuery;
    qyUnidadeCD_UNIDADE: TIntegerField;
    qyUnidadeDS_UNIDADE: TIBStringField;
    qyUnidadeFL_ATIVA: TIBStringField;
    dsUnidade: TDataSource;
    SpeedButton5: TSpeedButton;
    Panel5: TPanel;
    dxDBGrid2: TdxDBGrid;
    Panel6: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    qyPTV: TIBQuery;
    dsPTV: TDataSource;
    qyPTVDS_PROVINCIA: TIBStringField;
    qyPTVDS_MUNICIPIO: TIBStringField;
    qyPTVDS_UNIDADE: TIBStringField;
    qyPTVVL_MESANO: TIBStringField;
    qyPTVTOTAL_ADMITIDAS_PTV1: TLargeintField;
    qyPTVTOTAL_ADMITIDAS_PARTO1: TLargeintField;
    qyPTVTOTAL_ADMITIDAS_POS_PARTO1: TLargeintField;
    qyPTVTOTAL_TERAPIA_COMPLETA1: TLargeintField;
    qyPTVTOTAL_TERAPIA_OUTRO1: TLargeintField;
    qyPTVTOTAL_TERAPIA_NENHUM1: TLargeintField;
    qyPTVTOTAL_CRIANCA1: TLargeintField;
    qyPTVTOTAL_ADMITIDAS_PTV2: TLargeintField;
    qyPTVTOTAL_ADMITIDAS_PARTO2: TLargeintField;
    qyPTVTOTAL_ADMITIDAS_POS_PARTO2: TLargeintField;
    qyPTVTOTAL_TERAPIA_COMPLETA2: TLargeintField;
    qyPTVTOTAL_TERAPIA_OUTRO2: TLargeintField;
    qyPTVTOTAL_TERAPIA_NENHUM2: TLargeintField;
    dxDBGrid2DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid2DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid2DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid2VL_MESANO: TdxDBGridColumn;
    dxDBGrid2TOTAL_ADMITIDAS_PTV1: TdxDBGridColumn;
    dxDBGrid2TOTAL_ADMITIDAS_PARTO1: TdxDBGridColumn;
    dxDBGrid2TOTAL_ADMITIDAS_POS_PARTO1: TdxDBGridColumn;
    dxDBGrid2TOTAL_TERAPIA_COMPLETA1: TdxDBGridColumn;
    dxDBGrid2TOTAL_TERAPIA_OUTRO1: TdxDBGridColumn;
    dxDBGrid2TOTAL_TERAPIA_NENHUM1: TdxDBGridColumn;
    dxDBGrid2TOTAL_CRIANCA1: TdxDBGridColumn;
    dxDBGrid2TOTAL_ADMITIDAS_PTV2: TdxDBGridColumn;
    dxDBGrid2TOTAL_ADMITIDAS_PARTO2: TdxDBGridColumn;
    dxDBGrid2TOTAL_ADMITIDAS_POS_PARTO2: TdxDBGridColumn;
    dxDBGrid2TOTAL_TERAPIA_COMPLETA2: TdxDBGridColumn;
    dxDBGrid2TOTAL_TERAPIA_OUTRO2: TdxDBGridColumn;
    dxDBGrid2TOTAL_TERAPIA_NENHUM2: TdxDBGridColumn;
    dxDBGrid2TOTAL_TOTAL_CRIANCA2: TdxDBGridColumn;
    Panel7: TPanel;
    dxDBGrid3: TdxDBGrid;
    Panel8: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Panel9: TPanel;
    dxDBGrid4: TdxDBGrid;
    Panel10: TPanel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Panel11: TPanel;
    dxDBGrid5: TdxDBGrid;
    Panel12: TPanel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    Panel13: TPanel;
    dxDBGrid6: TdxDBGrid;
    Panel14: TPanel;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Panel15: TPanel;
    dxDBGrid7: TdxDBGrid;
    Panel16: TPanel;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    dsTARVAcomp: TDataSource;
    qyTARVAcomp: TIBQuery;
    dsTARVEsquema: TDataSource;
    qyTARVEsquema: TIBQuery;
    dsTARVCD4: TDataSource;
    qyTARVCD4: TIBQuery;
    dsCoinfeccao: TDataSource;
    qyCoinfeccao: TIBQuery;
    dsTARV: TDataSource;
    qyTARV: TIBQuery;
    qyTARVDS_PROVINCIA: TIBStringField;
    qyTARVDS_MUNICIPIO: TIBStringField;
    qyTARVDS_UNIDADE: TIBStringField;
    qyTARVVL_MESANO: TIBStringField;
    qyTARVTOTAL_ACUMULADOS1: TLargeintField;
    qyTARVTOTAL_NOVOS1: TLargeintField;
    qyTARVTOTAL_TRANSFERIDOS1: TLargeintField;
    qyTARVTOTAL_ABANDONOS1: TLargeintField;
    qyTARVTOTAL_TRANSFERIDOS_PARA1: TLargeintField;
    qyTARVTOTAL_OBITOS1: TLargeintField;
    qyTARVTOTAL_TRANSFERIDOS2: TLargeintField;
    qyTARVTOTAL_ABANDONOS2: TLargeintField;
    qyTARVTOTAL_TRANSFERIDOS_PARA2: TLargeintField;
    qyTARVTOTAL_OBITOS2: TLargeintField;
    dxDBGrid3DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid3DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid3DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid3VL_MESANO: TdxDBGridColumn;
    dxDBGrid3TOTAL_ACUMULADOS1: TdxDBGridColumn;
    dxDBGrid3TOTAL_NOVOS1: TdxDBGridColumn;
    dxDBGrid3TOTAL_TRANSFERIDOS1: TdxDBGridColumn;
    dxDBGrid3TOTAL_ABANDONOS1: TdxDBGridColumn;
    dxDBGrid3TOTAL_TRANSFERIDOS_PARA1: TdxDBGridColumn;
    dxDBGrid3TOTAL_OBITOS1: TdxDBGridColumn;
    dxDBGrid3TOTAL_VL_ACUMULADOS2: TdxDBGridColumn;
    dxDBGrid3TOTAL_VL_NOVOS2: TdxDBGridColumn;
    dxDBGrid3TOTAL_TRANSFERIDOS2: TdxDBGridColumn;
    dxDBGrid3TOTAL_ABANDONOS2: TdxDBGridColumn;
    dxDBGrid3TOTAL_TRANSFERIDOS_PARA2: TdxDBGridColumn;
    dxDBGrid3TOTAL_OBITOS2: TdxDBGridColumn;
    qyTARVAcompDS_PROVINCIA: TIBStringField;
    qyTARVAcompDS_MUNICIPIO: TIBStringField;
    qyTARVAcompDS_UNIDADE: TIBStringField;
    qyTARVAcompVL_MESANO: TIBStringField;
    qyTARVAcompTOTAL_ACUMULADOS1: TLargeintField;
    qyTARVAcompTOTAL_NOVOS1: TLargeintField;
    qyTARVAcompTOTAL_TRANSFERIDOS1: TLargeintField;
    qyTARVAcompTOTAL_ABANDONOS1: TLargeintField;
    qyTARVAcompTOTAL_TRANSFERIDOS_PARA1: TLargeintField;
    qyTARVAcompTOTAL_OBITOS1: TLargeintField;
    qyTARVAcompTOTAL_ACUMULADOS2: TLargeintField;
    qyTARVAcompTOTAL_NOVOS2: TLargeintField;
    qyTARVAcompTOTAL_TRANSFERIDOS2: TLargeintField;
    qyTARVAcompTOTAL_ABANDONOS2: TLargeintField;
    qyTARVAcompTOTAL_TRANSFERIDOS_PARA2: TLargeintField;
    qyTARVAcompTOTAL_OBITOS2: TLargeintField;
    dxDBGrid4DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid4DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid4DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid4VL_MESANO: TdxDBGridColumn;
    dxDBGrid4TOTAL_ACUMULADOS1: TdxDBGridColumn;
    dxDBGrid4TOTAL_NOVOS1: TdxDBGridColumn;
    dxDBGrid4TOTAL_TRANSFERIDOS1: TdxDBGridColumn;
    dxDBGrid4TOTAL_ABANDONOS1: TdxDBGridColumn;
    dxDBGrid4TOTAL_TRANSFERIDOS_PARA1: TdxDBGridColumn;
    dxDBGrid4TOTAL_OBITOS1: TdxDBGridColumn;
    dxDBGrid4TOTAL_ACUMULADOS2: TdxDBGridColumn;
    dxDBGrid4TOTAL_NOVOS2: TdxDBGridColumn;
    dxDBGrid4TOTAL_TRANSFERIDOS2: TdxDBGridColumn;
    dxDBGrid4TOTAL_ABANDONOS2: TdxDBGridColumn;
    dxDBGrid4TOTAL_TRANSFERIDOS_PARA2: TdxDBGridColumn;
    dxDBGrid4TOTAL_OBITOS2: TdxDBGridColumn;
    qyTARVEsquemaDS_PROVINCIA: TIBStringField;
    qyTARVEsquemaDS_MUNICIPIO: TIBStringField;
    qyTARVEsquemaDS_UNIDADE: TIBStringField;
    qyTARVEsquemaVL_MESANO: TIBStringField;
    qyTARVEsquemaTOTAL_ANTERIOR_CRIANCA1: TLargeintField;
    qyTARVEsquemaTOTAL_ANTERIOR_ADULTO1: TLargeintField;
    qyTARVEsquemaTOTAL_CORRENTE_CRIANCA1: TLargeintField;
    qyTARVEsquemaTOTAL_CORRENTE_ADULTO1: TLargeintField;
    qyTARVEsquemaTOTAL_ANTERIOR_CRIANCA2: TLargeintField;
    qyTARVEsquemaTOTAL_ANTERIOR_ADULTO2: TLargeintField;
    qyTARVEsquemaTOTAL_CORRENTE_CRIANCA2: TLargeintField;
    qyTARVEsquemaTOTAL_CORRENTE_ADULTO2: TLargeintField;
    dxDBGrid5DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid5DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid5DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid5VL_MESANO: TdxDBGridColumn;
    dxDBGrid5TOTAL_ANTERIOR_CRIANCA1: TdxDBGridColumn;
    dxDBGrid5TOTAL_ANTERIOR_ADULTO1: TdxDBGridColumn;
    dxDBGrid5TOTAL_CORRENTE_CRIANCA1: TdxDBGridColumn;
    dxDBGrid5TOTAL_CORRENTE_ADULTO1: TdxDBGridColumn;
    dxDBGrid5TOTAL_ANTERIOR_CRIANCA2: TdxDBGridColumn;
    dxDBGrid5TOTAL_ANTERIOR_ADULTO2: TdxDBGridColumn;
    dxDBGrid5TOTAL_CORRENTE_CRIANCA2: TdxDBGridColumn;
    dxDBGrid5TOTAL_CORRENTE_ADULTO2: TdxDBGridColumn;
    qyTARVCD4DS_PROVINCIA: TIBStringField;
    qyTARVCD4DS_MUNICIPIO: TIBStringField;
    qyTARVCD4DS_UNIDADE: TIBStringField;
    qyTARVCD4VL_MESANO: TIBStringField;
    qyTARVCD4TOTAL_CD4_MENOR_3501: TLargeintField;
    qyTARVCD4TOTAL_CD4_MAIOR_3501: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_11: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_21: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_31: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_41: TLargeintField;
    qyTARVCD4TOTAL_CD4_MENOR_3502: TLargeintField;
    qyTARVCD4TOTAL_CD4_MAIOR_3502: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_12: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_22: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_32: TLargeintField;
    qyTARVCD4TOTAL_ESTADO_CLINICO_42: TLargeintField;
    dxDBGrid6DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid6DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid6DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid6VL_MESANO: TdxDBGridColumn;
    dxDBGrid6TOTAL_CD4_MENOR_3501: TdxDBGridColumn;
    dxDBGrid6TOTAL_CD4_MAIOR_3501: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_11: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_21: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_31: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_41: TdxDBGridColumn;
    dxDBGrid6TOTAL_CD4_MENOR_3502: TdxDBGridColumn;
    dxDBGrid6TOTAL_CD4_MAIOR_3502: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_12: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_22: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_32: TdxDBGridColumn;
    dxDBGrid6TOTAL_ESTADO_CLINICO_42: TdxDBGridColumn;
    qyCoinfeccaoDS_PROVINCIA: TIBStringField;
    qyCoinfeccaoDS_MUNICIPIO: TIBStringField;
    qyCoinfeccaoDS_UNIDADE: TIBStringField;
    qyCoinfeccaoVL_MESANO: TIBStringField;
    qyCoinfeccaoTOTAL_VIH_POSITIVOS1: TLargeintField;
    qyCoinfeccaoTOTAL_TRATAMENTO_ARVS1: TLargeintField;
    qyCoinfeccaoTOTAL_VIH_POSITIVOS2: TLargeintField;
    qyCoinfeccaoTOTAL_TRATAMENTO_ARVS2: TLargeintField;
    dxDBGrid7DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid7DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid7DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid7VL_MESANO: TdxDBGridColumn;
    dxDBGrid7TOTAL_VIH_POSITIVOS1: TdxDBGridColumn;
    dxDBGrid7TOTAL_TRATAMENTO_ARVS1: TdxDBGridColumn;
    dxDBGrid7TOTAL_VIH_POSITIVOS2: TdxDBGridColumn;
    dxDBGrid7TOTAL_TRATAMENTO_ARVS2: TdxDBGridColumn;
    ImageList1: TImageList;
    qyATVcalc: TStringField;
    dxDBGrid1Column13: TdxDBGridColumn;
    qyPTVcalc: TStringField;
    qyPTVTOTAL_CRIANCA2: TLargeintField;
    qyTARVcalc: TStringField;
    qyTARVTOTAL_ACUMULADOS2: TLargeintField;
    qyTARVTOTAL_NOVOS2: TLargeintField;
    qyTARVAcompcalc: TStringField;
    qyTARVEsquemacalc: TStringField;
    qyTARVCD4calc: TStringField;
    qyCoinfeccaocalc: TStringField;
    TabSheet8: TTabSheet;
    Panel17: TPanel;
    dxDBGrid8: TdxDBGrid;
    Panel18: TPanel;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    dsPrograma: TDataSource;
    qyPrograma: TIBQuery;
    qyProgramaDS_PROVINCIA: TIBStringField;
    qyProgramaDS_MUNICIPIO: TIBStringField;
    qyProgramaDS_UNIDADE: TIBStringField;
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
    qyProgramaTOTAL_ACONSELHADOS2: TLargeintField;
    qyProgramaTOTAL_POSITIVOS2: TLargeintField;
    qyProgramaTOTAL_NEGATIVOS2: TLargeintField;
    qyProgramaTOTAL_INDETERMINADOS2: TLargeintField;
    qyProgramaTOTAL_FEMININO_22: TLargeintField;
    qyProgramaTOTAL_MASCULINO_22: TLargeintField;
    qyProgramaTOTAL_GESTANTE_32: TLargeintField;
    qyProgramaTOTAL_POS_PARTO_32: TLargeintField;
    qyProgramaTOTAL_PARTOS_32: TLargeintField;
    qyProgramaTOTAL_FEMININO_522: TLargeintField;
    qyProgramaTOTAL_MASCULINO_522: TLargeintField;
    dxDBGrid8calc: TdxDBGridColumn;
    dxDBGrid8DS_PROVINCIA: TdxDBGridMaskColumn;
    dxDBGrid8DS_MUNICIPIO: TdxDBGridMaskColumn;
    dxDBGrid8DS_UNIDADE: TdxDBGridMaskColumn;
    dxDBGrid8VL_MESANO: TdxDBGridColumn;
    dxDBGrid8TOTAL_ACONSELHADOS1: TdxDBGridColumn;
    dxDBGrid8TOTAL_POSITIVOS1: TdxDBGridColumn;
    dxDBGrid8TOTAL_NEGATIVOS1: TdxDBGridColumn;
    dxDBGrid8TOTAL_INDETERMINADOS1: TdxDBGridColumn;
    dxDBGrid8TOTAL_FEMININO_21: TdxDBGridColumn;
    dxDBGrid8TOTAL_MASCULINO_21: TdxDBGridColumn;
    dxDBGrid8TOTAL_GESTANTE_31: TdxDBGridColumn;
    dxDBGrid8TOTAL_POS_PARTO_31: TdxDBGridColumn;
    dxDBGrid8TOTAL_PARTOS_31: TdxDBGridColumn;
    dxDBGrid8TOTAL_FEMININO_521: TdxDBGridColumn;
    dxDBGrid8TOTAL_MASCULINO_521: TdxDBGridColumn;
    dxDBGrid8TOTAL_ACONSELHADOS2: TdxDBGridColumn;
    dxDBGrid8TOTAL_POSITIVOS2: TdxDBGridColumn;
    dxDBGrid8TOTAL_NEGATIVOS2: TdxDBGridColumn;
    dxDBGrid8TOTAL_INDETERMINADOS2: TdxDBGridColumn;
    dxDBGrid8TOTAL_FEMININO_22: TdxDBGridColumn;
    dxDBGrid8TOTAL_MASCULINO_22: TdxDBGridColumn;
    dxDBGrid8TOTAL_GESTANTE_32: TdxDBGridColumn;
    dxDBGrid8TOTAL_POS_PARTO_32: TdxDBGridColumn;
    dxDBGrid8TOTAL_PARTOS_32: TdxDBGridColumn;
    dxDBGrid8TOTAL_FEMININO_522: TdxDBGridColumn;
    dxDBGrid8TOTAL_MASCULINO_522: TdxDBGridColumn;
    qyProgramacalc: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
    procedure leMunicipioClick(Sender: TObject);
    procedure leUnidadeChange(Sender: TObject);
    procedure leUnidadeButtonClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qyATVBeforeOpen(DataSet: TDataSet);
    procedure qyPTVBeforeOpen(DataSet: TDataSet);
    procedure qyTARVBeforeOpen(DataSet: TDataSet);
    procedure qyTARVAcompBeforeOpen(DataSet: TDataSet);
    procedure qyTARVEsquemaBeforeOpen(DataSet: TDataSet);
    procedure qyTARVCD4BeforeOpen(DataSet: TDataSet);
    procedure qyCoinfeccaoBeforeOpen(DataSet: TDataSet);
    procedure qyATVCalcFields(DataSet: TDataSet);
    procedure dxDBGrid1CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure qyPTVCalcFields(DataSet: TDataSet);
    procedure dxDBGrid2CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure qyTARVCalcFields(DataSet: TDataSet);
    procedure dxDBGrid3CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure qyTARVAcompCalcFields(DataSet: TDataSet);
    procedure dxDBGrid4CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure qyTARVEsquemaCalcFields(DataSet: TDataSet);
    procedure dxDBGrid5CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure qyTARVCD4CalcFields(DataSet: TDataSet);
    procedure dxDBGrid6CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure qyCoinfeccaoCalcFields(DataSet: TDataSet);
    procedure dxDBGrid7CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure qyProgramaBeforeOpen(DataSet: TDataSet);
    procedure qyProgramaCalcFields(DataSet: TDataSet);
    procedure dxDBGrid8CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreConsultas;
  end;

var
  frmAuditoriaRelatorios: TfrmAuditoriaRelatorios;
  strSQLATV,
  strSQLTARV,
  strSQLTARVACOMP,
  strSQLTARVCD4,
  strSQLTARVESQUEMA,
  strSQLPTV,
  strSQLCOINFECCAO,
  strSQLPROGRAMA:String;
  bATV,
  bTARV,
  bTARVACOMP,
  bTARVCD4,
  bTARVESQUEMA,
  bPTV,
  bCOINFECCAO,
  bPROGRAMA:boolean;
  Unidade, Provincia, Municipio:Integer;
  PSQL, MSQL, USQL:string;

implementation

{$R *.dfm}
uses UDM, UDMGeral, uSplash;

procedure TfrmAuditoriaRelatorios.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;


procedure TfrmAuditoriaRelatorios.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;

  qyATV.Close;
  qyTARV.Close;
  qyTARVACOMP.Close;
  qyTARVCD4.Close;
  qyTARVESQUEMA.Close;
  qyPTV.Close;
  qyCOINFECCAO.Close;
  qyPrograma.Close;
  qyATV.Open;
  qyTARV.Open;
  qyTARVACOMP.Open;
  qyTARVCD4.Open;
  qyTARVESQUEMA.Open;
  qyPTV.Open;
  qyCOINFECCAO.Open;
  qyPrograma.Open;

  frmSplash.Close;
  frmSplash.Free;

end;

procedure TfrmAuditoriaRelatorios.FormCreate(Sender: TObject);
begin
  strSQLATV := qyATV.SQL.Text;
  strSQLTARV := qyTARV.SQL.Text;
  strSQLTARVACOMP := qyTARVACOMP.SQL.Text;
  strSQLTARVCD4 := qyTARVCD4.SQL.Text;
  strSQLTARVESQUEMA := qyTARVESQUEMA.SQL.Text;
  strSQLPTV := qyPTV.SQL.Text;
  strSQLCOINFECCAO := qyCOINFECCAO.SQL.Text;
  strSQLPROGRAMA := qyPrograma.SQL.Text;

  AbreConsultas;
end;

procedure TfrmAuditoriaRelatorios.leProvinciaChange(Sender: TObject);
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

procedure TfrmAuditoriaRelatorios.leMunicipioClick(Sender: TObject);
begin
  if leMunicipio.Modified then
  begin
    qyMunicipio.Close;
    qyMunicipio.SQL.Text := MSQL;
    qyMunicipio.SQL.Add('and Upper(ds_municipio) like(''' + '%' + UpperCase(leMunicipio.Text) + '%'')');
    qyMunicipio.Open;
  end
  else
  begin
    qyMunicipio.SQL.Text := MSQL;
    qyMunicipio.Open;
  end;

end;

procedure TfrmAuditoriaRelatorios.leUnidadeChange(Sender: TObject);
begin
  if leUnidade.Modified then
  begin
    qyUnidade.Close;
    qyUnidade.SQL.Text := USQL;
    qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');

    qyUnidade.SQL.Add('order by ds_unidade');
    qyUnidade.Open;
  end
  else
  begin
    qyUnidade.SQL.Text := USQL;
    if leUnidade.Text <> '' then
      qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');

    qyUnidade.SQL.Add('order by ds_unidade');
    qyUnidade.Open;
  end;

end;

procedure TfrmAuditoriaRelatorios.leUnidadeButtonClick(Sender: TObject);
begin
  qyUnidade.Close;
  qyUnidade.SQL.Text := USQL;
  if leUnidade.Text <> '' then
    qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');

  qyUnidade.SQL.Add('order by ds_unidade');
  qyUnidade.Open;

end;

procedure TfrmAuditoriaRelatorios.SpeedButton5Click(Sender: TObject);
begin
  leProvincia.Clear;
  leMunicipio.Clear;
  leUnidade.Clear;
  cbAno.Clear;
end;

procedure TfrmAuditoriaRelatorios.qyATVBeforeOpen(DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
  sWhereCONDICAO := TStringList.Create;
  qyATV.SQL.Text := strSQLATV;
  sSQL := qyATV.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_atv.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_atv.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_atv.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_atv.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyATV.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyATV.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyATV.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyATV.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyATV.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyATV.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;

procedure TfrmAuditoriaRelatorios.qyPTVBeforeOpen(DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
  sWhereCONDICAO := TStringList.Create;
  qyPTV.SQL.Text := strSQLPTV;
  sSQL := qyPTV.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_ptv.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_ptv.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_ptv.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_ptv.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyPTV.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyPTV.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyPTV.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyPTV.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyPTV.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyPTV.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;

procedure TfrmAuditoriaRelatorios.qyTARVBeforeOpen(DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
  sWhereCONDICAO := TStringList.Create;
  qyTARV.SQL.Text := strSQLTARV;
  sSQL := qyTARV.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyTARV.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyTARV.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyTARV.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyTARV.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyTARV.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyTARV.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;


procedure TfrmAuditoriaRelatorios.qyTARVAcompBeforeOpen(DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
  sWhereCONDICAO := TStringList.Create;
  qyTARVAcomp.SQL.Text := strSQLTARVAcomp;
  sSQL := qyTARVAcomp.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_acomp.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_acomp.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_acomp.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_acomp.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyTARVAcomp.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyTARVAcomp.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyTARVAcomp.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyTARVAcomp.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyTARVAcomp.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyTARVAcomp.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;

procedure TfrmAuditoriaRelatorios.qyTARVEsquemaBeforeOpen(
  DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
  sWhereCONDICAO := TStringList.Create;
  qyTARVEsquema.SQL.Text := strSQLTARVEsquema;
  sSQL := qyTARVEsquema.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_esquema.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_esquema.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_esquema.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_esquema.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyTARVEsquema.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyTARVEsquema.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyTARVEsquema.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyTARVEsquema.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyTARVEsquema.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyTARVEsquema.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;


procedure TfrmAuditoriaRelatorios.qyTARVCD4BeforeOpen(DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
  sWhereCONDICAO := TStringList.Create;
  qyTARVCD4.SQL.Text := strSQLTARVCD4;
  sSQL := qyTARVCD4.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_cd4.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_cd4.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_cd4.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_tarv_cd4.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyTARVCD4.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyTARVCD4.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyTARVCD4.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyTARVCD4.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyTARVCD4.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyTARVCD4.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;

procedure TfrmAuditoriaRelatorios.qyCoinfeccaoBeforeOpen(
  DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  inherited;
  sWhereCONDICAO := TStringList.Create;
  qyCoinfeccao.SQL.Text := strSQLCOINFECCAO;
  sSQL := qyCoinfeccao.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_coinfeccao.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_coinfeccao.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_coinfeccao.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_coinfeccao.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyCoinfeccao.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyCoinfeccao.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyCoinfeccao.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyCoinfeccao.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyCoinfeccao.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyCoinfeccao.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;

procedure TfrmAuditoriaRelatorios.qyATVCalcFields(DataSet: TDataSet);
begin
  if (qyATVTOTAL_ACONSELHADOS1.AsInteger <> qyATVTOTAL_ACONSELHADOS2.AsInteger) or
       (qyATVTOTAL_POSITIVOS1.AsInteger <> qyATVTOTAL_POSITIVOS1.AsInteger) or
         (qyATVTOTAL_NEGATIVOS1.AsInteger <> qyATVTOTAL_NEGATIVOS1.AsInteger) or
           (qyATVTOTAL_INDETERMINADO1.AsInteger <> qyATVTOTAL_INDETERMINADO1.AsInteger) then
    qyATVcalc.AsString := 'Diferente'
  else
    qyATVcalc.AsString := 'Igual';

end;

procedure TfrmAuditoriaRelatorios.dxDBGrid1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyATVcalc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;
end;

procedure TfrmAuditoriaRelatorios.qyPTVCalcFields(DataSet: TDataSet);
begin
  if (qyPTVTOTAL_ADMITIDAS_PTV1.AsInteger <> qyPTVTOTAL_ADMITIDAS_PTV2.AsInteger) or
       (qyPTVTOTAL_ADMITIDAS_PARTO1.AsInteger <> qyPTVTOTAL_ADMITIDAS_PARTO2.AsInteger) or
         (qyPTVTOTAL_ADMITIDAS_POS_PARTO1.AsInteger <> qyPTVTOTAL_ADMITIDAS_POS_PARTO2.AsInteger) or
           (qyPTVTOTAL_TERAPIA_COMPLETA1.AsInteger <> qyPTVTOTAL_TERAPIA_COMPLETA2.AsInteger) or
             (qyPTVTOTAL_TERAPIA_OUTRO1.AsInteger <> qyPTVTOTAL_TERAPIA_OUTRO2.AsInteger) or
               (qyPTVTOTAL_TERAPIA_NENHUM1.AsInteger <> qyPTVTOTAL_TERAPIA_NENHUM2.AsInteger) or
                (qyPTVTOTAL_CRIANCA1.AsInteger <> qyPTVTOTAL_CRIANCA2.AsInteger) then
    qyPTVcalc.AsString := 'Diferente'
  else
    qyPTVcalc.AsString := 'Igual';

end;

procedure TfrmAuditoriaRelatorios.dxDBGrid2CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyPTVcalc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;

end;

procedure TfrmAuditoriaRelatorios.qyTARVCalcFields(DataSet: TDataSet);
begin
  if (qyTARVTOTAL_ACUMULADOS1.AsInteger <> qyTARVTOTAL_ACUMULADOS2.AsInteger) or
       (qyTARVTOTAL_NOVOS1.AsInteger <> qyTARVTOTAL_NOVOS2.AsInteger) or
         (qyTARVTOTAL_TRANSFERIDOS1.AsInteger <> qyTARVTOTAL_TRANSFERIDOS2.AsInteger) or
           (qyTARVTOTAL_ABANDONOS1.AsInteger <> qyTARVTOTAL_ABANDONOS2.AsInteger) or
             (qyTARVTOTAL_TRANSFERIDOS_PARA1.AsInteger <> qyTARVTOTAL_TRANSFERIDOS_PARA2.AsInteger) or
               (qyTARVTOTAL_OBITOS1.AsInteger <> qyTARVTOTAL_OBITOS2.AsInteger) then
    qyTARVcalc.AsString := 'Diferente'
  else
    qyTARVcalc.AsString := 'Igual';
end;

procedure TfrmAuditoriaRelatorios.dxDBGrid3CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyTARVcalc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;

end;

procedure TfrmAuditoriaRelatorios.qyTARVAcompCalcFields(DataSet: TDataSet);
begin
  if (qyTARVAcompTOTAL_ACUMULADOS1.AsInteger <> qyTARVAcompTOTAL_ACUMULADOS2.AsInteger) or
       (qyTARVAcompTOTAL_NOVOS1.AsInteger <> qyTARVAcompTOTAL_NOVOS2.AsInteger) or
         (qyTARVAcompTOTAL_TRANSFERIDOS1.AsInteger <> qyTARVAcompTOTAL_TRANSFERIDOS2.AsInteger) or
           (qyTARVAcompTOTAL_ABANDONOS1.AsInteger <> qyTARVAcompTOTAL_ABANDONOS2.AsInteger) or
             (qyTARVAcompTOTAL_TRANSFERIDOS_PARA1.AsInteger <> qyTARVAcompTOTAL_TRANSFERIDOS_PARA2.AsInteger) or
               (qyTARVAcompTOTAL_OBITOS1.AsInteger <> qyTARVAcompTOTAL_OBITOS2.AsInteger) then
    qyTARVAcompcalc.AsString := 'Diferente'
  else
    qyTARVAcompcalc.AsString := 'Igual';

end;

procedure TfrmAuditoriaRelatorios.dxDBGrid4CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyTARVAcompcalc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;

end;

procedure TfrmAuditoriaRelatorios.qyTARVEsquemaCalcFields(
  DataSet: TDataSet);
begin
  if (qyTARVEsquemaTOTAL_ANTERIOR_CRIANCA1.AsInteger <> qyTARVEsquemaTOTAL_ANTERIOR_CRIANCA2.AsInteger) or
       (qyTARVEsquemaTOTAL_ANTERIOR_ADULTO1.AsInteger <> qyTARVEsquemaTOTAL_ANTERIOR_ADULTO2.AsInteger) or
         (qyTARVEsquemaTOTAL_CORRENTE_CRIANCA1.AsInteger <> qyTARVEsquemaTOTAL_CORRENTE_CRIANCA2.AsInteger) or
           (qyTARVEsquemaTOTAL_CORRENTE_ADULTO1.AsInteger <> qyTARVEsquemaTOTAL_CORRENTE_ADULTO2.AsInteger) then
    qyTARVEsquemacalc.AsString := 'Diferente'
  else
    qyTARVEsquemacalc.AsString := 'Igual';

end;

procedure TfrmAuditoriaRelatorios.dxDBGrid5CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyTARVEsquemacalc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;

end;

procedure TfrmAuditoriaRelatorios.qyTARVCD4CalcFields(DataSet: TDataSet);
begin
  if (qyTARVCD4TOTAL_CD4_MENOR_3501.AsInteger <> qyTARVCD4TOTAL_CD4_MENOR_3502.AsInteger) or
       (qyTARVCD4TOTAL_CD4_MAIOR_3501.AsInteger <> qyTARVCD4TOTAL_CD4_MAIOR_3502.AsInteger) or
         (qyTARVCD4TOTAL_ESTADO_CLINICO_11.AsInteger <> qyTARVCD4TOTAL_ESTADO_CLINICO_12.AsInteger) or
           (qyTARVCD4TOTAL_ESTADO_CLINICO_21.AsInteger <> qyTARVCD4TOTAL_ESTADO_CLINICO_22.AsInteger) or
             (qyTARVCD4TOTAL_ESTADO_CLINICO_31.AsInteger <> qyTARVCD4TOTAL_ESTADO_CLINICO_32.AsInteger) or
               (qyTARVCD4TOTAL_ESTADO_CLINICO_41.AsInteger <> qyTARVCD4TOTAL_ESTADO_CLINICO_42.AsInteger) then
    qyTARVCD4calc.AsString := 'Diferente'
  else
    qyTARVCD4calc.AsString := 'Igual';

end;

procedure TfrmAuditoriaRelatorios.dxDBGrid6CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyTARVCD4calc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;

end;

procedure TfrmAuditoriaRelatorios.qyCoinfeccaoCalcFields(
  DataSet: TDataSet);
begin
  if (qyCoinfeccaoTOTAL_VIH_POSITIVOS1.AsInteger <> qyCoinfeccaoTOTAL_VIH_POSITIVOS2.AsInteger) or
       (qyCoinfeccaoTOTAL_TRATAMENTO_ARVS1.AsInteger <> qyCoinfeccaoTOTAL_TRATAMENTO_ARVS2.AsInteger) then
    qyCoinfeccaocalc.AsString := 'Diferente'
  else
    qyCoinfeccaocalc.AsString := 'Igual';

end;

procedure TfrmAuditoriaRelatorios.dxDBGrid7CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyCoinfeccaocalc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;

end;

procedure TfrmAuditoriaRelatorios.qyProgramaBeforeOpen(DataSet: TDataSet);
var sWhereCONDICAO:TStringList;
    sSQLWhere, sSQL, sAux, sWA:String;
    nB,nE:Integer;
    bCondicao:Boolean;
begin
  sWhereCONDICAO := TStringList.Create;
  qyPrograma.SQL.Text := strSQLPrograma;
  sSQL := qyPrograma.SQL.Text;
  try
    try
      GetSQLWhere(sSQL,sSQLWhere,nB,nE);
      bCondicao := (Pos('/*CONDICAO*/',sSQL)>0);

      if (sSQLWhere='') then
        sWA := 'where '
      else
        sWA := 'and ';

      if (leProvincia.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_programa.CD_PROVINCIA = :PROVINCIA');
        sWA := 'and ';
      end;

      if (leMunicipio.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_programa.CD_MUNICIPIO = :MUNICIPIO');
        sWA := 'and ';
      end;

      if (leUnidade.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_programa.CD_UNIDADE = :UNIDADE');
        sWA := 'and ';
      end;

      if (cbAno.Text <> '') then
      begin
        sWhereCONDICAO.Add(sWA + 'registro_programa.VL_MESANO LIKE (:ANO)');
        sWA := 'and ';
      end;

      if (sWhereCONDICAO.Text<>'') then
      begin
        sAux := sSQL;

        if bCondicao then
          sAux := StringReplace(sAux,'/*CONDICAO*/',sWhereCONDICAO.Text,[rfReplaceAll]);

        qyPrograma.SQL.Text := sAux;
      end;

      //Parametros
      if (leProvincia.Text <> '') then
        qyPrograma.ParamByName('PROVINCIA').AsString := leProvincia.LookupValue;

      if (leMunicipio.Text <> '') then
        qyPrograma.ParamByName('MUNICIPIO').AsString := leMunicipio.LookupValue;

      if (leUnidade.Text <> '') then
        qyPrograma.ParamByName('UNIDADE').AsString := leUnidade.LookupValue;

      if (cbAno.Text <> '') then
        qyPrograma.ParamByName('ANO').AsString := '%' + cbAno.Text;

     except
        qyPrograma.SQL.Text := sSQL;
     end;
   finally
      FreeAndNil(sWhereCONDICAO);
   end;

end;

procedure TfrmAuditoriaRelatorios.qyProgramaCalcFields(DataSet: TDataSet);
begin
  if (qyProgramaTOTAL_ACONSELHADOS1.AsInteger <> qyProgramaTOTAL_ACONSELHADOS2.AsInteger) or
      (qyProgramaTOTAL_POSITIVOS1.AsInteger <> qyProgramaTOTAL_POSITIVOS2.AsInteger) or
       (qyProgramaTOTAL_NEGATIVOS1.AsInteger <> qyProgramaTOTAL_NEGATIVOS2.AsInteger) or
        (qyProgramaTOTAL_INDETERMINADOS1.AsInteger <> qyProgramaTOTAL_INDETERMINADOS2.AsInteger) or
         (qyProgramaTOTAL_FEMININO_21.AsInteger <> qyProgramaTOTAL_FEMININO_22.AsInteger) or
          (qyProgramaTOTAL_MASCULINO_21.AsInteger <> qyProgramaTOTAL_MASCULINO_22.AsInteger) or
           (qyProgramaTOTAL_GESTANTE_31.AsInteger <> qyProgramaTOTAL_GESTANTE_32.AsInteger) or
            (qyProgramaTOTAL_POS_PARTO_31.AsInteger <> qyProgramaTOTAL_POS_PARTO_32.AsInteger) or
             (qyProgramaTOTAL_PARTOS_31.AsInteger <> qyProgramaTOTAL_PARTOS_32.AsInteger) or
              (qyProgramaTOTAL_FEMININO_521.AsInteger <> qyProgramaTOTAL_FEMININO_522.AsInteger) or
               (qyProgramaTOTAL_MASCULINO_521.AsInteger <> qyProgramaTOTAL_MASCULINO_522.AsInteger) then
    qyProgramacalc.AsString := 'Diferente'
  else
    qyProgramacalc.AsString := 'Igual';

end;

procedure TfrmAuditoriaRelatorios.dxDBGrid8CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if qyProgramacalc.AsString = 'Diferente' then
    AColor := $005555FF//$000000EC//$004F4FFF//$008080FF
  else
    AColor := clWindow;


end;

end.
