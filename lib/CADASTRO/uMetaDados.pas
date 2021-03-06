unit uMetaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IBSQL, Buttons, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids, ComCtrls;

type
  TfrmMetaDados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    mLog: TMemo;
    mSQL: TMemo;
    IBSQL: TIBSQL;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    IBQ: TIBQuery;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lsScripts: TListBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    Panel3: TPanel;
    btExecutar: TButton;
    Button1: TButton;
    btTodos: TButton;
    Button2: TButton;
    btLog: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    cbVersao: TComboBox;
    Splitter2: TSplitter;
    ckTodos: TCheckBox;
    ckID: TCheckBox;
    IBQ2: TIBQuery;
    tbDe: TIBDataSet;
    tbPara: TIBDataSet;
    qyCampos: TIBQuery;
    qyCamposNM_CAMPO: TIBStringField;
    procedure btExecutarClick(Sender: TObject);
    procedure lsScriptsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbVersaoChange(Sender: TObject);
    procedure btTodosClick(Sender: TObject);
    procedure btLogClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IBQAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure RecriaCamposChave;
    procedure RecriaCamposUnd;
    procedure ExecutaMeta;
    procedure CriaTrigerEdi;
    procedure ProcDigFis;
    procedure ProcIncluiAuditoria;
    procedure RequisitaNotificacao;
    procedure MontaDataSet(nmTabela: String; ibds: TIBDataSet);
  public
    { Public declarations }
    sDir:string;
    FsDE,FsPARA:string;
    FbExc:boolean;
    procedure CarregaVersao;
    procedure CopiarDePara(psDe, psPara: string; pbExcluir:boolean = false);
  end;

var
  frmMetaDados: TfrmMetaDados;
  id:integer;
  tipo:string;
  mParams:variant;

implementation

uses uScripts, UDM, UGeralSQL, uConstanteScript, UGeral, UDMDIG, UDMGERAL;

{$R *.dfm}

procedure TfrmMetaDados.CopiarDePara(psDe,psPara:string; pbExcluir:boolean);
var
  i:integer;
begin
  MontaDataSet(psDe,tbDe);
  MontaDataSet(psPara,tbPara);

  tbPara.Open;
  tbDe.Open;
  tbDe.First;
  while Not tbDe.Eof do
  begin
    try
      tbPara.Insert;
      for i:=0 to tbDe.FieldCount-1 do
        tbPara.FieldByName(tbDe.Fields[i].FieldName).Value := tbDe.Fields[i].value;
      tbPara.Post;
      Application.ProcessMessages;
      if pbExcluir then
         tbDe.Delete
      else
         tbDe.Next;
      dm.Commit(tbPara);
    except
      on E:Exception do
      begin
        mLog.lines.add('Para:'+psPara+' RecNo:' +  intToStr(tbDe.RecNo) + 'Erro: ' + e.Message);
        tbPara.Cancel;
        tbDe.Next;
      end;
    end;
  end;
  tbPara.Close;
  tbDe.Close;
end;

procedure TfrmMetaDados.MontaDataSet(nmTabela: String; ibds: TIBDataSet);
var sName,sSelect,sInsert,sUpdate,sDelete:String;
    sAuxI1, sAuxI2, sAuxU, sAuxW:String;
    i:Integer;
