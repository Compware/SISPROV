unit uCadNotificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, RxLookup, Mask, ToolEdit,
  RXDBCtrl, dxEditor, dxEdLib, dxDBELib, IBCustomDataSet, IBQuery, RxDBComb,
  DBCtrls, ImgList,
  uFrameTransfusao, uFramePerfuracao, uFrameTatuagem, uFramePaciente, uFrameDentario,
  uFrameCircuncisao,uFrameIntervencaoCirurgica,
  Grids, DBGrids, ActnList, RpCon, RpConDS, RpBase, RpSystem, RpDefine,
  RpRave, Menus;

type
  TfrmCadNotificacao = class(TfrmCadPad)
    tbAspectos: TTabSheet;
    Panel5: TPanel;
    pgOms: TPageControl;
    tbOMS_Crianca: TTabSheet;
    tbOMS_Adultos: TTabSheet;
    pgNotificacao: TPageControl;
    tbNotificacao: TTabSheet;
    tbPessoais: TTabSheet;
    tbPerfil: TTabSheet;
    tbLaboratorio: TTabSheet;
    tbInvestigador: TTabSheet;
    tbEvolucao: TTabSheet;
    Panel6: TPanel;
    Label10: TLabel;
    edPaciente: TEdit;
    BitBtn1: TBitBtn;
    ScrollBox1: TScrollBox;
    pnTransfusao: TPanel;
    pnPerfuracao: TPanel;
    pnIntervencao: TPanel;
    pnDentario: TPanel;
    pnTatuagem: TPanel;
    pnCircuncisao: TPanel;
    ImageList1: TImageList;
    framPaciente1: TframPaciente;
    grDadosColumn2: TdxDBGridColumn;
    grDadosColumn4: TdxDBGridColumn;
    grDadosColumn5: TdxDBGridColumn;
    grDadosColumn6: TdxDBGridColumn;
    grDadosColumn7: TdxDBGridColumn;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label13: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    Label14: TLabel;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    Label15: TLabel;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    Label21: TLabel;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    Label22: TLabel;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    CheckBox50: TCheckBox;
    CheckBox51: TCheckBox;
    CheckBox52: TCheckBox;
    CheckBox53: TCheckBox;
    CheckBox54: TCheckBox;
    CheckBox56: TCheckBox;
    CheckBox58: TCheckBox;
    Label23: TLabel;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    CheckBox62: TCheckBox;
    CheckBox64: TCheckBox;
    CheckBox65: TCheckBox;
    Label24: TLabel;
    CheckBox67: TCheckBox;
    CheckBox68: TCheckBox;
    CheckBox69: TCheckBox;
    CheckBox70: TCheckBox;
    CheckBox72: TCheckBox;
    CheckBox73: TCheckBox;
    CheckBox74: TCheckBox;
    CheckBox75: TCheckBox;
    CheckBox76: TCheckBox;
    CheckBox77: TCheckBox;
    CheckBox79: TCheckBox;
    CheckBox80: TCheckBox;
    CheckBox81: TCheckBox;
    CheckBox82: TCheckBox;
    CheckBox83: TCheckBox;
    CheckBox84: TCheckBox;
    CheckBox85: TCheckBox;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    CheckBox55: TCheckBox;
    CheckBox57: TCheckBox;
    CheckBox63: TCheckBox;
    CheckBox66: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dxDBEdit1: TdxDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    RxDBComboBox1: TRxDBComboBox;
    btLocProvincia: TdxDBButtonEdit;
    btLocMunicipio: TdxDBButtonEdit;
    btLocUnidade: TdxDBButtonEdit;
    GroupBox2: TGroupBox;
    Label26: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    dbtesteconfirmatorio: TRxDBComboBox;
    dbtestetriagem: TRxDBComboBox;
    lbteste2: TLabel;
    lbteste1: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    GroupBox3: TGroupBox;
    Label54: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit4: TdxDBEdit;
    GroupBox4: TGroupBox;
    Label52: TLabel;
    RxDBComboBox5: TRxDBComboBox;
    RxDBComboBox17: TRxDBComboBox;
    DBDateEdit3: TDBDateEdit;
    Label53: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    edProvincia: TdxDBEdit;
    qyAspecto_Notificacao: TIBQuery;
    edMunicipio: TdxDBEdit;
    edUnidade: TdxDBEdit;
    Panel8: TPanel;
    Label35: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    Panel9: TPanel;
    Label36: TLabel;
    sbPerfuracao: TSpeedButton;
    RxDBComboBox13: TRxDBComboBox;
    Panel12: TPanel;
    Label37: TLabel;
    RxDBComboBox14: TRxDBComboBox;
    Panel11: TPanel;
    Label38: TLabel;
    RxDBComboBox15: TRxDBComboBox;
    Panel7: TPanel;
    Label19: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label39: TLabel;
    SpeedButton1: TSpeedButton;
    RxDBComboBox7: TRxDBComboBox;
    RxDBComboBox8: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    RxDBComboBox10: TRxDBComboBox;
    RxDBComboBox11: TRxDBComboBox;
    Panel10: TPanel;
    Label40: TLabel;
    RxDBComboBox16: TRxDBComboBox;
    Label16: TLabel;
    Label66: TLabel;
    sbtransfusao: TSpeedButton;
    sbTatuagem: TSpeedButton;
    Label67: TLabel;
    sbDentario: TSpeedButton;
    Label68: TLabel;
    sbIntervencaoCirurgica: TSpeedButton;
    Label69: TLabel;
    sbCircuncisao: TSpeedButton;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    edNotificacao: TEdit;
    btatualizaNR: TBitBtn;
    qyPacienteExistente: TIBQuery;
    qyPacienteExistenteCD_PACIENTE: TIntegerField;
    qyPacienteExistenteNM_PACIENTE: TIBStringField;
    qyPacienteExistenteDT_NASCIMENTO: TDateField;
    qyPacienteExistenteNM_MAE: TIBStringField;
    dsPacienteExistente: TDataSource;
    rbficha: TRadioButton;
    rbnumero: TRadioButton;
    RvNotificacao: TRvProject;
    RvSysNotificaocao: TRvSystem;
    rvdsNotificacao: TRvDataSetConnection;
    rvdsPerfuracao: TRvDataSetConnection;
    rvdsTatuagem: TRvDataSetConnection;
    qyTransfusao: TIBQuery;
    qyPerfuracao: TIBQuery;
    qyTatuagem: TIBQuery;
    qyRelNotificacao: TIBQuery;
    rvdsTransfusao: TRvDataSetConnection;
    rvdsAspectosOMSCriancas: TRvDataSetConnection;
    qyAspectosOMSCriancas: TIBQuery;
    dsRelNotificacao: TDataSource;
    qyAspectosOMSAdultos: TIBQuery;
    rvdsAspectosOMSAdultos: TRvDataSetConnection;
    qyRelNotificacaoCD_FICHA: TLargeintField;
    qyRelNotificacaoCD_UNIDADE: TIntegerField;
    qyRelNotificacaoCD_USUARIO: TIntegerField;
    qyRelNotificacaoCD_MUNICIPIO: TIntegerField;
    qyRelNotificacaoCD_UNIDADE_TRATAMENTO: TIntegerField;
    qyRelNotificacaoCD_MUNICIPIO_TRATAMENTO: TIntegerField;
    qyRelNotificacaoCD_PACIENTE: TIntegerField;
    qyRelNotificacaoDT_NOTIFICACAO: TDateField;
    qyRelNotificacaoDT_DIAGNOSTICO: TDateField;
    qyRelNotificacaoCD_RELACOES_SEXO: TSmallintField;
    qyRelNotificacaoCD_MAE_POSITIVO: TSmallintField;
    qyRelNotificacaoCD_USOU_DROGA: TSmallintField;
    qyRelNotificacaoCD_ACIDENTE_MAT_BIO: TSmallintField;
    qyRelNotificacaoSN_TRANSFUSAO_SANGUE: TIntegerField;
    qyRelNotificacaoSN_PERFURACAO: TIntegerField;
    qyRelNotificacaoSN_TRAT_DENTARIO: TIntegerField;
    qyRelNotificacaoSN_INTERV_CIRURGICA: TIntegerField;
    qyRelNotificacaoSN_CIRCUNCISAO: TIntegerField;
    qyRelNotificacaoCD_TESTE_TRIAGEM: TSmallintField;
    qyRelNotificacaoDS_TESTE_TRIAGEM: TIBStringField;
    qyRelNotificacaoCD_OCUPACAO: TSmallintField;
    qyRelNotificacaoDS_OCUPACAO: TIBStringField;
    qyRelNotificacaoCD_TESTE_CONFIRMATORIO: TSmallintField;
    qyRelNotificacaoDS_TESTE_CONFIRMATORIO: TIBStringField;
    qyRelNotificacaoCD_OMS: TSmallintField;
    qyRelNotificacaoCD_CD4: TIntegerField;
    qyRelNotificacaoCD_EVOLUCAO: TSmallintField;
    qyRelNotificacaoDT_EVOLUCAO: TDateField;
    qyRelNotificacaoDS_OBSERVACAO: TIBStringField;
    qyRelNotificacaoCD_NOTIFICACAO: TIntegerField;
    qyRelNotificacaoREGDUP: TIBStringField;
    qyRelNotificacaoCD_LOTE: TIntegerField;
    qyRelNotificacaoNM_ENTREVISTADOR: TIBStringField;
    qyRelNotificacaoTEL_ENTREVISTADOR: TIBStringField;
    qyRelNotificacaoFUNCAO_ENTREVISTADOR: TIBStringField;
    qyRelNotificacaoNM_MEDICO: TIBStringField;
    qyRelNotificacaoTEL_MEDICO: TIBStringField;
    qyRelNotificacaoSN_TATUAGEM: TIntegerField;
    qyRelNotificacaoTP_ENTRADA: TIntegerField;
    qyRelNotificacaoEVIDENCIA_GESTANTE: TIntegerField;
    qyRelNotificacaoTB_ATUAL: TIntegerField;
    qyRelNotificacaoTB_ANTERIOR: TIntegerField;
    qyRelNotificacaoDT_TRATAMENTO_TB: TDateField;
    qyRelNotificacaoCD_PROVINCIA_TRATAMENTO: TIntegerField;
    qyRelNotificacaoCD_PROVINCIA_NOT: TIntegerField;
    qyRelNotificacaoDT_ALTERACAO: TDateTimeField;
    qyRelNotificacaoDT_EXPORTACAO: TDateTimeField;
    qyRelNotificacaoCD_FICHA_ORACLE: TIntegerField;
    qyRelNotificacaoCD_MEDICO: TIntegerField;
    qyRelNotificacaoNR_NOTIFICACAO: TIBStringField;
    qyRelNotificacaoCD_FICHA_SINVS: TLargeintField;
    qyRelNotificacaoCD_PACIENTE1: TIntegerField;
    qyRelNotificacaoCD_BAIRRO: TIntegerField;
    qyRelNotificacaoCD_PAIS: TIntegerField;
    qyRelNotificacaoCD_MUNICIPIO1: TIntegerField;
    qyRelNotificacaoCD_MOR_MUNICIPIO: TIntegerField;
    qyRelNotificacaoCD_PROVINCIA: TIntegerField;
    qyRelNotificacaoCD_COMUNA: TIntegerField;
    qyRelNotificacaoNM_PACIENTE: TIBStringField;
    qyRelNotificacaoDT_NASCIMENTO: TDateField;
    qyRelNotificacaoIDADE: TSmallintField;
    qyRelNotificacaoNM_MAE: TIBStringField;
    qyRelNotificacaoCD_MORADA_PERM: TIBStringField;
    qyRelNotificacaoCD_ESCOLARIDADE: TSmallintField;
    qyRelNotificacaoDS_ESCOLARIDADE: TIBStringField;
    qyRelNotificacaoTP_SEXO: TIBStringField;
    qyRelNotificacaoMESES: TIntegerField;
    qyRelNotificacaoESTADO_CIVIL: TIntegerField;
    qyRelNotificacaoCD_NAR_PROVINCIA: TIntegerField;
    qyRelNotificacaoCD_PACIENTE_ORACLE: TIntegerField;
    qyRelNotificacaoCD_OCUPACAO1: TIntegerField;
    qyRelNotificacaoCD_DOCUMENTO: TIntegerField;
    qyRelNotificacaoTP_DOCUMENTO: TIBStringField;
    qyRelNotificacaoNR_DOCUMENTO: TIBStringField;
    qyRelNotificacaoNR_TEL_1: TIBStringField;
    qyRelNotificacaoNR_TEL_2: TIBStringField;
    qyRelNotificacaoDS_ENDERECO: TIBStringField;
    qyRelNotificacaoFL_GESTANTE: TIntegerField;
    qyRelNotificacaoFL_NOTIFICACAO: TIntegerField;
    qyRelNotificacaoDS_PROVINCIA_NOT: TIBStringField;
    qyRelNotificacaoDS_MUNICIPIO_NOT: TIBStringField;
    qyRelNotificacaoDS_UNIDADE: TIBStringField;
    qyRelNotificacaoDS_PROVINCIA_TRATAMENTO: TIBStringField;
    qyRelNotificacaoDS_MUNICIPIO_TRATAMENTO: TIBStringField;
    qyRelNotificacaoDS_UNIDADE_TRATAMENTO: TIBStringField;
    qyPerfuracaoDT_PERFURACAO: TDateField;
    qyTatuagemDT_TATUAGEM: TDateField;
    qyTransfusaoDT_TRANSFUSAO: TDateField;
    qyTransfusaoDS_TRANSFUSAO: TIBStringField;
    qyAspectosOMSCriancasCD_ESTAGIO_CLINICO: TSmallintField;
    qyAspectosOMSCriancasDS_ASPECTO: TIBStringField;
    qyAspectosOMSAdultosCD_ESTAGIO_CLINICO: TSmallintField;
    qyAspectosOMSAdultosDS_ASPECTO: TIBStringField;
    qyRelNotificacaoDS_PROVINCIA_P_NATURALIDADE: TIBStringField;
    qyRelNotificacaoDS_MUNICIPIO_P_NATURALIZADE: TIBStringField;
    qyRelNotificacaoDS_PROVINCIA_P_MORADIA: TIBStringField;
    qyRelNotificacaoDS_MUNICIPIO_P_MORADIA: TIBStringField;
    qyRelNotificacaoDS_PAIS_P: TIBStringField;
    Label9: TLabel;
    dxDBEdit8: TdxDBEdit;
    qyLocalizarNotificacao: TIBQuery;
    qyDentario: TIBQuery;
    dvdsDentario: TRvDataSetConnection;
    qyIntervencao: TIBQuery;
    rvdsIntervencao: TRvDataSetConnection;
    qyCircuncisao: TIBQuery;
    rvdsCircuncisao: TRvDataSetConnection;
    qyDentarioDT_DENTARIO: TDateField;
    qyIntervencaoDT_CIRURGIA: TDateField;
    qyCircuncisaoDT_CIRCUNCISAO: TDateField;
    GroupBox5: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    SpeedButton2: TSpeedButton;
    dxDBEdit5: TdxDBEdit;
    dxDBEdit7: TdxDBEdit;
    btLocMedico: TdxDBButtonEdit;
    dxDBEdit9: TdxDBEdit;
    GroupBox6: TGroupBox;
    dxDBMemo1: TdxDBMemo;
    SpeedButton3: TSpeedButton;
    btLocInvestigador: TdxDBButtonEdit;
    dxDBEdit6: TdxDBEdit;
    GroupBox7: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label55: TLabel;
    Label51: TLabel;
    RxDBComboBox18: TRxDBComboBox;
    btLocProvinciaTra: TdxDBButtonEdit;
    btLocMunicipioTra: TdxDBButtonEdit;
    btLocUnidadeTra: TdxDBButtonEdit;
    DBDateEdit4: TDBDateEdit;
    dxDBEdit11: TdxDBEdit;
    dxDBEdit12: TdxDBEdit;
    dxDBEdit13: TdxDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    RxDBComboBox6: TRxDBComboBox;
    DBDateEdit5: TDBDateEdit;
    DBDateEdit6: TDBDateEdit;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    tbClassificacao: TTabSheet;
    grDadosColumn8: TdxDBGridColumn;
    grDadosColumn10: TdxDBGridColumn;
    grDadosColumn9: TdxDBGridColumn;
    qyLocalizarNotificacaoNR_NOTIFICACAO: TIBStringField;
    qyLocalizarNotificacaoDT_NOTIFICACAO: TDateField;
    qyLocalizarNotificacaoNM_ENTREVISTADOR: TIBStringField;
    qyLocalizarNotificacaoNM_MEDICO: TIBStringField;
    qyLocalizarNotificacaoNM_PACIENTE: TIBStringField;
    qyLocalizarNotificacaoNR_PROCESSO: TIntegerField;
    qyLocalizarNotificacaoDS_UNIDADE: TIBStringField;
    qyLocalizarNotificacaoCD_FICHA: TLargeintField;
    grDadosColumn11: TdxDBGridColumn;
    qyLocalizarNotificacaoCD_UND: TIntegerField;
    qyLocalizarNotificacaoCD_UNIDADE: TIntegerField;
    qyLocalizarNotificacaoCD_USUARIO: TIntegerField;
    qyLocalizarNotificacaoCD_MUNICIPIO: TIntegerField;
    qyLocalizarNotificacaoCD_UNIDADE_TRATAMENTO: TIntegerField;
    qyLocalizarNotificacaoCD_MUNICIPIO_TRATAMENTO: TIntegerField;
    qyLocalizarNotificacaoCD_PACIENTE: TIntegerField;
    qyLocalizarNotificacaoDT_DIAGNOSTICO: TDateField;
    qyLocalizarNotificacaoCD_RELACOES_SEXO: TSmallintField;
    qyLocalizarNotificacaoCD_MAE_POSITIVO: TSmallintField;
    qyLocalizarNotificacaoCD_USOU_DROGA: TSmallintField;
    qyLocalizarNotificacaoCD_ACIDENTE_MAT_BIO: TSmallintField;
    qyLocalizarNotificacaoSN_TRANSFUSAO_SANGUE: TIntegerField;
    qyLocalizarNotificacaoSN_PERFURACAO: TIntegerField;
    qyLocalizarNotificacaoSN_TRAT_DENTARIO: TIntegerField;
    qyLocalizarNotificacaoSN_INTERV_CIRURGICA: TIntegerField;
    qyLocalizarNotificacaoSN_CIRCUNCISAO: TIntegerField;
    qyLocalizarNotificacaoCD_TESTE_TRIAGEM: TSmallintField;
    qyLocalizarNotificacaoDS_TESTE_TRIAGEM: TIBStringField;
    qyLocalizarNotificacaoCD_OCUPACAO: TSmallintField;
    qyLocalizarNotificacaoDS_OCUPACAO: TIBStringField;
    qyLocalizarNotificacaoCD_TESTE_CONFIRMATORIO: TSmallintField;
    qyLocalizarNotificacaoDS_TESTE_CONFIRMATORIO: TIBStringField;
    qyLocalizarNotificacaoCD_OMS: TSmallintField;
    qyLocalizarNotificacaoCD_CD4: TIntegerField;
    qyLocalizarNotificacaoCD_EVOLUCAO: TSmallintField;
    qyLocalizarNotificacaoDT_EVOLUCAO: TDateField;
    qyLocalizarNotificacaoDS_OBSERVACAO: TIBStringField;
    qyLocalizarNotificacaoCD_NOTIFICACAO: TIntegerField;
    qyLocalizarNotificacaoREGDUP: TIBStringField;
    qyLocalizarNotificacaoCD_LOTE: TIntegerField;
    qyLocalizarNotificacaoTEL_ENTREVISTADOR: TIBStringField;
    qyLocalizarNotificacaoFUNCAO_ENTREVISTADOR: TIBStringField;
    qyLocalizarNotificacaoTEL_MEDICO: TIBStringField;
    qyLocalizarNotificacaoSN_TATUAGEM: TIntegerField;
    qyLocalizarNotificacaoTP_ENTRADA: TIntegerField;
    qyLocalizarNotificacaoEVIDENCIA_GESTANTE: TIntegerField;
    qyLocalizarNotificacaoTB_ATUAL: TIntegerField;
    qyLocalizarNotificacaoTB_ANTERIOR: TIntegerField;
    qyLocalizarNotificacaoDT_TRATAMENTO_TB: TDateField;
    qyLocalizarNotificacaoCD_PROVINCIA_TRATAMENTO: TIntegerField;
    qyLocalizarNotificacaoCD_PROVINCIA_NOT: TIntegerField;
    qyLocalizarNotificacaoDT_ALTERACAO: TDateTimeField;
    qyLocalizarNotificacaoDT_EXPORTACAO: TDateTimeField;
    qyLocalizarNotificacaoCD_FICHA_ORACLE: TIntegerField;
    qyLocalizarNotificacaoCD_MEDICO: TIntegerField;
    qyLocalizarNotificacaoCD_FICHA_SINVS: TLargeintField;
    qyLocalizarNotificacaoCD_INVESTIGADOR: TIntegerField;
    qyLocalizarNotificacaoDT_TESTE_TRIAGEM: TDateTimeField;
    qyLocalizarNotificacaoDT_TESTE_CONFIRMATORIO: TDateTimeField;
    qyLocalizarNotificacaoNR_PROCESSO_UTENTE: TIBStringField;
    qyLocalizarNotificacaoCD_BAIRRO: TIntegerField;
    qyLocalizarNotificacaoCD_PAIS: TIntegerField;
    qyLocalizarNotificacaoCD_MOR_MUNICIPIO: TIntegerField;
    qyLocalizarNotificacaoCD_PROVINCIA: TIntegerField;
    qyLocalizarNotificacaoCD_COMUNA: TIntegerField;
    qyLocalizarNotificacaoDT_NASCIMENTO: TDateField;
    qyLocalizarNotificacaoIDADE: TSmallintField;
    qyLocalizarNotificacaoNM_MAE: TIBStringField;
    qyLocalizarNotificacaoCD_MORADA_PERM: TIBStringField;
    qyLocalizarNotificacaoCD_ESCOLARIDADE: TSmallintField;
    qyLocalizarNotificacaoDS_ESCOLARIDADE: TIBStringField;
    qyLocalizarNotificacaoTP_SEXO: TIBStringField;
    qyLocalizarNotificacaoMESES: TIntegerField;
    qyLocalizarNotificacaoESTADO_CIVIL: TIntegerField;
    qyLocalizarNotificacaoCD_NAR_PROVINCIA: TIntegerField;
    qyLocalizarNotificacaoCD_DOCUMENTO: TIntegerField;
    qyLocalizarNotificacaoTP_DOCUMENTO: TIBStringField;
    qyLocalizarNotificacaoNR_DOCUMENTO: TIBStringField;
    qyLocalizarNotificacaoNR_TEL_1: TIBStringField;
    qyLocalizarNotificacaoNR_TEL_2: TIBStringField;
    qyLocalizarNotificacaoDS_ENDERECO: TIBStringField;
    qyLocalizarNotificacaoFL_GESTANTE: TIntegerField;
    qyLocalizarNotificacaoFL_NOTIFICACAO: TIntegerField;
    qyLocalizarNotificacaoNR_MESES_GESTANTE: TIntegerField;
    qyLocalizarNotificacaoFL_RESULTADO: TIBStringField;
    qyLocalizarNotificacaoCHAVE: TIBStringField;
    DBText1: TDBText;
    grDadosColumn12: TdxDBGridColumn;
    dsLocNotificacao: TDataSource;
    Label80: TLabel;
    DBDateEdit7: TDBDateEdit;
    DBDateEdit8: TDBDateEdit;
    Label81: TLabel;
    qyRelNotificacaoDT_ENTRADA: TDateField;
    qyRelNotificacaoDT_EVOLUCAO_2: TDateField;
    Label75: TLabel;
    Label76: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    qyLocalizarNotificacaoNR_IDADE_IDENTIFICACAO: TIntegerField;
    grDadosColumn13: TdxDBGridColumn;
    lblNR_IDADE_IDENTIFICACAO: TLabel;
    qyRelNotificacaoNR_IDADE_IDENTIFICACAO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure sbPerfuracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btgravarClick(Sender: TObject);
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvinciaTraButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioTraButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeTraButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btIncluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure sbtransfusaoClick(Sender: TObject);
    procedure sbTatuagemClick(Sender: TObject);
    procedure framPaciente1dsPacienteStateChange(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure BitBtn1Click(Sender: TObject);
    procedure btatualizaNRClick(Sender: TObject);
    procedure dxDBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure framPaciente1dxDBEdit2Exit(Sender: TObject);
    procedure framPaciente1DBDateEdit3Exit(Sender: TObject);
    procedure framPaciente1dxDBEdit5Exit(Sender: TObject);
    procedure btLocUnidadeChange(Sender: TObject);
    procedure btLocMunicipioChange(Sender: TObject);
    procedure btLocProvinciaChange(Sender: TObject);
    procedure btLocProvinciaTraChange(Sender: TObject);
    procedure btLocMunicipioTraChange(Sender: TObject);
    procedure btLocUnidadeTraChange(Sender: TObject);
    procedure rbfichaClick(Sender: TObject);
    procedure rbnumeroClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure framPaciente1SpeedButton1Click(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure qyPerfuracaoBeforeOpen(DataSet: TDataSet);
    procedure qyTatuagemBeforeOpen(DataSet: TDataSet);
    procedure qyTransfusaoBeforeOpen(DataSet: TDataSet);
    procedure qyAspectosOMSCriancasBeforeOpen(DataSet: TDataSet);
    procedure qyAspectosOMSAdultosBeforeOpen(DataSet: TDataSet);
    procedure tabListaShow(Sender: TObject);
    procedure btLocProvinciaExit(Sender: TObject);
    procedure btLocMunicipioExit(Sender: TObject);
    procedure btLocUnidadeExit(Sender: TObject);
    procedure btLocProvinciaTraExit(Sender: TObject);
    procedure btLocMunicipioTraExit(Sender: TObject);
    procedure btLocUnidadeTraExit(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure framPaciente1SpeedButton2Click(Sender: TObject);
    procedure sbDentarioClick(Sender: TObject);
    procedure sbIntervencaoCirurgicaClick(Sender: TObject);
    procedure sbCircuncisaoClick(Sender: TObject);
    procedure dsControleStateChange(Sender: TObject);
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMedicoChange(Sender: TObject);
    procedure btLocMedicoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qyDentarioBeforeOpen(DataSet: TDataSet);
    procedure qyIntervencaoBeforeOpen(DataSet: TDataSet);
    procedure qyCircuncisaoBeforeOpen(DataSet: TDataSet);
    procedure RvNotificacaoCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btLocInvestigadorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocInvestigadorChange(Sender: TObject);
    procedure btLocInvestigadorExit(Sender: TObject);
    procedure framPaciente1dxDBEdit16Exit(Sender: TObject);
    procedure qyRelNotificacaoBeforeOpen(DataSet: TDataSet);
    procedure qyLocalizarNotificacaoCalcFields(DataSet: TDataSet);
    procedure tbNotificacaoShow(Sender: TObject);
    procedure DBDateEdit1Change(Sender: TObject);
    procedure dsControleDataChange(Sender: TObject; Field: TField);
    procedure qyRelNotificacaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    fbSAP, fbIncluir:Boolean;
    fsNotificacao,fsPaciente,fsSexo,fsIdade:string;
    procedure AtualizarNrNotificacao;
    procedure CarregaFrame;
    procedure AbreConsultas;
    procedure VerificarCampos;
    procedure ConsultaPaciente;
    procedure AtualizaAspectosOMS;
    procedure PacienteExistente;
    procedure FocoControle; override;
    procedure AtualizaNR_IDADE_IDENTIFICACAO;
    function VerificarNrProcesso:Double;
    function ExisteNotificacao:boolean;
  end;

var
  frmCadNotificacao: TfrmCadNotificacao;
  framTransfusao: TframTransfusao;
  framPerfuracao: TframPerfuracao;
  framTatuagem: TframTatuagem;
  framDentario: TframDentario;
  framCircuncisao: TframCircuncisao;
  framIntervencaoCirurgica: TframIntervencaoCirurgica;
  strSQL, strConsulta,sPSQL,sNSQL:String;
  bFiltro:Boolean;

implementation

uses UDMGERAL, UDM, UfrmLocalizar, UGeralSQL, UPacienteExistente, Math,
  uFrmLocNotificacao, UCadMedico, UGeral, uCadInvestigador,
  UProcessoExistente, DateUtils;

{$R *.dfm}

function TfrmCadNotificacao.VerificarNrProcesso:Double;
var
  bLibera, bEXIT:Boolean;
begin
  if DMGERAL.TB_PACIENTENR_PROCESSO.AsString <> '' then
  begin
    bLibera := false;
    bEXIT := true;
    Result := 0;

    qyPacienteExistente.Close;
    qyPacienteExistente.SQL.Text := sPSQL;
    if (DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger <> null) then
    begin
       qyPacienteExistente.SQL.Add('WHERE NR_PROCESSO =:processo');
       qyPacienteExistente.ParamByName('processo').AsInteger :=
          DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger;

    end;
    qyPacienteExistente.Open;
    qyPacienteExistente.First;

    while not qyPacienteExistente.Eof do
    begin
      bEXIT := false;
      if qyPacienteExistenteCD_PACIENTE.AsInteger = DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger then
      begin
        bLibera := true;
        qyPacienteExistente.Next;
      end
      else
        qyPacienteExistente.Next;
    end;

    if bLibera then
      bEXIT := true;

    if not bEXIT then
    begin
      framPaciente1dxDBEdit16Exit(Self);
      Result := 1;
    end;

  end;
end;

procedure TfrmCadNotificacao.PacienteExistente;
begin
  if not qyPacienteExistente.Eof then
  begin
    frmProcessoExistente := TfrmProcessoExistente.Create(application);
    frmProcessoExistente.DBGrid1.DataSource := dsPacienteExistente;
    if frmProcessoExistente.ShowModal=mrok then
      begin
        DMGERAL.TB_NOTIFICACAOCD_PACIENTE.AsInteger :=
          qyPacienteExistente.FieldByname('cd_paciente').AsInteger;
        DMGERAL.TB_PACIENTE.Cancel;
        DMGERAL.TB_PACIENTE.Close;
        DMGERAL.TB_PACIENTE.Open;
        DMGERAL.TB_PACIENTE.Edit;
        strConsulta := '';
        framPaciente1.RxDBLookupCombo1.SetFocus;
      end;
    qyPacienteExistente.Close;
    frmProcessoExistente.Free;
  end;
end;


procedure TfrmCadNotificacao.AtualizaAspectosOMS;
var c : word;
begin
  inherited;
    // desabilita todos os CheckBoxs
    for c:=0 to ComponentCount - 1 do
      if (Components[c] is TCheckBox) then
        (Components[c] as TCheckBox).Checked := false;

    // habilita os CheckBoxs para para esta notificação
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('select CD_ASPECTO from ASPECTO_NOTIFICACAO');
      sql.Add('where CD_FICHA = '''+IntToStr(DMGERAL.TB_NOTIFICACAOCD_FICHA.asInteger)+'''');
      open;
      while not Eof do
      begin
        for c:=0 to frmCadNotificacao.ComponentCount - 1 do
        begin
          if (frmCadNotificacao.Components[c] is TCheckBox) then
            if ((frmCadNotificacao.Components[c] as TCheckBox).Tag =
                                                FieldByName('CD_ASPECTO').AsInteger) then
            begin
              (frmCadNotificacao.Components[c] as TCheckBox).Checked := true;
              Break;
            end;
        end;
        Next;
      end;
      close;
      free;
    end;
end;

procedure TfrmCadNotificacao.AtualizarNrNotificacao;
var calc:integer;
begin
  try
    btatualizaNR.Caption := 'Aguarde a msg...';
    calc := 0;
    DMGERAL.TB_NR_NOTIFICACAO.Open;
    DMGERAL.TB_NR_NOTIFICACAO.First;
    //qyLocalizarNotificacao.First;
    while not DMGERAL.TB_NR_NOTIFICACAO.Eof do
    begin
      try
        if DMGERAL.TB_NR_NOTIFICACAONR_NOTIFICACAO.AsString = '' then
        begin
          DMGERAL.TB_NR_NOTIFICACAO.Edit;
          DMGERAL.TB_NR_NOTIFICACAONR_NOTIFICACAO.AsString :=
           ZeroEsq(DMGERAL.TB_NR_NOTIFICACAOCD_UNIDADE.AsString, 3) +  '-' +
             ZeroEsq(IntToStr(dm.GeraCodigo('GEN_NR_NOTIFICACAO')), 5);
          DMGERAL.TB_NR_NOTIFICACAO.Post;
          calc := calc + 1;
        end;
      finally
        DMGERAL.TB_NR_NOTIFICACAO.Next;
        //qyLocalizarNotificacao.Next;
      end;
    end;
    btatualizaNR.Caption := 'Atualização concluida';
    MessageDlg('Total de Nr. atualizados:' + IntToStr(calc) ,mtInformation,
     [mbOK],0);
   except
     MessageDlg('Erro na procedure AtualizarNrNotificacao!',mtError,
      [mbOK],0);
   end;

   btatualizaNR.Visible := false;
   DMGERAL.TB_NR_NOTIFICACAO.Close;
end;



procedure TfrmCadNotificacao.FormCreate(Sender: TObject);
begin
  inherited;
  sPSQL := qyPacienteExistente.SQL.Text;
  CarregaFrame;
end;

procedure TfrmCadNotificacao.CarregaFrame;
begin
  framTransfusao := TframTransfusao.Create(self);
  framPerfuracao := TframPerfuracao.Create(self);
  framTatuagem   := TframTatuagem.Create(self);
  framDentario := TframDentario.Create(self);
  framCircuncisao := TframCircuncisao.Create(self);
  framIntervencaoCirurgica := TframIntervencaoCirurgica.Create(self);
end;

procedure TfrmCadNotificacao.VerificarCampos;
begin

  if DMGERAL.TB_NOTIFICACAODT_NOTIFICACAO.AsString = '' then
  begin
    MessageDlg('É necessário incluir a Data da Notificação!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 0;
    DBDateEdit1.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOTIFICACAOCD_PROVINCIA_NOT.AsInteger < 1 then
  begin
    MessageDlg('É necessário incluir a Provincia da Notificação!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 0;
    btLocProvincia.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO.AsInteger < 1 then
  begin
    MessageDlg('É necessário incluir o Municipio da Notificação!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 0;
    btLocMunicipio.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOTIFICACAOCD_UNIDADE.AsInteger < 1 then
  begin
    MessageDlg('É necessário incluir a Unidade Sanitária da Notificação!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 0;
    btLocUnidade.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOTIFICACAOTP_ENTRADA.AsString = '' then
  begin
    MessageDlg('É necessário escolher um tipo de entrada!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 0;
    RxDBComboBox1.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOTIFICACAOCD_TESTE_CONFIRMATORIO.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Teste Confirmatório!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 3;
    dbtesteconfirmatorio.SetFocus;
    abort;
  end;

  //**Paciente
  //Fiz manualmente para ter o controle das abas
  if DMGERAL.TB_PACIENTENM_PACIENTE.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Nome do Utente!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 1;
    framPaciente1.dxDBEdit2.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_PACIENTETP_SEXO.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Sexo do Utente!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 1;
    framPaciente1.RxDBComboBox2.SetFocus;
    Abort;
  end;

  if (DMGERAL.TB_PACIENTEIDADE.AsString = '') then
  begin
    MessageDlg('É necessário incluir a Idade ou Meses do Utente!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 1;
    framPaciente1.dxDBEdit3.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_PACIENTENM_MAE.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Nome da Mãe do Utente!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 1;
    framPaciente1.dxDBEdit5.SetFocus;
    Abort;
  end;
  //Paciente**

  if DMGERAL.TB_NOTIFICACAOCD_TESTE_TRIAGEM.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Teste de Triagem!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 3;
    dbtestetriagem.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOTIFICACAOCD_TESTE_CONFIRMATORIO.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Teste Confirmatório!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 3;
    dbtesteconfirmatorio.SetFocus;
    abort;
  end;

  if DMGERAL.TB_NOTIFICACAOCD_EVOLUCAO.AsString = '' then
  begin
    MessageDlg('É necessário o campo 31, Situação atual!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgNotificacao.TabIndex := 5;
    RxDBComboBox18.SetFocus;
    abort;
  end;

end;


procedure TfrmCadNotificacao.sbPerfuracaoClick(Sender: TObject);
var bmp:TBitmap;
begin
  inherited;
  //if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    if (RxDBComboBox13.Text = 'Sim') then
    begin
      bmp := TBitmap.Create;
      try
        if framPerfuracao.Parent = nil then
        begin
          ImageList1.GetBitmap(1,bmp);
          framPerfuracao.Parent := pnPerfuracao;
        end
        else
        begin
          ImageList1.GetBitmap(0,bmp);
           framPerfuracao.Parent := nil;
        end;
        sbPerfuracao.Glyph := bmp;
      except
        FreeAndNil(bmp);
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.FormShow(Sender: TObject);
begin
  inherited;
  if not fbSAP then
    DMGERAL.TB_NOTIFICACAO.DataSource := dsGrid;

  sNSQL := qyLocalizarNotificacao.SQL.Text;
  qyLocalizarNotificacao.Open;
  AbreConsultas;
  pgGeral.ActivePage := tabGeral;
  pgNotificacao.ActivePage := tbNotificacao;
  pgOms.ActivePage := tbOMS_Crianca;
  framPaciente1.AbreConsultas;
  AtualizaAspectosOMS;

  if fbIncluir then
  begin
   if Not ExisteNotificacao then
   begin
     btIncluirClick(sender);
     dmGeral.TB_NOTIFICACAODT_NOTIFICACAO.AsDateTime := dm.GetDate;
     dmGeral.TB_NOTIFICACAOTP_ENTRADA.AsInteger := 1;
     dmGeral.TB_PACIENTENM_PACIENTE.AsString := fsPaciente;
     dmGeral.TB_PACIENTEIDADE.AsString := fsIdade;
     framPaciente1SpeedButton1Click(sender);
     dmGeral.TB_PACIENTETP_SEXO.AsString := fsSexo;
     dmGeral.TB_PACIENTEFL_RESULTADO.AsInteger := 1;
     dmGeral.TB_PACIENTEFL_CASONOVO.AsString := 'S';
     pgGeral.ActivePage := tbNotificacao;
     pgNotificacao.ActivePage := tbPessoais;
     ConsultaPaciente;
   end;
  end else if (fsNotificacao<>'') then
  begin
    qyLocalizarNotificacao.Close;
    qyLocalizarNotificacao.SQL.Text := StringReplace(sNSQL,'and 1=2',
      'and Notificacao.cd_ficha='+fsNotificacao,[]);
    qyLocalizarNotificacao.Open;
    grDadosDblClick(Self);
  end;
end;

procedure TfrmCadNotificacao.AbreConsultas;
begin
  DMGERAL.TB_PACIENTE.DataSource := dsControle;
  DMGERAL.TB_PACIENTE.Open;
  DMGERAL.TB_PERFURACAO.DataSource := dsControle;
  DMGERAL.TB_PERFURACAO.Open;
  DMGERAL.TB_TRANSFUSAO.DataSource := dsControle;
  DMGERAL.TB_TRANSFUSAO.Open;
  DMGERAL.TB_TATUAGEM.DataSource := dsControle;
  DMGERAL.TB_TATUAGEM.Open;
  DMGERAL.TB_DENTARIO.DataSource := dsControle;
  DMGERAL.TB_DENTARIO.Open;
  DMGERAL.TB_CIRCUNCISAO.DataSource := dsControle;
  DMGERAL.TB_CIRCUNCISAO.Open;
  DMGERAL.TB_INTERV_CIRURGICA.DataSource := dsControle;
  DMGERAL.TB_INTERV_CIRURGICA.Open;
end;

procedure TfrmCadNotificacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (btgravar.Enabled) then
  begin
    btCancelarClick(Sender);
    fsNotificacao := '';
  end
  else
    fsNotificacao := DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

  inherited;
  framPaciente1.FechaConsultas;
  DMGERAL.TB_NOTIFICACAO.DataSource := nil;
end;

procedure TfrmCadNotificacao.btgravarClick(Sender: TObject);
var i : integer;
begin

  if dmGeral.TB_PACIENTE.State in [dsInsert] then
    if VerificarNrProcesso = 1  then
      abort;

  VerificarCampos;

  if (dmGeral.TB_PACIENTE.State in [dsEdit, dsInsert]) then
    dmGeral.TB_PACIENTEFL_NOTIFICACAO.AsInteger := 1;

  //inherited;
  //Numero Notificação 000(UN)00000(GEN)
  if DMGERAL.TB_NOTIFICACAO.State in [dsInsert] then
  begin
    DMGERAL.TB_NOTIFICACAONR_NOTIFICACAO.AsString :=
     ZeroEsq(DMGERAL.TB_NOTIFICACAOCD_UNIDADE.AsString, 3) +  '-' +
       ZeroEsq(IntToStr(dm.GeraCodigo('GEN_NR_NOTIFICACAO')), 5);
  end;

  if DMGERAL.TB_NOTIFICACAOCD_EVOLUCAO.AsInteger = 2 then
    BEGIN
      if not (DMGERAL.TB_PACIENTE.State in [dsEdit, dsInsert]) then
        DMGERAL.TB_PACIENTE.Edit;

      DMGERAL.TB_PACIENTEFL_OBITO.AsInteger := 2;
      DMGERAL.TB_PACIENTEDT_OBITO.AsDateTime := DMGERAL.TB_NOTIFICACAODT_EVOLUCAO.AsDateTime;
      DMGERAL.TB_PACIENTE.post;
    END;


  if dsControle.DataSet.State in [dsEdit, dsInsert] then
    begin
      InicializaControles;
      dsControle.DataSet.Post;
      DM.Commit(dsControle.DataSet);
    end;

  try
    //Aqui necessita iniciar a transação porque no inherited ocorre o post e consequenteo commit
    dm.Transacao(dsControle.DataSet);
    // deleta todas os aspectos da notificação
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('delete from ASPECTO_NOTIFICACAO');
      sql.Add('where CD_FICHA = '''+IntToStr(DMGERAL.TB_NOTIFICACAOCD_FICHA.AsInteger)+'''');
      ExecSQL;
      close;
      free;
    end;

    // inclui as que estiverem marcadas nos checkboxs
    for i:=0 to (ComponentCount - 1) do
      if (Components[i] is TCheckBox) then
        if (Components[i] as TCheckBox).Checked then
        begin
          qyAspecto_Notificacao.close;
          qyAspecto_Notificacao.SQL.Clear;
          qyAspecto_Notificacao.SQL.Add('insert into ASPECTO_NOTIFICACAO (CD_ASPECTO, ' +
                           'CD_FICHA, CD_UND)');
          qyAspecto_Notificacao.SQL.Add('values(' + IntToStr((Components[i] as TCheckBox).tag) +
                           ', '''+IntToStr(DMGERAL.TB_NOTIFICACAOCD_FICHA.asInteger)+'''' +
                           ', '''+prmUnidade+''')');
          qyAspecto_Notificacao.ExecSQL;
        end;
    dm.Commit(DMGERAL.TB_NOTIFICACAO);
  except
    on Err:Exception do
      ShowMessage(Err.message);
    {
    showmessage('Tag: ' + IntToStr((Components[e] as TCheckBox).tag) +
                '    Hint: ' + (Components[e] as TCheckBox).Hint);   }
  end;
  AtualizaAspectosOMS;
  pgGeral.TabIndex := 1;
  pgNotificacao.TabIndex := 0;
end;

procedure TfrmCadNotificacao.btLocProvinciaButtonClick(Sender: TObject;
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
    dmGeral.TB_NOTIFICACAOCD_PROVINCIA_NOT.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_NOTIFICACAODS_PROVINCIA_NOT.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO.Clear;
    DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TfrmCadNotificacao.btLocMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  try
    if(dsControle.DataSet.FieldByName('CD_PROVINCIA_NOT').AsString<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(dsControle.DataSet.FieldByName('CD_PROVINCIA_NOT').AsInteger);
      frmLocalizar.Where := true;
    end;
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
    dmGeral.TB_NOTIFICACAOCD_MUNICIPIO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_NOTIFICACAODS_MUNICIPIO_NOT.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TfrmCadNotificacao.btLocUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados := SelectDadosUnidade;

  try
    frmLocalizar.Where := false;
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
    dmGeral.TB_NOTIFICACAOCD_UNIDADE.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
    dmGeral.TB_NOTIFICACAODS_UNIDADE.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TfrmCadNotificacao.btLocProvinciaTraButtonClick(Sender: TObject;
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
    dmGeral.TB_NOTIFICACAOCD_PROVINCIA_TRATAMENTO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_provincia').AsInteger;
    dmGeral.TB_NOTIFICACAODS_PROVINCIA_TRATAMENTO.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO_TRATAMENTO.Clear;
    DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.Clear;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TfrmCadNotificacao.btLocMunicipioTraButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Municipio';
  try
    if(dsControle.DataSet.FieldByName('CD_PROVINCIA_TRATAMENTO').AsString<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(dsControle.DataSet.FieldByName('CD_PROVINCIA_TRATAMENTO').AsInteger);
      frmLocalizar.Where := true;
    end;
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
    dmGeral.TB_NOTIFICACAOCD_MUNICIPIO_TRATAMENTO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_municipio').AsInteger;
    dmGeral.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TfrmCadNotificacao.btLocUnidadeTraButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados := SelectDadosUnidade;

  try
    frmLocalizar.Where := false;
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
    dmGeral.TB_NOTIFICACAOCD_UNIDADE_TRATAMENTO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
    dmGeral.TB_NOTIFICACAODS_UNIDADE_TRATAMENTO.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;
end;

procedure TfrmCadNotificacao.btIncluirClick(Sender: TObject);
begin
  inherited;
  if not (framPaciente1.dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
    begin
      dm.Transacao(framPaciente1.dsPaciente.DataSet);
      framPaciente1.dsPaciente.DataSet.Insert;
      DMGERAL.TB_PACIENTEFL_RESULTADO.AsInteger := 0;
      strConsulta := 'nome';
      AtualizaAspectosOMS;
    end;
end;

procedure TfrmCadNotificacao.btCancelarClick(Sender: TObject);
begin
  if (framPaciente1.dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
    begin
      dm.Transacao(framPaciente1.dsPaciente.DataSet);
      framPaciente1.dsPaciente.DataSet.Cancel;
    end;
  inherited;
  AtualizaAspectosOMS;
end;

procedure TfrmCadNotificacao.bteditarClick(Sender: TObject);
begin
  inherited;
  if not (framPaciente1.dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
    begin
      dm.Transacao(framPaciente1.dsPaciente.DataSet);
      framPaciente1.dsPaciente.DataSet.Edit;
    end;
   AtualizaAspectosOMS;
end;

procedure TfrmCadNotificacao.btAnteriorClick(Sender: TObject);
begin
  inherited;
  dsGrid.DataSet.Prior;
  AtualizaAspectosOMS;
end;

procedure TfrmCadNotificacao.btProximoClick(Sender: TObject);
begin
  inherited;
  dsGrid.DataSet.Next;
  AtualizaAspectosOMS;
end;

procedure TfrmCadNotificacao.sbtransfusaoClick(Sender: TObject);
var bmp:TBitmap;
begin
  inherited;
  //if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    if (RxDBComboBox11.Text = 'Sim') then
    begin
      bmp := TBitmap.Create;
      try
        if framTransfusao.Parent = nil then
        begin
          ImageList1.GetBitmap(1,bmp);
          framTransfusao.Parent := pnTransfusao;
        end
        else
        begin
          ImageList1.GetBitmap(0,bmp);
           framTransfusao.Parent := nil;
        end;
        sbtransfusao.Glyph := bmp;
      except
        FreeAndNil(bmp);
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.sbTatuagemClick(Sender: TObject);
var bmp:TBitmap;
begin
  inherited;
  //if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    if (RxDBComboBox14.Text = 'Sim') then
    begin
      bmp := TBitmap.Create;
      try
        if framTatuagem.Parent = nil then
        begin
          ImageList1.GetBitmap(1,bmp);
          framTatuagem.Parent := pnPerfuracao;
        end
        else
        begin
          ImageList1.GetBitmap(0,bmp);
           framTatuagem.Parent := nil;
        end;
        sbTatuagem.Glyph := bmp;
      except
        FreeAndNil(bmp);
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.framPaciente1dsPacienteStateChange(
  Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadNotificacao.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  inherited;
  sbPadrao.Canvas.Brush.Color:=$00FFEECC;
  sbPadrao.Canvas.FillRect(Rect);
  sbPadrao.Canvas.TextOut(Rect.Left+18,Rect.Top,'Todos os campos que estiverem com * são obrigatórios.');
  ImageList1.Draw(StatusBar.Canvas,Rect.Left,Rect.top, 2);
end;

procedure TfrmCadNotificacao.BitBtn1Click(Sender: TObject);
begin
  {TODO: Mudar de Locate para SQL}
  inherited;
  if not (DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert]) then
  begin
    if (edNotificacao.Text <> '') and (edPaciente.Text <> '') then
    begin
      try
        if rbficha.Checked then
          try
            if not (qyLocalizarNotificacao.Locate('CD_FICHA;NM_PACIENTE',
              VarArrayOf([StrToInt(edNotificacao.Text),edPaciente.Text]), [loPartialKey, loCaseinsensitive])) then
                MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
          except
            MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
          end;

        if rbnumero.Checked then
            if not (qyLocalizarNotificacao.Locate('NR_NOTIFICACAO;NM_PACIENTE',
              VarArrayOf([edNotificacao.Text,edPaciente.Text]), [loPartialKey, loCaseinsensitive])) then
                MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);

       except
         MessageDlg('Erro Inesperado!',mtError,[mbOK],0);
       end;
    end
    else
    begin
      if rbficha.Checked then
        if (edNotificacao.Text <> '') then
           try
           if not (qyLocalizarNotificacao.Locate('CD_FICHA', StrToInt(edNotificacao.Text), [])) then
             MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
           except
              MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
           end;
      if rbnumero.Checked then
        if (edNotificacao.Text <> '') then
           if not (qyLocalizarNotificacao.Locate('NR_NOTIFICACAO', edNotificacao.Text, [])) then
             MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);

      if (edPaciente.Text <> '') then
        if not (qyLocalizarNotificacao.Locate('NM_PACIENTE', edPaciente.Text, [loPartialKey, loCaseinsensitive])) then
          MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
    end;
    pgGeral.TabIndex := 1;
  end;

  AtualizaAspectosOMS;
end;

procedure TfrmCadNotificacao.btatualizaNRClick(Sender: TObject);
begin
  inherited;
  AtualizarNrNotificacao;
end;

procedure TfrmCadNotificacao.dxDBEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
    btatualizaNR.Visible := true;

end;

procedure TfrmCadNotificacao.framPaciente1dxDBEdit2Exit(Sender: TObject);
begin
  inherited;
   ConsultaPaciente;
end;

procedure TfrmCadNotificacao.framPaciente1DBDateEdit3Exit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    framPaciente1.DBDateEdit3Exit(Sender);
    ConsultaPaciente;
  end;
end;

procedure TfrmCadNotificacao.framPaciente1dxDBEdit5Exit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    ConsultaPaciente;
  end;

end;

procedure TfrmCadNotificacao.ConsultaPaciente;
var sWhere:string;
begin
  if (DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert]) then
  begin
    try
      sWhere := 'WHERE';
      qyPacienteExistente.Close;
      qyPacienteExistente.SQL.Text := sPSQL;
      if (DMGERAL.TB_PACIENTENM_PACIENTE.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere + ' Upper(NM_PACIENTE) like('''+ UpperCase(DMGERAL.TB_PACIENTENM_PACIENTE.AsString) + '%'')');
         sWhere := 'AND';
      end;

      if (DMGERAL.TB_PACIENTENM_MAE.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere +' Upper(NM_MAE) like('''+ UpperCase(DMGERAL.TB_PACIENTENM_MAE.AsString)+ '%'')');
         sWhere := 'AND';
      end;
      {
      if (DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere + ' DT_NASCIMENTO = :DATA');
         qyPacienteExistente.ParamByName('DATA').AsDate := DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime;
         sWhere := 'AND';
      end;
      }
      if (DMGERAL.TB_PACIENTEIDADE.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere + ' IDADE = :IDADE');
         qyPacienteExistente.ParamByName('IDADE').AsString := DMGERAL.TB_PACIENTEIDADE.AsString;
         sWhere := 'AND';
      end;

      qyPacienteExistente.Open;
      PacienteExistente;
    except
      qyPacienteExistente.close;
    end;
  end;
end;

procedure TfrmCadNotificacao.btLocUnidadeChange(Sender: TObject);
begin
  inherited;
  if btLocUnidade.Text = '' then
    DMGERAL.TB_NOTIFICACAODS_UNIDADE.Clear
  else if btLocUnidade.Modified then
  begin
    try
      DMGERAL.TB_NOTIFICACAODS_UNIDADE.AsString :=
        PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btLocUnidade.Text],nil);
    except
      begin
        DMGERAL.TB_NOTIFICACAODS_UNIDADE.Clear;
      end;
    end;
  end;

end;

procedure TfrmCadNotificacao.btLocMunicipioChange(Sender: TObject);
begin
  inherited;
  if btLocMunicipio.Text = '' then
    DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.Clear
  else if btLocMunicipio.Modified then
  begin
    if btLocProvincia.text <> '' then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.AsString :=
          PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
           [btLocMunicipio.Text],nil);
       except
          begin
            DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.Clear;
          end;
       end;
      end
    else
      begin
        DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO.Clear;
        DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.Clear;
        MessageDlg('É necessário incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;

end;

procedure TfrmCadNotificacao.btLocProvinciaChange(Sender: TObject);
begin
  inherited;
  if dsControle.DataSet.State in [dsEdit, dsInsert] then
  begin
    if btLocProvincia.Text = ''  then
      DMGERAL.TB_NOTIFICACAODS_PROVINCIA_NOT.Clear
    else if btLocProvincia.Modified then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_PROVINCIA_NOT.AsString :=
          PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
          [btLocProvincia.Text],nil);
      except
        begin
          DMGERAL.TB_NOTIFICACAODS_PROVINCIA_NOT.Clear;
        end;
      end;
        DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO.Clear;
        DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.Clear;
    end;
  end;
