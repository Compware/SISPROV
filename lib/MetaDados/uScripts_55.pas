unit uScripts_55;

interface

const


  cvCREATE_MAPA_LAB =
'CREATE TABLE "MAPA_LAB"                                          ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA"	 INTEGER NOT NULL,                                  ' + chr(13) +
'  "CD_UNIDADE"	 INTEGER,                                         ' + chr(13) +
'  "DT_MAPA"	 TIMESTAMP,                                         ' + chr(13) +
' PRIMARY KEY ("CD_MAPA")                                         ' + chr(13) +
')';

  cvCREATE_MAPA_LAB_PACIENTE =
'CREATE TABLE "MAPA_LAB_PACIENTE"                                 ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA_PACIENTE"	 INTEGER NOT NULL,                          ' + chr(13) +
'  "CD_MAPA"	 INTEGER NOT NULL,                                  ' + chr(13) +
'  "CD_PACIENTE"	 INTEGER,                                       ' + chr(13) +
'  "NM_PACIENTE"	 VARCHAR(100) NOT NULL,                         ' + chr(13) +
'  "FL_SEXO"	 CHAR(1),                                           ' + chr(13) +
'  "NR_IDADE"	 INTEGER,                                           ' + chr(13) +
'  "VL_RESULTADO"	 VARCHAR(50),                                   ' + chr(13) +
'  "DS_OBSERVACAO"	 VARCHAR(200),                                ' + chr(13) +
'  "CD_TECNICO"	 INTEGER,                                         ' + chr(13) +
'  "NR_PROCESSO"	 VARCHAR(15),                                   ' + chr(13) +
'  "TP_EXAME_CD4"	 CHAR(1),                                       ' + chr(13) +
'  "TP_EXAME_CV"	 CHAR(1),                                       ' + chr(13) +
'  "TP_EXAME_DPI"	 CHAR(1),                                       ' + chr(13) +
'  "TP_EXAME_TB"	 CHAR(1),                                       ' + chr(13) +
' PRIMARY KEY ("CD_MAPA_PACIENTE")                                ' + chr(13) +
')';

  cvCREATE_MAPA_TESTAGEM =
'CREATE TABLE "MAPA_TESTAGEM"                                     ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA_TESTAGEM"	 INTEGER NOT NULL,                          ' + chr(13) +
'  "CD_PROVINCIA"	 INTEGER NOT NULL,                              ' + chr(13) +
'  "CD_MUNICIPIO"	 INTEGER NOT NULL,                              ' + chr(13) +
'  "CD_UNIDADE"	 INTEGER NOT NULL,                                ' + chr(13) +
'  "DT_MAPA"	 DATE,                                              ' + chr(13) +
'  "DS_LOCAL"	 VARCHAR(30),                                       ' + chr(13) +
'  "NR_LIVRO"	 VARCHAR(15),                                       ' + chr(13) +
' PRIMARY KEY ("CD_MAPA_TESTAGEM")                                ' + chr(13) +
')';

  cvCREATE_INDEX_IDX_MAPA_TESTAGEM_1 =
'CREATE UNIQUE INDEX "IDX_MAPA_TESTAGEM_1"                        ' + chr(13) +
'ON "MAPA_TESTAGEM"("DT_MAPA")';

  cvCREATE_MAPA_TESTAGEM_PACIENTE =
