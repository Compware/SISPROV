unit uCadNotGestante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, Menus, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, dxEditor, dxEdLib,
  dxDBELib, Mask, ToolEdit, RXDBCtrl, RxDBComb, dxDBTLCl, dxGrClms,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, RXCtrls, DBCtrls;

type
  TfrmCadNotGestante = class(TfrmCadPad)
    sbGeral: TScrollBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    dxDBEdit1: TdxDBEdit;
    DBDateEdit1: TDBDateEdit;
    btLocProvincia: TdxDBButtonEdit;
    btLocMunicipio: TdxDBButtonEdit;
    btLocUnidade: TdxDBButtonEdit;
    edProvincia: TdxDBEdit;
    edMunicipio: TdxDBEdit;
    edUnidade: TdxDBEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    dxDBEdit2: TdxDBEdit;
    Label13: TLabel;
    DBDateEdit3: TDBDateEdit;
    Label14: TLabel;
    dxDBEdit3: TdxDBEdit;
    Label30: TLabel;
    dxDBEdit16: TdxDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBDateEdit2: TDBDateEdit;
    RxDBComboBox1: TRxDBComboBox;
    Label10: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label11: TLabel;
    Label12: TLabel;
    btLocProvincia2: TdxDBButtonEdit;
    dxDBEdit4: TdxDBEdit;
    Label22: TLabel;
    btLocPais: TdxDBButtonEdit;
    dxDBEdit11: TdxDBEdit;
    dxDBEdit15: TdxDBEdit;
    Label16: TLabel;
    Label15: TLabel;
    dxDBEdit5: TdxDBEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label21: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    Label23: TLabel;
    dxDBEdit10: TdxDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    dxDBEdit12: TdxDBEdit;
    Label26: TLabel;
    dxDBEdit13: TdxDBEdit;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    RxDBComboBox5: TRxDBComboBox;
    Label28: TLabel;
    DBDateEdit4: TDBDateEdit;
    Label29: TLabel;
    RxDBComboBox6: TRxDBComboBox;
    Label31: TLabel;
    RxDBComboBox7: TRxDBComboBox;
    Label32: TLabel;
    dxDBEdit14: TdxDBEdit;
    Label33: TLabel;
    RxDBComboBox8: TRxDBComboBox;
    Label34: TLabel;
    DBDateEdit5: TDBDateEdit;
    Label35: TLabel;
    btLocProvincia4: TdxDBButtonEdit;
    dxDBEdit17: TdxDBEdit;
    Label36: TLabel;
    btLocMunicipio3: TdxDBButtonEdit;
    dxDBEdit18: TdxDBEdit;
    Label37: TLabel;
    btLocUnidade2: TdxDBButtonEdit;
    dxDBEdit19: TdxDBEdit;
    Label38: TLabel;
    DBDateEdit6: TDBDateEdit;
    Label39: TLabel;
    dxDBEdit20: TdxDBEdit;
    Label40: TLabel;
    Label41: TLabel;
    DBDateEdit7: TDBDateEdit;
    Label42: TLabel;
    dxDBEdit21: TdxDBEdit;
    Label43: TLabel;
    dxDBEdit22: TdxDBEdit;
    Label44: TLabel;
    dxDBEdit23: TdxDBEdit;
    Label45: TLabel;
    RxDBComboBox9: TRxDBComboBox;
    Label46: TLabel;
    btLesquema: TSpeedButton;
    Label47: TLabel;
    dxDBEdit24: TdxDBEdit;
    Label48: TLabel;
    DBDateEdit8: TDBDateEdit;
    Label49: TLabel;
    dxDBEdit25: TdxDBEdit;
    Label50: TLabel;
    RxDBComboBox10: TRxDBComboBox;
    Label51: TLabel;
    DBDateEdit9: TDBDateEdit;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    btLocProvincia5: TdxDBButtonEdit;
    btLocMunicipio4: TdxDBButtonEdit;
    btLocUnidade3: TdxDBButtonEdit;
    dxDBEdit26: TdxDBEdit;
    dxDBEdit27: TdxDBEdit;
    dxDBEdit28: TdxDBEdit;
    Label55: TLabel;
    RxDBComboBox11: TRxDBComboBox;
    Label56: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    Label57: TLabel;
    RxDBComboBox13: TRxDBComboBox;
    Label58: TLabel;
    RxDBComboBox14: TRxDBComboBox;
    Label59: TLabel;
    dxDBEdit29: TdxDBEdit;
    RxDBComboBox15: TRxDBComboBox;
    Label60: TLabel;
    Label61: TLabel;
    RxDBComboBox16: TRxDBComboBox;
    Label62: TLabel;
    RxDBComboBox17: TRxDBComboBox;
    Label63: TLabel;
    dxDBEdit30: TdxDBEdit;
    DBDateEdit10: TDBDateEdit;
    Label64: TLabel;
    Label65: TLabel;
    dxDBEdit31: TdxDBEdit;
    Label66: TLabel;
    Label67: TLabel;
    DBDateEdit11: TDBDateEdit;
    Label68: TLabel;
    dxDBEdit32: TdxDBEdit;
    Label69: TLabel;
    RxDBComboBox18: TRxDBComboBox;
    RxDBComboBox19: TRxDBComboBox;
    Label74: TLabel;
    Label75: TLabel;
    RxDBComboBox20: TRxDBComboBox;
    Label76: TLabel;
    RxDBComboBox21: TRxDBComboBox;
    Label77: TLabel;
    dxDBEdit33: TdxDBEdit;
    Label78: TLabel;
    Label79: TLabel;
    RxDBComboBox22: TRxDBComboBox;
    Label80: TLabel;
    Label81: TLabel;
    RxDBComboBox23: TRxDBComboBox;
    Label82: TLabel;
    dxDBEdit35: TdxDBEdit;
    Label83: TLabel;
    Label84: TLabel;
    RxDBComboBox24: TRxDBComboBox;
    Label85: TLabel;
    RxDBComboBox25: TRxDBComboBox;
    Label86: TLabel;
    RxDBComboBox26: TRxDBComboBox;
    Label87: TLabel;
    DBDateEdit12: TDBDateEdit;
    Label88: TLabel;
    DBDateEdit13: TDBDateEdit;
    Label89: TLabel;
    DBDateEdit14: TDBDateEdit;
    Label90: TLabel;
    DBDateEdit15: TDBDateEdit;
    RxDBComboBox27: TRxDBComboBox;
    Label91: TLabel;
    Label92: TLabel;
    RxDBComboBox28: TRxDBComboBox;
    Label93: TLabel;
    RxDBComboBox29: TRxDBComboBox;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    RxDBComboBox30: TRxDBComboBox;
    Label98: TLabel;
    Label99: TLabel;
    DBDateEdit16: TDBDateEdit;
    DBDateEdit17: TDBDateEdit;
    Label100: TLabel;
    Label101: TLabel;
    DBDateEdit18: TDBDateEdit;
    Label102: TLabel;
    Label103: TLabel;
    DBDateEdit19: TDBDateEdit;
    RxDBComboBox31: TRxDBComboBox;
    RxDBComboBox32: TRxDBComboBox;
    RxDBComboBox33: TRxDBComboBox;
    Label104: TLabel;
    RxDBComboBox34: TRxDBComboBox;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    DBDateEdit21: TDBDateEdit;
    DBDateEdit22: TDBDateEdit;
    Label108: TLabel;
    DBDateEdit23: TDBDateEdit;
    dxDBEdit36: TdxDBEdit;
    Label17: TLabel;
    dxDBEdit6: TdxDBEdit;
    dxDBEdit7: TdxDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    btLocMunicipio2: TdxDBButtonEdit;
    dxDBEdit8: TdxDBEdit;
    Label20: TLabel;
    btLocProvincia3: TdxDBButtonEdit;
    dxDBEdit9: TdxDBEdit;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    btLocProvincia6: TdxDBButtonEdit;
    btLocMunicipio5: TdxDBButtonEdit;
    btLocUnidade4: TdxDBButtonEdit;
    dxDBEdit37: TdxDBEdit;
    dxDBEdit38: TdxDBEdit;
    dxDBEdit39: TdxDBEdit;
    RxDBComboBox35: TRxDBComboBox;
    Label112: TLabel;
    GroupBox8: TGroupBox;
    btLocInvestigador: TdxDBButtonEdit;
    dxDBEdit40: TdxDBEdit;
    dxDBEdit41: TdxDBEdit;
    Label113: TLabel;
    Label114: TLabel;
    SpeedButton1: TSpeedButton;
    IBQuery1: TIBQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    RxDBComboBox36: TRxDBComboBox;
    dxDBEdit34: TdxDBEdit;
    Label115: TLabel;
    RxCheckListBox1: TRxCheckListBox;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    dxDBEdit42: TdxDBEdit;
    RxDBComboBox37: TRxDBComboBox;
    RxDBComboBox38: TRxDBComboBox;
    Label116: TLabel;
    DBCheckBox1: TDBCheckBox;
    IBQuery1CD_NOT_GESTANTE: TIntegerField;
    IBQuery1CD_NR_NOFITICACAO: TIBStringField;
    IBQuery1DT_NOTIFICACAO: TDateTimeField;
    IBQuery1CD_PROVINCIA: TIntegerField;
    IBQuery1DS_PROVINCIA: TIBStringField;
    IBQuery1CD_MUNICIPIO: TIntegerField;
    IBQuery1DS_MUNICIPIO: TIBStringField;
    IBQuery1CD_UNIDADE: TIntegerField;
    IBQuery1DS_UNIDADE: TIBStringField;
    IBQuery1NM_GEST: TIBStringField;
    IBQuery1DT_NASC_GEST: TDateTimeField;
    IBQuery1IDADE_GEST: TIntegerField;
    IBQuery1NR_PROCESSO_GEST: TIntegerField;
    IBQuery1DT_APROX_GEST: TDateTimeField;
    IBQuery1FL_SIT_ACTUAL: TIntegerField;
    IBQuery1DS_SIT_ACTUAL: TIBStringField;
    IBQuery1FL_ESTADO_CIVIL: TIntegerField;
    IBQuery1DS_ESTADO_CIVIL: TIBStringField;
    IBQuery1CD_PROV_NASC: TIntegerField;
    IBQuery1DS_PROV_NASC: TIBStringField;
    IBQuery1CD_PAIS_NASC: TIntegerField;
    IBQuery1DS_PAIS_NASC: TIBStringField;
    IBQuery1DS_ENDERECO_NASC: TIBStringField;
    IBQuery1NR_TELEMOVEL: TIBStringField;
    IBQuery1CD_PROV_MORADA: TIntegerField;
    IBQuery1DS_PROV_MORADA: TIBStringField;
    IBQuery1CD_MUN_MORADA: TIntegerField;
    IBQuery1DS_MUN_MORADA: TIBStringField;
    IBQuery1DS_BAIRRO_MORADA: TIBStringField;
    IBQuery1DS_COMUNA_MORADA: TIBStringField;
    IBQuery1FL_NIVEL_ESCO: TIntegerField;
    IBQuery1DS_NIVEL_ESCO: TIBStringField;
    IBQuery1DS_OUTRO_ESCO: TIBStringField;
    IBQuery1FL_FUNCAO: TIntegerField;
    IBQuery1DS_FUNCAO: TIBStringField;
    IBQuery1DS_OUTRA_FUNC: TIBStringField;
    IBQuery1NM_MAE_GEST: TIBStringField;
    IBQuery1FL_MOM_DIAG_VIH_1: TIntegerField;
    IBQuery1DS_MOM_DIAG_VIH_1: TIBStringField;
    IBQuery1DT_DIAG_VIH_1: TDateTimeField;
    IBQuery1FL_SIT_SEROLOGICA_1: TIntegerField;
    IBQuery1DS_SIT_SEROLOGICA_1: TIBStringField;
    IBQuery1FL_OCUP_PARCEIRO_1: TIntegerField;
    IBQuery1DS_OCUP_PARCEIRO_1: TIBStringField;
    IBQuery1DS_OCUP_OUTROS_1: TIBStringField;
    IBQuery1FL_PRENATAL_CPN_2: TIntegerField;
    IBQuery1DS_PRENATAL_CPN_2: TIBStringField;
    IBQuery1DT_PRIMEIRA_CON_2: TDateTimeField;
    IBQuery1CD_UND_CPN_2: TIntegerField;
    IBQuery1DS_UND_CPN_2: TIBStringField;
    IBQuery1CD_MUN_CPN_2: TIntegerField;
    IBQuery1DS_MUN_CPN_2: TIBStringField;
    IBQuery1CD_PROV_CPN_2: TIntegerField;
    IBQuery1DS_PROV_CPN_2: TIBStringField;
    IBQuery1DT_ULT_MESTRUACAO_2: TDateTimeField;
    IBQuery1FL_IDADE_GES_2: TIntegerField;
    IBQuery1DT_PROVAVEL_PARTO_2: TDateTimeField;
    IBQuery1FL_ANT_GESTACOES_2: TIntegerField;
    IBQuery1FL_ANT_ABORTOS_2: TIntegerField;
    IBQuery1FL_ANT_NADO_2: TIntegerField;
    IBQuery1FL_USA_ANTVIRAL_2: TIntegerField;
    IBQuery1DS_USA_ANTVIRAL_2: TIBStringField;
    IBQuery1DS_QUAIS_ANTVIRAL_2: TIBStringField;
    IBQuery1DS_SIGLA_ANTVIRAL_2: TIBStringField;
    IBQuery1DT_INI_ANTVIRAL_2: TDateTimeField;
    IBQuery1FL_NAO_MOTIVOS_2: TIntegerField;
    IBQuery1DS_NAO_MOTIVOS_2: TIBStringField;
    IBQuery1DS_OUTROS_MOTIVOS_2: TIBStringField;
    IBQuery1DT_PARTO_3: TDateTimeField;
    IBQuery1FL_LOCAL_PARTO: TIntegerField;
    IBQuery1DS_LOCAL_PARTO: TIBStringField;
    IBQuery1CD_UND_PARTO_3: TIntegerField;
    IBQuery1DS_UND_PARTO_3: TIBStringField;
    IBQuery1CD_MUN_PARTO_3: TIntegerField;
    IBQuery1DS_MUN_PARTO_3: TIBStringField;
    IBQuery1CD_PROV_PARTO_3: TIntegerField;
    IBQuery1DS_PROV_PARTO_3: TIBStringField;
    IBQuery1FL_TP_PARTO_3: TIntegerField;
    IBQuery1DS_TP_PARTO_3: TIBStringField;
    IBQuery1FL_TP_GEMELAR_3: TIntegerField;
    IBQuery1DS_TP_GEMELAR_3: TIBStringField;
    IBQuery1DS_QUAL_GEMELAR_3: TIBStringField;
    IBQuery1ST_TP_GEMELAR_3: TIBStringField;
    IBQuery1FL_EST_SEROLOGICO_3: TIntegerField;
    IBQuery1DS_EST_SEROLOGICO_3: TIBStringField;
    IBQuery1FL_USA_ANTVIRAL_3: TIntegerField;
    IBQuery1DS_USA_ANTVIRAL_3: TIBStringField;
    IBQuery1FL_NAO_PORQUE_3: TIntegerField;
    IBQuery1DS_NAO_PORQUE_3: TIBStringField;
    IBQuery1DS_OUTROS_MOTIVOS_3: TIBStringField;
    IBQuery1FL_OBITO_MATERNO_3: TIntegerField;
    IBQuery1DS_OBITO_MATERNO_3: TIBStringField;
    IBQuery1FL_DESF_GEST_3: TIntegerField;
    IBQuery1DS_DESF_GEST_3: TIBStringField;
    IBQuery1FL_NADO_VIVO_3: TIntegerField;
    IBQuery1DS_NADO_VIVO_3: TIBStringField;
    IBQuery1NR_PROCESSO_CRI: TIntegerField;
    IBQuery1ST_RN: TIBStringField;
    IBQuery1NM_CRI: TIBStringField;
    IBQuery1DT_NASC_CRI: TDateTimeField;
    IBQuery1IDADE_CRI: TIntegerField;
    IBQuery1FL_IDADE_CRI: TIntegerField;
    IBQuery1DS_IDADE_CRI: TIBStringField;
    IBQuery1FL_SEXO_CRI: TIntegerField;
    IBQuery1DS_SEXO_CRI: TIBStringField;
    IBQuery1DT_PRI_CONS_4: TDateTimeField;
    IBQuery1FL_INI_PROFILAXIA_4: TIntegerField;
    IBQuery1DS_INI_PROFILAXIA_4: TIBStringField;
    IBQuery1FL_ALEITAMENTO_4: TIntegerField;
    IBQuery1DS_ALEITAMENTO_4: TIBStringField;
    IBQuery1FL_ALEI_TEMPO_4: TIntegerField;
    IBQuery1FL_MAE_USO_TARV_4: TIntegerField;
    IBQuery1DS_MAE_USO_TARV_4: TIBStringField;
    IBQuery1FL_NAO_USO_MOTIVO_4: TIntegerField;
    IBQuery1DS_NAO_USO_MOTIVO_4: TIBStringField;
    IBQuery1DS_OUTROS_MOTIVO_4: TIBStringField;
    IBQuery1FL_ALEIT_MATERNO_4: TIntegerField;
    IBQuery1DS_ALEIT_MATERNO_4: TIBStringField;
    IBQuery1FL_ALEI_MATER_TEMPO_4: TIntegerField;
    IBQuery1FL_USO_PROFILAXIA_4: TIntegerField;
    IBQuery1DS_USO_PROFILAXIA_4: TIBStringField;
    IBQuery1FL_TEMPO_USO_PROF_4: TIntegerField;
    IBQuery1DS_TEMPO_USO_PROF_4: TIBStringField;
    IBQuery1FL_PROF_CTX_4: TIntegerField;
    IBQuery1DS_PROF_CTX_4: TIBStringField;
    IBQuery1DT_INICIO_CTX_4: TDateTimeField;
    IBQuery1FL_PRI_CV_5: TIntegerField;
    IBQuery1DS_PRI_CV_5: TIBStringField;
    IBQuery1DT_PRI_CV_5: TDateTimeField;
    IBQuery1FL_SEG_CV_5: TIntegerField;
    IBQuery1DS_SEG_CV_5: TIBStringField;
    IBQuery1DT_SEG_CV_5: TDateTimeField;
    IBQuery1FL_TER_CV_5: TIntegerField;
    IBQuery1DS_TER_CV_5: TIBStringField;
    IBQuery1DT_TER_CV_5: TDateTimeField;
    IBQuery1FL_PRI_TEST_5: TIntegerField;
    IBQuery1DS_PRI_TEST_5: TIBStringField;
    IBQuery1DT_PRI_TEST_5: TDateTimeField;
    IBQuery1FL_SEG_TEST_5: TIntegerField;
    IBQuery1DS_SEG_TEST_5: TIBStringField;
    IBQuery1DT_SEG_TEST_5: TDateTimeField;
    IBQuery1FL_TER_TEST_5: TIntegerField;
    IBQuery1DS_TER_TEST_5: TIBStringField;
    IBQuery1DT_TER_TEST_5: TDateTimeField;
    IBQuery1FL_QUA_TEST_5: TIntegerField;
    IBQuery1DS_QUA_TEST_5: TIBStringField;
    IBQuery1DT_QUA_TEST_5: TDateTimeField;
    IBQuery1FL_DESFECHO_5: TIntegerField;
    IBQuery1DS_DESFECHO_5: TIBStringField;
    IBQuery1DT_DESF_DIAG_5: TDateTimeField;
    IBQuery1DT_DESF_ENCE_5: TDateTimeField;
    IBQuery1DS_LOCAL_TRANS_5: TIBStringField;
    IBQuery1DT_DESF_OBITO_5: TDateTimeField;
    IBQuery1CD_PROV_US_5: TIntegerField;
    IBQuery1DS_PROV_US_5: TIBStringField;
    IBQuery1CD_MUN_US_5: TIntegerField;
    IBQuery1DS_MUN_US_5: TIBStringField;
    IBQuery1CD_UND_US_5: TIntegerField;
    IBQuery1DS_UND_US_5: TIBStringField;
    IBQuery1CD_INVESTIGADOR: TIntegerField;
    IBQuery1NM_INVESTIGADOR: TIBStringField;
    IBQuery1NR_TEL_INVES: TIBStringField;
    IBQuery1CD_UND: TIntegerField;
    IBQuery1DT_EXP: TDateTimeField;
    IBQuery1CD_EDI: TIntegerField;
    IBQuery1CD_USU_INCLUSAO: TIntegerField;
    IBQuery1DT_INCLUSAO: TDateTimeField;
    IBQuery1CD_USU_ALTERACAO: TIntegerField;
    IBQuery1DT_ALTERACAO: TDateTimeField;
    IBQuery1CD_REGISTRO_GERAL: TIntegerField;
    IBQuery1CHAVE: TIBStringField;
    grDadosCD_NOT_GESTANTE: TdxDBGridMaskColumn;
    grDadosCD_NR_NOFITICACAO: TdxDBGridMaskColumn;
    grDadosDT_NOTIFICACAO: TdxDBGridDateColumn;
    grDadosCD_PROVINCIA: TdxDBGridMaskColumn;
    grDadosDS_PROVINCIA: TdxDBGridMaskColumn;
    grDadosCD_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosDS_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosCD_UNIDADE: TdxDBGridMaskColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    grDadosNM_GEST: TdxDBGridMaskColumn;
    grDadosDT_NASC_GEST: TdxDBGridDateColumn;
    grDadosIDADE_GEST: TdxDBGridMaskColumn;
    grDadosNR_PROCESSO_GEST: TdxDBGridMaskColumn;
    grDadosDT_APROX_GEST: TdxDBGridDateColumn;
    grDadosFL_SIT_ACTUAL: TdxDBGridMaskColumn;
    grDadosDS_SIT_ACTUAL: TdxDBGridMaskColumn;
    grDadosFL_ESTADO_CIVIL: TdxDBGridMaskColumn;
    grDadosDS_ESTADO_CIVIL: TdxDBGridMaskColumn;
    grDadosCD_PROV_NASC: TdxDBGridMaskColumn;
    grDadosDS_PROV_NASC: TdxDBGridMaskColumn;
    grDadosCD_PAIS_NASC: TdxDBGridMaskColumn;
    grDadosDS_PAIS_NASC: TdxDBGridMaskColumn;
    grDadosDS_ENDERECO_NASC: TdxDBGridMaskColumn;
    grDadosNR_TELEMOVEL: TdxDBGridMaskColumn;
    grDadosCD_PROV_MORADA: TdxDBGridMaskColumn;
    grDadosDS_PROV_MORADA: TdxDBGridMaskColumn;
    grDadosCD_MUN_MORADA: TdxDBGridMaskColumn;
    grDadosDS_MUN_MORADA: TdxDBGridMaskColumn;
    grDadosDS_BAIRRO_MORADA: TdxDBGridMaskColumn;
    grDadosDS_COMUNA_MORADA: TdxDBGridMaskColumn;
    grDadosFL_NIVEL_ESCO: TdxDBGridMaskColumn;
    grDadosDS_NIVEL_ESCO: TdxDBGridMaskColumn;
    grDadosDS_OUTRO_ESCO: TdxDBGridMaskColumn;
    grDadosFL_FUNCAO: TdxDBGridMaskColumn;
    grDadosDS_FUNCAO: TdxDBGridMaskColumn;
    grDadosDS_OUTRA_FUNC: TdxDBGridMaskColumn;
    grDadosNM_MAE_GEST: TdxDBGridMaskColumn;
    grDadosFL_MOM_DIAG_VIH_1: TdxDBGridMaskColumn;
    grDadosDS_MOM_DIAG_VIH_1: TdxDBGridMaskColumn;
    grDadosDT_DIAG_VIH_1: TdxDBGridDateColumn;
    grDadosFL_SIT_SEROLOGICA_1: TdxDBGridMaskColumn;
    grDadosDS_SIT_SEROLOGICA_1: TdxDBGridMaskColumn;
    grDadosFL_OCUP_PARCEIRO_1: TdxDBGridMaskColumn;
    grDadosDS_OCUP_PARCEIRO_1: TdxDBGridMaskColumn;
    grDadosDS_OCUP_OUTROS_1: TdxDBGridMaskColumn;
    grDadosFL_PRENATAL_CPN_2: TdxDBGridMaskColumn;
    grDadosDS_PRENATAL_CPN_2: TdxDBGridMaskColumn;
    grDadosDT_PRIMEIRA_CON_2: TdxDBGridDateColumn;
    grDadosCD_UND_CPN_2: TdxDBGridMaskColumn;
    grDadosDS_UND_CPN_2: TdxDBGridMaskColumn;
    grDadosCD_MUN_CPN_2: TdxDBGridMaskColumn;
    grDadosDS_MUN_CPN_2: TdxDBGridMaskColumn;
    grDadosCD_PROV_CPN_2: TdxDBGridMaskColumn;
    grDadosDS_PROV_CPN_2: TdxDBGridMaskColumn;
    grDadosDT_ULT_MESTRUACAO_2: TdxDBGridDateColumn;
    grDadosFL_IDADE_GES_2: TdxDBGridMaskColumn;
    grDadosDT_PROVAVEL_PARTO_2: TdxDBGridDateColumn;
    grDadosFL_ANT_GESTACOES_2: TdxDBGridMaskColumn;
    grDadosFL_ANT_ABORTOS_2: TdxDBGridMaskColumn;
    grDadosFL_ANT_NADO_2: TdxDBGridMaskColumn;
    grDadosFL_USA_ANTVIRAL_2: TdxDBGridMaskColumn;
    grDadosDS_USA_ANTVIRAL_2: TdxDBGridMaskColumn;
    grDadosDS_QUAIS_ANTVIRAL_2: TdxDBGridMaskColumn;
    grDadosDS_SIGLA_ANTVIRAL_2: TdxDBGridMaskColumn;
    grDadosDT_INI_ANTVIRAL_2: TdxDBGridDateColumn;
    grDadosFL_NAO_MOTIVOS_2: TdxDBGridMaskColumn;
    grDadosDS_NAO_MOTIVOS_2: TdxDBGridMaskColumn;
    grDadosDS_OUTROS_MOTIVOS_2: TdxDBGridMaskColumn;
    grDadosDT_PARTO_3: TdxDBGridDateColumn;
    grDadosFL_LOCAL_PARTO: TdxDBGridMaskColumn;
    grDadosDS_LOCAL_PARTO: TdxDBGridMaskColumn;
    grDadosCD_UND_PARTO_3: TdxDBGridMaskColumn;
    grDadosDS_UND_PARTO_3: TdxDBGridMaskColumn;
    grDadosCD_MUN_PARTO_3: TdxDBGridMaskColumn;
    grDadosDS_MUN_PARTO_3: TdxDBGridMaskColumn;
    grDadosCD_PROV_PARTO_3: TdxDBGridMaskColumn;
    grDadosDS_PROV_PARTO_3: TdxDBGridMaskColumn;
    grDadosFL_TP_PARTO_3: TdxDBGridMaskColumn;
    grDadosDS_TP_PARTO_3: TdxDBGridMaskColumn;
    grDadosFL_TP_GEMELAR_3: TdxDBGridMaskColumn;
    grDadosDS_TP_GEMELAR_3: TdxDBGridMaskColumn;
    grDadosDS_QUAL_GEMELAR_3: TdxDBGridMaskColumn;
    grDadosST_TP_GEMELAR_3: TdxDBGridMaskColumn;
    grDadosFL_EST_SEROLOGICO_3: TdxDBGridMaskColumn;
    grDadosDS_EST_SEROLOGICO_3: TdxDBGridMaskColumn;
    grDadosFL_USA_ANTVIRAL_3: TdxDBGridMaskColumn;
    grDadosDS_USA_ANTVIRAL_3: TdxDBGridMaskColumn;
    grDadosFL_NAO_PORQUE_3: TdxDBGridMaskColumn;
    grDadosDS_NAO_PORQUE_3: TdxDBGridMaskColumn;
    grDadosDS_OUTROS_MOTIVOS_3: TdxDBGridMaskColumn;
    grDadosFL_OBITO_MATERNO_3: TdxDBGridMaskColumn;
    grDadosDS_OBITO_MATERNO_3: TdxDBGridMaskColumn;
    grDadosFL_DESF_GEST_3: TdxDBGridMaskColumn;
    grDadosDS_DESF_GEST_3: TdxDBGridMaskColumn;
    grDadosFL_NADO_VIVO_3: TdxDBGridMaskColumn;
    grDadosDS_NADO_VIVO_3: TdxDBGridMaskColumn;
    grDadosNR_PROCESSO_CRI: TdxDBGridMaskColumn;
    grDadosST_RN: TdxDBGridMaskColumn;
    grDadosNM_CRI: TdxDBGridMaskColumn;
    grDadosDT_NASC_CRI: TdxDBGridDateColumn;
    grDadosIDADE_CRI: TdxDBGridMaskColumn;
    grDadosFL_IDADE_CRI: TdxDBGridMaskColumn;
    grDadosDS_IDADE_CRI: TdxDBGridMaskColumn;
    grDadosFL_SEXO_CRI: TdxDBGridMaskColumn;
    grDadosDS_SEXO_CRI: TdxDBGridMaskColumn;
    grDadosDT_PRI_CONS_4: TdxDBGridDateColumn;
    grDadosFL_INI_PROFILAXIA_4: TdxDBGridMaskColumn;
    grDadosDS_INI_PROFILAXIA_4: TdxDBGridMaskColumn;
    grDadosFL_ALEITAMENTO_4: TdxDBGridMaskColumn;
    grDadosDS_ALEITAMENTO_4: TdxDBGridMaskColumn;
    grDadosFL_ALEI_TEMPO_4: TdxDBGridMaskColumn;
    grDadosFL_MAE_USO_TARV_4: TdxDBGridMaskColumn;
    grDadosDS_MAE_USO_TARV_4: TdxDBGridMaskColumn;
    grDadosFL_NAO_USO_MOTIVO_4: TdxDBGridMaskColumn;
    grDadosDS_NAO_USO_MOTIVO_4: TdxDBGridMaskColumn;
    grDadosDS_OUTROS_MOTIVO_4: TdxDBGridMaskColumn;
    grDadosFL_ALEIT_MATERNO_4: TdxDBGridMaskColumn;
    grDadosDS_ALEIT_MATERNO_4: TdxDBGridMaskColumn;
    grDadosFL_ALEI_MATER_TEMPO_4: TdxDBGridMaskColumn;
    grDadosFL_USO_PROFILAXIA_4: TdxDBGridMaskColumn;
    grDadosDS_USO_PROFILAXIA_4: TdxDBGridMaskColumn;
    grDadosFL_TEMPO_USO_PROF_4: TdxDBGridMaskColumn;
    grDadosDS_TEMPO_USO_PROF_4: TdxDBGridMaskColumn;
    grDadosFL_PROF_CTX_4: TdxDBGridMaskColumn;
    grDadosDS_PROF_CTX_4: TdxDBGridMaskColumn;
    grDadosDT_INICIO_CTX_4: TdxDBGridDateColumn;
    grDadosFL_PRI_CV_5: TdxDBGridMaskColumn;
    grDadosDS_PRI_CV_5: TdxDBGridMaskColumn;
    grDadosDT_PRI_CV_5: TdxDBGridDateColumn;
    grDadosFL_SEG_CV_5: TdxDBGridMaskColumn;
    grDadosDS_SEG_CV_5: TdxDBGridMaskColumn;
    grDadosDT_SEG_CV_5: TdxDBGridDateColumn;
    grDadosFL_TER_CV_5: TdxDBGridMaskColumn;
    grDadosDS_TER_CV_5: TdxDBGridMaskColumn;
    grDadosDT_TER_CV_5: TdxDBGridDateColumn;
    grDadosFL_PRI_TEST_5: TdxDBGridMaskColumn;
    grDadosDS_PRI_TEST_5: TdxDBGridMaskColumn;
    grDadosDT_PRI_TEST_5: TdxDBGridDateColumn;
    grDadosFL_SEG_TEST_5: TdxDBGridMaskColumn;
    grDadosDS_SEG_TEST_5: TdxDBGridMaskColumn;
    grDadosDT_SEG_TEST_5: TdxDBGridDateColumn;
    grDadosFL_TER_TEST_5: TdxDBGridMaskColumn;
    grDadosDS_TER_TEST_5: TdxDBGridMaskColumn;
    grDadosDT_TER_TEST_5: TdxDBGridDateColumn;
    grDadosFL_QUA_TEST_5: TdxDBGridMaskColumn;
    grDadosDS_QUA_TEST_5: TdxDBGridMaskColumn;
    grDadosDT_QUA_TEST_5: TdxDBGridDateColumn;
    grDadosFL_DESFECHO_5: TdxDBGridMaskColumn;
    grDadosDS_DESFECHO_5: TdxDBGridMaskColumn;
    grDadosDT_DESF_DIAG_5: TdxDBGridDateColumn;
    grDadosDT_DESF_ENCE_5: TdxDBGridDateColumn;
    grDadosDS_LOCAL_TRANS_5: TdxDBGridMaskColumn;
    grDadosDT_DESF_OBITO_5: TdxDBGridDateColumn;
    grDadosCD_PROV_US_5: TdxDBGridMaskColumn;
    grDadosDS_PROV_US_5: TdxDBGridMaskColumn;
    grDadosCD_MUN_US_5: TdxDBGridMaskColumn;
    grDadosDS_MUN_US_5: TdxDBGridMaskColumn;
    grDadosCD_UND_US_5: TdxDBGridMaskColumn;
    grDadosDS_UND_US_5: TdxDBGridMaskColumn;
    grDadosCD_INVESTIGADOR: TdxDBGridMaskColumn;
    grDadosNM_INVESTIGADOR: TdxDBGridMaskColumn;
    grDadosNR_TEL_INVES: TdxDBGridMaskColumn;
    grDadosCD_UND: TdxDBGridMaskColumn;
    grDadosDT_EXP: TdxDBGridDateColumn;
    grDadosCD_EDI: TdxDBGridMaskColumn;
    grDadosCD_USU_INCLUSAO: TdxDBGridMaskColumn;
    grDadosDT_INCLUSAO: TdxDBGridDateColumn;
    grDadosCD_USU_ALTERACAO: TdxDBGridMaskColumn;
    grDadosDT_ALTERACAO: TdxDBGridDateColumn;
    grDadosCD_REGISTRO_GERAL: TdxDBGridMaskColumn;
    grDadosCHAVE: TdxDBGridMaskColumn;
    qyNotGest: TIBQuery;
    qyNotGestCD_NR_NOFITICACAO: TIBStringField;
    qyNotGestDT_NOTIFICACAO: TDateTimeField;
    qyNotGestDT_APROX_GEST: TDateTimeField;
    qyNotGestNM_GEST: TIBStringField;
    qyNotGestDT_NASC_GEST: TDateTimeField;
    qyNotGestNM_MAE_GEST: TIBStringField;
    qyNotGestDT_NASC_CRI: TDateTimeField;
    qyNotGestDS_TP_GEMELAR_3: TIBStringField;
    qyNotGestDS_QUAL_GEMELAR_3: TIBStringField;
    qyNotGestCHAVE: TIBStringField;
    qyNotGestCD_NOT_GESTANTE: TIntegerField;
    qyNotGestCD_UND: TIntegerField;
    dsNotGest: TDataSource;
    qyNotGestDS_SEXO_CRI: TIBStringField;
    Panel5: TPanel;
    GroupBox9: TGroupBox;
    edNr: TEdit;
    Label117: TLabel;
    edNome: TEdit;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edDtNot: TDateEdit;
    edDtNasc: TDateEdit;
    procedure btgravarClick(Sender: TObject);
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grDadosDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btLocInvestigadorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocInvestigadorChange(Sender: TObject);
    procedure btLocInvestigadorExit(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure RxDBComboBox4Exit(Sender: TObject);
    procedure RxDBComboBox3Exit(Sender: TObject);
    procedure RxDBComboBox7Exit(Sender: TObject);
    procedure RxDBComboBox9Exit(Sender: TObject);
    procedure RxDBComboBox35Exit(Sender: TObject);
    procedure RxDBComboBox14Exit(Sender: TObject);
    procedure RxDBComboBox16Exit(Sender: TObject);
    procedure RxDBComboBox21Exit(Sender: TObject);
    procedure RxDBComboBox23Exit(Sender: TObject);
    procedure RxDBComboBox27Exit(Sender: TObject);
    procedure RxDBComboBox28Exit(Sender: TObject);
    procedure RxDBComboBox29Exit(Sender: TObject);
    procedure RxDBComboBox30Exit(Sender: TObject);
    procedure RxDBComboBox31Exit(Sender: TObject);
    procedure RxDBComboBox32Exit(Sender: TObject);
    procedure RxDBComboBox33Exit(Sender: TObject);
    procedure RxDBComboBox34Exit(Sender: TObject);
    procedure RxDBComboBox22Exit(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure RxDBComboBox36Exit(Sender: TObject);
    procedure RxCheckListBox1ClickCheck(Sender: TObject);
    procedure btLesquemaClick(Sender: TObject);
    procedure dsControleStateChange(Sender: TObject);
    procedure btLocProvincia2ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvincia3ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvincia4ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvincia5ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvincia6ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipio2ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipio3ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipio4ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipio5ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidade2ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidade3ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidade4ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocPaisButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure DBDateEdit2Exit(Sender: TObject);
    procedure DBDateEdit11Exit(Sender: TObject);
    procedure RxDBComboBox37Exit(Sender: TObject);
    procedure RxDBComboBox1Exit(Sender: TObject);
    procedure RxDBComboBox2Exit(Sender: TObject);
    procedure RxDBComboBox5Exit(Sender: TObject);
    procedure RxDBComboBox6Exit(Sender: TObject);
    procedure RxDBComboBox8Exit(Sender: TObject);
    procedure RxDBComboBox10Exit(Sender: TObject);
    procedure RxDBComboBox11Exit(Sender: TObject);
    procedure RxDBComboBox12Exit(Sender: TObject);
    procedure RxDBComboBox13Exit(Sender: TObject);
    procedure RxDBComboBox15Exit(Sender: TObject);
    procedure RxDBComboBox17Exit(Sender: TObject);
    procedure RxDBComboBox18Exit(Sender: TObject);
    procedure RxDBComboBox19Exit(Sender: TObject);
    procedure RxDBComboBox24Exit(Sender: TObject);
    procedure RxDBComboBox25Exit(Sender: TObject);
    procedure RxDBComboBox26Exit(Sender: TObject);
    procedure DBCheckBox1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxDBEdit2Exit(Sender: TObject);
    procedure DBDateEdit3Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure VerificarCampos;
    procedure ConsultaGestante;
    procedure GestanteExistente;
  end;

var
  frmCadNotGestante: TfrmCadNotGestante;
  sNESQL,sNLSQL:String;
  
implementation

{$R *.dfm}

USES UGeralSQL, UDM, UDMGERAL, UfrmLocalizar, uCadInvestigador, Math, Ugeral, DateUtils,
  uConGestExistente;

procedure TfrmCadNotGestante.ConsultaGestante;
var sWhere:string;
begin
  if (DMGERAL.TB_NOT_GESTANTE.State in [dsEdit, dsInsert]) then
  begin
    try
      sWhere := 'WHERE';
      qyNotGest.Close;
      qyNotGest.SQL.Text := sNESQL;
      if (DMGERAL.TB_NOT_GESTANTENM_GEST.AsString <> '') then
      begin
         qyNotGest.SQL.Add(sWhere + ' Upper(NM_GEST) like('''+ UpperCase(DMGERAL.TB_NOT_GESTANTENM_GEST.AsString) + '%'')');
         sWhere := 'AND';
      end;

      if (DMGERAL.TB_NOT_GESTANTEDT_NASC_GEST.AsString <> '') then
      begin
         qyNotGest.SQL.Add(sWhere + ' DT_NASC_GEST = :DATA');
         qyNotGest.ParamByName('DATA').AsDate := DMGERAL.TB_NOT_GESTANTEDT_NASC_GEST.AsDateTime;
         sWhere := 'AND';
      end;

      qyNotGest.Open;
      GestanteExistente;
    except
      qyNotGest.close;
    end;
  end;
end;

procedure TfrmCadNotGestante.GestanteExistente;
begin

  if not qyNotGest.Eof then
  begin
    frmGestanteExistente := TfrmGestanteExistente.Create(application);
    frmGestanteExistente.DBGrid1.DataSource := dsNotGest;
    if frmGestanteExistente.ShowModal=mrok then
      begin

        ibQuery1.Locate('CD_NOT_GESTANTE;CD_UND',
              VarArrayOf([qyNotGest.FieldByname('cd_not_gestante').AsInteger,
                qyNotGest.FieldByname('cd_und').AsInteger]), [loPartialKey, loCaseinsensitive]);

        dmGeral.TB_NOT_GESTANTE.cancel;
        dmGeral.TB_NOT_GESTANTE.Close;
        dmGeral.TB_NOT_GESTANTE.Open;
        dmGeral.TB_NOT_GESTANTE.Edit;
      end;
    qyNotGest.Close;
    frmGestanteExistente.Free;
  end;
end;

procedure TfrmCadNotGestante.VerificarCampos;
begin

  if DMGERAL.TB_NOT_GESTANTEDT_NOTIFICACAO.AsString = '' then
  begin
    MessageDlg('� necess�rio incluir a Data da Notifica��o!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    DBDateEdit1.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOT_GESTANTECD_PROVINCIA.AsInteger < 1 then
  begin
    MessageDlg('� necess�rio incluir a Provincia da Notifica��o!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    btLocProvincia.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOT_GESTANTECD_MUNICIPIO.AsInteger < 1 then
  begin
    MessageDlg('� necess�rio incluir o Municipio da Notifica��o!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    btLocMunicipio.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOT_GESTANTECD_UNIDADE.AsInteger < 1 then
  begin
    MessageDlg('� necess�rio incluir a Unidade Sanit�ria da Notifica��o!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    btLocUnidade.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOT_GESTANTENM_GEST.AsString = '' then
  begin
    MessageDlg('� necess�rio incluir o Nome da Utente!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    dxDBEdit2.SetFocus;
    abort;
  end;

  if (DMGERAL.TB_NOT_GESTANTEIDADE_GEST.AsString = '') then
  begin
    MessageDlg('� necess�rio incluir a Idade da Utente!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    dxDBEdit3.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_NOT_GESTANTEDT_PRI_CONS_4.AsString <> '' then
  begin
    if (DMGERAL.TB_NOT_GESTANTENM_CRI.AsString = '') then
    begin
      MessageDlg('� necess�rio incluir o Nome da Crian�a!',mtInformation,
       [mbOK],0);

      pgGeral.TabIndex := 1;
      dxDBEdit31.SetFocus;
      Abort;
    end;

    if (DMGERAL.TB_NOT_GESTANTEIDADE_CRI.AsString = '') then
    begin
      MessageDlg('� necess�rio incluir a Idade da Crian�a!',mtInformation,
       [mbOK],0);

      pgGeral.TabIndex := 1;
      dxDBEdit32.SetFocus;
      Abort;
    end;
  end;
end;

procedure TfrmCadNotGestante.btgravarClick(Sender: TObject);
var
  bGemelar:boolean;
  //String
  sNrtelemovel      ,
  sDsprovincia      ,
  sDsmunicipio      ,
  sDsunidade        ,
  sNmgest           ,
  sDssitactual      ,
  sDsestadocivil    ,
  sDsprovnasc       ,
  sDspais           ,
  sDsendereco       ,
  sDsprovmorada     ,
  sDsmunmorada      ,
  sDsbairo          ,
  sDscomuna         ,
  sDsnivelesco      ,
  sDsoutroesco      ,
  sDsfuncao         ,
  sDsoutrafunc      ,
  sNmmaegest        ,
  sDsmomdiagvih1    ,
  sDsserologia1     ,
  sDsocupparceiro   ,
  sDsocupoutro1     ,
  sFlprenatal2      ,
  sDsprovcpn        ,
  sDsmuncpn         ,
  sDsundcpn         ,
  sDsusaant         ,
  sDsquaisant       ,
  sDssigla          ,
  sDsnaousa         ,
  sDsoutrosmot2     ,
  //Integer alterei para string por conta dos 0 quando forem null
  iFlantgest        ,
  iFlidadegest2     ,
  iCdundcpn         ,
  iCdmuncpn         ,
  iCdprovcpn        ,
  iFlprenatal2      ,
  iFlocupparceiro   ,
  iFlserologia1     ,
  iFlmomdiagvih1    ,
  iFlfuncao         ,
  iFlnivelesco      ,
  iCdmunmorada      ,
  iCdprovmorada     ,
  iCdpais           ,
  iCdprovnasc       ,
  iflestadocivil    ,
  iIdadegest        ,
  iNrprocessogest   ,
  iflsitactual      ,
  iCdunidade        ,
  iCdmunicipio      ,
  iCdprovincia      ,
  iFlantabortos     ,
  iFlantnado        ,
  iFlusaant         ,
  iFlnaousa         ,
  //Data alterei para string por conta da data padr�o do componente quando forem null
  dNrnotificacao   ,
  dDtnascgest      ,
  dDtaproxgest     ,
  dDtdiagvih1      ,
  dDtprimeiracon2  ,
  dDtultmest       ,
  dDtprovavelparto ,
  dDtiniant:string;

  procedure VariaveisGemelar;
  begin
    dNrnotificacao   := DMGERAL.TB_NOT_GESTANTEDT_NOTIFICACAO.AsString       ;
    iCdprovincia     := DMGERAL.TB_NOT_GESTANTECD_PROVINCIA.AsString          ;
    sDsprovincia     := DMGERAL.TB_NOT_GESTANTEDS_PROVINCIA.AsString           ;
    iCdmunicipio     := DMGERAL.TB_NOT_GESTANTECD_MUNICIPIO.AsString          ;
    sDsmunicipio     := DMGERAL.TB_NOT_GESTANTEDS_MUNICIPIO.AsString           ;
    iCdunidade       := DMGERAL.TB_NOT_GESTANTECD_UNIDADE.AsString            ;
    sDsunidade       := DMGERAL.TB_NOT_GESTANTEDS_UNIDADE.AsString             ;
    sNmgest          := DMGERAL.TB_NOT_GESTANTENM_GEST.AsString                ;
    dDtnascgest      := DMGERAL.TB_NOT_GESTANTEDT_NASC_GEST.AsString         ;
    dDtaproxgest     := DMGERAL.TB_NOT_GESTANTEDT_APROX_GEST.AsString        ;
    iIdadegest       := DMGERAL.TB_NOT_GESTANTEIDADE_GEST.AsString            ;
    iNrprocessogest  := DMGERAL.TB_NOT_GESTANTENR_PROCESSO_GEST.AsString      ;
    iflsitactual     := DMGERAL.TB_NOT_GESTANTEFL_SIT_ACTUAL.AsString         ;
    sDssitactual     := DMGERAL.TB_NOT_GESTANTEDS_SIT_ACTUAL.AsString          ;
    iflestadocivil   := DMGERAL.TB_NOT_GESTANTEFL_ESTADO_CIVIL.AsString       ;
    sDsestadocivil   := DMGERAL.TB_NOT_GESTANTEDS_ESTADO_CIVIL.AsString        ;
    iCdprovnasc      := DMGERAL.TB_NOT_GESTANTECD_PROV_NASC.AsString          ;
    sDsprovnasc      := DMGERAL.TB_NOT_GESTANTEDS_PROV_NASC.AsString           ;
    iCdpais          := DMGERAL.TB_NOT_GESTANTECD_PAIS_NASC.AsString          ;
    sDspais          := DMGERAL.TB_NOT_GESTANTEDS_PAIS_NASC.AsString           ;
    sDsendereco      := DMGERAL.TB_NOT_GESTANTEDS_ENDERECO_NASC.AsString       ;
    sNrtelemovel     := DMGERAL.TB_NOT_GESTANTENR_TELEMOVEL.AsString           ;
    iCdprovmorada    := DMGERAL.TB_NOT_GESTANTECD_PROV_MORADA.AsString        ;
    sDsprovmorada    := DMGERAL.TB_NOT_GESTANTEDS_PROV_MORADA.AsString         ;
    iCdmunmorada     := DMGERAL.TB_NOT_GESTANTECD_MUN_MORADA.AsString         ;
    sDsmunmorada     := DMGERAL.TB_NOT_GESTANTEDS_MUN_MORADA.AsString          ;
    sDsbairo         := DMGERAL.TB_NOT_GESTANTEDS_BAIRRO_MORADA.AsString       ;
    sDscomuna        := DMGERAL.TB_NOT_GESTANTEDS_COMUNA_MORADA.AsString       ;
    iFlnivelesco     := DMGERAL.TB_NOT_GESTANTEFL_NIVEL_ESCO.AsString         ;
    sDsnivelesco     := DMGERAL.TB_NOT_GESTANTEDS_NIVEL_ESCO.AsString          ;
    sDsoutroesco     := DMGERAL.TB_NOT_GESTANTEDS_OUTRO_ESCO.AsString          ;
    iFlfuncao        := DMGERAL.TB_NOT_GESTANTEFL_FUNCAO.AsString             ;
    sDsfuncao        := DMGERAL.TB_NOT_GESTANTEDS_FUNCAO.AsString              ;
    sDsoutrafunc     := DMGERAL.TB_NOT_GESTANTEDS_OUTRA_FUNC.AsString          ;
    sNmmaegest       := DMGERAL.TB_NOT_GESTANTENM_MAE_GEST.AsString            ;
    iFlmomdiagvih1   := DMGERAL.TB_NOT_GESTANTEFL_MOM_DIAG_VIH_1.AsString     ;
    sDsmomdiagvih1   := DMGERAL.TB_NOT_GESTANTEDS_MOM_DIAG_VIH_1.AsString      ;
    dDtdiagvih1      := DMGERAL.TB_NOT_GESTANTEDT_DIAG_VIH_1.AsString        ;
    iFlserologia1    := DMGERAL.TB_NOT_GESTANTEFL_SIT_SEROLOGICA_1.AsString   ;
    sDsserologia1    := DMGERAL.TB_NOT_GESTANTEDS_SIT_SEROLOGICA_1.AsString    ;
    iFlocupparceiro  := DMGERAL.TB_NOT_GESTANTEFL_OCUP_PARCEIRO_1.AsString    ;
    sDsocupparceiro  := DMGERAL.TB_NOT_GESTANTEDS_OCUP_PARCEIRO_1.AsString     ;
    sDsocupoutro1    := DMGERAL.TB_NOT_GESTANTEDS_OCUP_OUTROS_1.AsString       ;
    iFlprenatal2     := DMGERAL.TB_NOT_GESTANTEFL_PRENATAL_CPN_2.AsString     ;
    sFlprenatal2     := DMGERAL.TB_NOT_GESTANTEDS_PRENATAL_CPN_2.AsString      ;
    dDtprimeiracon2  := DMGERAL.TB_NOT_GESTANTEDT_PRIMEIRA_CON_2.AsString    ;
    iCdprovcpn       := DMGERAL.TB_NOT_GESTANTECD_PROV_CPN_2.AsString         ;
    sDsprovcpn       := DMGERAL.TB_NOT_GESTANTEDS_PROV_CPN_2.AsString          ;
    iCdmuncpn        := DMGERAL.TB_NOT_GESTANTECD_MUN_CPN_2.AsString          ;
    sDsmuncpn        := DMGERAL.TB_NOT_GESTANTEDS_MUN_CPN_2.AsString           ;
    iCdundcpn        := DMGERAL.TB_NOT_GESTANTECD_UND_CPN_2.AsString          ;
    sDsundcpn        := DMGERAL.TB_NOT_GESTANTEDS_UND_CPN_2.AsString           ;
    dDtultmest       := DMGERAL.TB_NOT_GESTANTEDT_ULT_MESTRUACAO_2.AsString  ;
    iFlidadegest2    := DMGERAL.TB_NOT_GESTANTEFL_IDADE_GES_2.AsString        ;
    dDtprovavelparto := DMGERAL.TB_NOT_GESTANTEDT_PROVAVEL_PARTO_2.AsString  ;
    iFlantgest       := DMGERAL.TB_NOT_GESTANTEFL_ANT_GESTACOES_2.AsString    ;
    iFlantabortos    := DMGERAL.TB_NOT_GESTANTEFL_ANT_ABORTOS_2.AsString      ;
    iFlantnado       := DMGERAL.TB_NOT_GESTANTEFL_ANT_NADO_2.AsString         ;
    iFlusaant        := DMGERAL.TB_NOT_GESTANTEFL_USA_ANTVIRAL_2.AsString     ;
    sDsusaant        := DMGERAL.TB_NOT_GESTANTEDS_USA_ANTVIRAL_2.AsString      ;
    sDsquaisant      := DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString    ;
    sDssigla         := DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString    ;
    dDtiniant        := DMGERAL.TB_NOT_GESTANTEDT_INI_ANTVIRAL_2.AsString    ;
    iFlnaousa        := DMGERAL.TB_NOT_GESTANTEFL_NAO_MOTIVOS_2.AsString      ;
    sDsnaousa        := DMGERAL.TB_NOT_GESTANTEDS_NAO_MOTIVOS_2.AsString       ;
    sDsoutrosmot2    := DMGERAL.TB_NOT_GESTANTEDS_OUTROS_MOTIVOS_2.AsString    ;
  end;

  procedure IncluirNotGemelar;
  begin
     btIncluirClick(sender);
     DMGERAL.TB_NOT_GESTANTEDT_NOTIFICACAO.AsString        :=   dNrnotificacao  ;
     DMGERAL.TB_NOT_GESTANTECD_PROVINCIA.AsString           :=   iCdprovincia    ;
     DMGERAL.TB_NOT_GESTANTEDS_PROVINCIA.AsString            :=   sDsprovincia    ;
     DMGERAL.TB_NOT_GESTANTECD_MUNICIPIO.AsString           :=   iCdmunicipio    ;
     DMGERAL.TB_NOT_GESTANTEDS_MUNICIPIO.AsString            :=   sDsmunicipio    ;
     DMGERAL.TB_NOT_GESTANTECD_UNIDADE.AsString             :=   iCdunidade      ;
     DMGERAL.TB_NOT_GESTANTEDS_UNIDADE.AsString              :=   sDsunidade      ;
     DMGERAL.TB_NOT_GESTANTENM_GEST.AsString                 :=   sNmgest         ;
     DMGERAL.TB_NOT_GESTANTEDT_NASC_GEST.AsString          :=   dDtnascgest     ;
     DMGERAL.TB_NOT_GESTANTEDT_APROX_GEST.AsString         :=   dDtaproxgest    ;
     DMGERAL.TB_NOT_GESTANTEIDADE_GEST.AsString             :=   iIdadegest      ;
     DMGERAL.TB_NOT_GESTANTENR_PROCESSO_GEST.AsString       :=   iNrprocessogest ;
     DMGERAL.TB_NOT_GESTANTEFL_SIT_ACTUAL.AsString          :=   iflsitactual    ;
     DMGERAL.TB_NOT_GESTANTEDS_SIT_ACTUAL.AsString           :=   sDssitactual    ;
     DMGERAL.TB_NOT_GESTANTEFL_ESTADO_CIVIL.AsString        :=   iflestadocivil  ;
     DMGERAL.TB_NOT_GESTANTEDS_ESTADO_CIVIL.AsString         :=   sDsestadocivil  ;
     DMGERAL.TB_NOT_GESTANTECD_PROV_NASC.AsString           :=   iCdprovnasc     ;
     DMGERAL.TB_NOT_GESTANTEDS_PROV_NASC.AsString            :=   sDsprovnasc     ;
     DMGERAL.TB_NOT_GESTANTECD_PAIS_NASC.AsString           :=   iCdpais         ;
     DMGERAL.TB_NOT_GESTANTEDS_PAIS_NASC.AsString            :=   sDspais         ;
     DMGERAL.TB_NOT_GESTANTEDS_ENDERECO_NASC.AsString        :=   sDsendereco     ;
     DMGERAL.TB_NOT_GESTANTENR_TELEMOVEL.AsString            :=   sNrtelemovel    ;
     DMGERAL.TB_NOT_GESTANTECD_PROV_MORADA.AsString         :=   iCdprovmorada   ;
     DMGERAL.TB_NOT_GESTANTEDS_PROV_MORADA.AsString          :=   sDsprovmorada   ;
     DMGERAL.TB_NOT_GESTANTECD_MUN_MORADA.AsString          :=   iCdmunmorada    ;
     DMGERAL.TB_NOT_GESTANTEDS_MUN_MORADA.AsString           :=   sDsmunmorada    ;
     DMGERAL.TB_NOT_GESTANTEDS_BAIRRO_MORADA.AsString        :=   sDsbairo        ;
     DMGERAL.TB_NOT_GESTANTEDS_COMUNA_MORADA.AsString        :=   sDscomuna       ;
     DMGERAL.TB_NOT_GESTANTEFL_NIVEL_ESCO.AsString          :=   iFlnivelesco    ;
     DMGERAL.TB_NOT_GESTANTEDS_NIVEL_ESCO.AsString           :=   sDsnivelesco    ;
     DMGERAL.TB_NOT_GESTANTEDS_OUTRO_ESCO.AsString           :=   sDsoutroesco    ;
     DMGERAL.TB_NOT_GESTANTEFL_FUNCAO.AsString              :=   iFlfuncao       ;
     DMGERAL.TB_NOT_GESTANTEDS_FUNCAO.AsString               :=   sDsfuncao       ;
     DMGERAL.TB_NOT_GESTANTEDS_OUTRA_FUNC.AsString           :=   sDsoutrafunc    ;
     DMGERAL.TB_NOT_GESTANTENM_MAE_GEST.AsString             :=   sNmmaegest      ;
     DMGERAL.TB_NOT_GESTANTEFL_MOM_DIAG_VIH_1.AsString      :=   iFlmomdiagvih1  ;
     DMGERAL.TB_NOT_GESTANTEDS_MOM_DIAG_VIH_1.AsString       :=   sDsmomdiagvih1  ;
     DMGERAL.TB_NOT_GESTANTEDT_DIAG_VIH_1.AsString         :=   dDtdiagvih1     ;
     DMGERAL.TB_NOT_GESTANTEFL_SIT_SEROLOGICA_1.AsString    :=   iFlserologia1   ;
     DMGERAL.TB_NOT_GESTANTEDS_SIT_SEROLOGICA_1.AsString     :=   sDsserologia1   ;
     DMGERAL.TB_NOT_GESTANTEFL_OCUP_PARCEIRO_1.AsString     :=   iFlocupparceiro ;
     DMGERAL.TB_NOT_GESTANTEDS_OCUP_PARCEIRO_1.AsString      :=   sDsocupparceiro ;
     DMGERAL.TB_NOT_GESTANTEDS_OCUP_OUTROS_1.AsString        :=   sDsocupoutro1   ;
     DMGERAL.TB_NOT_GESTANTEFL_PRENATAL_CPN_2.AsString      :=   iFlprenatal2    ;
     DMGERAL.TB_NOT_GESTANTEDS_PRENATAL_CPN_2.AsString       :=   sFlprenatal2    ;
     DMGERAL.TB_NOT_GESTANTEDT_PRIMEIRA_CON_2.AsString     :=   dDtprimeiracon2 ;
     DMGERAL.TB_NOT_GESTANTECD_PROV_CPN_2.AsString          :=   iCdprovcpn      ;
     DMGERAL.TB_NOT_GESTANTEDS_PROV_CPN_2.AsString           :=   sDsprovcpn      ;
     DMGERAL.TB_NOT_GESTANTECD_MUN_CPN_2.AsString           :=   iCdmuncpn       ;
     DMGERAL.TB_NOT_GESTANTEDS_MUN_CPN_2.AsString            :=   sDsmuncpn       ;
     DMGERAL.TB_NOT_GESTANTECD_UND_CPN_2.AsString           :=   iCdundcpn       ;
     DMGERAL.TB_NOT_GESTANTEDS_UND_CPN_2.AsString            :=   sDsundcpn       ;
     DMGERAL.TB_NOT_GESTANTEDT_ULT_MESTRUACAO_2.AsString   :=   dDtultmest      ;
     DMGERAL.TB_NOT_GESTANTEFL_IDADE_GES_2.AsString         :=   iFlidadegest2   ;
     DMGERAL.TB_NOT_GESTANTEDT_PROVAVEL_PARTO_2.AsString   :=   dDtprovavelparto;
     DMGERAL.TB_NOT_GESTANTEFL_ANT_GESTACOES_2.AsString     :=   iFlantgest      ;
     DMGERAL.TB_NOT_GESTANTEFL_ANT_ABORTOS_2.AsString       :=   iFlantabortos   ;
     DMGERAL.TB_NOT_GESTANTEFL_ANT_NADO_2.AsString          :=   iFlantnado      ;
     DMGERAL.TB_NOT_GESTANTEFL_USA_ANTVIRAL_2.AsString      :=   iFlusaant       ;
     DMGERAL.TB_NOT_GESTANTEDS_USA_ANTVIRAL_2.AsString       :=   sDsusaant       ;
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString     :=   sDsquaisant     ;
     DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString     :=   sDssigla        ;
     DMGERAL.TB_NOT_GESTANTEDT_INI_ANTVIRAL_2.AsString     :=   dDtiniant       ;
     DMGERAL.TB_NOT_GESTANTEFL_NAO_MOTIVOS_2.AsString       :=   iFlnaousa       ;
     DMGERAL.TB_NOT_GESTANTEDS_NAO_MOTIVOS_2.AsString        :=   sDsnaousa       ;
     DMGERAL.TB_NOT_GESTANTEDS_OUTROS_MOTIVOS_2.AsString     :=   sDsoutrosmot2   ;
  end;
	
begin
  VerificarCampos;
  //Parto Gemelar
  bGemelar := (DMGERAL.TB_NOT_GESTANTEFL_TP_GEMELAR_3.AsInteger = 1);
  if bGemelar then
    VariaveisGemelar; //popular variaveis


  //Numero Notifica��o GESTANTE 0000(UN)00000(GEN)
  if DMGERAL.TB_NOT_GESTANTE.State in [dsInsert] then
  begin
    DMGERAL.TB_NOT_GESTANTECD_NR_NOFITICACAO.AsString :=
     ZeroEsq(DMGERAL.TB_NOT_GESTANTECD_UNIDADE.AsString, 4) +  '-' +
       ZeroEsq(IntToStr(dm.GeraCodigo('GEN_NR_NOT_GEST')), 5);
  end;

  inherited;
  if bGemelar then
  if MessageDlg('Parto Gemelar, deseja incluir uma nova a Notifica��o '+ #10#13 +
                'com os mesmos dados da Gestante atual?',mtConfirmation,[mbYes,mbNo], 0) = mrYes then
    IncluirNotGemelar; //Proxima notificacao autom�tica

end;

procedure TfrmCadNotGestante.btLocProvinciaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
    begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Provincia';
    frmLocalizar.qyDados := SelectDadosProvincia;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,2);
      frmLocalizar.KeyField := 'cd_provincia';
      VCampo[0].Titulo  := 'Prov';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome da Provincia';
      VCampo[1].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      dmGeral.TB_NOT_GESTANTECD_PROVINCIA.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
      dmGeral.TB_NOT_GESTANTEDS_PROVINCIA.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
      DMGERAL.TB_NOT_GESTANTECD_MUNICIPIO.Clear;
      DMGERAL.TB_NOT_GESTANTEDS_MUNICIPIO.Clear;
      DMGERAL.TB_NOT_GESTANTECD_UNIDADE.Clear;
      DMGERAL.TB_NOT_GESTANTEDS_UNIDADE.Clear;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadNotGestante.btLocMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_MUNICIPIO, DS_MUNICIPIO');
  frmLocalizar.qyDados.sql.add('from MUNICIPIO');
  if(dsControle.DataSet.FieldByName('CD_PROVINCIA').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_PROVINCIA = :CD_PROVINCIA');
    frmLocalizar.qyDados.ParamByName('CD_PROVINCIA').AsInteger := dsControle.DataSet.FieldByName('CD_PROVINCIA').AsInteger;
    frmLocalizar.Where := true;
  end
  else
  begin
    MessageDlg('� necess�rio incluir uma prov�ncia!',mtInformation,[mbOK],0);
    abort;
  end;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Municipio';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome do Municipio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_MUNICIPIO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_MUNICIPIO.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
    DMGERAL.TB_NOT_GESTANTECD_UNIDADE.Clear;
    DMGERAL.TB_NOT_GESTANTEDS_UNIDADE.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_UNIDADE, DS_UNIDADE');
  frmLocalizar.qyDados.sql.add('from UNIDADE');
  if(dsControle.DataSet.FieldByName('CD_MUNICIPIO').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_MUNICIPIO = :CD_MUNICIPIO');
    frmLocalizar.qyDados.ParamByName('CD_MUNICIPIO').AsInteger := dsControle.DataSet.FieldByName('CD_MUNICIPIO').AsInteger;
    frmLocalizar.Where := true;
  end
  else
  begin
    MessageDlg('� necess�rio incluir um munic�pio!',mtInformation,[mbOK],0);
    abort;
  end;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'Unidade';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_UNIDADE.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_UNIDADE.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.FormShow(Sender: TObject);
begin
  inherited;
  IBQuery1.Open;
  DMGERAL.TB_NOT_GESTANTE.DataSource := dsGrid;
end;

procedure TfrmCadNotGestante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IBQuery1.Close;
end;

procedure TfrmCadNotGestante.grDadosDblClick(Sender: TObject);
begin
  inherited;
  dmGeral.TB_NOT_GESTANTE.Close;
  dmGeral.TB_NOT_GESTANTE.Open;
end;

procedure TfrmCadNotGestante.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOT_GESTANTE.State in [dsEdit, dsInsert] then
  begin
    frmCadInvestigador := TfrmCadInvestigador.Create(self);
    frmCadInvestigador.ShowModal;
    frmCadInvestigador.Free;
  end;
end;

procedure TfrmCadNotGestante.btLocInvestigadorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if DMGERAL.TB_NOT_GESTANTE.State in [dsEdit, dsInsert] then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Investigador';
    frmLocalizar.qyDados := SelectDadosInvestigador;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,4);
      frmLocalizar.KeyField := 'cd_investigador';
      VCampo[0].Titulo  := 'C�d.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome';
      VCampo[1].Width := 25;
      VCampo[2].Titulo  := 'Fun��o';
      VCampo[2].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := True;
      VCampo[3].Visivel := false;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      DMGERAL.TB_NOT_GESTANTENM_INVESTIGADOR.AsString := frmLocalizar.qyDados.FieldByname('nm_investigador').AsString;
      DMGERAL.TB_NOT_GESTANTENR_TEL_INVES.AsString := frmLocalizar.qyDados.FieldByname('nr_telefone').AsString;
      DMGERAL.TB_NOT_GESTANTECD_INVESTIGADOR.AsInteger := frmLocalizar.qyDados.FieldByname('cd_investigador').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;

end;

procedure TfrmCadNotGestante.btLocInvestigadorChange(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOT_GESTANTE.State in [dsEdit,dsInsert] then
  begin
    if btLocInvestigador.Text = '' then
      DMGERAL.TB_NOT_GESTANTENM_INVESTIGADOR.Clear
    else if btLocInvestigador.Modified then
    begin
      try
        DMGERAL.TB_NOT_GESTANTENM_INVESTIGADOR.AsString := PegaValor('NM_INVESTIGADOR','INVESTIGADOR',['CD_INVESTIGADOR'],
          [btLocInvestigador.Text],nil);

        if PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil) <> null then
          DMGERAL.TB_NOT_GESTANTENR_TEL_INVES.AsString :=
            PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil)
        else
          DMGERAL.TB_NOT_GESTANTENR_TEL_INVES.Clear;

      except
        begin
          DMGERAL.TB_NOT_GESTANTENM_INVESTIGADOR.Clear;
          DMGERAL.TB_NOT_GESTANTENR_TEL_INVES.Clear;
        end;
      end;
    end;
  end;


end;

procedure TfrmCadNotGestante.btLocInvestigadorExit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOT_GESTANTE.State in [dsEdit,dsInsert] then
  begin
    if btLocInvestigador.Text <> '' then
    begin
      try
        DMGERAL.TB_NOT_GESTANTENM_INVESTIGADOR.AsString := PegaValor('NM_INVESTIGADOR','INVESTIGADOR',['CD_INVESTIGADOR'],
          [btLocInvestigador.Text],nil);

        if PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil) <> null then
          DMGERAL.TB_NOT_GESTANTENR_TEL_INVES.AsString :=
            PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil)
        else
          DMGERAL.TB_NOT_GESTANTENR_TEL_INVES.Clear;
      except
        begin
          MessageDlg('Investigador n�o encontrado!',mtWarning,[mbOK],0);
          DMGERAL.TB_NOT_GESTANTENM_INVESTIGADOR.Clear;
          DMGERAL.TB_NOT_GESTANTENR_TEL_INVES.Clear;
          DMGERAL.TB_NOT_GESTANTECD_INVESTIGADOR.Clear;
        end;
      end;
    end;
  end;

end;

procedure TfrmCadNotGestante.btIncluirClick(Sender: TObject);
begin
  inherited;
  DBDateEdit1.SetFocus;
end;

procedure TfrmCadNotGestante.bteditarClick(Sender: TObject);
begin
  inherited;
  DBDateEdit1.SetFocus;
end;

procedure TfrmCadNotGestante.RxDBComboBox4Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_NIVEL_ESCO.AsString := RxDBComboBox4.Text;

    if RxDBComboBox4.Text = 'Outro' then
    begin
      dxDBEdit10.Enabled := true;
      dxDBEdit10.SetFocus;
    end
    else
      dxDBEdit10.Enabled := false;
  end;
end;

procedure TfrmCadNotGestante.RxDBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_FUNCAO.AsString := RxDBComboBox3.Text;

    if RxDBComboBox3.Text = 'OUTRAS OCUPACOES' then
    begin
      dxDBEdit12.Enabled := true;
      dxDBEdit12.SetFocus;

    end
    else
      dxDBEdit12.Enabled := false;

  end;
end;

procedure TfrmCadNotGestante.RxDBComboBox7Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_OCUP_PARCEIRO_1.AsString := RxDBComboBox7.Text;

    if RxDBComboBox7.Text = 'OUTRAS OCUPACOES' then
    begin
      dxDBEdit14.Enabled := true;
      dxDBEdit14.SetFocus;

    end
    else
      dxDBEdit14.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox9Exit(Sender: TObject);
var i:integer;
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_USA_ANTVIRAL_2.AsString := RxDBComboBox9.Text;

    if RxDBComboBox9.Text = 'Sim' then
    begin

      dxDBEdit24.Enabled := true;
      //RxCheckListBox1.SetFocus;
      DBDateEdit8.Enabled := true;
      dxDBEdit42.Enabled := true;
      btLesquema.Enabled := true;
      RxCheckListBox1.Enabled := true;
    end
    else
    begin
      dxDBEdit24.Enabled := false;
      DBDateEdit8.Enabled := false;
      dxDBEdit42.Enabled := false;
      btLesquema.Enabled := false;
      RxCheckListBox1.Enabled := false;
      DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.Clear;
      for i:= 0 to 11 do
      begin
        RxCheckListBox1.Checked[i] := false;
      end;
    end;

    if RxDBComboBox9.Text = 'N�o' then
    begin
      RxDBComboBox35.Enabled := true;
      RxDBComboBox35.SetFocus;

    end
    else
      RxDBComboBox35.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox35Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_NAO_MOTIVOS_2.AsString := RxDBComboBox35.Text;

    if RxDBComboBox35.Text = 'Outros motivos' then
    begin
      dxDBEdit25.Enabled := true;
      dxDBEdit25.SetFocus;

    end
    else
      dxDBEdit25.Enabled := false;

   dmGeral.TB_NOT_GESTANTEDS_NAO_MOTIVOS_2.AsString := RxDBComboBox35.Text;
  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox14Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_USA_ANTVIRAL_3.AsString := RxDBComboBox14.Text;

    if RxDBComboBox14.Text = 'N�o usou' then
    begin
      RxDBComboBox37.Enabled := true;
      RxDBComboBox37.SetFocus;

    end
    else
      RxDBComboBox37.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox16Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_DESF_GEST_3.AsString := RxDBComboBox16.Text;

    if RxDBComboBox16.Text = 'Nado vivo' then
    begin
      RxDBComboBox17.Enabled := true;
      RxDBComboBox17.SetFocus;

    end
    else
      RxDBComboBox17.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox21Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_ALEITAMENTO_4.AsString := RxDBComboBox21.Text;

    if (RxDBComboBox21.Text = 'Materno exclusivo em uso') or (RxDBComboBox21.Text = 'Misto em uso' ) then
    begin
      dxDBEdit33.Enabled := true;
      dxDBEdit33.SetFocus;
    end
    else
      dxDBEdit33.Enabled := false;
  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox23Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_ALEIT_MATERNO_4.AsString := RxDBComboBox23.Text;

    if RxDBComboBox23.Text = 'Sim' then
    begin
      dxDBEdit35.Enabled := true;
      dxDBEdit35.SetFocus;

    end
    else
      dxDBEdit35.Enabled := false;

    if RxDBComboBox23.Text = 'N�o' then
    begin
      RxDBComboBox25.Enabled := true;
      RxDBComboBox25.SetFocus;

      RxDBComboBox24.Enabled := true;
    end
    else
    begin
      RxDBComboBox25.Enabled := false;
      RxDBComboBox24.Enabled := false;
    end;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox27Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_PRI_CV_5.AsString := RxDBComboBox27.Text;

    if (RxDBComboBox27.Text = 'Detect�vel') or (RxDBComboBox27.Text = 'Indetect�vel') then
    begin
      DBDateEdit13.Enabled := true;
      DBDateEdit13.SetFocus;

    end
    else
      DBDateEdit13.Enabled := false;


  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox28Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_SEG_CV_5.AsString := RxDBComboBox28.Text;

    if (RxDBComboBox28.Text = 'Detect�vel') or (RxDBComboBox28.Text = 'Indetect�vel') then
    begin
      DBDateEdit14.Enabled := true;
      DBDateEdit14.SetFocus;

    end
    else
      DBDateEdit14.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox29Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_TER_CV_5.AsString := RxDBComboBox29.Text;

    if (RxDBComboBox29.Text = 'Detect�vel') or (RxDBComboBox29.Text = 'Indetect�vel') then
    begin
      DBDateEdit15.Enabled := true;
      DBDateEdit15.SetFocus;

    end
    else
      DBDateEdit15.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox30Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_PRI_TEST_5.AsString := RxDBComboBox30.Text;

    if (RxDBComboBox30.Text = 'Positivo') or (RxDBComboBox30.Text = 'Negativo') or (RxDBComboBox30.Text = 'Indeterminado') then
    begin
      DBDateEdit18.Enabled := true;
      DBDateEdit18.SetFocus;

    end
    else
      DBDateEdit18.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox31Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_SEG_TEST_5.AsString := RxDBComboBox31.Text;

    if (RxDBComboBox31.Text = 'Positivo') or (RxDBComboBox31.Text = 'Negativo') or (RxDBComboBox31.Text = 'Indeterminado') then
    begin
      DBDateEdit17.Enabled := true;
      DBDateEdit17.SetFocus;

    end
    else
      DBDateEdit17.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox32Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_TER_TEST_5.AsString := RxDBComboBox32.Text;

    if (RxDBComboBox32.Text = 'Positivo') or (RxDBComboBox32.Text = 'Negativo') or (RxDBComboBox32.Text = 'Indeterminado') then
    begin
      DBDateEdit16.Enabled := true;
      DBDateEdit16.SetFocus;

    end
    else
      DBDateEdit16.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox33Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_QUA_TEST_5.AsString := RxDBComboBox33.Text;

    if (RxDBComboBox33.Text = 'Positivo') or (RxDBComboBox33.Text = 'Negativo') or (RxDBComboBox33.Text = 'Indeterminado') then
    begin
      DBDateEdit19.Enabled := true;
      DBDateEdit19.SetFocus;

    end
    else
      DBDateEdit19.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox34Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    if RxDBComboBox34.Text = 'Crian�a INFECTADA' then
    begin
      DBDateEdit22.Enabled := true;
      DBDateEdit22.SetFocus;

    end
    else
      DBDateEdit22.Enabled := false;

    if RxDBComboBox34.Text = 'Crian�a N�O INFECTADA' then
    begin
      DBDateEdit21.Enabled := true;
      DBDateEdit21.SetFocus;

    end
    else
      DBDateEdit21.Enabled := false;

    if RxDBComboBox34.Text = 'Transfer�ncia' then
    begin
      dxDBEdit36.Enabled := true;
      dxDBEdit36.SetFocus;

    end
    else
      dxDBEdit36.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox22Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_MAE_USO_TARV_4.AsString := RxDBComboBox22.Text;

    if RxDBComboBox22.Text = 'N�o' then
    begin
      RxDBComboBox36.Enabled := true;
      RxDBComboBox36.SetFocus;
    end
    else
      RxDBComboBox36.Enabled := false;

  end;

end;

procedure TfrmCadNotGestante.btimprimirClick(Sender: TObject);
begin
  if pgGeral.TabIndex = 0 then
    inherited;
    
  if pgGeral.TabIndex = 1 then
  begin
    frxReport1.LoadFromFile(sPathLayOut + '\RelNotificacaoGestante.fr3');
    frxReport1.ShowReport;
    frxReport1.Print;
  end;
end;

procedure TfrmCadNotGestante.RxDBComboBox36Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_NAO_USO_MOTIVO_4.AsString := RxDBComboBox36.Text;

    if RxDBComboBox36.Text = 'Outros motivos' then
    begin
      dxDBEdit34.Enabled := true;
      dxDBEdit34.SetFocus;

    end
    else
      dxDBEdit34.Enabled := false;

   dmGeral.TB_NOT_GESTANTEDS_NAO_USO_MOTIVO_4.AsString := RxDBComboBox36.Text;
  end;
end;

procedure TfrmCadNotGestante.RxCheckListBox1ClickCheck(Sender: TObject);
var bEsquema:boolean;
begin
  inherited;
  bEsquema := (DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString <> '');
  
  if RxCheckListBox1.ItemIndex = 0 then
  if RxCheckListBox1.Checked[0] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + '1';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'AZT';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 1 then
  if RxCheckListBox1.Checked[1] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + '2';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '3TC';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 2 then
  if RxCheckListBox1.Checked[2] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + '3';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'FTC';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 3 then
  if RxCheckListBox1.Checked[3] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + '4';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'ddl';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 4 then
  if RxCheckListBox1.Checked[4] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + '5';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'ABC';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 5 then
  if RxCheckListBox1.Checked[5] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + '6';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'TDF';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 6 then
  if RxCheckListBox1.Checked[6] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + 'A';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'NVP';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 7 then
  if RxCheckListBox1.Checked[7] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + 'B';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'EFV';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 8 then
  if RxCheckListBox1.Checked[8] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + 'C';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'LPV/r';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 9 then
  if RxCheckListBox1.Checked[9] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + 'F';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'SQV';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 10 then
  if RxCheckListBox1.Checked[10] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + 'G';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'RTV';
    bEsquema := true;
  end;

  if RxCheckListBox1.ItemIndex = 11 then
  if RxCheckListBox1.Checked[11] then
  begin
     DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.AsString + 'H';
    if bEsquema then
      DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + '+';

    DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString :=
       DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.AsString + 'ATV/r';
    bEsquema := true;
  end;
end;

procedure TfrmCadNotGestante.btLesquemaClick(Sender: TObject);
var i:integer;
begin
  inherited;
  DMGERAL.TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2.Clear;
  DMGERAL.TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2.Clear;
  
  for i:= 0 to 11 do
  begin
    RxCheckListBox1.Checked[i] := false;
  end;
end;

procedure TfrmCadNotGestante.dsControleStateChange(Sender: TObject);
var i:integer;
begin
  inherited;
  for i:= 0 to 11 do
  begin
    RxCheckListBox1.Checked[i] := false;
  end;
end;

procedure TfrmCadNotGestante.btLocProvincia2ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'Prov';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome da Provincia';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_PROV_NASC.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_PROV_NASC.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocProvincia3ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'Prov';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome da Provincia';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_PROV_MORADA.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_PROV_MORADA.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_NOT_GESTANTECD_MUN_MORADA.Clear;
    DMGERAL.TB_NOT_GESTANTEDS_MUN_MORADA.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocProvincia4ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'Prov';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome da Provincia';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_PROV_CPN_2.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_PROV_CPN_2.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_NOT_GESTANTECD_MUN_CPN_2.Clear;
    DMGERAL.TB_NOT_GESTANTEDS_MUN_CPN_2.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocProvincia5ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'Prov';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome da Provincia';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_PROV_PARTO_3.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_PROV_PARTO_3.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_NOT_GESTANTECD_MUN_PARTO_3.Clear;
    DMGERAL.TB_NOT_GESTANTEDS_MUN_PARTO_3.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocProvincia6ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'Prov';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome da Provincia';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_PROV_US_5.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_PROV_US_5.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_NOT_GESTANTECD_MUN_US_5.Clear;
    DMGERAL.TB_NOT_GESTANTEDS_MUN_US_5.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocMunicipio2ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_MUNICIPIO, DS_MUNICIPIO');
  frmLocalizar.qyDados.sql.add('from MUNICIPIO');
  if(dsControle.DataSet.FieldByName('CD_PROV_MORADA').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_PROVINCIA = :CD_PROVINCIA');
    frmLocalizar.qyDados.ParamByName('CD_PROVINCIA').AsInteger := dsControle.DataSet.FieldByName('CD_PROV_MORADA').AsInteger;
    frmLocalizar.Where := true;
  end
  else
      frmLocalizar.Where := false;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Municipio';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome do Municipio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_MUN_MORADA.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_MUN_MORADA.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocMunicipio3ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_MUNICIPIO, DS_MUNICIPIO');
  frmLocalizar.qyDados.sql.add('from MUNICIPIO');
  if(dsControle.DataSet.FieldByName('CD_PROV_CPN_2').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_PROVINCIA = :CD_PROVINCIA');
    frmLocalizar.qyDados.ParamByName('CD_PROVINCIA').AsInteger := dsControle.DataSet.FieldByName('CD_PROV_CPN_2').AsInteger;
    frmLocalizar.Where := true;
  end
  else
      frmLocalizar.Where := false;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Municipio';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome do Municipio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_MUN_CPN_2.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_MUN_CPN_2.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocMunicipio4ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_MUNICIPIO, DS_MUNICIPIO');
  frmLocalizar.qyDados.sql.add('from MUNICIPIO');
  if(dsControle.DataSet.FieldByName('CD_PROV_PARTO_3').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_PROVINCIA = :CD_PROVINCIA');
    frmLocalizar.qyDados.ParamByName('CD_PROVINCIA').AsInteger := dsControle.DataSet.FieldByName('CD_PROV_PARTO_3').AsInteger;
    frmLocalizar.Where := true;
  end
  else
      frmLocalizar.Where := false;

  try
   SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Municipio';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome do Municipio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_MUN_PARTO_3.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_MUN_PARTO_3.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocMunicipio5ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_MUNICIPIO, DS_MUNICIPIO');
  frmLocalizar.qyDados.sql.add('from MUNICIPIO');
  if(dsControle.DataSet.FieldByName('CD_PROV_US_5').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_PROVINCIA = :CD_PROVINCIA');
    frmLocalizar.qyDados.ParamByName('CD_PROVINCIA').AsInteger := dsControle.DataSet.FieldByName('CD_PROV_US_5').AsInteger;
    frmLocalizar.Where := true;
  end
  else
      frmLocalizar.Where := false;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Municipio';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome do Municipio';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_MUN_US_5.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_MUN_US_5.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocUnidade2ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_UNIDADE, DS_UNIDADE');
  frmLocalizar.qyDados.sql.add('from UNIDADE');
  if(dsControle.DataSet.FieldByName('CD_MUN_CPN_2').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_MUNICIPIO = :CD_MUNICIPIO');
    frmLocalizar.qyDados.ParamByName('CD_MUNICIPIO').AsInteger := dsControle.DataSet.FieldByName('CD_MUN_CPN_2').AsInteger;
    frmLocalizar.Where := true;
  end
  else
    frmLocalizar.Where := false;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'Unidade';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_UND_CPN_2.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_UND_CPN_2.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TfrmCadNotGestante.btLocUnidade3ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_UNIDADE, DS_UNIDADE');
  frmLocalizar.qyDados.sql.add('from UNIDADE');
  if(dsControle.DataSet.FieldByName('CD_MUN_PARTO_3').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_MUNICIPIO = :CD_MUNICIPIO');
    frmLocalizar.qyDados.ParamByName('CD_MUNICIPIO').AsInteger := dsControle.DataSet.FieldByName('CD_MUN_PARTO_3').AsInteger;
    frmLocalizar.Where := true;
  end
  else
    frmLocalizar.Where := false;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'Unidade';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_UND_PARTO_3.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_UND_PARTO_3.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocUnidade4ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados.sql.Clear;
  frmLocalizar.qyDados.sql.add('select CD_UNIDADE, DS_UNIDADE');
  frmLocalizar.qyDados.sql.add('from UNIDADE');
  if(dsControle.DataSet.FieldByName('CD_MUN_US_5').AsString<>'')then
  begin
    frmLocalizar.qyDados.sql.add('where CD_MUNICIPIO = :CD_MUNICIPIO');
    frmLocalizar.qyDados.ParamByName('CD_MUNICIPIO').AsInteger := dsControle.DataSet.FieldByName('CD_MUN_US_5').AsInteger;
    frmLocalizar.Where := true;
  end
  else
    frmLocalizar.Where := false;

  try
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'Unidade';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmGeral.TB_NOT_GESTANTECD_UND_US_5.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
    dmGeral.TB_NOT_GESTANTEDS_UND_US_5.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.btLocPaisButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Pa�s';
  frmLocalizar.qyDados := SelectDadosPais;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_Pais';
    VCampo[0].Titulo  := 'C�digo';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Pa�s';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    DMGERAL.TB_NOT_GESTANTECD_PAIS_NASC.AsInteger := frmLocalizar.qyDados.FieldByname('cd_pais').AsInteger;
    DMGERAL.TB_NOT_GESTANTEDS_PAIS_NASC.AsString := frmLocalizar.qyDados.FieldByname('DS_pais').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

end;

procedure TfrmCadNotGestante.DBDateEdit2Exit(Sender: TObject);
begin
  if (DMGERAL.TB_NOT_GESTANTEDT_NASC_GEST.AsString <> '') and
    (DMGERAL.TB_NOT_GESTANTEDT_APROX_GEST.AsString <> '') then
    DMGERAL.TB_NOT_GESTANTEIDADE_GEST.AsInteger:=
       YearsBetween(DBDateEdit2.date, DBDateEdit3.date);
end;

procedure TfrmCadNotGestante.DBDateEdit11Exit(Sender: TObject);
var
  anoN, mesN, diaN : word;
  anoC, mesC, diaC : word;
begin

  if DBDateEdit9.Date > DBDateEdit11.Date then
  begin
  if MessageDlg('Data de Parto � maior que a data de Nascimento da Crian�a.' +#10#13+
               'Deseja continuar?',mtConfirmation,[mbYes,mbNo], 0) = mrNo then
    begin
      DBDateEdit11.Clear;
      abort;
    end;
  end;

  if DBDateEdit9.Date < DBDateEdit11.Date then
  begin
  if MessageDlg('Data de Parto � menor que a data de Nascimento da Crian�a.' +#10#13+
               'Deseja continuar?',mtConfirmation,[mbYes,mbNo], 0) = mrNo then
    begin
      DBDateEdit11.Clear;
      abort;
    end;
  end;

  Decodedate(DBDateEdit10.date,anoN,mesN,diaN);
  Decodedate(DBDateEdit11.date,anoC,mesC,diaC);

  if DMGERAL.TB_NOT_GESTANTEDT_PRI_CONS_4.AsString <> '' then
  begin
    if (anoC <> anoN) or ((anoC = anoN) and (mesC <> mesN)) then
    begin
      DMGERAL.TB_NOT_GESTANTEIDADE_CRI.AsInteger:=
         MonthsBetween(DBDateEdit11.date, DBDateEdit10.date);
      DMGERAL.TB_NOT_GESTANTEFL_IDADE_CRI.AsInteger:= 2;
      DMGERAL.TB_NOT_GESTANTECD_IDADE_CRI.AsString:=
      '20' + ZeroEsq(IntToStr(DMGERAL.TB_NOT_GESTANTEIDADE_CRI.AsInteger), 2);
    end;

    if (anoC = anoN) and (mesC = mesN) then
    begin
      DMGERAL.TB_NOT_GESTANTEIDADE_CRI.AsInteger:=
         DaysBetween(DBDateEdit11.date, DBDateEdit10.date);
      DMGERAL.TB_NOT_GESTANTEFL_IDADE_CRI.AsInteger:= 1;
      DMGERAL.TB_NOT_GESTANTECD_IDADE_CRI.AsString:=
       '10' + ZeroEsq(IntToStr(DMGERAL.TB_NOT_GESTANTEIDADE_CRI.AsInteger), 2);
    end;
  end;
end;

procedure TfrmCadNotGestante.RxDBComboBox37Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_NAO_PORQUE_3.AsString := RxDBComboBox37.Text;

    if RxDBComboBox37.Text = 'Outros motivos' then
    begin
      dxDBEdit29.Enabled := true;
      dxDBEdit29.SetFocus;

    end
    else
      dxDBEdit29.Enabled := false;

   dmGeral.TB_NOT_GESTANTEDS_NAO_PORQUE_3.AsString := RxDBComboBox37.Text;
  end;

end;

procedure TfrmCadNotGestante.RxDBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_SIT_ACTUAL.AsString := RxDBComboBox1.Text;
end;

procedure TfrmCadNotGestante.RxDBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_ESTADO_CIVIL.AsString := RxDBComboBox2.Text;
end;

procedure TfrmCadNotGestante.RxDBComboBox5Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_MOM_DIAG_VIH_1.AsString := RxDBComboBox5.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox6Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_SIT_SEROLOGICA_1.AsString := RxDBComboBox6.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox8Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_PRENATAL_CPN_2.AsString := RxDBComboBox8.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox10Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_LOCAL_PARTO.AsString := RxDBComboBox10.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox11Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_TP_PARTO_3.AsString := RxDBComboBox11.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox12Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  begin
    DMGERAL.TB_NOT_GESTANTEDS_TP_GEMELAR_3.AsString := RxDBComboBox12.Text;

    if RxDBComboBox12.Text = 'Sim' then
    begin
      RxDBComboBox38.Enabled := true;
      RxDBComboBox38.SetFocus;

    end
    else
      RxDBComboBox38.Enabled := false;

  end;


end;

procedure TfrmCadNotGestante.RxDBComboBox13Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_EST_SEROLOGICO_3.AsString := RxDBComboBox13.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox15Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_OBITO_MATERNO_3.AsString := RxDBComboBox15.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox17Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_NADO_VIVO_3.AsString := RxDBComboBox17.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox18Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_IDADE_CRI.AsString := RxDBComboBox18.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox19Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_INI_PROFILAXIA_4.AsString := RxDBComboBox19.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox24Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_USO_PROFILAXIA_4.AsString := RxDBComboBox24.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox25Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_TEMPO_USO_PROF_4.AsString := RxDBComboBox25.Text;

end;

procedure TfrmCadNotGestante.RxDBComboBox26Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
    DMGERAL.TB_NOT_GESTANTEDS_PROF_CTX_4.AsString := RxDBComboBox26.Text;

end;

procedure TfrmCadNotGestante.DBCheckBox1Exit(Sender: TObject);
begin
  inherited;
  if (dmGeral.TB_NOT_GESTANTE.State in [dsInsert, dsEdit]) and (pgGeral.TabIndex = 1) then
  if DBCheckBox1.Checked then
  begin
    DMGERAL.TB_NOT_GESTANTENM_CRI.Clear;
    DMGERAL.TB_NOT_GESTANTENM_CRI.AsString := DMGERAL.TB_NOT_GESTANTENM_GEST.AsString;
  end;
end;

procedure TfrmCadNotGestante.FormCreate(Sender: TObject);
begin
  inherited;
  sNESQL := qyNotGest.SQL.Text;
  sNLSQL := IBQuery1.SQL.Text;
end;

procedure TfrmCadNotGestante.dxDBEdit2Exit(Sender: TObject);
begin
  inherited;
  ConsultaGestante;
end;

procedure TfrmCadNotGestante.DBDateEdit3Exit(Sender: TObject);
begin
  inherited;
  ConsultaGestante;
end;

procedure TfrmCadNotGestante.BitBtn1Click(Sender: TObject);
var sWhere:string;
begin
  if not (DMGERAL.TB_NOT_GESTANTE.State in [dsEdit, dsInsert]) then
  begin
    try
      sWhere := 'WHERE';
      IBQuery1.Close;
      IBQuery1.SQL.Text := sNLSQL;
      if (edNr.Text <> '') then
      begin
         IBQuery1.SQL.Add(sWhere + ' CD_NR_NOFITICACAO = :NR');
         IBQuery1.ParamByName('NR').AsString := edNr.Text;
         sWhere := 'AND';
      end;

      if (eddtNot.Text <> '  /  /    ') then
      begin
         IBQuery1.SQL.Add(sWhere + ' DT_NOTIFICACAO = :DATA_NOT');
         IBQuery1.ParamByName('DATA_NOT').AsDate := eddtNot.Date;
         sWhere := 'AND';
      end;

      if (edNome.Text <> '') then
      begin
         IBQuery1.SQL.Add(sWhere + ' Upper(NM_GEST) like('''+ UpperCase(edNome.Text) + '%'')');
         sWhere := 'AND';
      end;

      if (edDtNasc.Text <> '  /  /    ') then
      begin
         IBQuery1.SQL.Add(sWhere + ' DT_NASC_GEST = :DATA_NASC');
         IBQuery1.ParamByName('DATA_NASC').AsDate := edDtNasc.Date;
         sWhere := 'AND';
      end;

      IBQuery1.Open;
    except
      IBQuery1.close;
    end;
  end;

end;

procedure TfrmCadNotGestante.BitBtn2Click(Sender: TObject);
begin
  inherited;
  edNr.Clear;
  eddtNot.Text := '  /  /    ';
  edNome.Clear;
  edDtNasc.Text := '  /  /    ';
end;

end.
