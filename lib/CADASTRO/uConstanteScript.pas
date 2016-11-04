unit uConstanteScript;

interface

Const
//Tabela
  cvCreateTableTARV =
      'CREATE TABLE REGISTRO_TARV                 ' + chr(13) +
      ' (CD_REGISTRO_TARV	 INTEGER NOT NULL,      ' + chr(13) +
      '  DT_REGISTRO	 TIMESTAMP NOT NULL,        ' + chr(13) +
      '  CD_UNIDADE	 INTEGER NOT NULL,            ' + chr(13) +
      '  CD_PROVINCIA	 INTEGER NOT NULL,          ' + chr(13) +
      '  CD_MUNICIPIO	 INTEGER NOT NULL,          ' + chr(13) +
      '  VL_MESANO	 VARCHAR(8) NOT NULL,         ' + chr(13) +
      '  VL_ACUMULADOS	 INTEGER,                 ' + chr(13) +
      '  VL_NOVOS	 INTEGER,                       ' + chr(13) +
      '  VL_TRANSFERIDOS	 INTEGER,               ' + chr(13) +
      '  VL_ABANDONOS	 INTEGER,                   ' + chr(13) +
      '  VL_TRANSFERIDOS_PARA	 INTEGER,           ' + chr(13) +
      '  VL_OBITOS	 INTEGER,                     ' + chr(13) +
      '  ID_FAIXA_ETARIA	 INTEGER,               ' + chr(13) +
      '  FL_SEXO	 CHAR(1),                       ' + chr(13) +
      '  FL_GESTANTE	 INTEGER,                   ' + chr(13) +
      '  VL_X	 INTEGER,                           ' + chr(13) +
      '  VL_Y	 INTEGER,                           ' + chr(13) +
      '  PRIMARY KEY (CD_REGISTRO_TARV))';

  cvCreateTablePTV =
      'CREATE TABLE REGISTRO_PTV                  ' + chr(13) +
      ' (CD_REGISTRO_PTV INTEGER NOT NULL,        ' + chr(13) +
      '  DT_REGISTRO TIMESTAMP,                   ' + chr(13) +
      '  CD_UNIDADE INTEGER NOT NULL,             ' + chr(13) +
      '  CD_PROVINCIA INTEGER NOT NULL,           ' + chr(13) +
      '  CD_MUNICIPIO INTEGER NOT NULL,           ' + chr(13) +
      '  VL_MESANO VARCHAR(8) NOT NULL,           ' + chr(13) +
      '  FL_GESTANTE INTEGER,                     ' + chr(13) +
      '  ID_GRUPOS_GESTANTE INTEGER,              ' + chr(13) +
      '  VL_ADMITIDAS_PTV INTEGER,                ' + chr(13) +
      '  VL_ADMITIDAS_PARTO INTEGER,              ' + chr(13) +
      '  VL_ADMITIDAS_POS_PARTO INTEGER,          ' + chr(13) +
      '  VL_X_GESTANTE INTEGER,                   ' + chr(13) +
      '  VL_Y_GESTANTE INTEGER,                   ' + chr(13) +
      '  FL_PARTO INTEGER,                        ' + chr(13) +
      '  ID_GRUPOS_PARTO INTEGER,                 ' + chr(13) +
      '  VL_TERAPIA_COMPLETA INTEGER,             ' + chr(13) +
      '  VL_TERAPIA_OUTRO INTEGER,                ' + chr(13) +
      '  VL_TERAPIA_NENHUM INTEGER,               ' + chr(13) +
      '  VL_X_PARTO INTEGER,                      ' + chr(13) +
      '  VL_Y_PARTO INTEGER,                      ' + chr(13) +
      '  FL_CRIANCA INTEGER,                      ' + chr(13) +
      '  ID_GRUPOS_CRIANCA INTEGER,               ' + chr(13) +
      '  VL_TOTAL_CRIANCA INTEGER,                ' + chr(13) +
      '  VL_X_CRIANCA INTEGER,                    ' + chr(13) +
      '  VL_Y_CRIANCA INTEGER,                    ' + chr(13) +
      '  PRIMARY KEY (CD_REGISTRO_PTV))';

  cvCreateTableINVESTIGADOR =
      'CREATE TABLE INVESTIGADOR                  ' + chr(13) +
      ' (CD_INVESTIGADOR	 INTEGER NOT NULL,      ' + chr(13) +
      '  NM_INVESTIGADOR	 VARCHAR(50),           ' + chr(13) +
      '  NM_FUNCAO	 VARCHAR(50),                 ' + chr(13) +
      '  NR_TELEFONE	 VARCHAR(20),               ' + chr(13) +
      '  PRIMARY KEY (CD_INVESTIGADOR))';

  cvCreateTableSCRIPT =
      'CREATE TABLE SCRIPT                        ' + chr(13) +
      ' (CD_SCRIPT	 INTEGER NOT NULL,            ' + chr(13) +
      '  DT_SCRIPT	 TIMESTAMP,                   ' + chr(13) +
      '  PRIMARY KEY (CD_SCRIPT))';

  cvCreateTableCARACTERIZACAO =
  'CREATE TABLE CARACTERIZACAO            ' + chr(13) +
  ' (CD_CARACTERIZACAO INTEGER NOT NULL,  ' + chr(13) +
  ' CD_PROVINCIA INTEGER,                 ' + chr(13) +
  ' CD_MUNICIPIO INTEGER,                 ' + chr(13) +
  ' CD_UNIDADE INTEGER,                   ' + chr(13) +
  ' CD_LOCAL INTEGER,                     ' + chr(13) +
  ' CD_UTENTE INTEGER,                    ' + chr(13) +
  ' CD_INVESTIGADOR INTEGER,              ' + chr(13) +
  ' DT_VISITA TIMESTAMP,                  ' + chr(13) +
  ' FL_SEXO INTEGER,                      ' + chr(13) +
  ' NR_IDADE INTEGER,                     ' + chr(13) +
  ' TP_SESSAO INTEGER,                    ' + chr(13) +
  ' CD_ESTADO_CIVIL INTEGER,              ' + chr(13) +
  ' NR_FILHOS INTEGER,                    ' + chr(13) +
  ' FL_GESTANTE INTEGER,                  ' + chr(13) +
  ' NR_SEMANAS_GESTANTE INTEGER,          ' + chr(13) +
  ' FL_AMAMENTA INTEGER,                  ' + chr(13) +
  ' CD_ESCOLARIDADE INTEGER,              ' + chr(13) +
  ' DS_ESCORALIDADE VARCHAR(50),          ' + chr(13) +
  ' CD_OCUPACAO INTEGER,                  ' + chr(13) +
  ' DS_OCUPACAO VARCHAR(50),              ' + chr(13) +
  ' FL_EMPREGADA INTEGER,                 ' + chr(13) +
  ' FL_OUVIU_FALAR INTEGER,               ' + chr(13) +
  ' CD_RAZAO INTEGER,                     ' + chr(13) +
  ' DS_RAZAO VARCHAR(100),                ' + chr(13) +
  ' CD_INDICACAO INTEGER,                 ' + chr(13) +
  ' DS_INDICACAO VARCHAR(100),            ' + chr(13) +
  ' FL_TRANSFUSAO INTEGER,                ' + chr(13) +
  ' FL_TATUAGEM INTEGER,                  ' + chr(13) +
  ' FL_CIRURGIA INTEGER,                  ' + chr(13) +
  ' FL_CIRCUNCISAO INTEGER,               ' + chr(13) +
  ' NR_PARTOS INTEGER,                    ' + chr(13) +
  ' NR_ABORTOS INTEGER,                   ' + chr(13) +
  ' FL_AMAMENTOU_OUTROS INTEGER,          ' + chr(13) +
  ' NR_IDADE_EXPERIENCIA INTEGER,         ' + chr(13) +
  ' FL_SEXO_ALCOOL INTEGER,               ' + chr(13) +
  ' FL_SEXO_DROGAS INTEGER,               ' + chr(13) +
  ' FL_SEXO_DINHEIRO INTEGER,             ' + chr(13) +
  ' FL_SEXO_MATERIAL INTEGER,             ' + chr(13) +
  ' FL_SINAIS_ITS INTEGER,                ' + chr(13) +
  ' CD_SINAIS_ITS INTEGER,                ' + chr(13) +
  ' DS_SINAIS_ITS VARCHAR(30),            ' + chr(13) +
  ' NR_PARCEIROS_SEXUAIS INTEGER,         ' + chr(13) +
  ' FL_PARCEIRO_SEXUAL INTEGER,           ' + chr(13) +
  ' FL_PRESERVATIVO INTEGER,              ' + chr(13) +
  ' FL_PRESERVATIVO_NAO_REGULAR INTEGER,  ' + chr(13) +
  ' FL_TESTE INTEGER,                     ' + chr(13) +
  ' CD_TESTE INTEGER,                     ' + chr(13) +
  ' DS_TESTE VARCHAR(50),                 ' + chr(13) +
  ' DT_TESTE TIMESTAMP,                   ' + chr(13) +
  ' FL_TESTE_RECENTES INTEGER,            ' + chr(13) +
  ' FL_TESTE_PARCEIROS INTEGER,           ' + chr(13) +
  ' FL_ITS INTEGER,                       ' + chr(13) +
  ' CD_SINTOMAS_ITS INTEGER,              ' + chr(13) +
  ' DS_SINTOMAS_ITS VARCHAR(30),          ' + chr(13) +
  ' FL_TESTE_HOJE INTEGER,                ' + chr(13) +
  ' FL_TESTE_RESULTADOS INTEGER,          ' + chr(13) +
  ' FL_PARCEIROS_RESULTADOS INTEGER,      ' + chr(13) +
  ' FL_REVELAR INTEGER,                   ' + chr(13) +
  ' CD_REVELAR INTEGER,                   ' + chr(13) +
  ' DS_REVELAR VARCHAR(50),               ' + chr(13) +
  ' FL_PLANO_REDUCAO INTEGER,             ' + chr(13) +
  ' CD_PLANO_REDUCAO INTEGER,             ' + chr(13) +
  ' DS_PLANO_REDUCAO VARCHAR(50),         ' + chr(13) +
  ' FL_RECEBEU_PRESERVATIVOS INTEGER,     ' + chr(13) +
  ' FL_TRANSFERENCIA INTEGER,             ' + chr(13) +
  ' CD_TRANSFERENCIA INTEGER,             ' + chr(13) +
  ' DS_TRANSFERENCIA VARCHAR(100),        ' + chr(13) +
  ' FL_SERVICO_SAUDE INTEGER,             ' + chr(13) +
  ' PRIMARY KEY (CD_CARACTERIZACAO))';


  cvCreateTableREGISTRO_PROGRAMA =
  ' CREATE TABLE REGISTRO_PROGRAMA           ' + chr(13) +
  '  (CD_REGISTRO_PROGRAMA INTEGER NOT NULL, ' + chr(13) +
  '  DT_REGISTRO	 TIMESTAMP NOT NULL,       ' + chr(13) +
  '  CD_UNIDADE	 INTEGER,                    ' + chr(13) +
  '  CD_PROVINCIA	 INTEGER,                  ' + chr(13) +
  '  CD_MUNICIPIO	 INTEGER,                  ' + chr(13) +
  '  VL_MESANO	 VARCHAR(8),                 ' + chr(13) +
  '  VL_ACONSELHADOS	 INTEGER,              ' + chr(13) +
  '  VL_POSITIVOS	 INTEGER,                  ' + chr(13) +
  '  VL_NEGATIVOS	 INTEGER,                  ' + chr(13) +
  '  VL_INDETERMINADOS	 INTEGER,            ' + chr(13) +
  '  ID_FAIXA_ETARIA_1	 INTEGER,            ' + chr(13) +
  '  FL_SEXO	 CHAR(1),                      ' + chr(13) +
  '  FL_GESTANTE	 INTEGER,                  ' + chr(13) +
  '  VL_X_1	 INTEGER,                        ' + chr(13) +
  '  VL_Y_1	 INTEGER,                        ' + chr(13) +
  '  VL_FEMININO_2 INTEGER,                  ' + chr(13) +
  '  VL_MASCULINO_2 INTEGER,                 ' + chr(13) +
  '  ID_FAIXA_ETARIA_2 INTEGER,              ' + chr(13) +
  '  VL_X_2	 INTEGER,                        ' + chr(13) +
  '  VL_Y_2	 INTEGER,                        ' + chr(13) +
  '  VL_GESTANTE_3 INTEGER,                  ' + chr(13) +
  '  VL_POS_PARTO_3 INTEGER,                 ' + chr(13) +
  '  VL_PARTOS_3 INTEGER,                    ' + chr(13) +
  '  VL_X_3	 INTEGER,                        ' + chr(13) +
  '  VL_Y_3	 INTEGER,                        ' + chr(13) +
  '  VL_REGISTRAD0S_4 INTEGER,               ' + chr(13) +
  '  VL_TARV_4 INTEGER,                      ' + chr(13) +
  '  VL_X_4	 INTEGER,                        ' + chr(13) +
  '  VL_Y_4	 INTEGER,                        ' + chr(13) +
  '  VL_REGISTRADOS_51 INTEGER,              ' + chr(13) +
  '  VL_TARV_51 INTEGER,                     ' + chr(13) +
  '  VL_X_51	 INTEGER,                      ' + chr(13) +
  '  VL_Y_51	 INTEGER,                      ' + chr(13) +
  '  ID_FAIXA_ETARIA_52 INTEGER,             ' + chr(13) +
  '  VL_FEMININO_52 INTEGER,                 ' + chr(13) +
  '  VL_MASCULINO_52 INTEGER,                ' + chr(13) +
  '  VL_X_52	 INTEGER,                      ' + chr(13) +
  '  VL_Y_52	 INTEGER,                      ' + chr(13) +
  '  VL_NR1_53 INTEGER,                      ' + chr(13) +
  '  VL_NR2_53 INTEGER,                     ' + chr(13) +
  '  VL_X_53	 INTEGER,                      ' + chr(13) +
  '  VL_Y_53	 INTEGER,                      ' + chr(13) +
  '  VL_FEMININO_54 INTEGER,                 ' + chr(13) +
  '  VL_MASCULINO_54 INTEGER,                ' + chr(13) +
  '  VL_X_54	 INTEGER,                      ' + chr(13) +
  '  VL_Y_54	 INTEGER,                      ' + chr(13) +
  '  VL_FEMININO_6 INTEGER,                  ' + chr(13) +
  '  VL_MASCULINO_6 INTEGER,                 ' + chr(13) +
  '  VL_X_6	 INTEGER,                        ' + chr(13) +
  '  VL_Y_6	 INTEGER,                        ' + chr(13) +
  '  PRIMARY KEY (CD_REGISTRO_PROGRAMA))';

  cvCreateTableGENTABELA =
  ' create table VINC_GEN_TABELA(                  ' + chr(13) +
  ' NM_GENERATOR VARCHAR(50) NOT NULL PRIMARY KEY, ' + chr(13) +
  ' NM_TABELA VARCHAR(50),                         ' + chr(13) +
  ' NM_COLUNA VARCHAR(50))                         ';

  cvCreateTableTMP_META =
  ' create table TMP_META(Ordem integer not null,  ' + chr(13) +
  ' Acao varchar(30), Instrucao varchar(500),      ' + chr(13) +
  ' Tabela varchar(100), flex char(1))';

  cvCreateTableREGISTRO_COINFECCAO =
  ' CREATE TABLE REGISTRO_COINFECCAO             ' + chr(13) +
  ' (                                            ' + chr(13) +
  ' CD_REGISTRO_COINFECCAO	 INTEGER NOT NULL,   ' + chr(13) +
  ' CD_UND	 INTEGER NOT NULL,                   ' + chr(13) +
  ' DT_REGISTRO	 TIMESTAMP NOT NULL,             ' + chr(13) +
  ' CD_UNIDADE	 INTEGER NOT NULL,               ' + chr(13) +
  ' CD_PROVINCIA	 INTEGER NOT NULL,             ' + chr(13) +
  ' CD_MUNICIPIO	 INTEGER NOT NULL,             ' + chr(13) +
  ' VL_MESANO	 VARCHAR(8) NOT NULL,              ' + chr(13) +
  ' VL_VIH_POSITIVOS	 INTEGER,                  ' + chr(13) +
  ' VL_TRATAMENTO_ARVS	 INTEGER,                ' + chr(13) +
  ' ID_FAIXA_ETARIA	 INTEGER,                    ' + chr(13) +
  ' FL_SEXO	 CHAR(1),                            ' + chr(13) +
  ' FL_GESTANTE	 INTEGER,                        ' + chr(13) +
  ' VL_X	 INTEGER,                              ' + chr(13) +
  ' VL_Y	 INTEGER,                              ' + chr(13) +
  ' CONSTRAINT REGISTRO_COINFECCAO_PK PRIMARY KEY' + chr(13) +
  ' (CD_REGISTRO_COINFECCAO, CD_UND))';

  cvCreateTableREGISTRO_TARV_ESQUEMA =
  ' CREATE TABLE REGISTRO_TARV_ESQUEMA           ' + chr(13) +
  ' (                                              ' + chr(13) +
  ' CD_REGISTRO_TARV_ESQUEMA	 INTEGER NOT NULL, ' + chr(13) +
  ' CD_UND	 INTEGER NOT NULL,                   ' + chr(13) +
  ' DT_REGISTRO	 TIMESTAMP NOT NULL,             ' + chr(13) +
  ' CD_UNIDADE	 INTEGER NOT NULL,               ' + chr(13) +
  ' CD_PROVINCIA	 INTEGER NOT NULL,             ' + chr(13) +
  ' CD_MUNICIPIO	 INTEGER NOT NULL,             ' + chr(13) +
  ' VL_MESANO	 VARCHAR(8) NOT NULL,              ' + chr(13) +
  ' VL_ANTERIOR_CRIANCA	 INTEGER,                ' + chr(13) +
  ' VL_ANTERIOR_ADULTO	 INTEGER,                ' + chr(13) +
  ' VL_CORRENTE_CRIANCA	 INTEGER,                ' + chr(13) +
  ' VL_CORRENTE_ADULTO	 INTEGER,                ' + chr(13) +
  ' VL_ESQUEMA	 VARCHAR(20),                    ' + chr(13) +
  ' VL_X	 INTEGER,                              ' + chr(13) +
  ' VL_Y	 INTEGER,                              ' + chr(13) +
  ' CONSTRAINT REGISTRO_TARV_ESQUEMA_PK PRIMARY KEY' + chr(13) +
  ' (CD_REGISTRO_TARV_ESQUEMA, CD_UND))';

  cvCreateTableATENDIMENTO =
  ' CREATE TABLE ATENDIMENTO                     ' + chr(13) +
  ' (CD_ATENDIMENTO INTEGER NOT NULL,            ' + chr(13) +
  ' CD_UND INTEGER,                              ' + chr(13) +
  ' CD_MEDICO INTEGER,                           ' + chr(13) +
  ' DT_ATENDIMENTO TIMESTAMP,                    ' + chr(13) +
  ' TP_PERIODO INTEGER,                          ' + chr(13) +
  ' CONSTRAINT ATENDIMENTO_PK PRIMARY KEY (CD_ATENDIMENTO, CD_UND))';

  cvCreateTableTESTESPOSITIVOS =
  ' CREATE TABLE "REGISTRO_TESTES_POSITIVOS"                  ' + chr(13) +
  ' (                                                         ' + chr(13) +
  ' "CD_REGISTRO_TESTES_POSITIVOS"	 INTEGER NOT NULL,        ' + chr(13) +
  '  "CD_UND"	 INTEGER NOT NULL,                              ' + chr(13) +
  '  "DT_REGISTRO"	 TIMESTAMP NOT NULL,                      ' + chr(13) +
  '  "CD_UNIDADE"	 INTEGER NOT NULL,                          ' + chr(13) +
  '  "CD_PROVINCIA"	 INTEGER NOT NULL,                        ' + chr(13) +
  '  "CD_MUNICIPIO"	 INTEGER NOT NULL,                        ' + chr(13) +
  '  "VL_MESANO"	 VARCHAR(8) NOT NULL,                       ' + chr(13) +
  '  "VL_MASCULINO"	 INTEGER,                                 ' + chr(13) +
  '  "VL_FEMININO"	 INTEGER,                                 ' + chr(13) +
  '  "VL_NAO_INFORMADO"	 INTEGER,                             ' + chr(13) +
  '  "ID_FAIXA_ETARIA"	 INTEGER,                             ' + chr(13) +
  '  "VL_X"	 INTEGER,                                         ' + chr(13) +
  '  "VL_Y"	 INTEGER,                                         ' + chr(13) +
  '  "DT_EXP"	 TIMESTAMP,                                     ' + chr(13) +
  '  "CD_EDI"	 INTEGER,                                       ' + chr(13) +
  ' CONSTRAINT "REGISTRO_TESTES_POSITIVOS_PK" PRIMARY KEY ("CD_REGISTRO_TESTES_POSITIVOS", "CD_UND") ' + chr(13) +
  ' )';

  cvDropTableESQUEMA =
  ' DROP TABLE ESQUEMA';

  cvCreateTableESQUEMA =
  ' CREATE TABLE ESQUEMA                                      ' + chr(13) +
  ' (                                                         ' + chr(13) +
  '   CD_ESQUEMA INTEGER,                                     ' + chr(13) +
  '   DS_NOME_MEDICAMENTO VARCHAR(100),                       ' + chr(13) +
  '   DS_SIGLA VARCHAR(50),                                   ' + chr(13) +
  '   DS_APRESENTACAO VARCHAR(50),                            ' + chr(13) +
  '   DS_NOME_COMERCIAL VARCHAR(100),                         ' + chr(13) +
  '   CD_UND	 INTEGER,                                       ' + chr(13) +
  '   DT_EXP	 TIMESTAMP,                                     ' + chr(13) +
  '   CD_EDI	 INTEGER,                                       ' + chr(13) +
  '   CONSTRAINT ESQUEMA_PK PRIMARY KEY (CD_ESQUEMA)          ' + chr(13) +
  ' )';

  cvCreateTableREGISTRO_TARV_ACOMP =
  ' CREATE TABLE "REGISTRO_TARV_ACOMP"                        ' + chr(13) +
  ' (                                                         ' + chr(13) +
  '   "CD_REGISTRO_TARV_ACOMP"	 INTEGER NOT NULL,            ' + chr(13) +
  '   "CD_UND"	 INTEGER NOT NULL,                            ' + chr(13) +
  '   "DT_REGISTRO"	 TIMESTAMP NOT NULL,                      ' + chr(13) +
  '   "CD_UNIDADE"	 INTEGER NOT NULL,                        ' + chr(13) +
  '   "CD_PROVINCIA"	 INTEGER NOT NULL,                      ' + chr(13) +
  '   "CD_MUNICIPIO"	 INTEGER NOT NULL,                      ' + chr(13) +
  '   "VL_MESANO"	 VARCHAR(8) NOT NULL,                       ' + chr(13) +
  '   "VL_ACUMULADOS"	 INTEGER,                               ' + chr(13) +
  '   "VL_NOVOS"	 INTEGER,                                   ' + chr(13) +
  '   "VL_TRANSFERIDOS"	 INTEGER,                             ' + chr(13) +
  '   "VL_ABANDONOS"	 INTEGER,                               ' + chr(13) +
  '   "VL_TRANSFERIDOS_PARA"	 INTEGER,                       ' + chr(13) +
  '   "VL_OBITOS"	 INTEGER,                                   ' + chr(13) +
  '   "ID_FAIXA_ETARIA"	 INTEGER,                             ' + chr(13) +
  '   "FL_SEXO"	 CHAR(1),                                     ' + chr(13) +
  '   "FL_GESTANTE"	 INTEGER,                                 ' + chr(13) +
  '   "VL_X"	 INTEGER,                                       ' + chr(13) +
  '   "VL_Y"	 INTEGER,                                       ' + chr(13) +
  '   "DT_EXP"	 TIMESTAMP,                                   ' + chr(13) +
  '   "CD_EDI"	 INTEGER,                                     ' + chr(13) +
  ' CONSTRAINT "REGISTRO_TARV_ACOMP_PK" PRIMARY KEY ("CD_REGISTRO_TARV_ACOMP", "CD_UND") ' + chr(13) +
  ' )';

  cvCreateTableREGISTRO_TARV_CD4 =
  '  CREATE TABLE "REGISTRO_TARV_CD4"                         ' + chr(13) +
  '(                                                          ' + chr(13) +
  '  "CD_REGISTRO_TARV_CD4"	 INTEGER NOT NULL,                ' + chr(13) +
  '  "CD_UND"	 INTEGER NOT NULL,                              ' + chr(13) +
  '  "DT_REGISTRO"	 TIMESTAMP NOT NULL,                      ' + chr(13) +
  '  "CD_UNIDADE"	 INTEGER NOT NULL,                          ' + chr(13) +
  '  "CD_PROVINCIA"	 INTEGER NOT NULL,                        ' + chr(13) +
  '  "CD_MUNICIPIO"	 INTEGER NOT NULL,                        ' + chr(13) +
  '  "VL_MESANO"	 VARCHAR(8) NOT NULL,                       ' + chr(13) +
  '  "VL_CD4_MENOR_350"	 INTEGER,                             ' + chr(13) +
  '  "VL_CD4_MAIOR_350"	 INTEGER,                             ' + chr(13) +
  '  "VL_ESTADO_CLINICO_1"	 INTEGER,                         ' + chr(13) +
  '  "VL_ESTADO_CLINICO_2"	 INTEGER,                         ' + chr(13) +
  '  "VL_ESTADO_CLINICO_3"	 INTEGER,                         ' + chr(13) +
  '  "VL_ESTADO_CLINICO_4"	 INTEGER,                         ' + chr(13) +
  '  "ID_FAIXA_ETARIA"	 INTEGER,                             ' + chr(13) +
  '  "FL_SEXO"	 CHAR(1),                                     ' + chr(13) +
  '  "FL_GESTANTE"	 INTEGER,                                 ' + chr(13) +
  '  "VL_X"	 INTEGER,                                         ' + chr(13) +
  '  "VL_Y"	 INTEGER,                                         ' + chr(13) +
  '  "DT_EXP"	 TIMESTAMP,                                     ' + chr(13) +
  '  "CD_EDI"	 INTEGER,                                       ' + chr(13) +
  'CONSTRAINT "REGISTRO_TARV_CD4_PK" PRIMARY KEY ("CD_REGISTRO_TARV_CD4", "CD_UND")' + chr(13) +
  ')';


  //Generator
  cvCreateGeneratorTARV = 'CREATE GENERATOR GEN_REGISTRO_TARV';
  cvCreateGeneratorPTV  = 'CREATE GENERATOR GEN_REGISTRO_PTV';
  cvCreateGeneratorINVESTIGADOR  = 'CREATE GENERATOR GEN_INVESTIGADOR';
  cvCreateGeneratorCARACTERIZACAO = 'CREATE GENERATOR GEN_CARACTERIZACAO';
  cvCreateGeneratorCODIGOUTENTE = 'CREATE GENERATOR GEN_CARACTERIZACAO_CD_UTENTE';
  cvCreateGeneratorREGISTRO_PROGRMA = 'CREATE GENERATOR GEN_REGISTRO_PROGRAMA';
  cvCreateGeneratorEDI = 'CREATE GENERATOR GEN_EDI';
  cvCreateGeneratorGEN_REGISTRO_COINFECCAO = 'CREATE GENERATOR GEN_REGISTRO_COINFECCAO';
  cvCreateGeneratorGEN_REGISTRO_TARV_ESQUEMA = 'CREATE GENERATOR GEN_REGISTRO_TARV_ESQUEMA';
  cvCreateGeneratorGEM_ATENDIMENTO = 'CREATE GENERATOR GEN_ATENDIMENTO';
  cvCreateGeneratorGEM_TESTES_POSITIVOS = 'CREATE GENERATOR GEN_REGISTRO_TESTES_POSITIVOS';
  cvCreateGeneratorGEM_ESQUEMA = 'CREATE GENERATOR GEN_ESQUEMA';
  cvCreateGeneratorGEM_REGISTRO_TARV_ACOMP = 'CREATE GENERATOR GEN_REGISTRO_TARV_ACOMP';
  cvCreateGeneratorGEN_REGISTRO_TARV_CD4 = 'CREATE GENERATOR GEN_REGISTRO_TARV_CD4';
  cvCreateGeneratorREGISTROGERAL = 'CREATE GENERATOR GEN_REGISTRO_GERAL';

  cvAlterGeneratorGEN_REGISTRO_ATV = 'SET GENERATOR GEN_REGISTRO_ATV TO %s';