end;

procedure TfrmCadNotificacao.btLocProvinciaTraChange(Sender: TObject);
begin
  inherited;
  if dsControle.DataSet.State in [dsEdit, dsInsert] then
  begin
    if btLocProvinciaTra.Text = ''  then
      DMGERAL.TB_NOTIFICACAODS_PROVINCIA_TRATAMENTO.Clear
    else if btLocProvinciaTra.Modified then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_PROVINCIA_TRATAMENTO.AsString :=
          PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
          [btLocProvinciaTra.Text],nil);
      except
        begin
          DMGERAL.TB_NOTIFICACAODS_PROVINCIA_TRATAMENTO.Clear;
        end;
      end;
      DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO_TRATAMENTO.Clear;
      DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.Clear;
    end;
  end;
end;

procedure TfrmCadNotificacao.btLocMunicipioTraChange(Sender: TObject);
begin
  inherited;
  if btLocMunicipioTra.Text = '' then
    DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.Clear
  else if btLocMunicipioTra.Modified then
  begin
    if btLocProvinciaTra.text <> '' then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.AsString :=
          PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
           [btLocMunicipioTra.Text],nil);
       except
          begin
            DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.Clear;
          end;
       end;
      end
    else
      begin
        DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO_TRATAMENTO.Clear;
        DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.Clear;
        MessageDlg('É necessário incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;

end;

procedure TfrmCadNotificacao.btLocUnidadeTraChange(Sender: TObject);
begin
  inherited;
  if btLocUnidadeTra.Text = '' then
    DMGERAL.TB_NOTIFICACAODS_UNIDADE_TRATAMENTO.Clear
  else if btLocUnidadeTra.Modified then
  begin
    try
      DMGERAL.TB_NOTIFICACAODS_UNIDADE_TRATAMENTO.AsString :=
        PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btLocUnidadeTra.Text],nil);
    except
      begin
        DMGERAL.TB_NOTIFICACAODS_UNIDADE_TRATAMENTO.Clear;
      end;
    end;
  end;

