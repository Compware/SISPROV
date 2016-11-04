unit uSQLNotificacao;

interface

uses sysutils;

var
  sSQLEstadoCivilCaract,
  sSQLTransfusaoCaract,
  sSQLAmamentouOutrosCaract,
  sSQLAmamentaCaract,
  sSQLEmpregadaCaract,
  sSQLOuviuFalarCaract,
  sSQLTatuagemCaract,
  sSQLCirurgiaCaract,
  sSQLCircuncisaoCaract,
  sSQLSexoDrogasCaract,
  sSQLSexoAlcoolCaract,
  sSQLSexoDinheiroCaract,
  sSQLSexoMaterialCaract,
  sSQLSinaisITSCaract,
  sSQLParceiroSexualCaract,
  sSQLParceirosResultadosCaract,
  sSQLPreservativoNaoRegularCaract,
  sSQLFaixaEtariaCaract,
  sSQLITSCaract,
  sSQLPlanoReducaoCaract,
  sSQLRecebeuPreservativosCaract,
  sSQLTransferenciaCaract,
  sSQLTesteCaract,
  sSQLTesteRecentesCaract,
  sSQLTesteHojeCaract,
  sSQLTesteResultadosCaract,
  sSQLRevelarCaract: String;

procedure InicializaConstantes;

const sSQLRELACOES_SEXO =
'       case                                                    '+chr(13)+
'        when N.CD_RELACOES_SEXO=1 then ''Com Homens''          '+chr(13)+
'        when N.CD_RELACOES_SEXO=2 then ''Com Mulheres''        '+chr(13)+
'        when N.CD_RELACOES_SEXO=3 then ''Com Homens e Mulheres'''+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as RELACOES_SEXO';

const sSQLTRANSMISSAO_VERTICAL =
'       case                                                    '+chr(13)+
'        when N.CD_MAE_POSITIVO=1 then ''Sim''                  '+chr(13)+
'        when N.CD_MAE_POSITIVO=2 then ''Não''                  '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TRANSMISSAO_VERTICAL';

const sSQLDROGA_INJETAVEL =
'       case                                                    '+chr(13)+
'        when N.CD_USOU_DROGA=1 then ''Sim''                    '+chr(13)+
'        when N.CD_USOU_DROGA=2 then ''Não''                    '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as DROGA_INJETAVEL';

const sSQLACIDENTE_BIOLOGICO =
'       case                                                    '+chr(13)+
'        when N.CD_ACIDENTE_MAT_BIO=1 then ''Sim''              '+chr(13)+
'        when N.CD_ACIDENTE_MAT_BIO=2 then ''Não''              '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as ACIDENTE_BIOLOGICO';

const sSQLTRANSFUSAO_SANGUE =
'       case                                                    '+chr(13)+
'        when N.SN_TRANSFUSAO_SANGUE=1 then ''Sim''             '+chr(13)+
'        when N.SN_TRANSFUSAO_SANGUE in (0,2) then ''Não''      '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TRANSFUSAO_SANGUE';

const sSQLTRATAMENTO_TRADICIONAL =
'       case                                                    '+chr(13)+
'        when N.SN_PERFURACAO=1 then ''Sim''                    '+chr(13)+
'        when N.SN_PERFURACAO in (0,2) then ''Não''             '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TRATAMENTO_TRADICIONAL';

const sSQLTRATAMENTO_DENTARIO =
'       case                                                    '+chr(13)+
'        when N.SN_TRAT_DENTARIO=1 then ''Sim''                 '+chr(13)+
'        when N.SN_TRAT_DENTARIO in (0,2) then ''Não''          '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TRATAMENTO_DENTARIO';

const sSQLINTERVENCAO_CIRURGICA =
'       case                                                    '+chr(13)+
'        when N.SN_INTERV_CIRURGICA=1 then ''Sim''              '+chr(13)+
'        when N.SN_INTERV_CIRURGICA in (0,2) then ''Não''       '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as INTERVENCAO_CIRURGICA';

const sSQLCIRCUNCISAO =
'       case                                                    '+chr(13)+
'        when N.SN_CIRCUNCISAO=1 then ''Sim''                   '+chr(13)+
'        when N.SN_CIRCUNCISAO in (0,2) then ''Não''            '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as CIRCUNCISAO';

const sSQLTATUAGEM =
'       case                                                    '+chr(13)+
'        when N.SN_TATUAGEM=1 then ''Sim''                      '+chr(13)+
'        when N.SN_TATUAGEM in (0,2) then ''Não''               '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TATUAGEM';