//Alter Table
  cvAlterTableMEDICO = 'ALTER TABLE MEDICO ADD NR_TELEFONE VARCHAR(20)';
  cvAlterTableNOTIFICACAO = 'ALTER TABLE NOTIFICACAO ADD CD_INVESTIGADOR INTEGER';
  cvAlterTableREGISTRO_PROGRAMA1 = 'ALTER TABLE REGISTRO_PROGRAMA ADD VL_ESQUEMA1_53 VARCHAR(20)';
  cvAlterTableREGISTRO_PROGRAMA2 = 'ALTER TABLE REGISTRO_PROGRAMA ADD VL_ESQUEMA2_53 VARCHAR(20)';
  cvAlterTableREGISTRO_PROGRAMA3 = 'ALTER TABLE REGISTRO_PROGRAMA ADD ID_FAIXA_ETARIA_3 INTEGER';
  cvAlterTableNOTIFICACAO1 = 'ALTER TABLE NOTIFICACAO ADD DT_TESTE_TRIAGEM TIMESTAMP';
  cvAlterTableNOTIFICACAO2 = 'ALTER TABLE NOTIFICACAO ADD DT_TESTE_CONFIRMATORIO TIMESTAMP';
  cvAlterTableNOTIFICACAO3 = 'ALTER TABLE NOTIFICACAO ADD NR_PROCESSO_UTENTE VARCHAR(30)';
  cvAlterTableDtExp = 'ALTER TABLE %s ADD DT_EXP TIMESTAMP';
  cvAlterTableCdEdi = 'ALTER TABLE %s ADD CD_EDI INTEGER';
  cvAlterTableCdUnd1 = 'ALTER TABLE %s ADD CD_UND INTEGER NOT NULL';
  cvAlterTableCdUnd2 = 'ALTER TABLE %s ALTER COLUMN CD_UND POSITION 2';
  cvAlterTableCdUnd3 = 'ALTER TABLE %s DROP CD_UND';
  cvAlterTableConst1 = 'ALTER TABLE %s DROP CONSTRAINT %s';

  cvAlterTableDASH1 = 'ALTER TABLE DASHBOARD ADD TP_DASHBOARD INTEGER';
  cvAlterTableDASH2 = 'ALTER TABLE DASHBOARD ADD TP_TABELA CHAR(1)';

  cvAlterTableAGENDA1 = 'ALTER TABLE AGENDA DROP CD_FICHA';
  cvAlterTableAGENDA2 = 'ALTER TABLE AGENDA DROP CD_UNIDADE_NOTIFICACAO';
  cvAlterTableAGENDA3 = 'ALTER TABLE AGENDA DROP CD_PROVINCIA_PACIENTE';
  cvAlterTableAGENDA4 = 'ALTER TABLE AGENDA DROP CD_MUNICIPIO_PACIENTE';
  cvAlterTableAGENDA5 = 'ALTER TABLE AGENDA ADD DS_ESQUEMA VARCHAR(30)';

  cvAlterTablePACIENTE  = 'ALTER TABLE PACIENTE ADD NR_PROCESSO INTEGER';
  cvAlterTablePACIENTE2 = 'ALTER TABLE PACIENTE ADD FL_LAB CHAR(1)';
  cvAlterTablePACIENTE3 = 'ALTER TABLE PACIENTE ADD CD_UNIDADE INTEGER';

  cvAlterTableUNIDADE = 'ALTER TABLE UNIDADE ADD CD_PROVINCIA INTEGER';
  cvAlterTableUNIDADE2 = 'ALTER TABLE UNIDADE ADD CD_MUNICIPIO INTEGER';
  cvAlterTableCARACTERIZACAO = 'ALTER TABLE CARACTERIZACAO ADD CD_PACIENTE INTEGER';

  cvAlterTableAGENDA7 = 'ALTER TABLE AGENDA ADD FL_ESQUEMA INTEGER';

  cvAlterTablePARAMETRO = 'ALTER TABLE PARAMETRO ALTER COLUMN VALOR TYPE VARCHAR(200)';