end;

procedure TfrmCadNotificacao.rbfichaClick(Sender: TObject);
begin
  inherited;
  if rbficha.Checked then
    rbnumero.Checked := false;

end;

procedure TfrmCadNotificacao.rbnumeroClick(Sender: TObject);
begin
  inherited;
  if rbnumero.Checked then
    rbficha.Checked := false;

end;

procedure TfrmCadNotificacao.btexcluirClick(Sender: TObject);
begin
  inherited;
  AtualizaAspectosOMS;
end;

procedure TfrmCadNotificacao.grDadosDblClick(Sender: TObject);
begin
  inherited;
  dmGeral.TB_NOTIFICACAO.Close;
  dmGeral.TB_NOTIFICACAO.Open;
  AtualizaAspectosOMS;
end;

procedure TfrmCadNotificacao.framPaciente1SpeedButton1Click(
  Sender: TObject);
begin
  inherited;
  framPaciente1.SpeedButton1Click(Sender);
end;

procedure TfrmCadNotificacao.btimprimirClick(Sender: TObject);
begin
  //inherited;
  qyRelNotificacao.Open;
  qyPerfuracao.Open;
  qyTatuagem.Open;
  qyTransfusao.Open;
  qyDentario.Open;
  qyIntervencao.Open;
  qyCircuncisao.Open;

  qyAspectosOMSCriancas.Open;
  qyAspectosOMSAdultos.Open;

  RvNotificacao.Execute;

  qyRelNotificacao.close;
  qyPerfuracao.Close;
  qyTatuagem.Close;
  qyTransfusao.Close;
  qyDentario.Close;
  qyIntervencao.Close;
  qyCircuncisao.Close;

  qyAspectosOMSCriancas.Close;
  qyAspectosOMSAdultos.Close;