const sSQLREMARCADO =
'       case                                                    '+chr(13)+
'        when A.FL_REMARCADO=1 then ''Sim''                     '+chr(13)+
'        when A.FL_REMARCADO=0 then ''Não''                     '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as REMARCADO';

const sSQLREALIZADO =
'       case                                                    '+chr(13)+
'        when A.FL_REALIZADO=1 then ''Sim''                     '+chr(13)+
'        when A.FL_REALIZADO=0 then ''Não''                     '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as REALIZADO';

const sSQLTESTE_TRIAGEM =
'       case                                                    '+chr(13)+
'        when N.CD_TESTE_TRIAGEM=1 then ''Positivo''            '+chr(13)+
'        when N.CD_TESTE_TRIAGEM=98 then ''Não Realizado''      '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TESTE_TRIAGEM';

const sSQLTESTE_CONFIRMATORIO =
'       case                                                    '+chr(13)+
'        when N.CD_TESTE_CONFIRMATORIO=1 then ''Positivo''      '+chr(13)+
'        when N.CD_TESTE_CONFIRMATORIO=98 then ''Não Realizado'''+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TESTE_CONFIRMATORIO';

const sSQLEVIDENCIA_GESTANTE =
'       case                                                    '+chr(13)+
'        when N.EVIDENCIA_GESTANTE=1 then ''Antes do pré-natal'''+chr(13)+
'        when N.EVIDENCIA_GESTANTE=2 then ''Durante o pré-natal'''+chr(13)+
'        when N.EVIDENCIA_GESTANTE=3 then ''Durante o parto''   '+chr(13)+
'        when N.EVIDENCIA_GESTANTE=4 then ''Após o parto''      '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as EVIDENCIA_GESTANTE';

const sSQLEVOLUCAO =
'       case                                                    '+chr(13)+
'        when N.CD_EVOLUCAO=1 then ''Activo''                   '+chr(13)+
'        when N.CD_EVOLUCAO=2 then ''Morto''                    '+chr(13)+
'        when N.CD_EVOLUCAO=3 then ''Transferido''              '+chr(13)+
'        when N.CD_EVOLUCAO=4 then ''Abandono''                 '+chr(13)+
'        when N.CD_EVOLUCAO=5 then ''Ignorado''                 '+chr(13)+
'        when N.CD_EVOLUCAO=6 then ''Recusado''                 '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as EVOLUCAO';

const sSQLOMS =
'       case                                                    '+chr(13)+
'        when N.CD_OMS=1 then ''Estado Clínico I''              '+chr(13)+
'        when N.CD_OMS=2 then ''Estado Clínico II''             '+chr(13)+
'        when N.CD_OMS=3 then ''Estado Clínico III''            '+chr(13)+
'        when N.CD_OMS=4 then ''Estado Clínico IV''             '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as ESTADIO_CLINICO';

const sSQLTB_ATUAL =
'       case                                                    '+chr(13)+
'        when N.TB_ATUAL=1 then ''Não''                         '+chr(13)+
'        when N.TB_ATUAL=2 then ''Sim''                         '+chr(13)+
'        when N.TB_ATUAL=3 then ''Ignorado''                    '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TB_ATUAL';

const sSQLTP_ENTRADA =
'       case                                                    '+chr(13)+
'        when N.TP_ENTRADA=1 then ''Caso Novo''                 '+chr(13)+
'        when N.TP_ENTRADA=2 then ''Transferência''             '+chr(13)+
'        when N.TP_ENTRADA=3 then ''Retorno após abandono''     '+chr(13)+
'        when N.TP_ENTRADA=4 then ''Ignorado''                  '+chr(13)+
'        when N.TP_ENTRADA=5 then ''Mãe da Criança Exposta''    '+chr(13)+
'        when N.TP_ENTRADA=6 then ''Caso Novo-Internamento''    '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TP_ENTRADA';

const sSQLTB_ANTERIOR =
'       case                                                    '+chr(13)+
'        when N.TB_ANTERIOR=1 then ''Não''                      '+chr(13)+
'        when N.TB_ANTERIOR=2 then ''Sim''                      '+chr(13)+
'        when N.TB_ANTERIOR=3 then ''Ignorado''                 '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as TB_ANTERIOR';