//Create Index
  cvCreateIndexDtExp = 'CREATE INDEX %s_EXP_IX ON %s(DT_EXP)';

//Insert Table
  cvInsertTableINVESTIGADOR =
      'INSERT INTO INVESTIGADOR                   ' + chr(13) +
      ' (CD_INVESTIGADOR,                         ' + chr(13) +
      '  NM_INVESTIGADOR,                         ' + chr(13) +
      '  NM_FUNCAO,                               ' + chr(13) +
      '  NR_TELEFONE)                             ' + chr(13) +
      '  select                                   ' + chr(13) +
      '   GEN_ID(GEN_INVESTIGADOR,1),             ' + chr(13) +
      '   b.NM_ENTREVISTADOR,                     ' + chr(13) +
      '   b.FUNCAO_ENTREVISTADOR,                 ' + chr(13) +
      '   b.TEL_ENTREVISTADOR                     ' + chr(13) +
      '  from                                     ' + chr(13) +
      '   (SELECT distinct                        ' + chr(13) +
      '    NM_ENTREVISTADOR,                      ' + chr(13) +
      '    FUNCAO_ENTREVISTADOR,                  ' + chr(13) +
      '    TEL_ENTREVISTADOR                      ' + chr(13) +
      '    from NOTIFICACAO) b';

  cvInserTableSCRIPT =
      'INSERT INTO  SCRIPT                        ' + chr(13) +
      ' (CD_SCRIPT, %s DT_SCRIPT)                    ' + chr(13) +
      ' VALUES(:CD_SCRIPT, %s CAST(''NOW'' AS DATE))';


//Create View
  cvCreateViewVWINDICES =
      'CREATE VIEW "VWINDICES" (                  ' + chr(13) +
      '   "NOME",                                 ' + chr(13) +
      '   "TABELA",                               ' + chr(13) +
      '   "CHAVE"                                 ' + chr(13) +
      ' ) AS                                      ' + chr(13) +
      ' select rdb$index_name nome,               ' + chr(13) +
      '        rdb$relation_name tabela,          ' + chr(13) +
      '        rdb$foreign_key chave              ' + chr(13) +
      ' from rdb$indices                          ';

  cvCreateViewVWTABELAS =
      'CREATE VIEW "VWTABELAS" (                  ' + chr(13) +
      '  "TABELA"                                 ' + chr(13) +
      ') AS                                       ' + chr(13) +
      'select rdb$relation_name tabela            ' + chr(13) +
      'from rdb$relations                         ' + chr(13) +
      'where rdb$flags = 1                        ' + chr(13) +
      'and (rdb$relation_type is null   or        ' + chr(13) +
      '     rdb$relation_type = 0)                ' + chr(13) +
      'order by 1                                 ';