end;

procedure TfrmCadNotificacao.qyPerfuracaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyPerfuracao.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.qyTatuagemBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyTatuagem.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.qyTransfusaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyTransfusao.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.qyAspectosOMSCriancasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qyAspectosOMSCriancas.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.qyAspectosOMSAdultosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qyAspectosOMSAdultos.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.tabListaShow(Sender: TObject);
var chave: integer;
begin
  inherited;
  if not (DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert]) then
    begin
      {chave := DMGERAL.TB_NOTIFICACAOCD_FICHA.AsInteger;
      DMGERAL.TB_NOTIFICACAO.Close;
      DMGERAL.TB_NOTIFICACAO.Open;
      DMGERAL.TB_NOTIFICACAO.Locate('CD_FICHA', chave, []);}
    end;
end;

procedure TfrmCadNotificacao.btLocProvinciaExit(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocProvincia.Text <> ''  then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_PROVINCIA_NOT.AsString :=
          PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
          [btLocProvincia.Text],nil);
      except
        begin
          MessageDlg('Provincia não encontrada!',mtWarning,[mbOK],0);
          DMGERAL.TB_NOTIFICACAOCD_PROVINCIA_NOT.Clear;
          DMGERAL.TB_NOTIFICACAODS_PROVINCIA_NOT.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.btLocMunicipioExit(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocMunicipio.Text <> '' then
    begin
        try
          DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.AsString :=
            PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
             [btLocMunicipio.Text],nil);
         except
            begin
              MessageDlg('Municipio não encontrado!',mtWarning,[mbOK],0);
              DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO.Clear;
              DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_NOT.Clear;
            end;
         end;
     end;
  end;
