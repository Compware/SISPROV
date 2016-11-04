unit uSQLPrograma;

interface
uses sysutils;

const
  cPessoasPosiProvincias = 1;
  cPessoasAconProvincias = 2;
  cPessoasTestProvincias = 3;
  cAdultoSexoPosiProvincias = 4;
  cAdultoSexoTestPosiProvincias = 5;
  cAdultoTestPosiProvincias = 6;
  cCriancaTestPosiProvincias = 7;
  cGestanteTestPosiProvincias = 8;
  cPessoasTestPosiProvincias = 9;
  cAcompTarvProvincia  = 10;
  cPessoasAconTestProvincias = 11;
  cAcompProvincia  = 12;
  cTarvProvincia  = 13;
  cAcompPosiProvincia  = 14;
  cPosiTarvProvincia  = 15;
  cCriancaAcompTarvProvincia = 16;
  cCriancasExpostasTrimestral = 17;
  cObitoTrimestral = 18;
  cGravidasPosiPTVTrimestral = 19;
  cAbanTarvProvincia = 20;
  cTransTarvProvincia = 21;
  cObitoTarvProvincia = 22;
  cPessoasGeralProvincias = 23;
  cAdultoAcompTarvProvincias = 24;
  cPessoasAconTestPosProvincias = 25;
  cGestantePTVAdmissao = 26;
  cGestantePTVLocal = 27;

  cAconselhados = 'ACONSELHADOS';
  cPositivos = 'POSITIVOS';
  cTestados = 'TESTADOS';

const cNaoGestante = '((fl_gestante <> 1)or(fl_gestante is null))';

const sSQLAcompProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(ACOMP) POSIT                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select COALESCE(VL_FEMININO_2,0) + COALESCE(VL_MASCULINO_2,0)  ACOMP           '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (2,7,8,9) then ''02''                       '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (6,10,11,12,13,14,15) then ''03''           '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_2 in (2,6,7,8,9,10,11,12,13,14,15) %s)                   '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';



const sSQLTarvProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) POSIT                                                              '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'       COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV          '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (2,7,8,9) then ''02''                      '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) then ''03''          '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (2,6,7,8,9,10,11,12,13,14,15) %s)                      '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLAcompTarvProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) TEST,                                                              '+chr(13)+
'  SUM(ACOMP) POSIT                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select COALESCE(VL_FEMININO_2,0) + COALESCE(VL_MASCULINO_2,0)  ACOMP           '+chr(13)+
'     , 0 TARV                                                                  '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (2,7,8,9) then ''02''                       '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (6,10,11,12,13,14,15) then ''03''           '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_2 in (2,6,7,8,9,10,11,12,13,14,15) %s                    '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select 0 ACOMP                                                                 '+chr(13)+
'     , COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV          '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (2,7,8,9) then ''02''                      '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) then ''03''          '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (2,6,7,8,9,10,11,12,13,14,15) %s)                  '+chr(13)+


'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLAdultoAcompTarvProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) TEST,                                                              '+chr(13)+
'  SUM(ACOMP) POSIT                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select COALESCE(VL_FEMININO_2,0) + COALESCE(VL_MASCULINO_2,0)  ACOMP           '+chr(13)+
'     , 0 TARV                                                                  '+chr(13)+
'     , SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                 '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_2 in (6,10,11,12,13,14,15) %s                            '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select 0 ACOMP                                                                 '+chr(13)+
'     , COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV          '+chr(13)+
'     , SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                 '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) %s)                          '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLCriancaAcompTarvProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) TEST,                                                              '+chr(13)+
'  SUM(ACOMP) POSIT                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select COALESCE(VL_FEMININO_2,0) + COALESCE(VL_MASCULINO_2,0)  ACOMP           '+chr(13)+
'     , 0 TARV                                                                  '+chr(13)+
'     , SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                 '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_2 in (2,7,8,9) %s                                        '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select 0 ACOMP                                                                 '+chr(13)+
'     , COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV          '+chr(13)+
'     , SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                 '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (2,7,8,9) %s)                                      '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';


const sSQLPosiTarvProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) TEST,                                                              '+chr(13)+
'  SUM(POSIT) POSIT                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select 0 TARV                                                                  '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSIT                        '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_1 in (16)  then ''02''                           '+chr(13)+
'         else ''03''                                                           '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (ID_FAIXA_ETARIA_1 in (6,16) and                                         '+chr(13)+
'      ' + cNaoGestante + ') %s                                                 '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select  COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV         '+chr(13)+
'     , 0 POSIT                                                                 '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (2,7,8,9) then ''02''                      '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) then ''03''          '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (2,6,7,8,9,10,11,12,13,14,15) %s)                  '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLAcompPosiProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(POSIT) POSIT,                                                            '+chr(13)+
'  SUM(ACOMP) TEST                                                              '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select COALESCE(VL_FEMININO_2,0) + COALESCE(VL_MASCULINO_2,0)  ACOMP           '+chr(13)+
'     , 0 POSIT                                                                 '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (2,7,8,9) then ''02''                       '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (6,10,11,12,13,14,15) then ''03''           '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_2 in (2,6,7,8,9,10,11,12,13,14,15) %s                    '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select 0 ACOMP                                                                 '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSIT                        '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_1 in (16)  then ''02''                           '+chr(13)+
'         else ''03''                                                           '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (ID_FAIXA_ETARIA_1 in (6,16) and ' + cNaoGestante + ') %s)               '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLTestPosiProvinciaSexo =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(NEGATIVO+POSITIVO+INDETERMINADO) TEST,                                   '+chr(13)+
'  SUM(POSITIVO) POSIT                                                          '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'      case                                                                     '+chr(13)+
'       when fl_sexo=''M''  then ''02''                                         '+chr(13)+
'      else  ''01''                                                             '+chr(13)+
'      end MES                                                                  '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSITIVO                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_INDETERMINADOS,0) INDETERMINADO           '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_NEGATIVOS,0) NEGATIVO                     '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  ((ID_FAIXA_ETARIA_1 = 6) and ' + cNaoGestante + ')                      '+chr(13)+
'  %s)                                                                          '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLPosiProvinciaSexo =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(%s) POSIT                                                                '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'      case                                                                     '+chr(13)+
'       when fl_sexo=''M''  then ''02''                                         '+chr(13)+
'      else  ''01''                                                             '+chr(13)+
'      end MES                                                                  '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_ACONSELHADOS,0) ACONSELHADOS              '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSITIVO                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_INDETERMINADOS,0) INDETERMINADO           '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_NEGATIVOS,0) NEGATIVO                     '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  1=1                                                                     '+chr(13)+
'  %s)                                                                          '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLAconTestPosProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(ACONSELHADOS) ACONS,                                                     '+chr(13)+
'  SUM(NEGATIVO+POSITIVO+INDETERMINADO) TEST,                                   '+chr(13)+
'  SUM(POSITIVO) POSIT                                                          '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'      case                                                                     '+chr(13)+
'       when (id_faixa_etaria_1=6  and ' + cNaoGestante + ')then ''03''         '+chr(13)+
'       when (id_faixa_etaria_1=16 and ' + cNaoGestante + ')then ''02''         '+chr(13)+
'       when (fl_gestante=1)        then ''01''                                 '+chr(13)+
'      end MES                                                                  '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_ACONSELHADOS,0) ACONSELHADOS              '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSITIVO                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_INDETERMINADOS,0) INDETERMINADO           '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_NEGATIVOS,0) NEGATIVO                     '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (id_faixa_etaria_1 in (6,16) or                                          '+chr(13)+
'       fl_gestante=1)                                                          '+chr(13)+
'       %s)                                                                     '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLPosiProvinciaTrimestral =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(%s) POSIT                                                                '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'      case                                                                     '+chr(13)+
'       when (id_faixa_etaria_1=6  and ' + cNaoGestante + ')then ''03''         '+chr(13)+
'       when (id_faixa_etaria_1=16 and ' + cNaoGestante + ')then ''02''         '+chr(13)+
'       when (fl_gestante=1)        then ''01''                                 '+chr(13)+
'      end MES                                                                  '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_ACONSELHADOS,0) ACONSELHADOS              '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSITIVO                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_INDETERMINADOS,0) INDETERMINADO           '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_NEGATIVOS,0) NEGATIVO                     '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (id_faixa_etaria_1 in (6,16) or                                          '+chr(13)+
'       fl_gestante=1)                                                          '+chr(13)+
'       %s)                                                                     '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLProvinciaTrimestral =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  ANO,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(NEGATIVO+POSITIVO+INDETERMINADO) TEST,                                   '+chr(13)+
'  SUM(POSITIVO) POSIT                                                          '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'       SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                 '+chr(13)+
'     , SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 4 FOR 4) ANO                 '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSITIVO                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_INDETERMINADOS,0) INDETERMINADO           '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_NEGATIVOS,0) NEGATIVO                     '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  1=1 %s)                                                                 '+chr(13)+
'GROUP BY  MES, ANO, PROVINCIA                                                  ';