//Select, Update
  cvSelectDadosImpUND  = 'SELECT * FROM %s WHERE CD_UNIDADE = :CD_UNIDADE ';
  cvSelectDadosDtExp  = 'SELECT * FROM %s WHERE DT_EXP IS NULL';
  cvSelectDadosImp    = 'SELECT * FROM %s WHERE CD_UND = :CD_UND AND CD_EDI = :CD_EDI';
  cvSelectDadosImpUK  = 'SELECT * FROM %s WHERE CD_UNIDADE = :CD_UNIDADE '+
                        ' AND CD_PROVINCIA = :CD_PROVINCIA ' +
                        ' AND CD_MUNICIPIO = :CD_MUNICIPIO ' +
                        ' AND VL_MESANO = :VL_MESANO ';

  cvSelectDadosGenTabela = 'SELECT * FROM VINC_GEN_TABELA WHERE NM_TABELA = :NM_TABELA';
  cvUpdateDadosDtExp  = 'UPDATE %s SET DT_EXP = CAST(''NOW'' AS TIMESTAMP) WHERE DT_EXP IS NULL';
  cvUpdateDadosDtExp2 = 'UPDATE %s SET DT_EXP = NULL';
  cvUpdateDadosUnd = 'UPDATE %s SET CD_UND = %s';
  cvUpdateDadosVersao = 'UPDATE PARAMETRO SET VALOR = ''%s'' WHERE CD_PARAMETRO = 2';
  cvInsertDadosVersao = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(2,%s,''Versao do Sistema'',''2.0.2-0'')';

  cvSelectDadosConstraintsFields =
        'select TRIM(RDB$CONSTRAINT_NAME) NOME,       ' + chr(13) +
        '  RDB$CONSTRAINT_TYPE TIPO,                  ' + chr(13) +
        '  TRIM(RDB$RELATION_NAME) TABELA,            ' + chr(13) +
        '  RDB$FIELD_NAME CAMPO                       ' + chr(13) +
        '  from rdb$relation_constraints c,           ' + chr(13) +
        '       rdb$index_segments i                  ' + chr(13) +
        'where c.rdb$index_name = i.rdb$index_name    ' + chr(13) +
        'AND RDB$CONSTRAINT_TYPE = :TIPO              ' + chr(13) +
        'AND RDB$RELATION_NAME = :TABELA';
  cvSelectDadosRelations =
        'select TRIM(RDB$CONSTRAINT_NAME)  NOME,      ' + chr(13) +
        '       TRIM(RDB$RELATION_NAME) TABELA        ' + chr(13) +
        'from rdb$relation_constraints                ' + chr(13) +
        'where RDB$CONSTRAINT_TYPE = :TIPO            ' + chr(13) +
        'and   RDB$RELATION_NAME = :TABELA';
  cvSelectDadosConstraintsFieldsFK =
        'select FK.rdb$constraint_name   NOME_FK,     ' + chr(13) +
        '     REL1.rdb$relation_name   TABELA_FK,     ' + chr(13) +
        '     REL2.rdb$relation_name   TABELA_RF,     ' + chr(13) +
        '       IX1.rdb$field_name      CAMPO_FK,     ' + chr(13) +
        '       IX2.rdb$field_name      CAMPO_RF      ' + chr(13) +
        'from                                         ' + chr(13) +
        '  rdb$ref_constraints FK,                    ' + chr(13) +
        '  rdb$relation_constraints REL1,             ' + chr(13) +
        '  rdb$relation_constraints REL2,             ' + chr(13) +
        '  rdb$index_segments IX1,                    ' + chr(13) +
        '  rdb$index_segments IX2                     ' + chr(13) +
        'where FK.rdb$constraint_name = :NOME_FK      ' + chr(13) +
        'and   REL1.rdb$constraint_name = FK.rdb$constraint_name  ' + chr(13) +
        'and   REL2.rdb$constraint_name = FK.rdb$const_name_uq    ' + chr(13) +
        'and   IX1.rdb$index_name = REL1.rdb$index_name           ' + chr(13) +
        'and   IX2.rdb$index_name = REL2.rdb$index_name           ' + chr(13) +
        'and   IX1.rdb$field_position = IX2.rdb$field_position    ' + chr(13) +
        'order by IX1.rdb$field_position, IX2.rdb$field_position';

  cvAlterTableAGENDA6 =
        'alter table agenda               ' + chr(13) +
        'add fl_confirmado integer,       ' + chr(13) +
        'add fl_transferido integer       ';

  cvDeletePACIENTE =
        'delete from paciente p                          ' + chr(13) +
        'where exists(select 1 from agenda a             ' + chr(13) +
        '  where a.dt_agenda <=  :DATA                   ' + chr(13) +
        '    and a.cd_paciente = p.cd_Paciente           ' + chr(13) +
        '    and not exists(                             ' + chr(13) +
        '         select n.cd_paciente                   ' + chr(13) +
        '           from notificacao n                   ' + chr(13) +
        '          where n.cd_paciente = p.cd_Paciente)) ';

  cvDeleteAGENDA =
        'delete from agenda a                      ' + chr(13) +
        'where a.dt_agenda <= :DATA                ' + chr(13) +
        'and not exists(                           ' + chr(13) +
        '  select cd_paciente                      ' + chr(13) +
        '  from notificacao                        ' + chr(13) +
        '  where cd_paciente = a.cd_Paciente)      ';

  cvUpdateCaracterizacao2=
        'update caracterizacao set FL_TESTE_HOJE = 100 where FL_TESTE_HOJE = 1';
  cvUpdateCaracterizacao3=
        'update caracterizacao set FL_TESTE_HOJE = 1  where FL_TESTE_HOJE = 2';
  cvUpdateCaracterizacao4=
        'update caracterizacao set FL_TESTE_HOJE = 2 where FL_TESTE_HOJE = 100';
  cvUpdatePaciente = 'update paciente set CD_UNIDADE = CD_UND';

  cvInsertParametro3 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(3,%s,''Data Maxima Agenda'',''31/12/2013'')';

  cvInsertParametro4 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(4,%s,''Bloquia Maximo Atendimento Agenda'',''S'')';

  cvInsertParametro5 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(5,%s,''Documento modelo Padrao'',''8'')';

  cvInsertParametro6 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(6,%s,''Grupo Padrão Parecer'',''1'')';

  cvInsertParametro7 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(12,%s,''Medico Padrao Agenda'',''20'')';

  cvInsertParametro8 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(13,%s,''Lista Medicos que nao transferem'',''10,20,46'')';

  cvInsertParametro9 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(14,%s,''Medico Integra LAB'',''20'')';

  cvInsertParametro10 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(16,%s,''Grupo Fomulario 1'',''2'')';

  cvInsertParametro11 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(17,%s,''Grupo Fomulario 2'',''2'')';

  cvInsertParametro12 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(18,%s,''Grupo Fomulario 3'',''2'')';

  cvInsertParametro13 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(19,%s,''Grupo Fomulario 4'',''2'')';

  cvInsertParametro14 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(20,%s,''URL RX'',''http:\\127.0.0.1\id='')';

  cvInsertParametro15 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(21,%s,''Grupo Exames'',''2'')';

  cvInsertParametro16 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(22,%s,''Sigla Empresa'',''HE'')';

  cvInsertParametro17 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(23,%s,''Tabela Resp. Laboratorio'',''0'')';

  cvInsertParametro18 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(24,%s,''Último Processo Criado'',''0'')';

  cvInsertParametro19 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(27,%s,''Parametro Unidade Central'',''31'')';

  cvAlterTableAgenda8  = 'alter table AGENDA add dt_confirmacao timestamp';
  cvAlterTableAgenda9  = 'alter table AGENDA add fl_parecer integer';
  cvAlterTableAgenda10 = 'alter table AGENDA add fl_lab char(1)';
  cvAlterTableAgenda11 = 'alter table agenda add nr_lab integer';

  cvCreateTableVINC_USUARIO_MEDICO =
    ' CREATE TABLE VINC_USUARIO_MEDICO( '+
    ' CD_USUARIO INTEGER NOT NULL, '+
    ' CD_MEDICO INTEGER NOT NULL, '+
    ' PRIMARY KEY(CD_USUARIO, CD_MEDICO)) ';

  cvAlterTableMedico2 = 'alter table medico ' +
                        ' add fl_ativo integer,' +
                        ' add dt_ativo timestamp';

  cvAlterTableMedico3 = 'alter table medico add ' +
                        ' nr_atendimento integer';


  cvCreateTablePROCESSO =
    'CREATE TABLE "PROCESSO" '+
    '(  '+
    '  "NR_PROCESSO"	 INTEGER NOT NULL,'+
    '  "FL_DIGITAL"	 INTEGER,'+
    'CONSTRAINT "PROCESSO_PK" PRIMARY KEY ("NR_PROCESSO")'+
    ')' ;


  cvCreateTableEXAMES =
' CREATE TABLE "EXAMES"'+
' ('+
'  "CD_EXAMES"	 INTEGER NOT NULL,'+
'  "CD_UND"	 INTEGER NOT NULL,'+
'  "DS_EXAMES"	 VARCHAR(50) NOT NULL,'+
'  "DT_EXP"	 TIMESTAMP,'+
'  "CD_EDI"	 INTEGER,'+
'  "CD_USU_INCLUSAO"	 INTEGER,'+
'  "DT_INCLUSAO"	 TIMESTAMP,'+
'  "CD_USU_ALTERACAO"	 INTEGER,'+
'  "DT_ALTERACAO"	 TIMESTAMP,'+
' CONSTRAINT "EXAMES_PK" PRIMARY KEY ("CD_EXAMES", "DS_EXAMES", "CD_UND")'+
' )';

   cvCreateTableEXAMES_AGENDA =