'CREATE TABLE "MAPA_TESTAGEM_PACIENTE"                            ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA_TESTAGEM_PACIENTE"	 INTEGER NOT NULL,                ' + chr(13) +
'  "CD_MAPA_TESTAGEM"	 INTEGER NOT NULL,                          ' + chr(13) +
'  "NM_PACIENTE"	 VARCHAR(100) NOT NULL,                         ' + chr(13) +
'  "FL_SEXO"	 CHAR(1),                                           ' + chr(13) +
'  "NR_IDADE"	 INTEGER,                                           ' + chr(13) +
'  "FL_ACONSELHADO"	 CHAR(1),                                     ' + chr(13) +
'  "FL_GESTANTE_NOVO"	 CHAR(1),                                   ' + chr(13) +
'  "FL_GESTANTE_RETORNO"	 CHAR(1),                               ' + chr(13) +
'  "FL_RESULTADO_NEGATIVO"	 CHAR(1),                             ' + chr(13) +
'  "FL_RESULTADO_POSITIVO"	 CHAR(1),                             ' + chr(13) +
'  "FL_RESULTADO_INDETERMINADO"	 CHAR(1),                         ' + chr(13) +
'  "DS_OBSERVACAO"	 VARCHAR(200),                                ' + chr(13) +
'  "CD_MEDICO"	 INTEGER,                                         ' + chr(13) +
'  "CD_NOTIFICACAO"	 INTEGER,                                     ' + chr(13) +
'  "NR_IDADE_MESES"	 INTEGER,                                     ' + chr(13) +
'  "NR_LIVRO"	 VARCHAR(15),                                       ' + chr(13) +
'  "DT_REGISTRO"	 DATE,                                          ' + chr(13) +
'  "NR_REGISTRO"	 INTEGER,                                       ' + chr(13) +
'  "NM_INVESTIGADOR"	 VARCHAR(30),                               ' + chr(13) +
'  "NM_DIGITADOR"	 VARCHAR(30),                                   ' + chr(13) +
'  "DT_INGRESSO_DIG"	 DATE,                                      ' + chr(13) +
'  "DS_OBSERVACAO_DIG"	 VARCHAR(200),                            ' + chr(13) +
'  "DS_LOCAL"	 VARCHAR(30),                                       ' + chr(13) +
'  "CD_PROVINCIA"	 INTEGER,                                       ' + chr(13) +
'  "CD_MUNICIPIO"	 INTEGER,                                       ' + chr(13) +
'  "DS_BAIRRO"	 VARCHAR(100),                                    ' + chr(13) +
'  "DS_SALA"	 VARCHAR(100),                                      ' + chr(13) +
' PRIMARY KEY ("CD_MAPA_TESTAGEM_PACIENTE")                       ' + chr(13) +
')';

  cvCREATE_MAPA_TESTE_RAPIDO =
'CREATE TABLE "MAPA_TESTE_RAPIDO"                                 ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA"	 INTEGER NOT NULL,                                  ' + chr(13) +
'  "CD_UNIDADE"	 INTEGER,                                         ' + chr(13) +
'  "DT_MAPA"	 TIMESTAMP,                                         ' + chr(13) +
' PRIMARY KEY ("CD_MAPA")                                         ' + chr(13) +
')';

  cvCREATE_MAPA_TESTE_RAPIDO_PACIENTE =
'CREATE TABLE "MAPA_TESTE_RAPIDO_PACIENTE"                        ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA_PACIENTE"	 INTEGER NOT NULL,                          ' + chr(13) +
'  "CD_MAPA"	 INTEGER NOT NULL,                                  ' + chr(13) +
'  "CD_PACIENTE"	 INTEGER,                                       ' + chr(13) +
'  "NM_PACIENTE"	 VARCHAR(100) NOT NULL,                         ' + chr(13) +
'  "FL_SEXO"	 CHAR(1),                                           ' + chr(13) +
'  "NR_IDADE"	 INTEGER,                                           ' + chr(13) +
'  "TP_EXAME"	 CHAR(1),                                           ' + chr(13) +
'  "VL_RESULTADO_DETERMINE"	 VARCHAR(20),                         ' + chr(13) +
'  "VL_RESULTADO_UNIGOLD"	 VARCHAR(20),                           ' + chr(13) +
'  "VL_RESULTADO_FINAL"	 VARCHAR(20),                             ' + chr(13) +
'  "VL_RESULTADO_CONFIRMATORIO"	 VARCHAR(20),                     ' + chr(13) +
'  "DS_OBSERVACAO"	 VARCHAR(200),                                ' + chr(13) +
'  "CD_TECNICO"	 INTEGER,                                         ' + chr(13) +
'  "NR_PROCESSO"	 VARCHAR(15),                                   ' + chr(13) +
' PRIMARY KEY ("CD_MAPA_PACIENTE")                                ' + chr(13) +
')';


  cvCREATE_MAPA_MEDICO =
'CREATE TABLE "MAPA_MEDICO"                                       ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA"	 INTEGER NOT NULL,                                  ' + chr(13) +
'  "CD_UNIDADE"	 INTEGER NOT NULL,                                ' + chr(13) +
'  "CD_MEDICO"	 INTEGER,                                         ' + chr(13) +
'  "DT_MAPA"	 TIMESTAMP,                                         ' + chr(13) +
' PRIMARY KEY ("CD_MAPA")                                         ' + chr(13) +
')';

  cvCREATE_MAPA_MEDICO_LINHA =