const sSQLGeralProvinciaTrimestral =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(ACONSELHADOS)ACONSELHADOS,                                               '+chr(13)+
'  SUM(NEGATIVO)NEGATIVO,                                                       '+chr(13)+
'  SUM(INDETERMINADO)INDETERMINADO,                                             '+chr(13)+
'  SUM(POSITIVO) POSITIVO                                                       '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'      case                                                                     '+chr(13)+
'       when (id_faixa_etaria_1=6  and '+ cNaoGestante + ')then ''03''              '+chr(13)+
'       when (id_faixa_etaria_1=16 and '+ cNaoGestante + ')then ''02''              '+chr(13)+
'       when (fl_gestante=1)       then ''01''                                  '+chr(13)+
'      end MES                                                                  '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_ACONSELHADOS,0) ACONSELHADOS              '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSITIVO                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_INDETERMINADOS,0) INDETERMINADO           '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_NEGATIVOS,0) NEGATIVO                     '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (id_faixa_etaria_1 in (6,16) or                                          '+chr(13)+
'       fl_gestante=1)                                                          '+chr(13)+
'       %s)                                                                     '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLCriancasExpostasTrimestral =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(RECEB)  POSIT,                                                           '+chr(13)+
'  SUM(NRECEB) TEST                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'     SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                   '+chr(13)+
'     , case                                                                    '+chr(13)+
'        when VL_Y_4=2 then VL_TARV_4 end RECEB                                 '+chr(13)+
'     , case                                                                    '+chr(13)+
'        when VL_Y_4=3 then VL_TARV_4 end NRECEB                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  (VL_Y_4 IN (2,3)) %s)                                                   '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLObitoTrimestral =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(POSIT)  POSIT,                                                           '+chr(13)+
'  SUM(TEST) TEST                                                               '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'   SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                     '+chr(13)+
' , CASE                                                                        '+chr(13)+
'      WHEN VL_Y_6 IN (1,3) THEN COALESCE(VL_FEMININO_6,0)+COALESCE(VL_MASCULINO_6,0) END POSIT       '+chr(13)+
' , CASE                                                                        '+chr(13)+
'      WHEN VL_Y_6 IN (2,4) THEN COALESCE(VL_FEMININO_6,0)+COALESCE(VL_MASCULINO_6,0) END TEST        '+chr(13)+
' , PROVINCIA.DS_PROVINCIA PROVINCIA                                            '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  (VL_Y_6 IN (1,2,3,4)) %s)                                               '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLGravidasPosiPTVTrimestral =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(POSIT)  POSIT,                                                           '+chr(13)+
'  SUM(TEST) TEST                                                               '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'   SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                     '+chr(13)+
' , 0   POSIT                                                                   '+chr(13)+
' , VL_GESTANTE_32 TEST                                                         '+chr(13)+
' , PROVINCIA.DS_PROVINCIA PROVINCIA                                            '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  1=1 %s                                                                      '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select                                                                         '+chr(13)+
'   SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                     '+chr(13)+
' , 0   POSIT                                                                   '+chr(13)+
' , VL_GESTANTE_3 TEST                                                          '+chr(13)+
' , PROVINCIA.DS_PROVINCIA PROVINCIA                                            '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  (VL_Y_3 in (2,3)) %s                                                    '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select                                                                         '+chr(13)+
'   SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSIT                        '+chr(13)+
'     , 0  TEST                                                                 '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (fl_gestante=1) %s )                                                     '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLAbanTarvProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(ABAN) TEST,                                                              '+chr(13)+
'  SUM(TARV) POSIT                                                              '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select 0 TARV                                                                  '+chr(13)+
'     , COALESCE(VL_FEMININO_54,0) + COALESCE(VL_MASCULINO_54,0) ABAN           '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when VL_Y_54 = 1  then ''02''                                         '+chr(13)+
'         else ''03''                                                           '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (%s) %s                                                                  '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select  COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV         '+chr(13)+
'     , 0 POSIT                                                                 '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (2,7,8,9) then ''02''                      '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) then ''03''          '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (2,6,7,8,9,10,11,12,13,14,15) %s)                  '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLObitoTarvProvincia =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) POSIT,                                                              '+chr(13)+
'  SUM(OBITO) TEST                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'   0 TARV                                                                      '+chr(13)+
' , COALESCE(VL_FEMININO_6,0)+COALESCE(VL_MASCULINO_6,0) OBITO                  '+chr(13)+
' , CASE                                                                        '+chr(13)+
'      when VL_Y_6 in (1,3) then ''02''                                         '+chr(13)+
'      when VL_Y_6 in (2,4) then ''03''                                         '+chr(13)+
'   end  MES                                                                    '+chr(13)+
' , PROVINCIA.DS_PROVINCIA PROVINCIA                                            '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  (VL_Y_6 IN (1,2,3,4)) %s                                                '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select  COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV         '+chr(13)+
'     , 0 OBITO                                                                 '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (2,7,8,9) then ''02''                      '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) then ''03''          '+chr(13)+
'       end  MES                                                                '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (2,6,7,8,9,10,11,12,13,14,15) %s)                  '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLAdultoAcompTarvProvincia2 =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) TEST,                                                              '+chr(13)+
'  SUM(ACOMP) POSIT                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select COALESCE(VL_FEMININO_2,0) + COALESCE(VL_MASCULINO_2,0)  ACOMP           '+chr(13)+
'     , 0 TARV                                                                  '+chr(13)+
'     , SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                 '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_2 in (6,10,11,12,13,14,15) %s                            '+chr(13)+
'UNION ALL                                                                      '+chr(13)+
'select 0 ACOMP                                                                 '+chr(13)+
'     , COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV          '+chr(13)+
'     , SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                 '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) %s)                          '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';