begin
  try
    qyCampos.Close;
    qyCampos.Params.ParamByName('NM_TABELA').Value := nmTabela;
    qyCampos.Open;
    if qyCampos.IsEmpty then
      Raise Exception.Create('Campo Chave nao definido!');

    sSelect := 'SELECT * FROM '+nmTabela; //+' where 1=2';
    sInsert := 'INSERT INTO '+nmTabela+'(%s) VALUES(%s)';
    sUpdate := 'UPDATE '+nmTabela+' set %s where %s';
    sDelete := 'DELETE FROM '+nmTabela+' where %s';
    sAuxI1 := '';
    sAuxI2 := '';
    sAuxU := '';
    sAuxW := '';

    ibds.Database := qyCampos.Database;
    ibds.Transaction := qyCampos.Transaction;
    
    ibds.Close;
    ibds.SelectSQL.Text := sSelect;
    ibds.InsertSQL.Text := '';
    ibds.ModifySQL.Text := '';
    ibds.DeleteSQL.Text := '';
    ibds.Open;

    for i:=0 to ibds.Fields.Count -1 do
    begin
       sName := ibds.Fields[i].FieldName;
       sAuxI1 := sAuxI1 + sName;
       sAuxI2 := sAuxI2 + ':' + sName;

       sAuxU := sAuxU + sName + ' = :' +sName;

       if (i<>ibds.Fields.Count-1) then
       begin
         sAuxI1 := sAuxI1 + ',';
         sAuxI2 := sAuxI2 + ',';
         sAuxU := sAuxU + ',' + chr(13);
       end;
    end;

    //Campos Chaves
    while not qyCampos.eof do
    begin
       sName := trim(qyCamposNM_CAMPO.AsString);
       sAuxW := sAuxW + sName + ' = :OLD_' +sName;
       qyCampos.Next;
       if not qyCampos.eof then
       begin
         sAuxW := sAuxW + chr(13) + 'and ';
       end;
    end;

    ibds.Close;
    ibds.InsertSQL.Text := Format(sInsert,[sAuxI1,sAuxI2]);
    ibds.ModifySQL.Text := Format(sUpdate,[sAuxU,sAuxW]);
    ibds.DeleteSQL.Text := Format(sDelete,[sAuxW]);
  except
     on E:Exception do
       Raise Exception.Create('Erro:' + nmTabela + chr(13) + e.Message);
  end;
end;

procedure TfrmMetaDados.btExecutarClick(Sender: TObject);
var ix:integer; v:Variant;
begin
  if PageControl1.ActivePageIndex = 0 then
     IBQ.Close;

  dm.Transacao(IBQ);

  try
   id := Script[cbVersao.ItemIndex,lsScripts.ItemIndex].ID;
   tipo := Script[cbVersao.ItemIndex,lsScripts.ItemIndex].tipo;
   //Verificar se Script ja foi Rodado
   if ckID.Checked then
   begin
     try
       v := PegaValor('CD_SCRIPT','SCRIPT',['CD_SCRIPT'],[id],nil);
       if not VarIsNull(v) then
         ix := strToInt(VarToStr(v));
     except
       ix := -1;
     end;
   end
   else
    ix := -1;


   if (id <> ix) then
   begin
     if (tipo = 'RECON') then
     begin
        dm.DB.Close; dm.DB.Open; dm.TS.Active := true;
     end
     else
     if (tipo = 'PROGDEPARA')or(tipo = 'PROGDEPARAX') then
     begin
       FbExc := (tipo = 'PROGDEPARAX');
       FsDE := Script[cbVersao.ItemIndex,lsScripts.ItemIndex].Sql;
       FsPARA := Script[cbVersao.ItemIndex,lsScripts.ItemIndex].Nome;
       CopiarDePara(FsDE,FsPARA,FbExc);
     end
     else
     begin
       ibSQL.SQL.Text := mSQL.Text;
       ibSQL.Prepare;
       if not VarIsEmpty(mParams) then
           ibSQL.Params.ByName(mParams[0]).Value := mParams[1];
       ibSQL.ExecQuery;
     end;
     mLog.Lines.Add(lsScripts.Items[lsScripts.ItemIndex] + ' - Sucesso!');
     ibSQL.SQL.Text := 'select * from SCRIPT where 1=2';
     ibSQL.Prepare;
     if ibSQL.FieldIndex['CD_UND'] > 0 then
       ibSQL.SQL.Text := Format(cvInserTableSCRIPT,['CD_UND,',prmUnidade+','])
     else
       ibSQL.SQL.Text := Format(cvInserTableSCRIPT,['','']);

     ibSQL.ParamByName('CD_SCRIPT').AsInteger := id;
     ibSQL.ExecQuery;
     dm.Commit(ibQ);
   end
   else
     mLog.Lines.Add(lsScripts.Items[lsScripts.ItemIndex] + ' - J� foi rodado!');;
  except
   on E:Exception do
   begin
     dm.Rollback(dm.IBD);
     mLog.Lines.Add('Erro:' + lsScripts.Items[lsScripts.ItemIndex]);
     mLog.Lines.Add('    ' + e.Message);
   end;
  end;