end;

procedure TfrmCadNotificacao.btLocUnidadeExit(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocUnidade.Text <> '' then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_UNIDADE.AsString :=
          PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
          [btLocUnidade.Text],nil);

        //Atualiza Numero Notificação 000(UN)00000(GEN)
        if DMGERAL.TB_NOTIFICACAONR_NOTIFICACAO.AsString <> '' then
          if MessageDlg('É recomendado que atualizae o Nr da Notificação '+#13#10+
                'para à Unidade selecioada! Click em Sim para Atualizar.',mtInformation,[mbYes,mbNo],0) = mrYes then
              begin
                DMGERAL.TB_NOTIFICACAONR_NOTIFICACAO.AsString :=
                 ZeroEsq(DMGERAL.TB_NOTIFICACAOCD_UNIDADE.AsString, 3) +  '-' +
                   ZeroEsq(IntToStr(dm.GeraCodigo('GEN_NR_NOTIFICACAO')), 5);
              end;

      except
        begin
          MessageDlg('Unidade não encontrada!',mtWarning,[mbOK],0);
          DMGERAL.TB_NOTIFICACAOCD_UNIDADE.Clear;
          DMGERAL.TB_NOTIFICACAODS_UNIDADE.Clear;
        end;
      end;
    end;

  end;