const sSQLGestantePTVAdmissao =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(POSIT)  POSIT,                                                           '+chr(13)+
'  SUM(TEST) TEST                                                               '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'   SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                     '+chr(13)+
' , COALESCE(VL_POS_PARTO_3,0)  +                                               '+chr(13)+
'   COALESCE(VL_POS_PARTO_32,0) +                                               '+chr(13)+
'   COALESCE(VL_PARTOS_3,0)     +                                               '+chr(13)+
'   COALESCE(VL_PARTOS_32,0) POSIT                                              '+chr(13)+
' , COALESCE(VL_GESTANTE_3,0)   +                                               '+chr(13)+
'   COALESCE(VL_GESTANTE_32,0)  TEST                                            '+chr(13)+
' , PROVINCIA.DS_PROVINCIA PROVINCIA                                            '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  (VL_Y_3 in (2,3) or VL_Y_32 in (2,3)) %s)                               '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const sSQLGestantePTVLocal =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(POSIT)  POSIT,                                                           '+chr(13)+
'  SUM(TEST) TEST                                                               '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'   CASE                                                                        '+chr(13)+
'      when (VL_Y_3=5) or (VL_Y_33=5) then 1                                    '+chr(13)+
'      when (VL_Y_3=6) or (VL_Y_33=6) then 2                                    '+chr(13)+
'      when (VL_Y_3=7) or (VL_Y_33=7) then 3                                    '+chr(13)+
'   end  MES                                                                    '+chr(13)+
' , COALESCE(VL_POS_PARTO_3,0)  +                                               '+chr(13)+
'   COALESCE(VL_POS_PARTO_33,0) +                                               '+chr(13)+
'   COALESCE(VL_PARTOS_3,0)     +                                               '+chr(13)+
'   COALESCE(VL_PARTOS_33,0) POSIT                                              '+chr(13)+
' , COALESCE(VL_GESTANTE_3,0)   +                                               '+chr(13)+
'   COALESCE(VL_GESTANTE_33,0)  TEST                                            '+chr(13)+
' , PROVINCIA.DS_PROVINCIA PROVINCIA                                            '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  (VL_Y_3 in (5,6,7) or VL_Y_33 in (5,6,7)) %s)                           '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

const cFaixaAdulto    = '(ID_FAIXA_ETARIA_1 =  6)';
const cFaixaCrianca   = '(ID_FAIXA_ETARIA_1 = 16)';
const cFaixaGestante  = '(FL_GESTANTE = 1)';
const cFaixaPessoas   = '(ID_FAIXA_ETARIA_1 IN (6,16) OR ' +
                           cFaixaGestante + ')';
const cFaixaCriancaNaoGestante = '((ID_FAIXA_ETARIA_1 =  16) and ' +
                                  cNaoGestante + ')';
const cFaixaAdultoNaoGestante = '((ID_FAIXA_ETARIA_1 =  6) and ' +
                                  cNaoGestante + ')';
const cFaixaAbandono  = 'VL_Y_54 in (1,2)';
const cFaixaTransferencia = 'VL_Y_54 in (3,4)';