const sSQLRESULTADO =
'       case                                                    '+chr(13)+
'        when P2.FL_RESULTADO=1 then ''Negativo''               '+chr(13)+
'        when P2.FL_RESULTADO=2 then ''Positivo''               '+chr(13)+
'        when P2.FL_RESULTADO=3 then ''Indeterminado''          '+chr(13)+
'        when P2.FL_RESULTADO=98 then ''Não se aplica''          '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as RESULTADO';

const sSQLGESTANTE =
'       case                                                    '+chr(13)+
'        when P2.FL_GESTANTE=0 then ''Não''                     '+chr(13)+
'        when P2.FL_GESTANTE=1 then ''Sim''                     '+chr(13)+
'       else                                                    '+chr(13)+
'        ''NIF''                                                '+chr(13)+
'       end as GESTANTE';

const sSQLESTADO_CIVIL =
'      CASE '+chr(13)+
'         when P2.ESTADO_CIVIL=1 then ''Solteiro''                '+chr(13)+
'         when P2.ESTADO_CIVIL=2 then ''Casado''                  '+chr(13)+
'         when P2.ESTADO_CIVIL=3 then ''Divorciado''              '+chr(13)+
'         when P2.ESTADO_CIVIL=4 then ''Separado''                '+chr(13)+
'         when P2.ESTADO_CIVIL=5 then ''Viúvo''                   '+chr(13)+
'         when P2.ESTADO_CIVIL=6 then ''Marital''                 '+chr(13)+
'      else ''NIF'' END as ESTADO_CIVIL';

const sSQLSexo =
'      CASE '+chr(13)+
'         when P2.tp_sexo=''M'' then ''Masculino''                '+chr(13)+
'         when P2.tp_sexo=''F'' then ''Feminino''                 '+chr(13)+
'      else ''NIF'' END as SEXO';

const sSQLFAIXA_ETARIA =
'     CASE '+chr(13)+
'         when ((P2.idade>=0)  and (P2.idade<=4))  then ''0-4''   '+chr(13)+
'         when ((P2.idade>=5)  and (P2.idade<=9))  then ''5-9''   '+chr(13)+
'         when ((P2.idade>=10) and (P2.idade<=14)) then ''10-14'' '+chr(13)+
'         when ((P2.idade>=15) and (P2.idade<=24)) then ''15-24'' '+chr(13)+
'         when ((P2.idade>=25) and (P2.idade<=44)) then ''25-44'' '+chr(13)+
'         when ((P2.idade>=45) and (P2.idade<=49)) then ''45-49'' '+chr(13)+
'         when (P2.idade>=50) then ''50-+'''+chr(13)+
'     else ''NIF'' END as FAIXA_ETARIA';

//Constantes da Caracterização
const sSQLLocal =
'     CASE '+chr(13)+
'         when (C.CD_LOCAL=1) then ''Centro Especifico''          '+chr(13)+
'         when (C.CD_LOCAL=2) then ''Posto Móvel''                '+chr(13)+
'         when (C.CD_LOCAL=3) then ''Posto Médico''               '+chr(13)+
'         when (C.CD_LOCAL=4) then ''Clínica Privada''            '+chr(13)+
'         when (C.CD_LOCAL=99) then ''Outro''                     '+chr(13)+
'     else ''NIF'' END as LOCAL';

const sSQLSexoCaract =
'      CASE '+chr(13)+
'         when C.FL_SEXO=''1'' then ''Masculino''                '+chr(13)+
'         when C.FL_SEXO=''2'' then ''Feminino''                 '+chr(13)+
'      else ''NIF'' END as SEXO';

const sSQLSessaoCaract =
'      CASE '+chr(13)+
'         when C.TP_SESSAO=''1'' then ''Individual''                '+chr(13)+
'         when C.TP_SESSAO=''2'' then ''Casal''                     '+chr(13)+
'         when C.TP_SESSAO=''3'' then ''Familiar''                  '+chr(13)+
'      else ''NIF'' END as SESSAO';

const sSQLGestanteCaract =
'      CASE '+chr(13)+
'         when C.FL_GESTANTE=''0'' then ''Não''                     '+chr(13)+
'         when C.FL_GESTANTE=''1'' then ''Sim''                     '+chr(13)+
'         when C.FL_GESTANTE=''97'' then ''Não Sabe''               '+chr(13)+
'         when C.FL_GESTANTE=''98'' then ''Não se Aplica''          '+chr(13)+
'         when C.FL_GESTANTE=''99'' then ''Outros''                 '+chr(13)+
'         when C.FL_GESTANTE=''100'' then ''Não Respondeu''         '+chr(13)+
'      else ''NIF'' END as GESTANTE';

