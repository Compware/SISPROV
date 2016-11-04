unit ufrmNovaBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, IBDatabase, DB, Grids, DBGrids,
  IBCustomDataSet, ComCtrls, CheckLst, IBQuery;

type
  TfrmNovaBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ibDe: TIBDatabase;
    ibPara: TIBDatabase;
    tsDe: TIBTransaction;
    tsPara: TIBTransaction;
    Panel3: TPanel;
    Label3: TLabel;
    edTabela: TEdit;
    Label4: TLabel;
    edProvincia: TEdit;
    Label5: TLabel;
    edMunicipio: TEdit;
    Label6: TLabel;
    edUnidade: TEdit;
    Label7: TLabel;
    edMesAno: TEdit;
    Label1: TLabel;
    edDe: TEdit;
    btDe: TSpeedButton;
    Label2: TLabel;
    edPara: TEdit;
    btPara: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    tbDe: TIBDataSet;
    tbPara: TIBDataSet;
    grDe: TDBGrid;
    grPara: TDBGrid;
    dsDe: TDataSource;
    dsPara: TDataSource;
    btAbrir: TButton;
    btDelPara: TButton;
    btDePara: TButton;
    pb: TProgressBar;
    btTodas: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    edUnd: TEdit;
    qyCampos: TIBQuery;
    qyCamposNM_CAMPO: TIBStringField;
    TabSheet3: TTabSheet;
    mLog: TMemo;
    Panel4: TPanel;
    ckTabelas1: TCheckListBox;
    ckGrupo1: TCheckBox;
    Panel5: TPanel;
    ckTabelas2: TCheckListBox;
    ckGrupo2: TCheckBox;
    Panel6: TPanel;
    ckTabelas3: TCheckListBox;
    ckGrupo3: TCheckBox;
    procedure btDeClick(Sender: TObject);
    procedure btParaClick(Sender: TObject);
    procedure btAbrirClick(Sender: TObject);
    procedure btDelParaClick(Sender: TObject);
    procedure btDeParaClick(Sender: TObject);
    procedure btTodasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Commit(DataSet:TDataSet);
    procedure MontaDataSet(nmTabela: String; ibds: TIBDataSet);
  end;

var
  frmNovaBase: TfrmNovaBase;

implementation

{$R *.dfm}

procedure TfrmNovaBase.MontaDataSet(nmTabela: String; ibds: TIBDataSet);
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

    sSelect := 'SELECT * FROM '+nmTabela+' where 1=2';
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

procedure TfrmNovaBase.btDeClick(Sender: TObject);
begin
  ibDe.Close;
  ibDe.DatabaseName := edDe.Text;
  ibDe.Open;
  mLog.Lines.add('DB De - Aberto');
end;

procedure TfrmNovaBase.btParaClick(Sender: TObject);
begin
  ibPara.Close;
  ibPara.DatabaseName := edPara.Text;
  ibPara.Open;
  mLog.Lines.add('DB Para - Aberto');
end;

procedure TfrmNovaBase.btAbrirClick(Sender: TObject);
var sSQL:string;
begin
  sSQL:= 'select * from ' + edTabela.Text +
         ' where (1=1)  ';

  if (edProvincia.Text<>'') then
    sSQL := sSQL +
         ' and cd_provincia = ' + edProvincia.Text;

  if(edMesAno.Text <>'') then
    sSQL := sSQL +
         ' and vl_mesano in (' + edMesAno.Text + ')';

  if edMunicipio.Text <> '' then
    sSQL := sSQL +
         ' and cd_municipio = ' + edMunicipio.Text ;

  if edUnidade.Text <> '' then
    sSQL := sSQL +
         ' and cd_unidade = ' + edUnidade.Text ;

  if edUnd.Text <> '' then
    sSQL := sSQL +
         ' and cd_und = ' + edUnd.Text ;

  tbDe.Close;
  tbDe.SelectSQL.Text := sSQL;
  tbDe.Open;
  tbDe.Last;

  tbPara.Close;
  MontaDataSet(edTabela.Text,tbPara);
  tbPara.SelectSQL.Text := sSQL;
  tbPara.Open;
  tbPara.Last;
  
  mLog.Lines.add('Tabela: ' + edTabela.Text +
   ' De: ' + intToStr(tbDe.RecordCount) +
   ' Para: ' + intToStr(tbPara.RecordCount));

end;

procedure TfrmNovaBase.btDelParaClick(Sender: TObject);
begin
  tbPara.First;
  while Not tbPara.Eof do
    tbPara.Delete;
  Commit(tbPara);
  mLog.Lines.add('Exclusao Para - Realizado');
end;

procedure TfrmNovaBase.btDeParaClick(Sender: TObject);
var
  i:integer;
begin
  tbDe.First;
  pb.Max:=tbDe.RecordCount;
  while Not tbDe.Eof do
  begin
    try
      tbPara.Insert;
      for i:=0 to tbDe.FieldCount-1 do
        tbPara.FieldByName(tbDe.Fields[i].FieldName).Value := tbDe.Fields[i].value;
      tbPara.Post;
      pb.Position:=tbPara.RecordCount;
      tbDe.Next;
      Commit(tbPara);
    except
      on E:Exception do
      begin
        mLog.lines.add('RecNo:' +  intToStr(tbDe.RecNo) + 'Erro: ' + e.Message);
        tbPara.Cancel;
        tbDe.Next;
      end;
    end;
  end;
end;

procedure TfrmNovaBase.btTodasClick(Sender: TObject);

  procedure Executar(ckTabelas:TCheckListBox; ckGrupo:TCheckBox);
  var i:integer;
  begin
   if ckGrupo.Checked then
   begin
     for i:=0 to ckTabelas.Items.Count -1 do
     begin
       if ckTabelas.Checked[i] then
       begin
         try
           edTabela.Text := ckTabelas.Items[i];
           Application.ProcessMessages;
           btAbrirClick(Sender);
           btDeParaClick(Sender);
         except
            on E:Exception do
            begin
              mLog.lines.add('De-Para:' +  edTabela.Text + 'Erro: ' + e.Message);
            end;
         end;
       end;
     end;
   end;
  end;

begin
 Executar(ckTabelas1, ckGrupo1);
 Executar(ckTabelas2, ckGrupo2);
 Executar(ckTabelas3, ckGrupo3);
end;

procedure TfrmNovaBase.Commit(DataSet: TDataSet);
begin
  if TIBDataSet(DataSet).Transaction.inTransaction then
  begin
    with TIBDataSet(DataSet).Transaction,
         TIBDataSet(DataSet).Database do
    begin
      //if Assigned(DataSet) then ApplyUpdates(DataSet);
      CommitRetaining;
    end;
  end;
end;

procedure TfrmNovaBase.FormShow(Sender: TObject);
var i:integer;
begin
 for i:=0 to ckTabelas1.Items.Count -1 do
   ckTabelas1.Checked[i] := true;
 for i:=0 to ckTabelas2.Items.Count -1 do
   ckTabelas2.Checked[i] := true;
  for i:=0 to ckTabelas3.Items.Count -1 do
   ckTabelas3.Checked[i] := true;
end;

end.