end;

procedure TfrmCadNotificacao.btLocProvinciaTraExit(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocProvinciaTra.Text <> ''  then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_PROVINCIA_TRATAMENTO.AsString :=
          PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
          [btLocProvinciaTra.Text],nil);
      except
        begin
          MessageDlg('Provincia não encontrada!',mtWarning,[mbOK],0);
          DMGERAL.TB_NOTIFICACAOCD_PROVINCIA_TRATAMENTO.Clear;
          DMGERAL.TB_NOTIFICACAODS_PROVINCIA_TRATAMENTO.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.btLocMunicipioTraExit(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocMunicipioTra.Text <> '' then
    begin
        try
          DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.AsString :=
            PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
             [btLocMunicipioTra.Text],nil);
         except
            begin
              MessageDlg('Municipio não encontrado!',mtWarning,[mbOK],0);
              DMGERAL.TB_NOTIFICACAOCD_MUNICIPIO_TRATAMENTO.Clear;
              DMGERAL.TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO.Clear;
            end;
         end;
    end;
  end;
end;

procedure TfrmCadNotificacao.btLocUnidadeTraExit(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocUnidadeTra.Text <> '' then
    begin
      try
        DMGERAL.TB_NOTIFICACAODS_UNIDADE_TRATAMENTO.AsString :=
          PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
          [btLocUnidadeTra.Text],nil);
      except
        begin
          MessageDlg('Unidade não encontrada!',mtWarning,[mbOK],0);
          DMGERAL.TB_NOTIFICACAOCD_UNIDADE_TRATAMENTO.Clear;
          DMGERAL.TB_NOTIFICACAODS_UNIDADE_TRATAMENTO.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.btPesquisarClick(Sender: TObject);