//*****************************************************************
const sSQLAconTestPosProvinciaAno =
'SELECT                                                                         '+chr(13)+
'  TIPO,                                                                        '+chr(13)+
'  ANO,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(ACONSELHADOS) ACONS,                                                     '+chr(13)+
'  SUM(NEGATIVO+POSITIVO+INDETERMINADO) TEST,                                   '+chr(13)+
'  SUM(POSITIVO) POSIT                                                          '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'      case                                                                     '+chr(13)+
'       when (id_faixa_etaria_1=6  and ' + cNaoGestante + ')then ''03''         '+chr(13)+
'       when (id_faixa_etaria_1=16 and ' + cNaoGestante + ')then ''02''         '+chr(13)+
'       when (fl_gestante=1)        then ''01''                                 '+chr(13)+
'      end TIPO                                                                 '+chr(13)+
'     , VL_ANO ANO                                                              '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_ACONSELHADOS,0) ACONSELHADOS              '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_POSITIVOS,0) POSITIVO                     '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_INDETERMINADOS,0) INDETERMINADO           '+chr(13)+
'     , COALESCE(REGISTRO_PROGRAMA.VL_NEGATIVOS,0) NEGATIVO                     '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where (id_faixa_etaria_1 in (6,16) or                                          '+chr(13)+
'       fl_gestante=1)                                                          '+chr(13)+
'       %s)                                                                     '+chr(13)+
'GROUP BY  TIPO,ANO,PROVINCIA                                                       ';

const sSQLAcompProvinciaAno =
'SELECT                                                                         '+chr(13)+
'  TIPO,                                                                        '+chr(13)+
'  ANO,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(ACOMP) ACOMP                                                             '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select COALESCE(VL_FEMININO_2,0) + COALESCE(VL_MASCULINO_2,0)  ACOMP           '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (2,7,8,9) then ''02''                       '+chr(13)+
'         when ID_FAIXA_ETARIA_2 in (6,10,11,12,13,14,15) then ''03''           '+chr(13)+
'       end  TIPO                                                               '+chr(13)+
'     , VL_ANO ANO                                                              '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_2 in (2,6,7,8,9,10,11,12,13,14,15) %s)                   '+chr(13)+
'GROUP BY  TIPO,ANO,PROVINCIA                                                       ';

const sSQLTarvProvinciaAno =
'SELECT                                                                         '+chr(13)+
'  TIPO,                                                                        '+chr(13)+
'  ANO,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(TARV) TARV                                                               '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'       COALESCE(VL_FEMININO_52,0) + COALESCE(VL_MASCULINO_52,0)  TARV          '+chr(13)+
'     , case                                                                    '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (2,7,8,9) then ''02''                      '+chr(13)+
'         when ID_FAIXA_ETARIA_52 in (6,10,11,12,13,14,15) then ''03''          '+chr(13)+
'       end  TIPO                                                               '+chr(13)+
'     , VL_ANO ANO                                                              '+chr(13)+
'     , PROVINCIA.DS_PROVINCIA PROVINCIA                                        '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where ID_FAIXA_ETARIA_52 in (2,6,7,8,9,10,11,12,13,14,15) %s)                  '+chr(13)+
'GROUP BY  TIPO,ANO,PROVINCIA                                                       ';

const sSQLObitoProvinciaAno =
'SELECT                                                                         '+chr(13)+
'  MES,                                                                         '+chr(13)+
'  PROVINCIA,                                                                   '+chr(13)+
'  SUM(POSIT)  POSIT,                                                           '+chr(13)+
'  SUM(TEST) TEST                                                               '+chr(13)+
'FROM (                                                                         '+chr(13)+
'select                                                                         '+chr(13)+
'   SUBSTRING(REGISTRO_PROGRAMA.VL_MESANO FROM 1 FOR 2) MES                     '+chr(13)+
' , CASE                                                                        '+chr(13)+
'      WHEN VL_Y_6 IN (1,3) THEN COALESCE(VL_FEMININO_6,0)+COALESCE(VL_MASCULINO_6,0) END POSIT       '+chr(13)+
' , CASE                                                                        '+chr(13)+
'      WHEN VL_Y_6 IN (2,4) THEN COALESCE(VL_FEMININO_6,0)+COALESCE(VL_MASCULINO_6,0) END TEST        '+chr(13)+
' , PROVINCIA.DS_PROVINCIA PROVINCIA                                            '+chr(13)+
'from VW_REGISTRO_PROGRAMA REGISTRO_PROGRAMA                                    '+chr(13)+
'  join PROVINCIA                                                               '+chr(13)+
'  on REGISTRO_PROGRAMA.CD_PROVINCIA = PROVINCIA.CD_PROVINCIA                   '+chr(13)+
'where  (VL_Y_6 IN (1,2,3,4)) %s)                                               '+chr(13)+
'GROUP BY  MES, PROVINCIA                                                       ';

implementation
end.