'CREATE TABLE "MAPA_MEDICO_LINHA"                                 ' + chr(13) +
'(                                                                ' + chr(13) +
'  "CD_MAPA_LINHA"	 INTEGER NOT NULL,                            ' + chr(13) +
'  "CD_MAPA"	 INTEGER NOT NULL,                                  ' + chr(13) +
'  "NR_PROCESSO"	 VARCHAR(15),                                   ' + chr(13) +
'  "DT_CONSULTA"	 TIMESTAMP,                                     ' + chr(13) +
'  "TP_CONSULTA"	 INTEGER,                                       ' + chr(13) +
'  "NM_PACIENTE"	 VARCHAR(50),                                   ' + chr(13) +
'  "FL_SEXO"	 CHAR(1),                                           ' + chr(13) +
'  "NR_IDADE_ANOS"	 INTEGER,                                     ' + chr(13) +
'  "NR_IDADE_MESES"	 INTEGER,                                     ' + chr(13) +
'  "VL_GESTANTE"	 VARCHAR(10),                                   ' + chr(13) +
'  "DT_PRIMEIRA_CONSULTA"	 TIMESTAMP,                             ' + chr(13) +
'  "VL_ESTADIO_PC"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_CV_PC"	 VARCHAR(10),                                       ' + chr(13) +
'  "DT_PRIMEIRO_TARV"	 TIMESTAMP,                                 ' + chr(13) +
'  "VL_PRIMEIRO_ESQUEMA"	 VARCHAR(20),                           ' + chr(13) +
'  "DT_ULTIMA_CONSULTA"	 TIMESTAMP,                               ' + chr(13) +
'  "VL_ESTADIO_UC"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_CV_UC"	 VARCHAR(10),                                       ' + chr(13) +
'  "VL_RASTREIO_TB"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_DIAGNOSTICO_TB"	 VARCHAR(10),                             ' + chr(13) +
'  "VL_TB_NOVO"	 VARCHAR(10),                                     ' + chr(13) +
'  "VL_TB_RECAIDA"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_TB_FRACASSADO"	 VARCHAR(10),                               ' + chr(13) +
'  "VL_TB_REAPARECIDO"	 VARCHAR(10),                             ' + chr(13) +
'  "VL_TB_SI"	 VARCHAR(10),                                       ' + chr(13) +
'  "CD_UND_REF_TB"	 INTEGER,                                     ' + chr(13) +
'  "VL_N"	 VARCHAR(10),                                           ' + chr(13) +
'  "VL_I"	 VARCHAR(10),                                           ' + chr(13) +
'  "VL_M"	 VARCHAR(10),                                           ' + chr(13) +
'  "VL_T"	 VARCHAR(10),                                           ' + chr(13) +
'  "VL_TARV_PADRAO"	 VARCHAR(20),                                 ' + chr(13) +
'  "VL_PRESCRICAO_IONIZADA"	 VARCHAR(20),                         ' + chr(13) +
'  "VL_PRESCRICAO_COTROMIXAZOL"	 VARCHAR(20),                     ' + chr(13) +
'  "DT_ESTADIO_UC"	 TIMESTAMP,                                   ' + chr(13) +
'  "DT_CD4_UC"	 TIMESTAMP,                                       ' + chr(13) +
'  "DT_CV_UC"	 TIMESTAMP,                                         ' + chr(13) +
'  "CD_PACIENTE"	 INTEGER,                                       ' + chr(13) +
'  "CD_AGENDA"	 INTEGER,                                         ' + chr(13) +
'  "VL_CD4_PC"	 INTEGER,                                         ' + chr(13) +
'  "VL_CD4_UC"	 INTEGER,                                         ' + chr(13) +
' PRIMARY KEY ("CD_MAPA_LINHA")                                   ' + chr(13) +
')';

 cvDROP_MAPA_LAB = 'DROP TABLE MAPA_LAB';
 cvDROP_MAPA_LAB_PACIENTE = 'DROP TABLE MAPA_LAB_PACIENTE';
 cvDROP_MAPA_TESTAGEM = 'DROP TABLE MAPA_TESTAGEM';
 cvDROP_MAPA_TESTAGEM_PACIENTE = 'DROP TABLE MAPA_TESTAGEM_PACIENTE';
 cvDROP_MAPA_TESTE_RAPIDO = 'DROP TABLE MAPA_TESTE_RAPIDO';
 cvDROP_MAPA_TESTE_RAPIDO_PACIENTE = 'DROP TABLE MAPA_TESTE_RAPIDO_PACIENTE';
 cvDROP_MAPA_MEDICO = 'DROP TABLE MAPA_MEDICO';
 cvDROP_MAPA_MEDICO_LINHA = 'DROP TABLE MAPA_MEDICO_LINHA';

 cvCREATE_GEN_MAPA_LINHA =
  'CREATE GENERATOR "GEN_MAPA_LINHA"';
 cvCREATE_GEN_MAPA_MEDICO =
  'CREATE GENERATOR "GEN_MAPA_MEDICO"';
 cvCREATE_GEN_MAPA_PACIENTE =
  'CREATE GENERATOR "GEN_MAPA_PACIENTE"';
 cvCREATE_GEN_MAPA_TESTAGEM =
  'CREATE GENERATOR "GEN_MAPA_TESTAGEM"';
 cvCREATE_GEN_MAPA_LAB =
  'CREATE GENERATOR "GEN_MAPA_LAB"';
 cvCREATE_GEN_MAPA_LAB_PACIENTE =
  'CREATE GENERATOR "GEN_MAPA_LAB_PACIENTE"';
 cvCREATE_GEN_MAPA_TESTE_RAPIDO =
  'CREATE GENERATOR "GEN_MAPA_TESTE_RAPIDO"';
 cvCREATE_GEN_TESTE_RAPIDO_PACIENTE =
  'CREATE GENERATOR "GEN_TESTE_RAPIDO_PACIENTE"';

 cvCREATE_GEN_MAPA_FARMACIA_LINHA =
