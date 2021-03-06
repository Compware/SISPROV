unit uScripts;

interface
uses variants, uGeralSQL, UGeral;

type
  TVersao = Record
    Codigo: integer;
    Nome: string;
end;

type
  TScripts = Record
    ID: integer;
    Versao: integer;
    Codigo: integer;
    Sql,Nome, Tipo: string;
    Params:variant;
end;

procedure InicializaScript;
procedure IncluiVersao(nVersao:integer; sVersao:string);

var
 Versao:array of TVersao;
 Script:array of array of TScripts;
 cPROCCAMPOCHAVE, cPROCCAMPOUND, cPROCEXECMETA, cPROCTRIGEDI, cPROCDIGFIS,
 cPROCREQNOT,cProcIncluiAuditoria, cPROGDEPARA: integer;
 mParams, vEmpty:variant;

implementation

uses uConstanteScript, sysUtils, uScripts_55;

procedure IncluiVersao(nVersao:integer; sVersao:string);
begin
  SetLength(Versao,nVersao+1);
  Versao[nVersao].Codigo := nVersao+1;
  Versao[nVersao].Nome   := sVersao;
end;

procedure InicializaScript;
var codigo, count, versao:integer;
  sVersao,sTMP:string;
  procedure Insere(sql,nome,tipo:string);
  begin
    inc(count);
    inc(codigo);
    SetLength(Script,versao+1);
    SetLength(Script[versao],codigo+1);
    Script[versao,codigo].Versao := versao;
    Script[versao,codigo].ID     := count;
    Script[versao,codigo].Codigo := codigo;
    Script[versao,codigo].Nome   := nome;
    Script[versao,codigo].Tipo   := tipo;
    Script[versao,codigo].Sql    := sql;
    Script[versao,codigo].Params    := mParams;
  end;