end;

procedure TfrmMetaDados.CarregaVersao;
var i:Integer;
begin
  cbVersao.Clear;
  for i:=Low(Versao) to High(Versao) do
    cbVersao.Items.Add(Versao[i].Nome);
end;

procedure TfrmMetaDados.lsScriptsClick(Sender: TObject);
var x,y:integer;
begin
  x := cbVersao.ItemIndex;
  y := lsScripts.ItemIndex;
  mSQL.Text := Script[x,y].Sql;
  mParams := vEmpty;
  if varType(Script[x,y].Params)<>varEmpty then
      mParams := Script[x,y].Params;
end;

procedure TfrmMetaDados.FormCreate(Sender: TObject);
begin
  //InicializaVersao;
  InicializaScript;
  CarregaVersao;
end;

procedure TfrmMetaDados.cbVersaoChange(Sender: TObject);
var i,ix:Integer;
begin
  lsScripts.Clear;
  ix := cbVersao.ItemIndex;
  for i:=Low(Script[ix]) to High(Script[ix]) do
    lsScripts.Items.Add(Script[ix,i].Nome);
end;

procedure TfrmMetaDados.btTodosClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to lsScripts.Items.Count-1 do
  begin
    dm.DB.Close; dm.DB.Open;
    ibq.Close;
    lsScripts.ItemIndex := i;
    lsScriptsClick(Sender);
    Sleep(3000);
    btExecutarClick(Sender);
  end;
  btLogClick(Sender);
end;

procedure TfrmMetaDados.btLogClick(Sender: TObject);
var mmLog:TStringList;
begin
  sDir := ExtractFilePath(Application.ExeName)+'\Log';
  if not DirectoryExists(sDir) then
   CreateDir(sDir);
  sDir := sDir + '\Log'+FormatDateTime('ddmmyy',Date)+'.txt' ;
  mmLog := TStringList.Create;
  try
    if FileExists(sDir) then
      mmLog.LoadFromFile(sDir);
    mmLog.Add(mLog.Lines.Text);
    mmLog.SaveToFile(sDir);
  finally
    mmLog.Free;
  end;
end;

procedure TfrmMetaDados.Button1Click(Sender: TObject);
begin
  if IBSQL.Transaction.InTransaction then
     IBSQL.Transaction.Commit;
end;

procedure TfrmMetaDados.Button2Click(Sender: TObject);
begin
  if IBSQL.Transaction.InTransaction then
     IBSQL.Transaction.Rollback;
end;

procedure TfrmMetaDados.ExecutaMeta;
var i:Integer; sMeta,acao:String;
     procedure Exec;
     begin
       try
         dm.Transacao(dm.IBD);
         mSQL.Text := IBQ.FieldByName('Instrucao').AsString;
         IBSQL.SQL.Text := mSQL.Text;
         IBSQL.ExecQuery;
         acao := IBQ.FieldByName('Acao').AsString;
         dm.Commit(dm.IBD);
         mLog.Lines.add(Acao + ': ' + IBQ.FieldByName('Tabela').AsString + ' OK!');
       except
         on E:Exception do
         begin
           mLog.Lines.add(Acao + ': ' + IBSQL.SQL.Text + chr(13) + ' Erro:' + e.Message);
           dm.Rollback(dm.IBD);
         end;
       end;
     end;
begin
  sMeta := 'Select * from TMP_META where flex = ''N'' order by Ordem';
  if (IBQ.SQL.Text <> sMeta) and (not IBQ.Active) then
  begin
    IBQ.Close;
    IBQ.SQL.Text := sMeta;
    IBQ.Open;
    IBQ.First;
    PageControl1.ActivePageIndex := 1;
  end;
  
  begin
    if ckTodos.Checked then
    begin
      while Not IBQ.Eof do
      begin
         Exec;
         IBQ.Next;
      end;
    end
    else
      Exec;
    //IBQ.Close;
  end;