const sSQLEscolaridadeCaract =
'      CASE '+chr(13)+
'         when C.CD_ESCOLARIDADE=''0'' then ''Nenhum''              '+chr(13)+
'         when C.CD_ESCOLARIDADE=''1'' then ''Ensino Geral''        '+chr(13)+
'         when C.CD_ESCOLARIDADE=''2'' then ''Secundário''          '+chr(13)+
'         when C.CD_ESCOLARIDADE=''3'' then ''Pré Universitário''   '+chr(13)+
'         when C.CD_ESCOLARIDADE=''4'' then ''Superior''            '+chr(13)+
'         when C.CD_ESCOLARIDADE=''99'' then ''Outros''             '+chr(13)+
'      else ''NIF'' END as ESCOLARIDADE';

const sSQLRazaoCaract =
'      CASE '+chr(13)+
'         when C.CD_RAZAO=''1'' then ''Comportamento do utente, arriscado-teve risco''                      '+chr(13)+
'         when C.CD_RAZAO=''2'' then ''Comportamento do parceiro, arriscado-teve risco''                    '+chr(13)+
'         when C.CD_RAZAO=''3'' then ''Tive um parceiro que é suspeito ter morrido ou está doente de SIDA'' '+chr(13)+
'         when C.CD_RAZAO=''4'' then ''Tenho uma criança doente ou morreu de VIH/SIDA''                     '+chr(13)+
'         when C.CD_RAZAO=''5'' then ''Aconselhado pelos amigos/membros da família''                        '+chr(13)+
'         when C.CD_RAZAO=''6'' then ''Penso casar-me''                                                     '+chr(13)+
'         when C.CD_RAZAO=''7'' then ''Penso ter filhos''                                                   '+chr(13)+
'         when C.CD_RAZAO=''8'' then ''Sinto-me doente/adoeço sempre''                                      '+chr(13)+
'         when C.CD_RAZAO=''9'' then ''Pedido do parceiro''                                                 '+chr(13)+
'         when C.CD_RAZAO=''10'' then ''Para segurança de vida''                                            '+chr(13)+
'         when C.CD_RAZAO=''11'' then ''Para residir no estrangeiro''                                       '+chr(13)+
'         when C.CD_RAZAO=''12'' then ''Referenciado por um Serviço de Saúde''                              '+chr(13)+
'         when C.CD_RAZAO=''13'' then ''2º teste (período de janela)''                                      '+chr(13)+
'         when C.CD_RAZAO=''14'' then ''2º teste (confirmação do estado VIH+)''                             '+chr(13)+
'         when C.CD_RAZAO=''99'' then ''Outros''                                                            '+chr(13)+
'      else ''NIF'' END as RAZAO';

const sSQLIndicacaoCaract =
'      CASE '+chr(13)+
'         when C.CD_INDICACAO=''1'' then ''Membro da família''                  '+chr(13)+
'         when C.CD_INDICACAO=''2'' then ''Amigo''                              '+chr(13)+
'         when C.CD_INDICACAO=''3'' then ''Parceiro''                           '+chr(13)+
'         when C.CD_INDICACAO=''4'' then ''Cartaz''                             '+chr(13)+
'         when C.CD_INDICACAO=''5'' then ''TV''                                 '+chr(13)+
'         when C.CD_INDICACAO=''6'' then ''Rádio''                              '+chr(13)+
'         when C.CD_INDICACAO=''7'' then ''Outro cliente de ATV''               '+chr(13)+
'         when C.CD_INDICACAO=''8'' then ''Trabalhador de Saúde''               '+chr(13)+
'         when C.CD_INDICACAO=''9'' then ''Mobilizador comunitário''            '+chr(13)+
'         when C.CD_INDICACAO=''10'' then ''Activista deste Cantro de ATV''     '+chr(13)+
'         when C.CD_INDICACAO=''99'' then ''Outros''                            '+chr(13)+
'      else ''NIF'' END as INDICACAO';