begin
  count  := -1;

  codigo := -1;
  Versao := 52; sVersao := '2.1.0-22';
  IncluiVersao(Versao,sVersao);

  //Este deve ser adicionado ap�s todos Scripts da Vers�o
  Insere(Format(cvUpdateDadosVersao,[sVersao]),'Atualiza de Vers�o do Sistema','');

  //LH - 30.01.2016
  codigo := -1;
  Versao := 53; sVersao := '2.1.0-23';
  IncluiVersao(Versao,sVersao);
  Insere(cvScript300116_1, 'Duplicidade Municipio','');

  //Este deve ser adicionado ap�s todos Scripts da Vers�o
  Insere(Format(cvUpdateDadosVersao,[sVersao]),'Atualiza de Vers�o do Sistema','');

  //LH - 18.02.2016
  codigo := -1;
  Versao := 54; sVersao := '2.1.0-24';
  IncluiVersao(Versao,sVersao);
  Insere('', 'Requisita Notifica��o','PROCREQNOT');

  //Este deve ser adicionado ap�s todos Scripts da Vers�o
  Insere(Format(cvUpdateDadosVersao,[sVersao]),'Atualiza de Vers�o do Sistema','');

  //LH - 22.03.2016
  codigo := -1;
  Versao := 55; sVersao := '2.1.0-25';
  IncluiVersao(Versao,sVersao);

  //LH - 16.04.2016
  codigo := -1;
  Versao := 56; sVersao := '2.1.0-26';
  IncluiVersao(Versao,sVersao);

  Insere('DELETE FROM SCRIPT','','');

  sTMP := StringReplace(cvCREATE_MAPA_LAB,
   'MAPA_LAB','MAPA_LAB_TMP',[]);
  Insere(sTMP,'','');
  sTMP := StringReplace(cvCREATE_MAPA_LAB_PACIENTE,
   'MAPA_LAB_PACIENTE','MAPA_LAB_PACIENTE_TMP',[]);
  Insere(sTMP,'','');
  sTMP := StringReplace(cvCREATE_MAPA_TESTAGEM,
   'MAPA_TESTAGEM','MAPA_TESTAGEM_TMP',[]);
  Insere(sTMP,'','');
  sTMP := StringReplace(cvCREATE_MAPA_TESTAGEM_PACIENTE,
   'MAPA_TESTAGEM_PACIENTE','MAPA_TESTAGEM_PACIENTE_TMP',[]);
  Insere(sTMP,'','');
  sTMP := StringReplace(cvCREATE_MAPA_TESTE_RAPIDO,
   'MAPA_TESTE_RAPIDO','MAPA_TESTE_RAPIDO_TMP',[]);
  Insere(sTMP,'','');
  sTMP := StringReplace(cvCREATE_MAPA_TESTE_RAPIDO_PACIENTE,
   'MAPA_TESTE_RAPIDO_PACIENTE','MAPA_TESTE_RAPIDO_PACIENTE_TMP',[]);
  Insere(sTMP,'','');
  sTMP := StringReplace(cvCREATE_MAPA_MEDICO,
   'MAPA_MEDICO','MAPA_MEDICO_TMP',[]);
  Insere(sTMP,'','');
  sTMP := StringReplace(cvCREATE_MAPA_MEDICO_LINHA,
   'MAPA_MEDICO_LINHA','MAPA_MEDICO_LINHA_TMP',[]);
  Insere(sTMP,'','');

  Insere(cvDROP_MAPA_LAB+'_TMP','','');
  Insere(cvDROP_MAPA_LAB_PACIENTE+'_TMP','','');
  Insere(cvDROP_MAPA_TESTAGEM+'_TMP','','');
  Insere(cvDROP_MAPA_TESTAGEM_PACIENTE+'_TMP','','');
  Insere(cvDROP_MAPA_TESTE_RAPIDO+'_TMP','','');
  Insere(cvDROP_MAPA_TESTE_RAPIDO_PACIENTE+'_TMP','','');
  Insere(cvDROP_MAPA_MEDICO+'_TMP','','');
  Insere(cvDROP_MAPA_MEDICO_LINHA+'_TMP','','');

  Insere('','','RECON');

  Insere('MAPA_LAB', 'MAPA_LAB_TMP','PROGDEPARA');
  Insere('MAPA_LAB_PACIENTE', 'MAPA_LAB_PACIENTE_TMP','PROGDEPARA');
  Insere('MAPA_TESTAGEM', 'MAPA_TESTAGEM_TMP','PROGDEPARA');
  Insere('MAPA_TESTAGEM_PACIENTE', 'MAPA_TESTAGEM_PACIENTE_TMP','PROGDEPARA');
  Insere('MAPA_TESTE_RAPIDO', 'MAPA_TESTE_RAPIDO_TMP','PROGDEPARA');
  Insere('MAPA_TESTE_RAPIDO_PACIENTE', 'MAPA_TESTE_RAPIDO_PACIENTE_TMP','PROGDEPARA');
  Insere('MAPA_MEDICO', 'MAPA_MEDICO_TMP','PROGDEPARA');
  Insere('MAPA_MEDICO_LINHA', 'MAPA_MEDICO_LINHA_TMP','PROGDEPARA');

  Insere(cvDROP_MAPA_LAB,'','');
  Insere(cvDROP_MAPA_LAB_PACIENTE,'','');
  Insere(cvDROP_MAPA_TESTAGEM,'','');
  Insere(cvDROP_MAPA_TESTAGEM_PACIENTE,'','');
  Insere(cvDROP_MAPA_TESTE_RAPIDO,'','');
  Insere(cvDROP_MAPA_TESTE_RAPIDO_PACIENTE,'','');
  Insere(cvDROP_MAPA_MEDICO,'','');
  Insere(cvDROP_MAPA_MEDICO_LINHA,'','');

  Insere('','','RECON');

  Insere(cvCREATE_MAPA_LAB,'','');
  Insere(cvCREATE_MAPA_LAB_PACIENTE,'','');
  Insere(cvCREATE_MAPA_TESTAGEM,'','');
  Insere(cvCREATE_MAPA_TESTAGEM_PACIENTE,'','');
  Insere(cvCREATE_MAPA_TESTE_RAPIDO,'','');
  Insere(cvCREATE_MAPA_TESTE_RAPIDO_PACIENTE,'','');
  Insere(cvCREATE_MAPA_MEDICO,'','');
  Insere(cvCREATE_MAPA_MEDICO_LINHA,'','');

  Insere('MAPA_LAB_TMP', 'MAPA_LAB','PROGDEPARAX');
  Insere('MAPA_LAB_PACIENTE_TMP', 'MAPA_LAB_PACIENTE','PROGDEPARAX');
  Insere('MAPA_TESTAGEM_TMP', 'MAPA_TESTAGEM','PROGDEPARAX');
  Insere('MAPA_TESTAGEM_PACIENTE_TMP', 'MAPA_TESTAGEM_PACIENTE','PROGDEPARAX');
  Insere('MAPA_TESTE_RAPIDO_TMP', 'MAPA_TESTE_RAPIDO','PROGDEPARAX');
  Insere('MAPA_TESTE_RAPIDO_PACIENTE_TMP', 'MAPA_TESTE_RAPIDO_PACIENTE','PROGDEPARAX');
  Insere('MAPA_MEDICO_TMP', 'MAPA_MEDICO','PROGDEPARAX');
  Insere('MAPA_MEDICO_LINHA_TMP', 'MAPA_MEDICO_LINHA','PROGDEPARAX');

  Insere(cvCREATE_GEN_MAPA_LINHA,'','');
  Insere(cvCREATE_GEN_MAPA_MEDICO,'','');
  Insere(cvCREATE_GEN_MAPA_PACIENTE,'','');
  Insere(cvCREATE_GEN_MAPA_TESTAGEM,'','');
  Insere(cvCREATE_GEN_MAPA_LAB,'','');
  Insere(cvCREATE_GEN_MAPA_LAB_PACIENTE,'','');
  Insere(cvCREATE_GEN_MAPA_TESTE_RAPIDO,'','');
  Insere(cvCREATE_GEN_TESTE_RAPIDO_PACIENTE,'','');

  Insere(cvCREATE_INDEX_IDX_MAPA_TESTAGEM_1,'','');

  //Este deve ser adicionado ap�s todos Scripts da Vers�o
  Insere(Format(cvUpdateDadosVersao,[sVersao]),'Atualiza de Vers�o do Sistema','');


  //LH - 02.07.2016
  codigo := -1;
  Versao := 57; sVersao := '2.1.0-27';
  IncluiVersao(Versao,sVersao);
  //Insere(cvCREATE_FORMA,'','');

end;

end.
