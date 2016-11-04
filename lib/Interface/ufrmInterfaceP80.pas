unit ufrmInterfaceP80;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uspViewPDF, uspWPViewPDFCompatible, Buttons, ExtCtrls,
  Grids, ValEdit, FileCtrl, DB, IBCustomDataSet, IBQuery, ShellApi,
  ComCtrls;

type
  TfrmInterfaceP80 = class(TForm)
    pdf: TspWPViewPDFCompatible;
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
    procedure btArquviosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ValueListEditor1Click(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure qyAgendaBeforeOpen(DataSet: TDataSet);
    procedure btAtualizarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTipo:Integer;
    function Imprimir:boolean;
  end;

type
  TMyRec = Record
  ID, Data, Nome:string;
end;

Const
  XT8000=1;
  P80=2;

var
  frmInterfaceP80: TfrmInterfaceP80;
  mRec:TMyrec;
  vRec:array of TMyRec;
  gsID, gsArquivo:string;

implementation

uses UDMDIG, UGeral;

{$R *.dfm}

procedure TfrmInterfaceP80.btArquviosClick(Sender: TObject);
var i,x,r:integer; sName, sID, sData:String;

  function GetDados:Boolean;
  var sNome :string;
  begin
    result := false;
    sNome := FileListBox1.Directory +'\'+ sName;
    pdf.LoadFromFile(sNome);
    memo1.lines.Text := pdf.GetText;
    begin
      Result := True;
      //Linha - Numero Laboratorio
      sID := Copy(memo1.lines[12],1,5);
      //Linha - Data
      sData := memo1.lines[15];
    end;
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
    pdf.Visible := False;
    Application.ProcessMessages;
    SetLength(vRec,0);
    while (ValueListEditor1.RowCount > 2) do
      ValueListEditor1.DeleteRow(ValueListEditor1.RowCount-1);

    ValueListEditor1.Cells[0,1]:='';
    ValueListEditor1.Cells[1,1]:='';
    ValueListEditor1.Cells[2,1]:='';

    FileListBox1.Directory := 'c:\compware';
    FileListBox1.Directory := 'C:\Compware\Pdf-Interface\P80';
    FileListBox1.Refresh;

    for i:=0 to FileListBox1.Count-1 do
    begin
       sName := FileListBox1.Items[i];
       //if not Existe then
       begin
         //Captura o Texto do PDF
         if GetDados then //P80
         begin
           x := High(vRec);
           //if not ValueListEditor1.FindRow(sID, r) then
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
    end;
  finally
    pdf.Visible := True;
  end;
end;

procedure TfrmInterfaceP80.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  btArquviosClick(Sender);
  ValueListEditor1Click(sender);
  Timer1.Enabled := true;
end;

procedure TfrmInterfaceP80.FormShow(Sender: TObject);
begin
  btArquviosClick(Sender);
  ValueListEditor1Click(sender);
end;

procedure TfrmInterfaceP80.ValueListEditor1Click(Sender: TObject);
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
    sNome := FileListBox1.Directory + '\' + vRec[x].Nome;
    gsArquivo := sNome;
    StatusBar1.SimpleText := gsArquivo;
    gsID := sID;
    ms := TMemoryStream.Create;
    ms.LoadFromFile(sNome);
    pdf.LoadFromStream(ms,0);
  end;
end;

procedure TfrmInterfaceP80.btConfirmarClick(Sender: TObject);
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
      
      pdf.Clear;
      ValueListEditor1.DeleteRow(ValueListEditor1.Row);

    finally
      ms.Free;
      dmDIG.tbDig_Arquivo.Close;
      dmDIG.tbArquivo_Exame.Close;
    end;
end;

procedure TfrmInterfaceP80.qyAgendaBeforeOpen(DataSet: TDataSet);
begin
  qyAgenda.ParamByName('NR_LAB').AsString := gsID;
end;

procedure TfrmInterfaceP80.btAtualizarClick(Sender: TObject);
begin
  btArquviosClick(Sender);
  ValueListEditor1Click(ValueListEditor1); 
end;

function TfrmInterfaceP80.Imprimir: boolean;
var sArquivo:string;
begin
  sArquivo := StringReplace(gsArquivo,'.pdf','.imp',[]);
  if CopyFile(pchar(gsArquivo),pchar(sArquivo),false) then
    ShellExecute(0, 'open', 'acrord32', PChar('/p /h ' + sArquivo), nil, SW_HIDE);
end;

procedure TfrmInterfaceP80.btImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

end.                                                              