end;

procedure TfrmMetaDados.RecriaCamposChave;
var lst, lstTB:TStringList;  i:integer;
    sTabela, sTabelaFK, sTabelaRF, sCamposRF, sCamposFk, sCamposPK, sNome,
    sTipo:String;
    qyTabelas, qyCampos, qyFK:TIBQuery;

    procedure Grava(Ordem, Acao:String);
    var i:integer; sTabela:string;
    begin
       for i:=0 to lst.Count-1 do
       begin
         IBSQL.SQL.Text := 'INSERT INTO TMP_META VALUES(:Ordem,:Acao,:Instrucao,:Tabela,''N'')';
         IBSQL.ParamByName('Ordem').AsString := Ordem;
         IBSQL.ParamByName('Acao').AsString := Acao;
         IBSQL.ParamByName('Instrucao').AsString := lst.Strings[i];
         sTabela := trim(lstTB.Strings[i]);
         IBSQL.ParamByName('Tabela').AsString := sTabela;
         IBSQL.ExecQuery;
       end;
       lst.Clear;
       lstTB.Clear;
    end;
begin
   lst := TStringList.Create;
   lstTB := TStringList.Create;
   qyTabelas := TIBQuery.Create(nil);
   qyCampos := TIBQuery.Create(nil);
   qyFK := TIBQuery.Create(nil);

   try
     try
       qyTabelas.Database := dm.DB;
       qyTabelas.Transaction := dm.TS;
       qyTabelas.SQL.Text := 'select TABELA from VWTABELAS';
       qyTabelas.Open;

       qyCampos.Database := dm.DB;
       qyCampos.Transaction := dm.TS;


       qyFK.Database := dm.DB;
       qyFK.Transaction := dm.TS;
       qyFK.SQL.Text := cvSelectDadosRelations;

       qyTabelas.First;
       while not qyTabelas.Eof do
       begin
         sTabela := trim(qyTabelas.FieldByName('TABELA').AsString);
         //Drop Constraint
         sTipo := 'FOREIGN KEY';
         qyFk.Close;
         qyFk.ParamByName('TABELA').AsString := sTabela;
         qyFk.ParamByName('TIPO').AsString := sTipo;
         qyFk.Open;
         qyFk.First;
         while not qyFk.Eof do
         begin
           sNome := qyFk.FieldByName('NOME').AsString;
           lst.Add(Format(cvAlterTableConst1,[sTabela,sNome])+';');
           lstTB.Add(sTabela);
           qyFk.Next;
         end;
         qyTabelas.Next;
       end;
       Grava('1','DropFK');

       qyTabelas.First;
       while not qyTabelas.Eof do
       begin
         sTabela := trim(qyTabelas.FieldByName('TABELA').AsString);
         sTipo := 'PRIMARY KEY';
         qyFk.Close;
         qyFk.ParamByName('TABELA').AsString := sTabela;
         qyFk.ParamByName('TIPO').AsString := sTipo;
         qyFk.Open;
         qyFk.First;
         while not qyFk.Eof do
         begin
           sNome := qyFk.FieldByName('NOME').AsString;
           lst.Add(Format(cvAlterTableConst1,[sTabela,sNome])+';');
           lstTB.Add(sTabela);
           qyFk.Next;
         end;
         qyTabelas.Next;
       end;
       Grava('2','DropPK');


       qyTabelas.First;
       while not qyTabelas.Eof do
       begin
         sTabela := trim(qyTabelas.FieldByName('TABELA').AsString);
         //Create Constraint
         sTipo := 'PRIMARY KEY';
         sNome := Copy(sTabela,1,28) + '_PK';
         qyCampos.Close;
         qyCampos.SQL.Text := cvSelectDadosConstraintsFields;
         qyCampos.ParamByName('TABELA').AsString := sTabela;
         qyCampos.ParamByName('TIPO').AsString := sTipo;
         qyCampos.Open;
         sCamposPk := '';
         qyCampos.First;
         while Not qyCampos.Eof do
         begin
           sCamposPk := sCamposPk + Trim(qyCampos.FieldByName('CAMPO').AsString);
           qyCampos.Next;
           if Not qyCampos.Eof then
             sCamposPk := sCamposPk + ',';
         end;
         if sCamposPk <> '' then
         begin
           sCamposPk := sCamposPk + ',CD_UND';
           lst.Add('ALTER TABLE ' + sTabela + ' ADD CONSTRAINT ' + sNome + ' ' +
             sTipo + '(' + sCamposPk + ');');
           lstTB.Add(sTabela);
         end;
         qyTabelas.Next;
       end;
       Grava('3','CreatePK');

       qyTabelas.First;
       while not qyTabelas.Eof do
       begin
         sTabela := trim(qyTabelas.FieldByName('TABELA').AsString);
         sTipo := 'FOREIGN KEY';
         qyFk.Close;
         qyFk.ParamByName('TABELA').AsString := sTabela;
         qyFk.ParamByName('TIPO').AsString := sTipo;
         qyFk.Open;
         i:=0;
         while not qyFk.Eof do
         begin
           inc(i);
           sNome := Copy(sTabela,1,26) + '_' + intToStr(i) + '_FK';
           qyCampos.Close;
           qyCampos.SQL.Text := cvSelectDadosConstraintsFieldsFK;
           qyCampos.ParamByName('NOME_FK').AsString := qyFk.FieldByName('NOME').AsString;
           qyCampos.Open;
           sCamposFk := '';
           sCamposRF := '';
           qyCampos.First;
           sTabelaFK := Trim(qyCampos.FieldByName('TABELA_FK').AsString);
           sTabelaRF := Trim(qyCampos.FieldByName('TABELA_RF').AsString);
           while Not qyCampos.Eof do
           begin
             sCamposFk := sCamposFk + Trim(qyCampos.FieldByName('CAMPO_FK').AsString);
             sCamposRF := sCamposRF + Trim(qyCampos.FieldByName('CAMPO_RF').AsString);
             qyCampos.Next;
             if Not qyCampos.Eof then
             begin
               sCamposFk := sCamposFk + ',';
               sCamposRF := sCamposRF + ',';
             end;
           end;
           if (sCamposRF <> '') then
           begin
             sCamposRF := sCamposRF + ',CD_UND';
             sCamposFk := sCamposFk + ',CD_UND';
             lst.Add('ALTER TABLE ' + sTabela + ' ADD CONSTRAINT ' + sNome + ' ' +
               sTipo + '(' + sCamposFk + ') REFERENCES ' + sTabelaRF +
               '(' + sCamposRF +');');
             lstTB.Add(sTabela);
           end;
           qyFk.Next;
         end;
         qyTabelas.Next;
       end;
       Grava('4','CreateFK');
     except
        on E:Exception do
          mLog.Lines.add('Recriando Chaves - Erro:' + e.Message);
     end;

   finally
     FreeAndNil(qyCampos);
     FreeAndNil(qyTabelas);
     FreeAndNil(qyFK);
     FreeAndNil(lst);
     FreeAndNil(lstTB);
   end;