'CREATE GENERATOR GEN_MAPA_FARMACIA_LINHA';
 cvCREATE_GEN_MAPA_FARMACIA =
'CREATE GENERATOR GEN_MAPA_FARMACIA';
 cvALTER_TABLE_ESQUEMA =
'ALTER TABLE ESQUEMA ADD VL_ARV VARCHAR(10)';

  cvCREATE_TABLE_MAPA_FARMACIA =
'CREATE TABLE MAPA_FARMACIA(                                      ' + chr(13) +
'CD_MAPA_FARMACIA	INTEGER NOT NULL PRIMARY KEY,                   ' + chr(13) +
'CD_UNIDADE	INTEGER NOT NULL,                                     ' + chr(13) +
'DT_MAPA	TIMESTAMP NOT NULL,                                     ' + chr(13) +
'NM_RESPONSAVEL	VARCHAR(50))';

 cvCREATE_TABLE_MAPA_FARMACIA_LINHA =
'CREATE TABLE MAPA_FARMACIA_LINHA(                                ' + chr(13) +
'CD_MAPA_FARMACIA_LINHA	INTEGER NOT NULL PRIMARY KEY,             ' + chr(13) +
'CD_MAPA_FARMACIA	INTEGER NOT NULL,                               ' + chr(13) +
'CD_PACIENTE	INTEGER,                                            ' + chr(13) +
'NR_PROCESSO	VARCHAR(15),                                        ' + chr(13) +
'NM_PACIENTE	VARCHAR(50),                                        ' + chr(13) +
'FL_SEXO	CHAR(1),                                                ' + chr(13) +
'NR_IDADE	INTEGER,                                                ' + chr(13) +
'VL_ESQUEMA	VARCHAR(20),                                          ' + chr(13) +
'VL_ARV1	VARCHAR(10),                                            ' + chr(13) +
'QT_DISPENSADA_ARV1	NUMERIC(8,2),                                 ' + chr(13) +
'DS_FORMA_ARV1	VARCHAR(50),                                      ' + chr(13) +
'DS_DOSAGEM_ARV1	VARCHAR(50),                                    ' + chr(13) +
'NR_LOTE_ARV1	VARCHAR(50),                                        ' + chr(13) +
'VL_VALIDADE_ARV1	VARCHAR(20),                                    ' + chr(13) +
'QT_DIAS_ATENDIDOS_ARV1	INTEGER,                                  ' + chr(13) +
'VL_ARV2	VARCHAR(10),                                            ' + chr(13) +
'QT_DISPENSADA_ARV2	NUMERIC(8,2),                                 ' + chr(13) +
'DS_FORMA_ARV2	VARCHAR(50),                                      ' + chr(13) +
'DS_DOSAGEM_ARV2	VARCHAR(50),                                    ' + chr(13) +
'NR_LOTE_ARV2	VARCHAR(50),                                        ' + chr(13) +
'VL_VALIDADE_ARV2	VARCHAR(20),                                    ' + chr(13) +
'QT_DIAS_ATENDIDOS_ARV2	INTEGER,                                  ' + chr(13) +
'VL_ARV3	VARCHAR(10),                                            ' + chr(13) +
'QT_DISPENSADA_ARV3	NUMERIC(8,2),                                 ' + chr(13) +
'DS_FORMA_ARV3	VARCHAR(50),                                      ' + chr(13) +
'DS_DOSAGEM_ARV3	VARCHAR(50),                                    ' + chr(13) +
'NR_LOTE_ARV3	VARCHAR(50),                                        ' + chr(13) +
'VL_VALIDADE_ARV3	VARCHAR(20),                                    ' + chr(13) +
'QT_DIAS_ATENDIDOS_ARV3	INTEGER,                                  ' + chr(13) +
'VL_ARV4	VARCHAR(10),                                            ' + chr(13) +
'QT_DISPENSADA_ARV4	NUMERIC(8,2),                                 ' + chr(13) +
'DS_FORMA_ARV4	VARCHAR(50),                                      ' + chr(13) +
'DS_DOSAGEM_ARV4	VARCHAR(50),                                    ' + chr(13) +
'NR_LOTE_ARV4	VARCHAR(50),                                        ' + chr(13) +
'VL_VALIDADE_ARV4	VARCHAR(20),                                    ' + chr(13) +
'QT_DIAS_ATENDIDOS_ARV4	INTEGER,                                  ' + chr(13) +
'VL_ARV5	VARCHAR(10),                                            ' + chr(13) +
'QT_DISPENSADA_ARV5	NUMERIC(8,2),                                 ' + chr(13) +
'DS_FORMA_ARV5	VARCHAR(50),                                      ' + chr(13) +
'DS_DOSAGEM_ARV5	VARCHAR(50),                                    ' + chr(13) +
'NR_LOTE_ARV5	VARCHAR(50),                                        ' + chr(13) +
'VL_VALIDADE_ARV5	VARCHAR(20),                                    ' + chr(13) +
'QT_DIAS_ATENDIDOS_ARV5	INTEGER,                                  ' + chr(13) +
'VL_OUTROS_FARMACOS	VARCHAR(10),                                  ' + chr(13) +
'QT_DISPENSADA_OUTROS	NUMERIC(8,2),                               ' + chr(13) +
'DS_FORMA_OUTROS	VARCHAR(50),                                    ' + chr(13) +
'DS_DOSAGEM_OUTROS	VARCHAR(50),                                  ' + chr(13) +
'NR_LOTE_OUTROS	VARCHAR(50),                                      ' + chr(13) +
'VL_VALIDADE_OUTROS	VARCHAR(20),                                  ' + chr(13) +
'QT_DIAS_ATENDIDOS_OUTROS	INTEGER,                                ' + chr(13) +
'DT_PROX_RETIRADA	TIMESTAMP)';