const sSQLPreservativoCaract =
'      CASE '+chr(13)+
'         when C.FL_PRESERVATIVO=''1'' then ''Nunca''                     '+chr(13)+
'         when C.FL_PRESERVATIVO=''2'' then ''Sempre''                     '+chr(13)+
'         when C.FL_PRESERVATIVO=''3'' then ''Às vezes''               '+chr(13)+
'         when C.FL_PRESERVATIVO=''98'' then ''Não se Aplica''          '+chr(13)+
'         when C.FL_PRESERVATIVO=''100'' then ''Não Respondeu''         '+chr(13)+
'      else ''NIF'' END as PRESERVATIVO';
const sSQLSintomasITSCaract =
'      CASE '+chr(13)+
'         when C.CD_SINTOMAS_ITS=''1'' then ''Corrimento Vaginal''          '+chr(13)+
'         when C.CD_SINTOMAS_ITS=''2'' then ''Corrimento Uretral''          '+chr(13)+
'         when C.CD_SINTOMAS_ITS=''3'' then ''Ulcera Genital''              '+chr(13)+
'         when C.CD_SINTOMAS_ITS=''4'' then ''Corrimento Neonatal''         '+chr(13)+
'         when C.CD_SINTOMAS_ITS=''5'' then ''Bubão Inguinal''              '+chr(13)+
'         when C.CD_SINTOMAS_ITS=''6'' then ''Doença Inflamatóri Pélvica''  '+chr(13)+
'         when C.CD_SINTOMAS_ITS=''99'' then ''Outros''                     '+chr(13)+
'      else ''NIF'' END as SINTOMAS_ITS';

const sSQLTesteParceirosCaract =
'      CASE '+chr(13)+
'         when C.FL_TESTE_PARCEIROS=''1'' then ''Não''                           '+chr(13)+
'         when C.FL_TESTE_PARCEIROS=''2'' then ''Sim, o resultado foi negativo'' '+chr(13)+
'         when C.FL_TESTE_PARCEIROS=''3'' then ''Sim o resultado foi positivo''  '+chr(13)+
'         when C.FL_TESTE_PARCEIROS=''97'' then ''Não Sabe''                     '+chr(13)+
'         when C.FL_TESTE_PARCEIROS=''98'' then ''Não se Aplica''                '+chr(13)+
'      else ''NIF'' END as TESTE_PARCEIROS';

{
'TESTE',
'TESTE_RECENTES',
'TESTE_PARCEIROS',
'ITS',
'SINTOMAS_ITS',
'TESTE_HOJE',
'TESTE_RESULTADOS',
'PARCEIROS_RESULTADOS',
'REVELAR',
'PLANO_REDUCAO',
'RECEBEU_PRESERVATIVOS',
'TRANSFERENCIA',
'SERVICO_SAUDE'
}
//Relação de Campos
const cCamposAgenda: array[1..10] of string = (
'CD4',
'ESQUEMA',
'REMARCADO',
'REALIZADO',
'MEDICO',
//'UNIDADE_TRATAMENTO',
'UNIDADE',
'MUNICIPIO',
'PROVINCIA',
'MESANO',
'DATA');

const cCamposPaciente: array[1..8] of string = (
'QUANTIDADE',
'OCUPACAO',
'ESCOLARIDADE',
'ESTADO_CIVIL',
'SEXO',
'FAIXA_ETARIA',
'GESTANTE',
'RESULTADO'
);

const cCamposNotificacao: array[1..28] of string = (
'UNIDADE',
'MUNICIPIO',
'PROVINCIA',
'UNIDADE_TRATAMENTO',
'MUNICIPIO_TRATAMENTO',
'INVESTIGADOR',
'MEDICO',
'TRANSMISSAO_VERTICAL',
'TB_ANTERIOR',
'TP_ENTRADA',
'TB_ATUAL',
'ESTADIO_CLINICO',
'EVOLUCAO',
'EVIDENCIA_GESTANTE',
'TESTE_CONFIRMATORIO',
'TESTE_TRIAGEM',
'TATUAGEM',
'CIRCUNCISAO',
'INTERVENCAO_CIRURGICA',
'TRATAMENTO_DENTARIO',
'TRATAMENTO_TRADICIONAL',
'TRANSFUSAO_SANGUE',
'ACIDENTE_BIOLOGICO',
'DROGA_INJETAVEL',
'RELACOES_SEXO',
'CD4',
'MESANO',
'DATA');