' CREATE TABLE "EXAMES_AGENDA"'+
' ('+
'  "CD_EXAMES"	 INTEGER NOT NULL,'+
'  "CD_UND"	 INTEGER NOT NULL,'+
'  "CD_AGENDA"	 INTEGER NOT NULL,'+
'  "DT_EXP"	 TIMESTAMP,'+
'  "CD_EDI"	 INTEGER,'+
'  "CD_USU_INCLUSAO"	 INTEGER,'+
'  "DT_INCLUSAO"	 TIMESTAMP,'+
'  "CD_USU_ALTERACAO"	 INTEGER,'+
'  "DT_ALTERACAO"	 TIMESTAMP,'+
' CONSTRAINT "EXAMES_AGENDA_PK" PRIMARY KEY ("CD_EXAMES", "CD_UND", "CD_AGENDA")'+
' )';


  cvAlterTablePaciente10 = 'alter table medico add ' +
                        ' nr_atendimento integer';

  //14
  cvCreateTableAVALIACAO_INICIAL =
  ' CREATE TABLE "AVALIACAO_INICIAL" '+
  '('+
  '  "CD_AVALIACAO_INICIAL"	 INTEGER NOT NULL,'+
  '  "CD_PACIENTE"	 INTEGER,'+
  '  "FL_MOTIVO"	 CHAR(1),'+
  '  "DT_DIAGNOSTICO"	 DATE,'+
  '  "NR_FILHO"	 INTEGER,'+
  '  "FL_TESTE"	 CHAR(1),'+
  '  "FL_PARCEIRO_TESTE"	 CHAR(1),'+
  '  "TX_RESULTADO"	 VARCHAR(50),'+
  '  "FL_MAIS_PARCEIRO"	 CHAR(1),'+
  '  "FL_GRAVIDA"	 CHAR(1),'+
  '  "TX_SINAIS_VITAIS1"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS2"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS3"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS4"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS5"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS6"	 VARCHAR(20),'+
  '  "FL_SINAIS_PALUDISMO"	 CHAR(1),'+
  '  "FL_SINAIS_TUBERCULOSE"	 CHAR(1),'+
  '  "FL_DIAG_PALUDISMO"	 CHAR(1),'+
  '  "FL_DIAG_TUBERCULOSE"	 CHAR(1),'+
  '  "TX_SINAIS_CONDUTA"	 VARCHAR(200),'+
  '  "FL_QUADRO_OMS1"	 CHAR(1),'+
  '  "FL_QUADRO_OMS2"	 CHAR(1),'+
  '  "FL_QUADRO_OMS3"	 CHAR(1),'+
  '  "FL_QUADRO_OMS4"	 CHAR(1),'+
  '  "FL_QUADRO_OMS5"	 CHAR(1),'+
  '  "FL_QUADRO_OMS6"	 CHAR(1),'+
  '  "FL_QUADRO_OMS7"	 CHAR(1),'+
  '  "FL_QUADRO_OMS8"	 CHAR(1),'+
  '  "FL_QUADRO_OMS9"	 CHAR(1),'+
  '  "FL_QUADRO_OMS10"	 CHAR(1),'+
  '  "FL_QUADRO_OMS11"	 CHAR(1),'+
  '  "FL_QUADRO_OMS12"	 CHAR(1),'+
  '  "FL_QUADRO_OMS13"	 CHAR(1),'+
  '  "FL_QUADRO_OMS14"	 CHAR(1),'+
  '  "FL_QUADRO_OMS15"	 CHAR(1),'+
  '  "FL_QUADRO_OMS16"	 CHAR(1),'+
  '  "FL_QUADRO_OMS17"	 CHAR(1),'+
  '  "FL_QUADRO_OMS18"	 CHAR(1),'+
  '  "FL_QUADRO_OMS19"	 CHAR(1),'+
  '  "FL_QUADRO_OMS20"	 CHAR(1),'+
  '  "FL_QUADRO_OMS21"	 CHAR(1),'+
  '  "FL_QUADRO_OMS22"	 CHAR(1),'+
  '  "FL_QUADRO_OMS23"	 CHAR(1),'+
  '  "FL_QUADRO_OMS24"	 CHAR(1),'+
  '  "FL_QUADRO_OMS25"	 CHAR(1),'+
  '  "FL_QUADRO_OMS26"	 CHAR(1),'+
  '  "FL_QUADRO_OMS27"	 CHAR(1),'+
  '  "FL_QUADRO_OMS28"	 CHAR(1),'+
  '  "FL_QUADRO_OMS29"	 CHAR(1),'+
  '  "FL_QUADRO_OMS30"	 CHAR(1),'+
  '  "FL_QUADRO_OMS31"	 CHAR(1),'+
  '  "FL_QUADRO_OMS32"	 CHAR(1),'+
  '  "FL_QUADRO_OMS33"	 CHAR(1),'+
  '  "FL_QUADRO_OMS34"	 CHAR(1),'+
  '  "FL_QUADRO_OMS35"	 CHAR(1),'+
  '  "FL_QUADRO_OMS36"	 CHAR(1),'+
  '  "FL_QUADRO_OMS37"	 CHAR(1),'+
  '  "FL_QUADRO_OMS38"	 CHAR(1),'+
  '  "FL_QUADRO_OMS39"	 CHAR(1),'+
  '  "FL_CONCLUSAO_MENOR"	 CHAR(1),'+
  '  "FL_CONCLUSAO_MAIOR"	 CHAR(1),'+
  '  "TX_CLASSIFICACAO"	 VARCHAR(10),'+
  '  "FL_CLASSIFICACAO"	 CHAR(1),   '+
  '  "TX_OUTRAS_QUEIXAS"	 VARCHAR(300),'+
  '  "TX_PRINCIPAIS_ANALISES1"	 VARCHAR(20),   '+
  '  "DT_PRINCIPAIS_ANALISES1"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES2"	 VARCHAR(20),   '+
  '  "DT_PRINCIPAIS_ANALISES2"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES3"	 VARCHAR(20),   '+
  '  "DT_PRINCIPAIS_ANALISES3"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES4"	 VARCHAR(20),   '+
  '  "DT_PRINCIPAIS_ANALISES4"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES5"	 VARCHAR(20),   '+
  '  "DT_PRINCIPAIS_ANALISES5"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES6"	 VARCHAR(20),   '+
  '  "DT_PRINCIPAIS_ANALISES6"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES7"	 VARCHAR(100),'+
  '  "FL_SEGUIMENTO_ROTINA"	 CHAR(1),   '+
  '  "FL_VAGA_ABERTA"	 CHAR(1),   '+
  '  "DT_VAGA_ABERTA"	 DATE,'+
  '  "FL_CD4_HEMOGRAMA"	 CHAR(1),   '+
  '  "TX_CD4_HEMOGRAMA"	 VARCHAR(100),'+
  '  "FL_ANALISES_ALTERADAS"	 CHAR(1),   '+
  '  "TX_ANALISES_ALTERADAS"	 VARCHAR(100),'+
  '  "FL_INICIO_IMEDIATO"	 CHAR(1),   '+
  '  "FL_INICIO_IMEDIATO1"	 CHAR(1), '+
  '  "FL_INICIO_IMEDIATO2"	 CHAR(1),   '+
  '  "DT_INICIO_IMEDIATO"	 DATE,'+
  '  "FL_SINTOMAS_GRAVES"	 CHAR(1),   '+
  '  "TX_SINTOMAS_GRAVES"	 VARCHAR(100),'+
  '  "FL_INICIO_IMEDIATO3"	 CHAR(1),   '+
  '  "TX_INICIO_IMEDIATO3"	 VARCHAR(100),'+
  '  "FL_INICIO_IMEDIATO4"	 CHAR(1),   '+
  '  "DT_INICIO_IMEDIATO4"	 DATE,'+
  '  "TX_INICIO_IMEDIATO4"	 VARCHAR(100),'+
  '  "FL_PUERPERA"	 CHAR(1),   '+
  '  "TX_ESQUEMA_EM_USO"	 VARCHAR(50),'+
  '  "DT_INICIO_ARV"	 DATE,'+
  '  "DT_PARTO"	 DATE,'+
  '  "FL_PROFILAXIA"	 CHAR(1),   '+
  '  "FL_TRATAMENTO_ARV"	 CHAR(1), '+
  '  "FL_PROFILAXIA_CONDUTA"	 CHAR(1),   '+
  '  "FL_ALEITAMENTO_ARTIFICIAL"	 CHAR(1), '+
  '  "FL_ALEITAMENTO_MATERNO"	 CHAR(1),   '+
  '  "FL_TRATAMENTO_ARV2"	 CHAR(1),   '+
  '  "FL_SINTOMAS_GRAVES2"	 CHAR(1), '+
  '  "TX_SINTOMAS_GRAVES2"	 VARCHAR(100),'+
  '  "DT_PUERPERA_RETORNO"	 DATE,'+
  '  "FL_CRIANCA_EXPOSTA"	 CHAR(1),   '+
  '  "DT_CRIANCA_EXPOSTA"	 DATE,'+
  '  "FL_SEGUIMENTO"	 CHAR(1),   '+
  '  "TX_SEGUIMENTO"	 VARCHAR(100),'+
  '  "FL_EM_USO_PROFILAXIA"	 CHAR(1),   '+
  '  "TX_AOTACOES_ENFERMAGEM"	 VARCHAR(300),'+
  '  "NM_MEDICO"	 VARCHAR(100),'+
  '  "NR_ORDEM"	 VARCHAR(20),'+
  '  "CD_USUARIO_CADASTRO"	 INTEGER,'+
  '  "DT_CADASTRO"	 TIMESTAMP,'+
  '  "CD_USUARIO_ALTERACAO"	 INTEGER,'+
  '  "DT_ALTERACAO"	 TIMESTAMP,'+
  '  "CD_USUARIO_EXCLUSAO"	 INTEGER,'+
  '  "DT_EXCLUSAO"	 TIMESTAMP,'+
  '  "CD_ARQUIVO"	 INTEGER,'+
  '  "CD_GRUPO"	 INTEGER,'+
  '  "CD_ARQUIVO2"	 INTEGER,'+
  ' PRIMARY KEY ("CD_AVALIACAO_INICIAL") '+
  ')';

  cvCreateIndexAVALIACAO_INICIAL =
  ' CREATE INDEX "IDX_AVALIACAO_INICIAL_1" ON "AVALIACAO_INICIAL"("CD_PACIENTE")';

  cvCreateGeneratorGEN_AVALIACAO_INICIAL = ' CREATE GENERATOR GEN_AVALIACAO_INICIAL ';

  cvCreateTableSEGUIMENTO_ENFERMAGEM =
  ' CREATE TABLE "SEGUIMENTO_ENFERMAGEM" '+
  '('+
  '  "CD_SEGUIMENTO_ENFERMAGEM"	 INTEGER NOT NULL,'+
  '  "CD_PACIENTE"	 INTEGER,'+
  '  "DT_DIAGNOSTICO"	 DATE,'+
  '  "FL_DATA_INICIO"	 CHAR(1),'+
  '  "DT_DATA_INICIO"	 DATE,'+
  '  "FL_INICIO"	 CHAR(1),'+
  '  "TX_ESQUEMA"	 VARCHAR(100),'+
  '  "TX_SINAIS_VITAIS1"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS2"	 VARCHAR(20),'+
  '  "FL_PERDA"	 CHAR(1),'+
  '  "TX_SINAIS_VITAIS3"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS4"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS5"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS6"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS7"	 VARCHAR(20),'+
  '  "FL_COMP_ULTIMA_CONSULTA"	 CHAR(1),'+
  '  "TX_COMP_ULTIMA_CONSULTA"	 VARCHAR(50),'+
  '  "FL_ANAL_ULTIMA_CONSULTA"	 CHAR(1),'+
  '  "TX_ANAL_ULTIMA_CONSULTA"	 VARCHAR(50),'+
  '  "FL_USO_COTRIMOXAZOL"	 CHAR(1),'+
  '  "FL_SINAIS_PALUDISMO"	 CHAR(1),'+
  '  "FL_SINAIS_TUBERCULOSE"	 CHAR(1),'+
  '  "FL_DIAG_PALUDISMO"	 CHAR(1),'+
  '  "FL_DIAG_TUBERCULOSE"	 CHAR(1),'+
  '  "FL_TRAT_TUBERCULOSE"	 CHAR(1),'+
  '  "TX_TRAT_TUBERCULOSE"	 VARCHAR(100),'+
  '  "TX_OUTRAS_QUEIXAS"	 VARCHAR(500),'+
  '  "TX_PRINCIPAIS_ANALISES1"	 VARCHAR(20),'+
  '  "DT_PRINCIPAIS_ANALISES1"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES2"	 VARCHAR(20),'+
  '  "DT_PRINCIPAIS_ANALISES2"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES3"	 VARCHAR(20),'+
  '  "DT_PRINCIPAIS_ANALISES3"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES4"	 VARCHAR(20),'+
  '  "DT_PRINCIPAIS_ANALISES4"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES5"	 VARCHAR(20),'+
  '  "DT_PRINCIPAIS_ANALISES5"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES6"	 VARCHAR(20),'+
  '  "DT_PRINCIPAIS_ANALISES6"	 DATE,'+
  '  "TX_PRINCIPAIS_ANALISES7"	 VARCHAR(20),'+
  '  "TX_PRINCIPAIS_ANALISES8"	 VARCHAR(20),'+
  '  "TX_PRINCIPAIS_ANALISES9"	 VARCHAR(20),'+
  '  "TX_PRINCIPAIS_ANALISES10"	 VARCHAR(20),'+
  '  "TX_PRINCIPAIS_ANALISES11"	 VARCHAR(20),'+
  '  "FL_SEM_SINAIS_SINTOMAS"	 CHAR(1),'+
  '  "FL_COM_SINAIS_SINTOMAS"	 CHAR(1),'+
  '  "FL_INICIAR_TARV1"	 CHAR(1),'+
  '  "FL_INICIAR_TARV2"	 CHAR(1),'+
  '  "FL_INICIAR_PROFILAXIA1"	 CHAR(1),'+
  '  "FL_INICIAR_PROFILAXIA2"	 CHAR(1),'+
  '  "FL_TRAT_ARV_A1"	 CHAR(1),'+
  '  "FL_TRAT_ARV_A2"	 CHAR(1),'+
  '  "FL_TRAT_ARV_B1"	 CHAR(1),'+
  '  "TX_TRAT_ARV_B1_REACAO"	 VARCHAR(200),'+
  '  "TX_TRAT_ARV_B1_CONDUTA"	 VARCHAR(200),'+
  '  "FL_TRAT_ARV_B2"	 CHAR(1),'+
  '  "FL_TRAT_ARV_B3"	 CHAR(1),'+
  '  "FL_TRAT_ARV_B4"	 CHAR(1),'+
  '  "FL_TRAT_ARV_B5"	 CHAR(1),'+
  '  "FL_TRAT_ARV_B6"	 CHAR(1),'+
  '  "FL_TRAT_ARV_C1"	 CHAR(1),'+
  '  "FL_TRAT_ARV_C2"	 CHAR(1),'+
  '  "FL_TRAT_ARV_C3"	 CHAR(1),'+
  '  "FL_TRAT_ARV_C4"	 CHAR(1), '+
  '  "FL_TRAT_ARV_C5"	 CHAR(1), '+
  '  "FL_TRAT_ARV_C6"	 CHAR(1),  '+
  '  "FL_ARV"	 CHAR(1),'+
  '  "TX_ARV"	 VARCHAR(200),'+
  '  "FL_FRASCOS_ARV"	 CHAR(1),'+
  '  "TX_QUANTOS_TOMA"	 VARCHAR(200),'+
  '  "FL_SENTE_ALGO_DIFERENTE"	 CHAR(1),'+
  '  "TX_SENTE_ALGO_DIFERENTE"	 VARCHAR(200),'+
  '  "FL_ALIMENTACAO"	 CHAR(1),'+
  '  "FL_ELIMINACAO"	 CHAR(1),'+
  ' "TX_ELIMINACAO"	 VARCHAR(100),'+
  '  "FL_ACTIVIDADE"	 CHAR(1),'+
  '  "TX_ACTIVIDADE"	 VARCHAR(100),'+
  '  "FL_PELE"	 CHAR(1),'+
  '  "TX_PELE"	 VARCHAR(100),'+
  '  "FL_DUVIDAS"	 CHAR(1),'+
  '  "TX_DIVIDAS"	 VARCHAR(100),'+
  '  "NM_MEDICO"	 VARCHAR(100),'+
  '  "NR_ORDEM"	 VARCHAR(20),'+
  '  "CD_USUARIO_CADASTRO"	 INTEGER,'+
  '  "DT_CADASTRO"	 TIMESTAMP,'+
  '  "CD_USUARIO_ALTERACAO"	 INTEGER,'+
  '  "DT_ALTERACAO"	 TIMESTAMP,'+
  '  "CD_USUARIO_EXCLUSAO"	 INTEGER,'+
  '  "DT_EXCLUSAO"	 TIMESTAMP,'+
  '  "CD_ARQUIVO"	 INTEGER,'+
  '  "CD_GRUPO"	 INTEGER,'+
  '  "CD_ARQUIVO2"	 INTEGER,'+
  ' PRIMARY KEY ("CD_SEGUIMENTO_ENFERMAGEM") '+
  ')';

  cvCreateIndexSEGUIMENTO_ENFERMAGEM =
  'CREATE INDEX "IDX_SEGUIMENTO_ENFERMAGEM_1" ON "SEGUIMENTO_ENFERMAGEM"("CD_PACIENTE")';

  cvCreateGeneratorGEN_SEGUIMENTO_ENFERMAGEM = 'CREATE GENERATOR GEN_SEGUIMENTO_ENFERMAGEM';

  cvCreateTableTRIAGEM_ENFERMAGEM =
  'CREATE TABLE "TRIAGEM_ENFERMAGEM"'+
  '('+
  '  "CD_TRIAGEM_ENFERMAGEM"	 INTEGER NOT NULL,'+
  '  "CD_PACIENTE"	 INTEGER,'+
  '  "FL_MOTIVO"	 CHAR(1),'+
  '  "TX_OUTROS"	 VARCHAR(100),'+
  '  "TX_TEMPO"	 VARCHAR(20),'+
  '  "FL_USO_ARV"	 CHAR(1),'+
  '  "FL_GESTANTE"	 CHAR(1),'+
  '  "TX_SINAIS_VITAIS1"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS2"	 VARCHAR(20),'+
  '  "FL_PERDA"	 CHAR(1),'+
  '  "TX_SINAIS_VITAIS3"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS4"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS5"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS6"	 VARCHAR(20),'+
  '  "TX_SINAIS_VITAIS7"	 VARCHAR(20),'+
  '  "FL_SINAIS_SINTOMAS1"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS2"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS3"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS4"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS5"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS6"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS7"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS8"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS9"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS10"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS11"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS12"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS13"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS14"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS15"	 CHAR(1),'+
  '  "FL_SINAIS_SINTOMAS16"	 CHAR(1),'+
  '  "TX_ANOTACOES"	 VARCHAR(600),'+
  '  "NM_MEDICO"	 VARCHAR(100),'+
  '  "NR_ORDEM"	 VARCHAR(20),'+
  '  "CD_USUARIO_CADASTRO"	 INTEGER,'+
  '  "DT_CADASTRO"	 TIMESTAMP,'+
  '  "CD_USUARIO_ALTERACAO"	 INTEGER,'+
  '  "DT_ALTERACAO"	 TIMESTAMP,'+
  '  "CD_USUARIO_EXCLUSAO"	 INTEGER,'+
  '  "DT_EXCLUSAO"	 TIMESTAMP,'+
  '  "CD_ARQUIVO"	 INTEGER,'+
  '  "CD_GRUPO"	 INTEGER,'+
  '  "CD_ARQUIVO2"	 INTEGER,'+
  ' PRIMARY KEY ("CD_TRIAGEM_ENFERMAGEM")'+
  ')';

  cvCreateIndexTRIAGEM_ENFERMAGEM =
  'CREATE INDEX "IDX_TRIAGEM_ENFERMAGEM_1" ON "TRIAGEM_ENFERMAGEM"("CD_PACIENTE")';

  cvCreateGeneratorGEN_TRIAGEM_ENFERMAGEM = 'CREATE GENERATOR GEN_TRIAGEM_ENFERMAGEM';

  //15
  cvAlterTablePaciente11 = 'ALTER TABLE PACIENTE ADD FL_TRANS INTEGER';
  cvAlterTablePaciente12 = 'ALTER TABLE PACIENTE ADD FL_OBITO INTEGER';
  cvAlterTablePaciente13 = 'ALTER TABLE PACIENTE ADD DT_OBITO TIMESTAMP';
  cvAlterTablePaciente14 = 'CREATE INDEX "AGENDA_IX2" ON "AGENDA"("FL_ESQUEMA")';
  cvAlterTablePaciente15 = 'CREATE INDEX "AGENDA_IX3" ON "AGENDA"("CD_PACIENTE")';
  cvAlterTablePaciente16 = 'CREATE INDEX "AGENDA_IX4" ON "AGENDA"("DT_AGENDA")';
  cvAlterTablePaciente17 = 'CREATE INDEX "AGENDA_IX5" ON "AGENDA"("CD_UND")';
  cvUpdatePaciente1 = 'UPDATE PACIENTE SET FL_TRANS = 0 WHERE FL_TRANS IS NULL';
  cvUpdatePaciente2 = 'UPDATE PACIENTE SET FL_OBITO = 0 WHERE FL_OBITO IS NULL';
  cvUpdateNotificacao1 = 'UPDATE NOTIFICACAO SET CD_EVOLUCAO = 1 WHERE CD_EVOLUCAO IS NULL';

  //17
  cvAlterTableTriagemEnfermagem = 'ALTER TABLE TRIAGEM_ENFERMAGEM ADD DT_CADASTRO_2 TIMESTAMP';

  //18
  cvAlterTableUsuarioCMP = 'ALTER TABLE USUARIO_CMP ADD CD_GRUPO INTEGER';
  cvAlterTableMODELO_DOCUMENTO = 'ALTER TABLE MODELO_DOCUMENTO ADD CD_GRUPO_DOC INTEGER;';

  //19
  cvCreateTableCID10_CAPITULO =
  'CREATE TABLE "CID10_CAPITULO"       '+
  '(                                   '+
  '  "CD_CAPITULO"	 INTEGER NOT NULL, '+
  '  "CD_CATINI"	 CHAR(3),            '+
  '  "CD_CATFIM"	 CHAR(3),            '+
  '  "DS_DESCRICAO"	 VARCHAR(300),     '+
  '  "DS_DESCRABREV"	 VARCHAR(300),   '+
  ' PRIMARY KEY ("CD_CAPITULO")        '+
  ')';

  cvCreateTableCID10_CATEGORIA =
  'CREATE TABLE "CID10_CATEGORIA"        '+
  '(                                     '+
  '  "CD_CATEGORIA"	 INTEGER NOT NULL,   '+
  '  "CD_CAT"	 CHAR(3),                  '+
  '  "DS_DESCRICAO"	 VARCHAR(300),       '+
  '  "DS_DESCRABREV"	 VARCHAR(300),     '+
  ' PRIMARY KEY ("CD_CATEGORIA")         '+
  ')';

  cvCreateTableCID10_GRUPO =
  'CREATE TABLE "CID10_GRUPO"              '+
  '(                                       '+
  '  "CD_GRUPO"	 INTEGER NOT NULL,         '+
  '  "CD_CATINI"	 CHAR(3),                '+
  '  "CD_CATFIM"	 CHAR(3),                '+
  '  "DS_DESCRICAO"	 VARCHAR(300),         '+
  '  "DS_DESCRABREV"	 VARCHAR(300),       '+
  ' PRIMARY KEY ("CD_GRUPO")               '+
  ')';

  cvCreateTableCID10_SUBCATEGORIA =
  'CREATE TABLE "CID10_SUBCATEGORIA"         '+
  '(                                         '+
  '  "CD_SUBCATEGORIA"	 INTEGER NOT NULL,   '+
  '  "CD_SUBCAT"	 CHAR(5),                  '+
  '  "CD_CAPITULO"	 INTEGER,                '+
  '  "CD_GRUPO"	 INTEGER,                    '+
  '  "CD_CATEGORIA"	 INTEGER,                '+
  '  "FL_USAR"	 CHAR(1),                    '+
  '  "DS_DESCRICAO"	 VARCHAR(300),           '+
  '  "DS_DESCRABREV"	 VARCHAR(300),         '+
  ' PRIMARY KEY ("CD_SUBCATEGORIA")          '+
  ')';

  //20
  cvCreateTableMAPA =
  ' CREATE TABLE MAPA               '+
  ' (CD_MAPA INTEGER NOT NULL,      '+
  ' CD_MEDICO INTEGER,              '+
  ' TP_CONSULTA CHAR(1),            '+
  ' DT_MAPA TIMESTAMP,              '+
  ' CD_PACIENTE INTEGER,            '+
  ' DS_PESO INTEGER,                '+
  ' TP_CONSULTA2 CHAR(1),           '+
  ' FL_RETORNO CHAR(1),             '+
  ' NR_ESTADIO_OMS INTEGER,         '+
  ' CD_CID10 VARCHAR(10),           '+
  ' NR_CD4 INTEGER,                 '+
  ' FL_TB CHAR(1),                  '+
  ' FL_N CHAR(1),                   '+
  ' FL_I CHAR(1),                   '+
  ' FL_T CHAR(1),                   '+
  ' FL_M CHAR(1),                   '+
  ' DS_ESQUEMA VARCHAR(20),         '+
  ' CD_USUARIO_CADASTRO	 INTEGER,   '+
  ' DT_CADASTRO	 TIMESTAMP,         '+
  ' CD_USUARIO_ALTERACAO	 INTEGER, '+
  ' DT_ALTERACAO	 TIMESTAMP,       '+
  ' CD_USUARIO_EXCLUSAO	 INTEGER,   '+
  ' DT_EXCLUSAO	 TIMESTAMP,         '+
  '  PRIMARY KEY (CD_MAPA)          '+
  ' )';

  cvCreateGeneratorMAPA =
  ' CREATE GENERATOR GEN_MAPA';

  cvAlterTableAGENDA20 =
  ' alter table agenda add CD_HISTORICO_PARECER	INTEGER';

  cvCreateTriggerT_ARQUIVO_DIGITAL_1 =
  ' SET TERM !!                                                   '+
  ' CREATE TRIGGER "T_ARQUIVO_DIGITAL_1" FOR "ARQUIVO_DIGITAL"    '+
  ' ACTIVE BEFORE INSERT POSITION 0                               '+
  ' AS                                                            '+
  '  DECLARE VARIABLE ORDEM INTEGER;                              '+
  ' BEGIN                                                         '+
  '    IF (NEW.DT_ARQUIVO IS NULL) THEN                           '+
  '       NEW.DT_ARQUIVO = CAST(''NOW'' AS DATE);                 '+
  '    IF (NEW.NU_ORDEM IS NULL) THEN                             '+
  '    BEGIN                                                      '+
  '      SELECT MAX(NU_ORDEM) FROM ARQUIVO_DIGITAL                '+
  '      WHERE CD_GRUPO = NEW.CD_GRUPO                            '+
  '      AND NR_PROCESSO = NEW.NR_PROCESSO                        '+
  '      INTO :ORDEM;                                             '+
  '      IF (ORDEM IS NULL) THEN                                  '+
  '        ORDEM = 0;                                             '+
  '      NEW.NU_ORDEM = :ORDEM + 1;                               '+
  '    END                                                        '+
  ' END!!';

  cvAlterTableDIG_GRUPO =
  ' ALTER TABLE DIG_GRUPO ADD FL_NOVO INTEGER';

  //24
  cvAlterTableAGENDA21 =