cvALTER_TABLE_MAPA_MEDICO_LINHA_21029 =
  'ALTER TABLE "MAPA_MEDICO_LINHA"  ADD "VL_ULTIMA_ESQUEMA"	 VARCHAR(20)';

cvALTER_TABLE_MAPA_LAB_PACIENTE_21029 =
  'ALTER TABLE "MAPA_LAB_PACIENTE"  ADD "CD_AGENDA" INTEGER' + chr(13) +
                                 ', ADD "NR_LAB" INTEGER';

cvALTER_TABLE_MAPA_LAB_21029 =
  'ALTER TABLE "MAPA_LAB"  ADD "CD_MEDICO" INTEGER';

cvALTER_TABLE_MAPA_FARMACIA_LINHA_21029 =
  'ALTER TABLE "MAPA_FARMACIA_LINHA"  ADD "CD_AGENDA" INTEGER';

cvALTER_TABLE_MAPA_FARMACIA_21029 =
  'ALTER TABLE "MAPA_FARMACIA"  ADD "CD_MEDICO" INTEGER';

cvALTER_TABLE_MAPA_TESTE_RAPIDO_PACIENTE_21029 =
  'ALTER TABLE "MAPA_TESTE_RAPIDO_PACIENTE"  ADD "CD_AGENDA" INTEGER';