end;

procedure TfrmMetaDados.RecriaCamposUnd;
var qyTabelas:TIBQuery;  sTabela:String;
    i:Integer; sMeta,acao:String;
     procedure Exec;
     begin
        dm.Transacao(dm.IBD);
        try
          sTabela := Trim(IBQ.FieldByName('TABELA').AsString);
          ibSQL.SQL.Text := Format(cvAlterTableCdUnd1,[sTabela]);
          ibSQL.ExecQuery;
          ibSQL.SQL.Text := Format(cvAlterTableCdUnd2,[sTabela]);
          ibSQL.ExecQuery;
          ibSQL.SQL.Text := Format(cvUpdateDadosUnd,[sTabela, prmUnidade]);
          dm.Commit(dm.IBD);
          ibSQL.ExecQuery;
          mLog.Lines.Add('Recriado Campos Und ' + sTabela + ' - ok!');
        except
          on E:Exception do
          begin
            mLog.Lines.Add('Recriando Campos Und ' + sTabela + '- Erro:' + e.Message);
          end;
        end;
     end;
begin
  sMeta := 'Select * from VWTABELAS';
  if (IBQ.SQL.Text <> sMeta) and (not IBQ.Active) then
  begin
    IBQ.Close;
    IBQ.SQL.Text := sMeta;
    IBQ.Open;
    IBQ.First;
    PageControl1.ActivePageIndex := 1;
  end;

  begin
    if ckTodos.Checked then
    begin
      while not IBQ.Eof do
      begin
         Exec;
         IBQ.Next;
      end
    end
    else
      Exec;
  end;