'ALTER TABLE RESULTADO_CD4 ADD FL_REFAZER CHAR(1)';

  cvUpdateTableCID10_SUBCATEGORIA =
'update "CID10_SUBCATEGORIA" set "FL_USAR" = ''S'' where  "FL_USAR" = ''N''';

  //00
  cvCreateTableRECEITA =
  'CREATE TABLE "RECEITA" (                                   '+
  '  "CD_RECEITA"	 INTEGER NOT NULL,                          '+
  '  "CD_PACIENTE"	 INTEGER,                                 '+
  '  "TX_ESQUEMA"	 VARCHAR(20),                               '+
  '  "TX_OBSERVACOES"	 VARCHAR(1700),                         '+
  '  "CD_USU_INCLUSAO"	 INTEGER,                             '+
  '  "CD_USU_EXCLUSAO"	 INTEGER,                             '+
  '  "CD_USU_ALTERACAO"	 INTEGER,                             '+
  '  "DT_INCLUSAO"	 TIMESTAMP,                               '+
  '  "DT_ALTERACAO"	 TIMESTAMP,                               '+
  '  "CD_UND"	 INTEGER,                                       '+
  '  "DT_CADASTRO"	 TIMESTAMP,                               '+
  ' PRIMARY KEY ("CD_RECEITA")                                '+
  ')';

  cvCreateIndexRECEITA =
  'CREATE INDEX "IDX_RECEITA" ON "RECEITA"("CD_PACIENTE")';

  cvCreateGeneratorGEN_RECEITA =
  'CREATE GENERATOR GEN_RECEITA';

  cvCreateTableREGISTRO_CRIANCAS_EXP =
  'CREATE TABLE "REGISTRO_CRIANCAS_EXP"                                                  '+
  '(                                                                                     '+
  '  "CD_REGISTRO_CRIANCAS_EXP"	 INTEGER NOT NULL,                                     '+
  '  "CD_UND"	 INTEGER NOT NULL,                                                         '+
  '  "DT_REGISTRO"	 TIMESTAMP NOT NULL,                                               '+
  '  "CD_UNIDADE"	 INTEGER NOT NULL,                                                     '+
  '  "CD_PROVINCIA"	 INTEGER NOT NULL,                                                 '+
  '  "CD_MUNICIPIO"	 INTEGER NOT NULL,                                                 '+
  '  "VL_MESANO"	 VARCHAR(8),                                                  '+
  '  "VL_ANO"	 INTEGER,                                                                  '+
  '  "VL_GRAVIDAS"	 INTEGER,                                                          '+
  '  "VL_CRI_POSITIVA"	 INTEGER,                                                      '+
  '  "VL_CRI_NEGATIVA"	 INTEGER,                                                      '+
  '  "VL_CRI_SEM_INFORMACAO"	 INTEGER,                                                  '+
  '  "VL_X"	 INTEGER,                                                                  '+
  '  "VL_Y"	 INTEGER,                                                                  '+
  '  "DT_EXP"	 TIMESTAMP,                                                                '+
  '  "CD_EDI"	 INTEGER,                                                                  '+
  '  "CD_USU_INCLUSAO"	 INTEGER,                                                      '+
  '  "DT_INCLUSAO"	 TIMESTAMP,                                                        '+
  '  "CD_USU_ALTERACAO"	 INTEGER,                                                      '+
  '  "DT_ALTERACAO"	 TIMESTAMP,                                                        '+
  '  "CD_USU_EXCLUSAO"	 INTEGER,                                                      '+
  'CONSTRAINT "REGISTRO_CRIANCAS_EXP" PRIMARY KEY ("CD_REGISTRO_CRIANCAS_EXP", "CD_UND") '+
  ')';

  cvCreateTableREGISTRO_PRE_NATAL =
  'CREATE TABLE "REGISTRO_PRE_NATAL"                                                   '+
  '(                                                                                   '+
  '  "CD_REGISTRO_PRE_NATAL"	 INTEGER NOT NULL,                                       '+
  '  "CD_UND"	 INTEGER NOT NULL,                                                       '+
  '  "DT_REGISTRO"	 TIMESTAMP NOT NULL,                                             '+
  '  "CD_UNIDADE"	 INTEGER NOT NULL,                                                   '+
  '  "CD_PROVINCIA"	 INTEGER NOT NULL,                                               '+
  '  "CD_MUNICIPIO"	 INTEGER NOT NULL,                                               '+
  '  "VL_MESANO"	 VARCHAR(8),                                                '+
  '  "VL_ANO"	 INTEGER,                                                                '+
  '  "VL_UNIDADE"	 INTEGER,                                                            '+
  '  "VL_CPN_SEM_PTV"	 INTEGER,                                                        '+
  '  "VL_CPN_COM_PTV"	 INTEGER,                                                        '+
  '  "VL_AT"	 INTEGER,                                                                '+
  '  "VL_TARV"	 INTEGER,                                                            '+
  '  "VL_X"	 INTEGER,                                                                '+
  '  "VL_Y"	 INTEGER,                                                                '+
  '  "DT_EXP"	 TIMESTAMP,                                                              '+
  '  "CD_EDI"	 INTEGER,                                                                '+
  '  "CD_USU_INCLUSAO"	 INTEGER,                                                    '+
  '  "DT_INCLUSAO"	 TIMESTAMP,                                                      '+
  '  "CD_USU_ALTERACAO"	 INTEGER,                                                    '+
  '  "DT_ALTERACAO"	 TIMESTAMP,                                                      '+
  '  "CD_USU_EXCLUSAO"	 INTEGER,                                                    '+
  'CONSTRAINT "REGISTRO_PRE_NATAL_EXP" PRIMARY KEY ("CD_REGISTRO_PRE_NATAL", "CD_UND") '+
  ')';

  cvCreateTableREGISTRO_SERVICOS_ACOMP =
  'CREATE TABLE "REGISTRO_SERVICOS_ACOMP"                                                        '+
  '(                                                                                             '+
  '  "CD_REGISTRO_SERVICOS_ACOMP"	 INTEGER NOT NULL,                                             '+
  '  "CD_UND"	 INTEGER NOT NULL,                                                                 '+
  '  "DT_REGISTRO"	 TIMESTAMP NOT NULL,                                                       '+
  '  "CD_UNIDADE"	 INTEGER NOT NULL,                                                             '+
  '  "CD_PROVINCIA"	 INTEGER NOT NULL,                                                         '+
  '  "CD_MUNICIPIO"	 INTEGER NOT NULL,                                                         '+
  '  "VL_MESANO"	 VARCHAR(8),                                                          '+
  '  "VL_ANO"	 INTEGER,                                                                          '+
  '  "VL_F_18"	 INTEGER,                                                                      '+
  '  "VL_M_18"	 INTEGER,                                                                      '+
  '  "VL_F_18X4"	 INTEGER,                                                                      '+
  '  "VL_M_18X4"	 INTEGER,                                                                      '+
  '  "VL_F_5X14"	 INTEGER,                                                                      '+
  '  "VL_M_5X14"	 INTEGER,                                                                      '+
  '  "VL_F_15X19"	 INTEGER,                                                                      '+
  '  "VL_M_15X19"	 INTEGER,                                                                      '+
  '  "VL_F_20X29"	 INTEGER,                                                                      '+
  '  "VL_M_20x29"	 INTEGER,                                                                      '+
  '  "VL_F_30x39"	 INTEGER,                                                                      '+
  '  "VL_M_30x99"	 INTEGER,                                                                      '+
  '  "VL_F_40x49"	 INTEGER,                                                                      '+
  '  "VL_M_40x49"	 INTEGER,                                                                      '+
  '  "VL_F_50x59"	 INTEGER,                                                                      '+
  '  "VL_M_50x59"	 INTEGER,                                                                      '+
  '  "VL_F_60"	 INTEGER,                                                                      '+
  '  "VL_M_60"	 INTEGER,                                                                      '+
  '  "VL_X"	 INTEGER,                                                                          '+
  '  "VL_Y"	 INTEGER,                                                                          '+
  '  "DT_EXP"	 TIMESTAMP,                                                                        '+
  '  "CD_EDI"	 INTEGER,                                                                          '+
  '  "CD_USU_INCLUSAO"	 INTEGER,                                                              '+
  '  "DT_INCLUSAO"	 TIMESTAMP,                                                                '+
  '  "CD_USU_ALTERACAO"	 INTEGER,                                                              '+
  '  "DT_ALTERACAO"	 TIMESTAMP,                                                                '+
  '  "CD_USU_EXCLUSAO"	 INTEGER,                                                              '+
  'CONSTRAINT "REGISTRO_SERVICOS_ACOMP_EXP" PRIMARY KEY ("CD_REGISTRO_SERVICOS_ACOMP", "CD_UND") '+
  ')';

  cvCreateTableREGISTRO_SERVICOS_TARV =
  'CREATE TABLE "REGISTRO_SERVICOS_TARV"                                                       '+
  '(                                                                                           '+
  '  "CD_REGISTRO_SERVICOS_TARV"	 INTEGER NOT NULL,                                           '+
  '  "CD_UND"	 INTEGER NOT NULL,                                                               '+
  '  "DT_REGISTRO"	 TIMESTAMP NOT NULL,                                                     '+
  '  "CD_UNIDADE"	 INTEGER NOT NULL,                                                           '+
  '  "CD_PROVINCIA"	 INTEGER NOT NULL,                                                       '+
  '  "CD_MUNICIPIO"	 INTEGER NOT NULL,                                                       '+
  '  "VL_MESANO"	 VARCHAR(8),                                                        '+
  '  "VL_ANO"	 INTEGER,                                                                        '+
  '  "VL_F_18"	 INTEGER,                                                                    '+
  '  "VL_M_18"	 INTEGER,                                                                    '+
  '  "VL_F_18X4"	 INTEGER,                                                                    '+
  '  "VL_M_18X4"	 INTEGER,                                                                    '+
  '  "VL_F_5X14"	 INTEGER,                                                                    '+
  '  "VL_M_5X14"	 INTEGER,                                                                    '+
  '  "VL_F_15X19"	 INTEGER,                                                                    '+
  '  "VL_M_15X19"	 INTEGER,                                                                    '+
  '  "VL_F_20X29"	 INTEGER,                                                                    '+
  '  "VL_M_20x29"	 INTEGER,                                                                    '+
  '  "VL_F_30x39"	 INTEGER,                                                                    '+
  '  "VL_M_30x99"	 INTEGER,                                                                    '+
  '  "VL_F_40x49"	 INTEGER,                                                                    '+
  '  "VL_M_40x49"	 INTEGER,                                                                    '+
  '  "VL_F_50x59"	 INTEGER,                                                                    '+
  '  "VL_M_50x59"	 INTEGER,                                                                    '+
  '  "VL_F_60"	 INTEGER,                                                                    '+
  '  "VL_M_60"	 INTEGER,                                                                    '+
  '  "VL_X"	 INTEGER,                                                                        '+
  '  "VL_Y"	 INTEGER,                                                                        '+
  '  "DT_EXP"	 TIMESTAMP,                                                                      '+
  '  "CD_EDI"	 INTEGER,                                                                        '+
  '  "CD_USU_INCLUSAO"	 INTEGER,                                                            '+
  '  "DT_INCLUSAO"	 TIMESTAMP,                                                              '+
  '  "CD_USU_ALTERACAO"	 INTEGER,                                                            '+
  '  "DT_ALTERACAO"	 TIMESTAMP,                                                              '+
  '  "CD_USU_EXCLUSAO"	 INTEGER,                                                            '+
  'CONSTRAINT "REGISTRO_SERVICOS_TARV_EXP" PRIMARY KEY ("CD_REGISTRO_SERVICOS_TARV", "CD_UND") '+
  ')';

  cvCreateGeneratorREGISTRO_CRIANCAS_EXP =
  'CREATE GENERATOR GEN_REGISTRO_CRIANCAS_EXP';

  cvCreateGeneratorREGISTRO_PRE_NATAL =
  'CREATE GENERATOR GEN_REGISTRO_PRE_NATAL';

  cvCreateGeneratorREGISTRO_SERVICOS_ACOMP =
  'CREATE GENERATOR GEN_REGISTRO_SERVICOS_ACOMP';

  cvCreateGeneratorREGISTRO_SERVICOS_TARV =
  'CREATE GENERATOR GEN_REGISTRO_SERVICOS_TARV';
  
  //cvAlterTableAGENDA21 ='ALTER TABLE RESULTADO_CD4 ADD FL_REFAZER CHAR(1)';

  //cvUpdateTableCID10_SUBCATEGORIA = 'update "CID10_SUBCATEGORIA" set "FL_USAR" = ''S'' where  "FL_USAR" = ''N''';

  //Correções
  cvAlterTableCorrecoes1 =
  'alter table paciente add fl_casonovo char(1)';

  cvAlterTableCorrecoes2 =
  'alter table agenda add fl_rx char(1)';

  cvAlterTableCorrecoes3 =
  'alter table agenda add fl_exame1 char(1)';

  cvAlterTableCorrecoes4 =
  'alter table agenda add fl_exame2 char(1)';

  cvAlterTableCorrecoes5 =
  'alter table agenda add fl_exame3 char(1)';

  cvAlterTableCorrecoes6 =
  'alter table agenda add fl_exame4 char(1)';

  cvAlterTableCorrecoes7 =
  'alter table agenda add fl_exame5 char(1)';

  cvAlterTableCorrecoes8 =
  'alter table agenda add fl_exame6 char(1)';

  cvAlterTableCorrecoes9 =
  'alter table agenda add ds_exame VARCHAR(200)';

  cvCreateTableREQUISICAO =
  'CREATE TABLE "REQUISICAO" '+
  '('+
  '  "CD_AGENDA"	 INTEGER NOT NULL,'+
  '  "BL_REQUISICAO" BLOB SUB_TYPE 0 SEGMENT SIZE 80,'+
  ' PRIMARY KEY ("CD_AGENDA")'+
  ')';

  cvAlterTableCorrecoes10 =