const cCamposCaracterizacao: array[1..47] of string = (
'QUANTIDADE',
'PROVINCIA',
'MUNICIPIO',
'UNIDADE',
'LOCAL',
'SEXO',
'FAIXA_ETARIA',
'SESSAO',
'ESTADO_CIVIL',
'GESTANTE',
'AMAMENTA',
'ESCOLARIDADE',
'OCUPACAO',
'EMPREGADA',
'OUVIU_FALAR',
'RAZAO',
'INDICACAO',
'TRANSFUSAO',
'TATUAGEM',
'CIRURGIA',
'CIRCUNCISAO',
'PARTOS',
'ABORTOS',
'AMAMENTOU_OUTROS',
'SEXO_ALCOOL',
'SEXO_DROGAS',
'SEXO_DINHEIRO',
'SEXO_MATERIAL',
'PARCEIROS_SEXUAIS',
'PARCEIRO_SEXUAL',
'PRESERVATIVO',
'PRESERVATIVO_NAO_REGULAR',
'TESTE',
'TESTE_RECENTES',
'TESTE_PARCEIROS',
'ITS_HOJE',
'SINAIS_ITS',
'SINTOMAS_ITS',
'TESTE_HOJE',
'TESTE_RESULTADOS',
'PARCEIROS_RESULTADOS',
'REVELAR',
'PLANO_REDUCAO',
'RECEBEU_PRESERVATIVOS',
'TRANSFERENCIA',
'INVESTIGADOR',
'MESANO');


implementation

procedure InicializaConstantes;
begin
  sSQLEstadoCivilCaract := StringReplace(sSQLESTADO_CIVIL,'P2.','C.CD_',[rfReplaceAll]);
  sSQLTransfusaoCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','TRANSFUSAO',[rfReplaceAll]);
  sSQLAmamentouOutrosCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','AMAMENTOU_OUTROS',[rfReplaceAll]);
  sSQLAmamentaCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','AMAMENTA',[rfReplaceAll]);
  sSQLEmpregadaCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','EMPREGADA',[rfReplaceAll]);
  sSQLOuviuFalarCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','OUVIU_FALAR',[rfReplaceAll]);
  sSQLTatuagemCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','TATUAGEM',[rfReplaceAll]);
  sSQLCirurgiaCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','CIRURGIA',[rfReplaceAll]);
  sSQLCircuncisaoCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','CIRCUNCISAO',[rfReplaceAll]);
  sSQLSexoDrogasCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','SEXO_DROGAS',[rfReplaceAll]);
  sSQLSexoAlcoolCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','SEXO_ALCOOL',[rfReplaceAll]);
  sSQLSexoDinheiroCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','SEXO_DINHEIRO',[rfReplaceAll]);
  sSQLSexoMaterialCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','SEXO_MATERIAL',[rfReplaceAll]);
  sSQLSinaisITSCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','SINAIS_ITS',[rfReplaceAll]);
  sSQLParceiroSexualCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','PARCEIRO_SEXUAL',[rfReplaceAll]);
  sSQLParceirosResultadosCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','PARCEIROS_RESULTADOS',[rfReplaceAll]);
  sSQLITSCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','ITS',[rfReplaceAll]);
  sSQLITSCaract := StringReplace(sSQLITSCaract,'as ITS','as ITS_HOJE',[rfReplaceAll]); //Mudar Alias
  sSQLPlanoReducaoCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','PLANO_REDUCAO',[rfReplaceAll]);
  sSQLPreservativoNaoRegularCaract := StringReplace(sSQLPreservativoCaract,'PRESERVATIVO','PRESERVATIVO_NAO_REGULAR',[rfReplaceAll]);
  sSQLFaixaEtariaCaract := StringReplace(sSQLFAIXA_ETARIA,'P2.idade','C.NR_IDADE',[rfReplaceAll]);
  sSQLRecebeuPreservativosCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','RECEBEU_PRESERVATIVOS',[rfReplaceAll]);
  sSQLTransferenciaCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','TRANSFERENCIA',[rfReplaceAll]);
  sSQLTesteCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','TESTE',[rfReplaceAll]);
  sSQLTesteRecentesCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','TESTE_RECENTES',[rfReplaceAll]);
  sSQLTesteHojeCaract := StringReplace(sSQLRESULTADO,'P2.FL_RESULTADO','C.FL_TESTE_HOJE',[rfReplaceAll]);
  sSQLTesteHojeCaract := StringReplace(sSQLTesteHojeCaract,'RESULTADO','TESTE_HOJE',[rfReplaceAll]); //Mudar Alias
  sSQLTesteResultadosCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','TESTE_RESULTADOS',[rfReplaceAll]);
  sSQLRevelarCaract := StringReplace(sSQLGestanteCaract,'GESTANTE','REVELAR',[rfReplaceAll]);

end;

end.