cvALTER_TABLE_MAPA_TESTE_RAPIDO_21029 =
  'ALTER TABLE "MAPA_TESTE_RAPIDO"  ADD "CD_MEDICO" INTEGER';

cvUPDATE_ULTIMO_ESQUEMA_21029 =
  'UPDATE MAPA_MEDICO_LINHA SET VL_ULTIMA_ESQUEMA = VL_PRIMEIRO_ESQUEMA';

cvSELECT_MAPA_MEDICO_LINHA_21029 =
'select                                                          ' + chr(13) +
'       MAPA_MEDICO_LINHA.CD_MAPA_LINHA                          ' + chr(13) +
'     , MAPA_MEDICO_LINHA.VL_PRIMEIRO_ESQUEMA                    ' + chr(13) +
'     , MAPA_MEDICO_LINHA.VL_ULTIMA_ESQUEMA                      ' + chr(13) +
'     , MAPA_MEDICO_LINHA.VL_TARV_PADRAO                         ' + chr(13) +
'     , MAPA_MEDICO_LINHA.NR_PROCESSO                            ' + chr(13) +
'     , MAPA_MEDICO.CD_MAPA                                      ' + chr(13) +
'     , MAPA_MEDICO.DT_MAPA                                      ' + chr(13) +
'from MAPA_MEDICO_LINHA                                          ' + chr(13) +
'join MAPA_MEDICO ON                                             ' + chr(13) +
' MAPA_MEDICO.CD_MAPA = MAPA_MEDICO_LINHA.CD_MAPA                ' + chr(13) +
'order by MAPA_MEDICO_LINHA.NR_PROCESSO, MAPA_MEDICO.DT_MAPA,    ' + chr(13) +
' MAPA_MEDICO_LINHA.CD_MAPA_LINHA ';

cvUPDATE_MAPA_MEDICO_LINHA_21029 =
'UPDATE MAPA_MEDICO_LINHA                                        ' + chr(13) +
' SET VL_ULTIMA_ESQUEMA = :ESQUEMA                               ' + chr(13) +
'WHERE CD_MAPA_LINHA = :CD_MAPA_LINHA ';

cvINSERT_PARAMETRO_21029_1 =
'insert into parametro(CD_PARAMETRO, CD_UND, DS_PARAMETRO, VALOR)' + chr(13) +
'values(30,31,''Agenda Laboratorio'',null)';

cvINSERT_PARAMETRO_21029_2 =
'insert into parametro(CD_PARAMETRO, CD_UND, DS_PARAMETRO, VALOR)' + chr(13) +
'values(31,31,''Agenda Farmacia'',null)';

cvINSERT_PARAMETRO_21029_3 =
'insert into parametro(CD_PARAMETRO, CD_UND, DS_PARAMETRO, VALOR)' + chr(13) +
'values(32,31,''Agenda Teste Rapido'',null)';

cvALTER_TABLE_NOTIFICACAO_21030 =
  'ALTER TABLE "NOTIFICACAO"  ADD "DT_ENTRADA"	 DATE, '+ chr(13) +
  '                           ADD "DT_EVOLUCAO_2"	 DATE';

cvINSERT_PERMISSAO_21030 =
'INSERT INTO "PERMISSAO"	 ("CD_PERMISSAO", 	"CD_UND", 	"DS_MODULO") '+ chr(13) +
'VALUES (	:CD_PERMISSAO, 	:CD_UND, 	''GERAL'')';

cvCREATE_FORMA_21031 =
'create table FORMA(                        ' + chr(13) +
'CD_FORMA INTEGER NOT NULL PRIMARY KEY,     ' + chr(13) +
'CD_UND INTEGER,                            ' + chr(13) +
'DS_FORMA VARCHAR(50),                      ' + chr(13) +
'DT_EXP TIMESTAMP,                          ' + chr(13) +
'CD_EDI INTEGER)';

cvCREATE_GENERATOR_21031 =
'CREATE GENERATOR GEN_FORMA';

cvALTER_TABLE_MAPA_FARMACIA_LINHA_21031 =
'ALTER TABLE MAPA_FARMACIA_LINHA            ' + chr(13) +
'ADD FL_CRIANCA_EXPOSTA CHAR(1),            ' + chr(13) +
'ADD FL_GESTANTE INTEGER,                   ' + chr(13) +
'ADD CD_FORMA_ARV1 INTEGER                  ' ;