'ALTER TABLE REGISTRO_ATV ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_ATV_IX1 =
'CREATE INDEX REGISTRO_ATV_IX1 ON REGISTRO_ATV(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes11 =
'ALTER TABLE REGISTRO_PTV ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_PTV_IX1 =
'CREATE INDEX REGISTRO_PTV_IX1 ON REGISTRO_PTV(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes12 =
'ALTER TABLE REGISTRO_TARV ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_TARV_IX1 =
'CREATE INDEX REGISTRO_TARV_IX1 ON REGISTRO_TARV(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes13 =
'ALTER TABLE REGISTRO_TARV_ACOMP ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_TARV_ACOMP_IX1 =
'CREATE INDEX REGISTRO_TARV_ACOMP_IX1 ON REGISTRO_TARV_ACOMP(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes14 =
'ALTER TABLE REGISTRO_TARV_CD4 ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_TARV_CD4_IX1 =
'CREATE INDEX REGISTRO_TARV_CD4_IX1 ON REGISTRO_TARV_CD4(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes15 =
'ALTER TABLE REGISTRO_TARV_ESQUEMA ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_TARV_ESQUEMA_IX1 =
'CREATE INDEX REGISTRO_TARV_ESQUEMA_IX1 ON REGISTRO_TARV_ESQUEMA(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes16 =
'ALTER TABLE REGISTRO_PROGRAMA ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_PROGRAMA_IX1 =
'CREATE INDEX REGISTRO_PROGRAMA_IX1 ON REGISTRO_PROGRAMA(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes17 =
'ALTER TABLE REGISTRO_COINFECCAO ADD CD_REGISTRO_GERAL INTEGER';
  cvCreateIndeREGISTRO_COINFECCAO_IX1 =