begin
  inherited;
  bFiltro := not bFiltro;
  if bFiltro then
  begin
    sbPadrao.Panels[2].Text := 'Filtro Ativado!';
    //qyAgenda.SQL.Text := sSQLLista;
    frmLocNotificacao := TfrmLocNotificacao.Create(self);
    frmLocNotificacao.ShowModal;
    frmLocNotificacao.Free;
    pgGeral.ActivePage := tabLista;
  end
  else
  begin
    sbPadrao.Panels[2].Text := '';
    qyLocalizarNotificacao.Close;
    qyLocalizarNotificacao.SQL.Text := StringReplace(sNSQL,'and 1=2','',[]);
    //tabListaShow(sender);
  end;
end;

procedure TfrmCadNotificacao.framPaciente1SpeedButton2Click(
  Sender: TObject);
begin
  inherited;
  framPaciente1.SpeedButton2Click(Sender);
end;

procedure TfrmCadNotificacao.sbDentarioClick(Sender: TObject);
var bmp:TBitmap;
begin
  inherited;
  //if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    if (RxDBComboBox15.Text = 'Sim') then
    begin
      bmp := TBitmap.Create;
      try
        if framDentario.Parent = nil then
        begin
          ImageList1.GetBitmap(1,bmp);
          framDentario.Parent := pnDentario;
        end
        else
        begin
          ImageList1.GetBitmap(0,bmp);
           framDentario.Parent := nil;
        end;
        sbDentario.Glyph := bmp;
      except
        FreeAndNil(bmp);
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.sbIntervencaoCirurgicaClick(Sender: TObject);
var bmp:TBitmap;
begin
  inherited;
  //if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    if (RxDBComboBox16.Text = 'Sim') then
    begin
      bmp := TBitmap.Create;
      try
        if framIntervencaoCirurgica.Parent = nil then
        begin
          ImageList1.GetBitmap(1,bmp);
          framIntervencaoCirurgica.Parent := pnIntervencao;
        end
        else
        begin
          ImageList1.GetBitmap(0,bmp);
           framIntervencaoCirurgica.Parent := nil;
        end;
        sbIntervencaoCirurgica.Glyph := bmp;
      except
        FreeAndNil(bmp);
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.sbCircuncisaoClick(Sender: TObject);
var bmp:TBitmap;
begin
  inherited;
  //if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    if (RxDBComboBox12.Text = 'Sim') then
    begin
      bmp := TBitmap.Create;
      try
        if framCircuncisao.Parent = nil then
        begin
          ImageList1.GetBitmap(1,bmp);
          framCircuncisao.Parent := pnCircuncisao;
        end
        else
        begin
          ImageList1.GetBitmap(0,bmp);
           framCircuncisao.Parent := nil;
        end;
        sbCircuncisao.Glyph := bmp;
      except
        FreeAndNil(bmp);
      end;
    end;
  end;
end;

procedure TfrmCadNotificacao.FocoControle;
begin
  inherited;
  pgNotificacao.ActivePageIndex := 0;
  dxDBEdit1.SetFocus;
end;

procedure TfrmCadNotificacao.dsControleStateChange(Sender: TObject);
var bEditModes:Boolean;
begin
  inherited;
  bEditModes := not(dsControle.State in dsEditModes);
  framTransfusao.Bloqueia(bEditModes);
  framPerfuracao.Bloqueia(bEditModes);
  framTatuagem.Bloqueia(bEditModes);
  framDentario.Bloqueia(bEditModes);
  framCircuncisao.Bloqueia(bEditModes);
  framIntervencaoCirurgica.Bloqueia(bEditModes);

end;

procedure TfrmCadNotificacao.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Médico';
    frmLocalizar.qyDados := SelectDadosMedico;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,3);
      frmLocalizar.KeyField := 'cd_medico';
      VCampo[0].Titulo  := 'Cód.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome';
      VCampo[1].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := false;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      DMGERAL.TB_NOTIFICACAONM_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
      DMGERAL.TB_NOTIFICACAOTEL_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nr_telefone').AsString;
      DMGERAL.TB_NOTIFICACAOCD_MEDICO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_medico').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadNotificacao.btLocMedicoChange(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit,dsInsert] then
  begin
    if btLocMedico.Text = '' then
      DMGERAL.TB_NOTIFICACAONM_MEDICO.Clear
    else if btLocMedico.Modified then
    begin
      try
        DMGERAL.TB_NOTIFICACAONM_MEDICO.AsString := PegaValor('NM_MEDICO','MEDICO',['CD_MEDICO'],
          [btLocMedico.Text],nil);

        IF PegaValor('NR_TELEFONE','MEDICO',['CD_MEDICO'],[btLocMedico.Text],nil) > 0  then
          DMGERAL.TB_NOTIFICACAOTEL_MEDICO.AsString :=
            PegaValor('NR_TELEFONE','MEDICO',['CD_MEDICO'],[btLocMedico.Text],nil)
        else
          DMGERAL.TB_NOTIFICACAOTEL_MEDICO.Clear;

      except
        begin
          DMGERAL.TB_NOTIFICACAONM_MEDICO.Clear;
          DMGERAL.TB_NOTIFICACAOTEL_MEDICO.Clear;
        end;
      end;
    end;
  end;

end;

procedure TfrmCadNotificacao.btLocMedicoExit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit,dsInsert] then
  begin
    if btLocMedico.Text <> '' then
    begin
      try
        DMGERAL.TB_NOTIFICACAONM_MEDICO.AsString := PegaValor('NM_MEDICO','MEDICO',['CD_MEDICO'],
          [btLocMedico.Text],nil);

        IF PegaValor('NR_TELEFONE','MEDICO',['CD_MEDICO'],[btLocMedico.Text],nil) > 0  then
          DMGERAL.TB_NOTIFICACAOTEL_MEDICO.AsString :=
            PegaValor('NR_TELEFONE','MEDICO',['CD_MEDICO'],[btLocMedico.Text],nil)
        else
          DMGERAL.TB_NOTIFICACAOTEL_MEDICO.Clear;
            
      except
        begin
          MessageDlg('Medico não encontrado!',mtWarning,[mbOK],0);
          DMGERAL.TB_NOTIFICACAONM_MEDICO.Clear;
          DMGERAL.TB_NOTIFICACAOTEL_MEDICO.Clear;
          DMGERAL.TB_NOTIFICACAOCD_MEDICO.Clear;
        end;
      end;
    end;
  end;