cvALTER_TABLE_PACIENTE_21031 =
'ALTER TABLE PACIENTE                       ' + chr(13) +
'ADD FL_CRIANCA_EXPOSTA CHAR(1)';
 {
cvCREATE_TABLE_GESTANTE_21032 =
'CREATE TABLE "GESTANTE"                    ' + chr(13) +
'(                                          ' + chr(13) +
'  "CD_GESTANTE"	 INTEGER NOT NULL,        ' + chr(13) +
'  "DT_GESTANTE"	 DATE,                    ' + chr(13) +
'  "CD_NOTIFICACAO"	 INTEGER,               ' + chr(13) +
'  "NR_PROCESSO"	 VARCHAR(15),             ' + chr(13) +
'  "CD_PACIENTE"	 INTEGER,                 ' + chr(13) +
'  "DT_NOTIFICACAO"	 DATE,                  ' + chr(13) +
'  "NR_MESES"	 INTEGER,                     ' + chr(13) +
'  "CD_USUARIO"	 INTEGER,                   ' + chr(13) +
'  "FL_GESTANTE"	 INTEGER,                 ' + chr(13) +
' PRIMARY KEY ("CD_GESTANTE")               ' + chr(13) +
')                                          ';    }

cvCREATE_TABLE_GESTANTE_21032 =
'CREATE TABLE "GESTANTE"              ' + chr(13) +
'(                                    ' + chr(13) +
'  "CD_GESTANTE"	 INTEGER NOT NULL,  ' + chr(13) +
'  "DT_INICIO_GESTACAO"	 DATE,        ' + chr(13) +
'  "NR_PROCESSO"	 VARCHAR(15),       ' + chr(13) +
'  "CD_PACIENTE"	 INTEGER,           ' + chr(13) +
'  "NR_MESES"	 INTEGER,               ' + chr(13) +
'  "CD_USUARIO"	 INTEGER,             ' + chr(13) +
'  "FL_GESTANTE"	 INTEGER,           ' + chr(13) +
'  "DT_FIM_GESTACAO"	 DATE,          ' + chr(13) +
' PRIMARY KEY ("CD_GESTANTE")         ' + chr(13) +
')                                    ';

cvCREATE_GENERATOR_GESTANTE_21032 =
'CREATE GENERATOR GEN_GESTANTE';

cvCREATE_TABLE_MAPA_CRIANCA_EXPOSTA_21033 =
'CREATE TABLE "MAPA_CRIANCA_EXPOSTA"        ' + chr(13) +
'(                                          ' + chr(13) +
'  "CD_MAPA_CRIANCA_EXPOSTA"	 INTEGER NOT NULL, ' + chr(13) +
'  "CD_UNIDADE"	 INTEGER,                   ' + chr(13) +
'  "DT_MAPA"	 TIMESTAMP,                   ' + chr(13) +
'  "CD_MEDICO"	 INTEGER,                   ' + chr(13) +
' PRIMARY KEY ("CD_MAPA_CRIANCA_EXPOSTA")   ' + chr(13) +
')                                          ';

cvCREATE_GENERATOR_MAPA_CRIANCA_EXPOSTA_21033 =
'CREATE GENERATOR GEN_MAPA_CRIANCA_EXPOSTA';