'CREATE INDEX REGISTRO_COINFECCAO_IX1 ON REGISTRO_COINFECCAO(CD_REGISTRO_GERAL)';

  cvAlterTableCorrecoes18 =
'ALTER TABLE TABELA_EDI '+
'  ADD FL_VALIDAR_RECEBIMENTO CHAR(1) ' +
'  ,ADD NR_ORDEM INTEGER';

 cvInsertParametro28 = 'INSERT INTO PARAMETRO(CD_PARAMETRO,CD_UND,DS_PARAMETRO,VALOR)'+
     'VALUES(28,%s,''Confirma EDI'',''N'')';

 cvInsertPermissao = 'INSERT INTO "PERMISSAO"	 ("CD_PERMISSAO", 	"CD_UND", 	"DS_MODULO") ' +
     'VALUES (41,	31,	''GERAL'')';

 cvScript20500_1 = 'ALTER TABLE UNIDADE ADD FL_ATIVA CHAR(1)';

 cvScript20500_2 = 'CREATE TABLE SERVICOS(CD_SERVICO INTEGER NOT NULL, ' +
                   'DS_SERVICO VARCHAR(100),                           ' +
                   'CONSTRAINT SERVICOS_PK PRIMARY KEY(CD_SERVICO))';

 cvScript20500_3 = 'CREATE GENERATOR GEN_SERVICOS';

 cvScript20500_4 = 'CREATE TABLE UNIDADE_SERVICOS(CD_UNIDADE INTEGER, CD_SERVICO INTEGER, ' +
                   'CONSTRAINT UNIDADE_SERVICOS_PK PRIMARY KEY(CD_UNIDADE,CD_SERVICO))';

 cvScript20500_5_1 = 'INSERT INTO "TABELA_EDI"	 ("NM_TABELA", 	"FL_ENVIAR", 	"FL_RECEBER") VALUES (	''SERVICOS'', 	''N'', 	''S'')';
 cvScript20500_5_2 = 'INSERT INTO "TABELA_EDI"	 ("NM_TABELA", 	"FL_ENVIAR", 	"FL_RECEBER") VALUES (	''UNIDADE_SERVICOS'', 	''S'', 	''S'')';
 cvScript20500_5_3 = 'INSERT INTO "TABELA_EDI"	 ("NM_TABELA", 	"FL_ENVIAR", 	"FL_RECEBER") VALUES (	''UNIDADE_SERVICOS'', 	''S'', 	''S'')';
 cvScript20500_5_4 = 'INSERT INTO "TABELA_EDI"	 ("NM_TABELA", 	"FL_ENVIAR", 	"FL_RECEBER") VALUES (	''PROTOCOLO_ENVIO'', 	''S'', 	''S'')';

 cvScript20500_8 = ' CREATE TABLE PROTOCOLO_ENVIO(  ' +
  '"CD_PROTOCOLO" INTEGER NOT NULL,                 ' +
  '"CD_UND"	 INTEGER NOT NULL,                      ' +
  '"TP_PROTOCOLO" INTEGER NOT NULL,                 ' +
  '"CD_UNIDADE"	 INTEGER NOT NULL,                  ' +
  '"CD_PROVINCIA" INTEGER NOT NULL,                 ' +
  '"CD_MUNICIPIO" INTEGER NOT NULL,                 ' +
  '"VL_MESANO"	 VARCHAR(8) NOT NULL,               ' +
  '"BL_PROTOCOLO" BLOB,                             ' +
  '"FL_ENVIADO"   CHAR(1),                          ' +
  '"FL_ACEITAR"   CHAR(1),                          ' +
  '"FL_IMPORTADO" CHAR(1),                          ' +
  '"CD_ARQUIVO"	 INTEGER,                           ' +
  '"DT_EXP"	 TIMESTAMP,                             ' +
  '"CD_EDI"	 INTEGER,                               ' +
  '"CD_REGISTRO_GERAL"	 INTEGER,                   ' +
  '"CD_USU_INCLUSAO"	 INTEGER,                     ' +
  '"DT_INCLUSAO"	 TIMESTAMP,                       ' +
  '"CD_USU_ALTERACAO"	 INTEGER,                     ' +
  '"DT_ALTERACAO"	 TIMESTAMP,                       ' +
  '"CD_USU_EXCLUSAO"	 INTEGER,                     ' +
  '"DT_EXCLUSAO"	 TIMESTAMP,                       ' +
  'CONSTRAINT "PROTOCOLO_ENVIO_PK" PRIMARY KEY ("CD_PROTOCOLO", "CD_UND"))' ;

 cvScript20500_9 = 'CREATE GENERATOR GEN_PROTOCOLO_ENVIO';
 cvScript20500_10 = 'alter TABLE "TABELA_EDI" add  "NM_ALIAS"	 VARCHAR(50)';

 cvScript20501_1 = 'ALTER TABLE SERVICOS ADD "CD_UND"	 INTEGER';
 cvScript20501_2 = 'ALTER TABLE UNIDADE_SERVICOS ADD "CD_UND"	 INTEGER';
 cvScript20501_3 = 'UPDATE UNIDADE_SERVICOS SET DT_EXP = NULL';
 cvScript20501_4 = 'UPDATE UNIDADE_SERVICOS SET CD_EDI = NULL';
 cvScript20501_5 = 'UPDATE SERVICOS SET DT_EXP = NULL';
 cvScript20501_6 = 'UPDATE SERVICOS SET CD_EDI = NULL';

 cvScript1410_0 = 'DELETE FROM SCRIPT';
 cvScript1410_1 = 'ALTER TABLE UNIDADE_SERVICOS ADD DT_EXP TIMESTAMP';
 cvScript1410_2 = 'ALTER TABLE SERVICOS ADD DT_EXP TIMESTAMP';
 cvScript1410_3 = 'ALTER TABLE UNIDADE_SERVICOS ADD CD_EDI INTEGER';
 cvScript1410_4 = 'ALTER TABLE SERVICOS ADD CD_EDI INTEGER';

 cvScript1410_5 = 'UPDATE PROVINCIA SET CD_UND = 31';
 cvScript1410_6 = 'UPDATE MUNICIPIO SET CD_UND = 31';
 cvScript1410_7 = 'DELETE FROM UNIDADE_SERVICOS';
 cvScript1410_8 = 'DELETE FROM SERVICOS';
 cvScript1410_9 = 'DELETE FROM UNIDADE WHERE CD_UNIDADE <> (SELECT VALOR FROM PARAMETRO WHERE CD_PARAMETRO = 1)';
 cvScript1610_1 = 'UPDATE PARAMETRO SET VALOR = ''S'' WHERE CD_PARAMETRO = 28';

 cvScript2106_1 = 'ALTER TABLE UNIDADE_SERVICOS ADD DT_INICIO DATE';

 cvScript1408_1 = 'ALTER TABLE ST_UNIDADE ADD DT_INI_ATIP TIMESTAMP';
 cvScript1408_2 = 'ALTER TABLE ST_UNIDADE ADD DT_INI_PTV TIMESTAMP';
 cvScript1408_3 = 'ALTER TABLE ST_UNIDADE ADD DT_INI_TARV_I TIMESTAMP';
 cvScript1408_4 = 'ALTER TABLE ST_UNIDADE ADD DT_INI_TARV_A TIMESTAMP';
 cvScript1408_5 = 'ALTER TABLE ST_UNIDADE ADD DT_INI_COINF TIMESTAMP';

 cvScript1911_1 = 'DROP TRIGGER TRIG_REGISTRO_ATV_EDI_AT2';
 cvScript1911_2 = 'DROP TRIGGER TRIG_REGISTRO_PTV_EDI_AT2';
 cvScript1911_3 = 'DROP TRIGGER TRIG_REG_TARV_EDI_AT2';
 cvScript1911_4 = 'DROP TRIGGER TRIG_REG_TARV_ACOMP_EDI_AT2';
 cvScript1911_5 = 'DROP TRIGGER TRIG_REG_TARV_ESQUEMA_EDI_AT2';
 cvScript1911_6 = 'DROP TRIGGER TRIG_REG_TARV_CD4_EDI_AT2';
 cvScript1911_7 = 'DROP TRIGGER TRIG_REGISTRO_COINF_EDI_AT2';
 cvScript1911_8 = 'DROP TRIGGER TRIG_REGISTRO_PROG_EDI_AT2';

 cvScript300116_1 =
    'delete from municipio       ' +
    'where cd_municipio in (     ' +
    'select cd_municipio         ' +
    'from (                      ' +
    ' select count(*) ct,        ' +
    ' cd_municipio,              ' +
    ' cd_provincia,              ' +
    ' ds_municipio               ' +
    ' from municipio             ' +
    ' group by cd_municipio,     ' +
    '          cd_provincia,     ' +
    '          ds_municipio      ' +
    ' having count(*)>1 ) )      ' +
    'and cd_und <> 31            ';

implementation

end.