end;

procedure TfrmMetaDados.IBQAfterScroll(DataSet: TDataSet);
var sTabela:String;
begin
  if (PageControl1.ActivePageIndex = 1) and (IBQ.Active) then
  begin
   if ID = cPROCCAMPOUND then
   begin
      sTabela := Trim(IBQ.FieldByName('TABELA').AsString);
      mSQl.Text := Format(cvAlterTableCdUnd1,[sTabela]);
   end
   else if ID = cPROCEXECMETA then
      mSQl.Text := IBQ.FieldByName('Instrucao').AsString;
  end;
end;

procedure TfrmMetaDados.CriaTrigerEdi;
var sTabela, sNome:String; qy:TIBQuery;
    i:Integer; sMeta:String;
     procedure Exec;
     begin
        dm.Transacao(nil);
        qy := TIBQuery.Create(nil);
        qy.Database := dm.DB;
        qy.Transaction := dm.TS;
        try
          sTabela := Trim(IBQ.FieldByName('TABELA').AsString);
          sNome := 'T_' + sTabela + '_D';
          qy.SQL.Text := 'select 1 from rdb$triggers '+
            'where TRIM(rdb$trigger_name) = :tabela';
          qy := ExecutaSQL(qy,['tabela'],[sNome]);

          if qy.RecordCount>0 then
          begin
            ibSQL.SQL.Text := 'DROP TRIGGER ' + sNome ;
            ibSQL.ExecQuery;
          end;

          begin
            ibSQL.SQL.Text :=
               'CREATE TRIGGER ' + sNome + ' FOR ' + sTabela +
               ' AFTER DELETE AS ' +
               'BEGIN' +
               '  EXECUTE PROCEDURE PROC_EDI(''' + sTabela + ''',OLD.CD_EDI,3); ' +
               'END';
            ibSQL.ExecQuery;
          end;

          qy.SQL.Text := 'select 1 from rdb$triggers '+
            'where TRIM(rdb$trigger_name) = :tabela';
          sNome := 'T_' + sTabela + '_U';
          qy := ExecutaSQL(qy,['tabela'],[sNome]);

          if qy.RecordCount>0 then
          begin
            ibSQL.SQL.Text := 'DROP TRIGGER ' + sNome ;
            ibSQL.ExecQuery;
          end;

          begin
            ibSQL.SQL.Text :=
               'CREATE TRIGGER T_' + sTabela + '_U FOR ' + sTabela +
               ' BEFORE UPDATE AS ' +
               'BEGIN' +
               '  IF (NOT(NEW.DT_EXP IS NULL)) THEN ' +
               '    NEW.DT_EXP = NULL; ' +
               'END';
            ibSQL.ExecQuery;
          end;

          dm.Commit(dm.IBD);
          mLog.Lines.Add('Criando Trigger EDI ' + sTabela + ' - ok!');
          qy.Free;
        except
          on E:Exception do
          begin
            mLog.Lines.Add('Criando Trigger EDI' + sTabela + '- Erro:' + e.Message);
          end;
        end;
     end;
begin
  sMeta := 'Select * from VWTABELAS';
  if (IBQ.SQL.Text <> sMeta) and (not IBQ.Active) then
  begin
    IBQ.Close;
    IBQ.SQL.Text := sMeta;
    IBQ.Open;
    IBQ.First;
    PageControl1.ActivePageIndex := 1;
  end;

  while not IBQ.Eof do
  begin
     Exec;
     IBQ.Next;
  end
end;

procedure TfrmMetaDados.ProcDigFis;
var sSQL, sAux:string;
begin
  try
    sSQL := dmDIG.qyArquivoDigital.SQL.Text;
    dmDIG.qyArquivoDigital.Close;
    dmDIG.qyArquivoDigital.SQL.Text :=
      'select distinct NR_PROCESSO ' +
      ' from ARQUIVO_DIGITAL ' +
      ' where CD_GRUPO <> :CD_GRUPO ';

    dmDIG.qyArquivoDigital.ParamByName('CD_GRUPO').AsString :=
      prmPastaParecer;
    dmDIG.qyArquivoDigital.Open;
    ibq2.SQL.Text := 'INSERT INTO PROCESSO(NR_PROCESSO, FL_DIGITAL) VALUES(:NR_PROCESSO,1)';
    while not dmDIG.qyArquivoDigital.Eof do
    begin
      IBQ2.ParamByName('NR_PROCESSO').AsInteger :=
        dmDIG.qyArquivoDigital.FieldByName('NR_PROCESSO').AsInteger;
      try
        IBQ2.ExecSQL;
      finally
        dmDIG.qyArquivoDigital.Next;
      end;
    end;
    DM.Commit(IBQ2);
  finally
    dmDIG.qyArquivoDigital.Close;
    dmDIG.qyArquivoDigital.SQL.Text := sSQL;
  end;
end;


procedure TfrmMetaDados.ProcIncluiAuditoria;
var sSQL, sTABELA:string;
begin
  try
    sSQL :=
      'alter table %s' +
      ' add cd_usu_inclusao integer,' +
      ' add dt_inclusao timestamp,' +
      ' add cd_usu_alteracao integer,' +
      ' add dt_alteracao timestamp';
    ibq2.SQL.Text := 'select tabela from vwtabelas';
    ibq2.open;
    while not ibq2.eof do
    begin
      sTABELA := trim(ibq2.FieldByName('TABELA').AsString);
      dm.qyGeral.SQL.Text := Format(sSQL,[sTABELA]);
      try
        dm.qyGeral.ExecSQL;
        DM.Commit(dm.qyGeral);
      except
        DM.Rollback(dm.qyGeral);
      end;
      ibq2.Next;
    end;
  finally
    ibq2.close;
  end;
end;

procedure TfrmMetaDados.RequisitaNotificacao;
var lsTabela:TStringList; i:integer;
begin
  lsTabela:=TStringList.Create;

  lsTabela.Add('MEDICO');
  lsTabela.Add('INVESTIGADOR');
  lsTabela.Add('PACIENTE');
  lsTabela.Add('NOTIFICACAO');
  lsTabela.Add('ASPECTO_NOTIFICACAO');
  lsTabela.Add('CIRCUNCISAO');
  lsTabela.Add('DENTARIO');
  lsTabela.Add('INTERV_CIRURGICA');
  lsTabela.Add('PERFURACAO');
  lsTabela.Add('TRANSFUSAO');
  lsTabela.Add('TATUAGEM');

  for i:=0 to lsTabela.Count-1 do
  begin
    dmGeral.TB_TABELA_EDI.Close;
    dmGeral.TB_TABELA_EDI.ParamByName('NM_TABELA').AsString :=
      lsTabela[i];
    dmGeral.TB_TABELA_EDI.Open;
    if not dmGeral.TB_TABELA_EDI.IsEmpty then
    begin
       dmGeral.TB_TABELA_EDI.Edit;
       dmGeral.TB_TABELA_EDIFL_ENVIAR.AsString := 'S';
       dmGeral.TB_TABELA_EDIFL_RECEBER.AsString := 'S';
       dmGeral.TB_TABELA_EDI.Post;
    end;

    dm.qyGeral.SQL.Clear;
    dm.qyGeral.SQL.Add('UPDATE ' + lsTabela[i]);
    dm.qyGeral.SQL.Add('SET DT_EXP = NULL');
    dm.qyGeral.ExecSQL;
    dm.Commit(dm.qyGeral);

  end;
  lsTabela.Free;
end;

end.