end;

procedure TfrmCadNotificacao.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    frmCadMedico := TfrmCadMedico.Create(self);
    frmCadMedico.ShowModal;
    frmCadMedico.Free;
  end;
end;

procedure TfrmCadNotificacao.qyDentarioBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyDentario.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.qyIntervencaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyIntervencao.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.qyCircuncisaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyCircuncisao.ParamByName('FICHA').AsString :=
    DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;

end;

procedure TfrmCadNotificacao.RvNotificacaoCreate(Sender: TObject);
begin
  inherited;
  RvNotificacao.ProjectFile := sPathLayout +'\RelNotificacao.rav';
end;

procedure TfrmCadNotificacao.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    frmCadInvestigador := TfrmCadInvestigador.Create(self);
    frmCadInvestigador.ShowModal;
    frmCadInvestigador.Free;
  end;

end;

procedure TfrmCadNotificacao.btLocInvestigadorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert] then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Investigador';
    frmLocalizar.qyDados := SelectDadosInvestigador;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,4);
      frmLocalizar.KeyField := 'cd_investigador';
      VCampo[0].Titulo  := 'Cód.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome';
      VCampo[1].Width := 25;
      VCampo[2].Titulo  := 'Função';
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
      DMGERAL.TB_NOTIFICACAONM_ENTREVISTADOR.AsString := frmLocalizar.qyDados.FieldByname('nm_investigador').AsString;
      DMGERAL.TB_NOTIFICACAOFUNCAO_ENTREVISTADOR.AsString := frmLocalizar.qyDados.FieldByname('nm_funcao').AsString;
      DMGERAL.TB_NOTIFICACAOTEL_ENTREVISTADOR.AsString := frmLocalizar.qyDados.FieldByname('nr_telefone').AsString;
      DMGERAL.TB_NOTIFICACAOCD_INVESTIGADOR.AsInteger := frmLocalizar.qyDados.FieldByname('cd_investigador').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;

end;

procedure TfrmCadNotificacao.btLocInvestigadorChange(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit,dsInsert] then
  begin
    if btLocInvestigador.Text = '' then
      DMGERAL.TB_NOTIFICACAONM_ENTREVISTADOR.Clear
    else if btLocInvestigador.Modified then
    begin
      try
        DMGERAL.TB_NOTIFICACAONM_ENTREVISTADOR.AsString := PegaValor('NM_INVESTIGADOR','INVESTIGADOR',['CD_INVESTIGADOR'],
          [btLocInvestigador.Text],nil);

        if PegaValor('NM_FUNCAO','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil) <> null then
          DMGERAL.TB_NOTIFICACAOFUNCAO_ENTREVISTADOR.AsString :=
            PegaValor('NM_FUNCAO','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil)
        else
          DMGERAL.TB_NOTIFICACAOFUNCAO_ENTREVISTADOR.Clear;

        if PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil) <> null then
          DMGERAL.TB_NOTIFICACAOTEL_ENTREVISTADOR.AsString :=
            PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil)
        else
          DMGERAL.TB_NOTIFICACAOTEL_ENTREVISTADOR.Clear;

      except
        begin
          DMGERAL.TB_NOTIFICACAONM_ENTREVISTADOR.Clear;
          DMGERAL.TB_NOTIFICACAOFUNCAO_ENTREVISTADOR.Clear;
          DMGERAL.TB_NOTIFICACAOTEL_ENTREVISTADOR.Clear;
        end;
      end;
    end;
  end;

end;

procedure TfrmCadNotificacao.btLocInvestigadorExit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_NOTIFICACAO.State in [dsEdit,dsInsert] then
  begin
    if btLocInvestigador.Text <> '' then
    begin
      try
        DMGERAL.TB_NOTIFICACAONM_ENTREVISTADOR.AsString := PegaValor('NM_INVESTIGADOR','INVESTIGADOR',['CD_INVESTIGADOR'],
          [btLocInvestigador.Text],nil);

        if PegaValor('NM_FUNCAO','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil) <> null then
          DMGERAL.TB_NOTIFICACAOFUNCAO_ENTREVISTADOR.AsString :=
            PegaValor('NM_FUNCAO','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil)
        else
          DMGERAL.TB_NOTIFICACAOFUNCAO_ENTREVISTADOR.Clear;

        if PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil) <> null then
          DMGERAL.TB_NOTIFICACAOTEL_ENTREVISTADOR.AsString :=
            PegaValor('NR_TELEFONE','INVESTIGADOR',['CD_INVESTIGADOR'],[btLocInvestigador.Text],nil)
        else
          DMGERAL.TB_NOTIFICACAOTEL_ENTREVISTADOR.Clear;
      except
        begin
          MessageDlg('Investigador não encontrado!',mtWarning,[mbOK],0);
          DMGERAL.TB_NOTIFICACAONM_ENTREVISTADOR.Clear;
          DMGERAL.TB_NOTIFICACAOFUNCAO_ENTREVISTADOR.Clear;
          DMGERAL.TB_NOTIFICACAOTEL_ENTREVISTADOR.Clear;
          DMGERAL.TB_NOTIFICACAOCD_INVESTIGADOR.Clear;
        end;
      end;
    end;
  end;

end;

procedure TfrmCadNotificacao.framPaciente1dxDBEdit16Exit(Sender: TObject);
begin
  inherited;
  if (DMGERAL.TB_NOTIFICACAO.State in [dsEdit, dsInsert]) then
  begin
    try
      qyPacienteExistente.Close;
      qyPacienteExistente.SQL.Text := sPSQL;
      if (DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger <> null) then
      begin
         qyPacienteExistente.SQL.Add('WHERE NR_PROCESSO =:processo');
         qyPacienteExistente.ParamByName('processo').AsInteger :=
            DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger;

      end;
      qyPacienteExistente.Open;
      PacienteExistente;
    except
      qyPacienteExistente.close;
    end;
  end;

end;

procedure TfrmCadNotificacao.qyRelNotificacaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyRelNotificacao.ParamByName('CD_FICHA').AsString := DMGERAL.TB_NOTIFICACAOCD_FICHA.AsString;
  qyRelNotificacao.ParamByName('CD_UND').AsInteger := DMGERAL.TB_NOTIFICACAOCD_UND.AsInteger;
end;

function TfrmCadNotificacao.ExisteNotificacao: boolean;
var sWhere:string;
begin
    try
      sWhere := 'AND';
      qyLocalizarNotificacao.Close;
      qyLocalizarNotificacao.SQL.Text := StringReplace(sNSQL,'and 1=2','',[]);
      if (fsPaciente <> '') then
      begin
         qyLocalizarNotificacao.SQL.Add(sWhere + ' Upper(NM_PACIENTE) like('''+
         UpperCase(fsPaciente) + '%'')');
         sWhere := 'AND';
      end;

      if (fsIdade <> '') then
      begin
         qyLocalizarNotificacao.SQL.Add(sWhere + ' IDADE = :IDADE');
         qyLocalizarNotificacao.ParamByName('IDADE').AsString := fsIdade;
         sWhere := 'AND';
      end;

      qyLocalizarNotificacao.Open;
      if not qyLocalizarNotificacao.IsEmpty then
      begin
        frmProcessoExistente := TfrmProcessoExistente.Create(application);
        frmProcessoExistente.DBGrid1.Columns[0].Visible := false;
        frmProcessoExistente.DBGrid1.Columns[1].Visible := false;
        frmProcessoExistente.DBGrid1.Columns[2].Title.Caption := 'Notificação';
        frmProcessoExistente.DBGrid1.Columns[2].FieldName := 'NR_NOTIFICACAO';
        frmProcessoExistente.DBGrid1.DataSource := dsLocNotificacao;
        Result := (frmProcessoExistente.ShowModal=mrok);
        frmProcessoExistente.Free;
        grDadosDblClick(Self);
      end;
    except
      qyLocalizarNotificacao.close;
    end;
end;

procedure TfrmCadNotificacao.qyLocalizarNotificacaoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qyLocalizarNotificacaoNR_IDADE_IDENTIFICACAO.AsInteger :=
    YearsBetween(qyLocalizarNotificacaoDT_NOTIFICACAO.AsDateTime,
                 qyLocalizarNotificacaoDT_NASCIMENTO.AsDateTime);
end;

procedure TfrmCadNotificacao.AtualizaNR_IDADE_IDENTIFICACAO;
begin
  lblNR_IDADE_IDENTIFICACAO.Caption := '';
  if (DMGERAL.TB_NOTIFICACAODT_NOTIFICACAO.IsNull or
      DMGERAL.TB_PACIENTEDT_NASCIMENTO.IsNull)then
      Exit;
  try
    lblNR_IDADE_IDENTIFICACAO.Caption :=
      IntToStr(YearsBetween(DMGERAL.TB_NOTIFICACAODT_NOTIFICACAO.AsDateTime,
                            DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime));
  except

  end;
end;

procedure TfrmCadNotificacao.tbNotificacaoShow(Sender: TObject);
begin
  inherited;
  AtualizaNR_IDADE_IDENTIFICACAO;
end;

procedure TfrmCadNotificacao.DBDateEdit1Change(Sender: TObject);
begin
  inherited;
  AtualizaNR_IDADE_IDENTIFICACAO;
end;

procedure TfrmCadNotificacao.dsControleDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  AtualizaNR_IDADE_IDENTIFICACAO;
end;

procedure TfrmCadNotificacao.qyRelNotificacaoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qyRelNotificacaoNR_IDADE_IDENTIFICACAO.AsInteger :=
    YearsBetween(qyRelNotificacaoDT_NOTIFICACAO.AsDateTime,
                 qyRelNotificacaoDT_NASCIMENTO.AsDateTime);
end;

end.


