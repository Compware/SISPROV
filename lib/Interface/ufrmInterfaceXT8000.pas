unit ufrmInterfaceXT8000;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uspViewPDF, uspWPViewPDFCompatible, Buttons, ExtCtrls,
  Grids, ValEdit, FileCtrl, DB, IBCustomDataSet, IBQuery, ShellApi,
  ComCtrls;

type
  TfrmInterfaceXT8000 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btConfirmar: TBitBtn;
    ValueListEditor1: TValueListEditor;
    Timer1: TTimer;
    Memo1: TMemo;
    FileListBox1: TFileListBox;
    Splitter1: TSplitter;
    qyAgenda: TIBQuery;
    qyAgendaNR_LAB: TIntegerField;
    qyAgendaCD_PACIENTE: TIntegerField;
    qyAgendaNM_PACIENTE: TIBStringField;
    qyAgendaNR_PROCESSO: TIntegerField;
    btAtualizar: TBitBtn;
    qyAgendaCD_AGENDA: TIntegerField;
    btImprimir: TBitBtn;
    StatusBar1: TStatusBar;
    pdf: TspWPViewPDFCompatible;
    ckManual: TCheckBox;
    btAdd: TBitBtn;
    procedure btArquviosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ValueListEditor1Click(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure qyAgendaBeforeOpen(DataSet: TDataSet);
    procedure btAtualizarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTipo:Integer;
    function Imprimir:boolean;
    procedure Inicializar;
  end;

type
  TMyRec = Record
  ID, Data, Nome:string;
end;

Const
  XT8000=1;
  P80=2;

var
  frmInterfaceXT8000: TfrmInterfaceXT8000;
  mRec:TMyrec;
  vRec:array of TMyRec;
  gsID, gsArquivo:string;

implementation

uses UDMDIG, UGeral;

{$R *.dfm}

procedure TfrmInterfaceXT8000.btArquviosClick(Sender: TObject);
begin
  FileListBox1.Directory := 'c:\compware';
  FileListBox1.Directory := 'C:\Compware\Pdf-Interface\XT1800';
  FileListBox1.Refresh;
end;

procedure TfrmInterfaceXT8000.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  btArquviosClick(Sender);
  Timer1.Enabled := true;
end;

procedure TfrmInterfaceXT8000.FormShow(Sender: TObject);
begin
  Inicializar;
  btArquviosClick(Sender);
  ValueListEditor1Click(sender);
end;

procedure TfrmInterfaceXT8000.ValueListEditor1Click(Sender: TObject);
var x:integer; sNome, sID,sData:string; ms:TMemoryStream;

  function Existe(var id:integer):Boolean;
  var i:integer;
  begin
     result := false;
     for i:=Low(vRec) to High(vRec) do
     begin
       id := i;
       mRec := vRec[i];
       if (mRec.ID = sID) and (mRec.Data = sData) then
       begin
         result := true;
         break;
       end;
     end;
  end;

begin
  x := ValueListEditor1.Row;
  sID := ValueListEditor1.Keys[x];
  sData := ValueListEditor1.Cells[1,x];
  if Existe(x) then
  begin
    sNome := vRec[x].Nome;
    gsArquivo := sNome;
    //gsArquivo := StringReplace(sNome,'.txt','.pdf',[]);
    StatusBar1.SimpleText := gsArquivo;
    gsID := sID;
    ms := TMemoryStream.Create;
    ms.LoadFromFile(gsArquivo);
    pdf.LoadFromStream(ms,0);
  end;
end;

procedure TfrmInterfaceXT8000.btConfirmarClick(Sender: TObject);
var ms : TMemoryStream;  sAux:string;
    nGrupo: Integer; bArq:Boolean;
begin
    nGrupo := ValorParametro(nParGrupoExames);
    qyAgenda.Close; qyAgenda.Open;

    if (qyAgenda.IsEmpty) then
    begin
       ShowMessage('Utente sem Agendamento!'+chr(13)+'É necessário fazer agendamento na Receção!');
       Abort;
    end;

    if (qyAgendaNR_PROCESSO.AsString = '') then
    begin
       ShowMessage('Utente sem processo!'+chr(13)+'Este exame será impresso!');
       Imprimir;
    end;

    dmDIG.tbDig_Arquivo.Open;
    dmDIG.tbArquivo_Exame.Open;
    ms := TMemoryStream.Create;
    try
      ms.LoadFromFile(gsArquivo);

      dmDIG.tbDig_Arquivo.Insert;
      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbDig_Arquivo.Post;

      if (qyAgendaNR_PROCESSO.AsString <> '') then
      begin
        dmDIG.tbArquivo_Digital.Close;
        dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString :=
          qyAgendaNR_PROCESSO.AsString;
        dmDIG.tbArquivo_Digital.Open;

        dmDIG.tbArquivo_Digital.Insert;
        dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := qyAgendaNR_PROCESSO.AsString;
        dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
          dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
        dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
        dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 3; //PDF Imp
        dmDIG.tbArquivo_Digital.Post;
      end
      else
      begin
        dmDIG.tbArquivo_Exame.Insert;
        dmDIG.tbArquivo_ExameCD_AGENDA.AsString := qyAgendaCD_AGENDA.AsString;
        dmDIG.tbArquivo_ExameCD_ARQUIVO.AsInteger :=
          dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
        dmDIG.tbArquivo_Exame.Post;
      end;

      dmDIG.Commit(dmDIG.tbDig_Arquivo);

      sAux := StringReplace(gsArquivo,'.pdf','.del',[]);
      bArq := RenameFile(gsArquivo,sAux);
      bArq := DeleteFile(sAux);

      sAux := StringReplace(gsArquivo,'.pdf','.jpg',[]);
      bArq := DeleteFile(sAux);

      sAux := StringReplace(gsArquivo,'.pdf','.txt',[]);
      bArq := DeleteFile(sAux);
      
      //pdf.Clear;
      ValueListEditor1.DeleteRow(ValueListEditor1.Row);

    finally
      ms.Free;
      dmDIG.tbDig_Arquivo.Close;
      dmDIG.tbArquivo_Exame.Close;
    end;
end;

procedure TfrmInterfaceXT8000.qyAgendaBeforeOpen(DataSet: TDataSet);
begin
  qyAgenda.ParamByName('NR_LAB').AsString := gsID;
end;

procedure TfrmInterfaceXT8000.btAtualizarClick(Sender: TObject);
begin
  btArquviosClick(Sender);
  ValueListEditor1Click(ValueListEditor1); 
end;

function TfrmInterfaceXT8000.Imprimir: boolean;
var sArquivo:string;
begin
  sArquivo := StringReplace(gsArquivo,'.pdf','.imp',[]);
  if CopyFile(pchar(gsArquivo),pchar(sArquivo),false) then
    ShellExecute(0, 'open', 'acrord32', PChar('/p /h ' + sArquivo), nil, SW_HIDE);
end;

procedure TfrmInterfaceXT8000.btImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

procedure TfrmInterfaceXT8000.btAddClick(Sender: TObject);
var i,x,r:integer; sName, sID, sData, sAux:String; c:char;

  function GetDados:Boolean;
  var sNome :string; i,f,l:integer;
  begin
    try
      sNome := sName;
      if ckManual.Checked then
      begin
        //Linha - Numero Laboratorio
        x := memo1.lines.Count-2;
        sID := memo1.lines[x];
        i := length(sID)-25;
        sID := trim(Copy(sID,i,6));

        //Linha - Data
        sData := memo1.lines[x];
        i := length(sData)-19;
        sData := trim(Copy(sData,i,20));
      end
      else
      begin
        //Linha - Numero Laboratorio
        x := memo1.lines.Count-2;
        sID := trim(memo1.lines[x]);
        //i := length(sID)-25;
        //sID := trim(Copy(sID,i,6));

        //Linha - Data
        x := memo1.lines.Count-3;
        sData := memo1.lines[x];
        i := length(sData)-19;
        sData := trim(Copy(sData,i,20));
      end;

      Result := True;
    except
      result := false;
    end
  end;

  function Existe:Boolean;
  var i:integer;
  begin
     result := false;
     for i:=Low(vRec) to High(vRec) do
     begin
       mRec := vRec[i];
       if mRec.Nome = sName then
       begin
         result := true;
         break;
       end;
     end;
  end;
begin
    try
       sName := FileListBox1.FileName;
       begin
         //Captura o Texto do PDF
         if GetDados then
         begin
           x := High(vRec);
           begin
             SetLength(vRec, x+2);
             x := High(vRec);
             mRec.ID := sID;
             mRec.Data := sData;
             mRec.Nome := sName;
             vRec[x] := mRec;

             ValueListEditor1.InsertRow(sID, sData, false);
           end;
         end;
       end;
    except
    end;
end;

procedure TfrmInterfaceXT8000.Inicializar;
begin
    Application.ProcessMessages;
    SetLength(vRec,0);
    while (ValueListEditor1.RowCount > 2) do
      ValueListEditor1.DeleteRow(ValueListEditor1.RowCount-1);

    ValueListEditor1.Cells[0,1]:='';
    ValueListEditor1.Cells[1,1]:='';
    ValueListEditor1.Cells[2,1]:='';
end;

procedure TfrmInterfaceXT8000.FileListBox1Change(Sender: TObject);
begin
  pdf.LoadFromFile(FileListBox1.FileName);
  Memo1.Lines.Text := pdf.GetText;
end;

end.