cvCREATE_TABLE_MAPA_CRIANCA_EXPOSTA_LINHA_21033 =
'CREATE TABLE "MAPA_CRIANCA_EXPOSTA_LINHA"              ' + chr(13) +
'(                                                      ' + chr(13) +
'  "CD_MAPA_CRIANCA_EXPOSTA_LINHA"	 INTEGER NOT NULL,  ' + chr(13) +
'  "CD_MAPA_CRIANCA_EXPOSTA"	 INTEGER NOT NULL,        ' + chr(13) +
'  "CD_PACIENTE"	 INTEGER,                             ' + chr(13) +
'  "CD_PACIENTE_MAE"	 INTEGER,                         ' + chr(13) +
'  "NR_PROCESSO_CRIANCA_EXPOSTA"	 VARCHAR(15),         ' + chr(13) +
'  "NM_PACIENTE"	 VARCHAR(50),                         ' + chr(13) +
'  "FL_SEXO"	 CHAR(1),                                 ' + chr(13) +
'  "CD_AGENDA"	 INTEGER,                               ' + chr(13) +
'  "NR_IDADE_MESES"	 INTEGER,                           ' + chr(13) +
'  "DT_PRIMEIRA_CONSULTA"	 TIMESTAMP,                   ' + chr(13) +
'  "VL_ESTADIO_PC"	 VARCHAR(10),                       ' + chr(13) +
'  "DT_PRIMEIRO_TARV"	 TIMESTAMP,                       ' + chr(13) +
'  "VL_PRIMEIRO_ESQUEMA"	 VARCHAR(20),                 ' + chr(13) +
'  "DT_ULTIMA_CONSULTA"	 TIMESTAMP,                     ' + chr(13) +
'  "VL_ESTADIO_UC"	 VARCHAR(10),                       ' + chr(13) +
'  "VL_RASTREIO_TB"	 VARCHAR(10),                       ' + chr(13) +
'  "VL_TB_NOVO"	 VARCHAR(10),                           ' + chr(13) +
'  "VL_N"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_I"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_M"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_T"	 VARCHAR(10),                                 ' + chr(13) +
'  "VL_TARV_PADRAO"	 VARCHAR(20),                       ' + chr(13) +
'  "VL_PRESCRICAO_IONIZADA"	 VARCHAR(20),               ' + chr(13) +
'  "VL_PRESCRICAO_COTROMIXAZOL"	 VARCHAR(20),           ' + chr(13) +
'  "DT_ESTADIO_UC"	 TIMESTAMP,                         ' + chr(13) +
'  "DT_TR_UC"	 TIMESTAMP,                               ' + chr(13) +
'  "DT_DPI_UC"	 TIMESTAMP,                             ' + chr(13) +
'  "VL_TR_PC"	 VARCHAR(50),                             ' + chr(13) +
'  "VL_TR_UC"	 VARCHAR(50),                             ' + chr(13) +
'  "VL_ULTIMA_ESQUEMA"	 VARCHAR(20),                   ' + chr(13) +
'  "VL_DPI_PC"	 INTEGER,                               ' + chr(13) +
'  "VL_DPI_UC"	 INTEGER,                               ' + chr(13) +
' PRIMARY KEY ("CD_MAPA_CRIANCA_EXPOSTA_LINHA")         ' + chr(13) +
')                                                      ';

cvCREATE_GENERATOR_MAPA_CRIANCA_EXPOSTA_LINHA_21033 =
'CREATE GENERATOR GEN_MAPA_CRIANCA_EXPOSTA_LINHA';

cvALTER_TABLE_PACIENTE_21033 =
'ALTER TABLE PACIENTE                       ' + chr(13) +
'ADD NR_PROCESSO_CRIANCA_EXP	 VARCHAR(15), ' + chr(13) +
'ADD CD_PACIENTE_MAE	 INTEGER,             ' + chr(13) +
'ADD DT_INICIO_CRIANCA_EXP	 DATE,          ' + chr(13) +
'ADD DT_FIM_CRIANCA_EXP	 DATE,              ' + chr(13) +
'ADD CD_DESFECHO_CRIANCA_EXP	 INTEGER      ';

cvALTER_TABLE_MAPA_MEDICO_LINHA_21033 =
'ALTER TABLE MAPA_MEDICO_LINHA ADD DT_PREV_GESTACAO DATE';

cvINSERT_PARAMETRO_21033 =
'insert into parametro(CD_PARAMETRO, CD_UND, DS_PARAMETRO, VALOR)' + chr(13) +
'values(33,31,''Agenda Criança Exposta'',null)';


cvINSERT_PERMISSAO_21034 =
'INSERT INTO "PERMISSAO"	 ("CD_PERMISSAO", 	"CD_UND", 	"DS_MODULO") '+ chr(13) +
'VALUES (	:CD_PERMISSAO, 	:CD_UND, 	''GERAL'')';

cvALTER_TABLE_MAPA_MEDICO_LINHA_21035 =
'ALTER TABLE MAPA_MEDICO_LINHA ADD VL_RASTREIO_ITS VARCHAR(10)';

cvALTER_TABLE_MAPA_LAB_PACIENTE_21035 =
'ALTER TABLE MAPA_LAB_PACIENTE ADD DT_RESULTADO TIMESTAMP';

implementation

end.                                                             
                                                                



