unit uframArvore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, Buttons, ExtCtrls, jpeg;

type
  TframArvore = class(TFrame)
    tv: TTreeView;
    ImageList1: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    tv2: TTreeView;
    Splitter1: TSplitter;
    btMovGrupoDir: TSpeedButton;
    btMovGrupoEsq: TSpeedButton;
    btSalvarGrupo: TSpeedButton;
    btUp: TSpeedButton;
    btDown: TSpeedButton;
    procedure tvGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure btMovGrupoDirClick(Sender: TObject);
    procedure btMovGrupoEsqClick(Sender: TObject);
    procedure btSalvarGrupoClick(Sender: TObject);
    procedure tvEdited(Sender: TObject; Node: TTreeNode; var S: String);
    procedure btUpClick(Sender: TObject);
    procedure btDownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaArvore;
    procedure CarregaGrupo(pbCarregaTodos:Boolean; tv:TTreeView);
    function RetornaStreamBlob(pID:Integer; var psProp:string):TMemoryStream;
    procedure HabilitaMover(pbHabilita:boolean);
  end;

{Tipo: 1 - PDF Dig , 2 - RTF Edt , 3 - PDF Imp}
type
  TRec = ^Rec;
  Rec = Record
   id, tipo, grupo:integer;
   nome:string;
  end;

Var
  pRec:TRec;

implementation

uses UDMDIG, DB, ufrmDigitalizar;

{$R *.dfm}

{ TframArvore }

procedure TframArvore.CarregaArvore;
var ndPai, nd:TTreeNode; sGrupo, sPagina:string;
  TIPO,ID,GRUPO, i:integer; NOME:string;
begin
   tv.Items.Clear;
   dmDIG.tbArquivo_Digital.First;
   i := 0;
   while not dmDIG.tbArquivo_Digital.Eof do
   begin
     inc(i);
     sPagina := 'Documento' + inttoStr(i);
     ID := dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
     TIPO := dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger;
     GRUPO := dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger;
     NOME := dmDIG.tbArquivo_DigitalNM_ARQUIVO.AsString;
     if Nome = '' then
       sPagina := 'Documento' + inttoStr(i)
     else
       sPagina := NOME;
     New(pRec);
     pRec^.id := ID;
     pRec^.tipo := TIPO;
     pRec^.grupo := GRUPO;
     pRec^.nome := NOME;

     if sGrupo <> dmDIG.tbArquivo_DigitalDS_GRUPO.AsString then
     begin
       ndPai := tv.Items.AddObject(nil,
          dmDIG.tbArquivo_DigitalDS_GRUPO.AsString, pRec);
     end;

     nd := tv.items.AddChildObject(ndPai, sPagina, pRec);
     sGrupo := dmDIG.tbArquivo_DigitalDS_GRUPO.AsString;
     dmDIG.tbArquivo_Digital.Next;
   end;
   CarregaGrupo(false, tv);
end;

procedure TframArvore.CarregaGrupo(pbCarregaTodos:Boolean; tv:TTreeView);
var sNome:String; nCd, ix:integer; bAdicionaNode:boolean;

  function ExisteNodo(psNome:string):Boolean;
  var i:integer;
  begin
     for  i:=0 to tv.Items.Count-1 do
       if tv.Items[i].Level=0 then
         if tv.Items[i].Text = psNome then
         begin
            result := true;
            exit;
         end;
  end;
begin
  dmDIG.tbDig_GrupoDoc.Close;
  dmDIG.tbDig_GrupoDoc.Open;
  while not dmDIG.tbDig_GrupoDoc.Eof do
  begin
     sNome := dmDIG.tbDig_GrupoDoc.FieldByName('DS_GRUPO').AsString;
     nCd := dmDIG.tbDig_GrupoDoc.FieldByName('CD_GRUPO').AsInteger;
     bAdicionaNode := not ExisteNodo(sNome);
     bAdicionaNode := bAdicionaNode or pbCarregaTodos;
     if bAdicionaNode then
     begin
       New(pRec);
       pRec^.grupo := nCd;
       tv.Items.AddObject(nil, sNome, pRec);
     end;
     dmDIG.tbDig_GrupoDoc.Next;
  end;
  dmDIG.tbDig_GrupoDoc.Close;
  tv.SetFocus;
end;

procedure TframArvore.HabilitaMover(pbHabilita: boolean);
begin
   panel1.Visible := pbHabilita;
   Splitter1.Visible := pbHabilita;
   if pbHabilita then
   begin
     tv2.Items.Clear;
     CarregaGrupo(true, tv2);
   end;
end;

function TframArvore.RetornaStreamBlob(pID: Integer; var psProp:string): TMemoryStream;
var ms:TMemoryStream;  jpg:TJPEGImage;
begin
  dmDIG.tbDig_Arquivo.Close;
  dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger := pID;
  dmDIG.tbDig_Arquivo.Open;
  if not dmDIG.tbDig_Arquivo.IsEmpty then
  begin
    jpg := TJPEGImage.Create;
    ms := TMemoryStream.Create;
    dmDIG.tbDig_ArquivoBL_ARQUIVO.SaveToStream(ms);
    ms.Position := 0;
    //jpg.LoadFromStream(ms); //JPEG
    //ms.SaveToFile('c:\temp\test.jpg');
    //frmDigitalizar.CriarPDF(ms, nPERFILCOLORIDO, 0, jpg.Width,  jpg.Height, 100);
    //ms.SaveToFile('c:\temp\test.pdf');
    psProp := dmDIG.tbDig_ArquivoDS_ARQUIVO.AsString;
    Result := ms;
  end;
  dmDIG.tbDig_Arquivo.Close;
end;

procedure TframArvore.tvGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex := 0;
  if Node.Selected then
    Node.SelectedIndex := 3;
  if Node.Level=0 then
  begin
    if Node.Expanded then
       Node.ImageIndex := 1;
  end
  else
  begin
    pRec := Node.data;
    case pRec.tipo of
      1:Node.ImageIndex := 4;
      2:Node.ImageIndex := 5;
      3:Node.ImageIndex := 6;
    end;

    {if Node.Selected then
       Node.SelectedIndex := 3;}
  end;
end;

procedure TframArvore.btMovGrupoDirClick(Sender: TObject);
var nd,np:TTreeNode;
begin
  nd := tv.Selected;
  np := tv2.Selected;
  if (nd.Level>0) then
  begin
   tv2.Items.AddChildObject(np,nd.Text,nd.Data);
   nd.Delete;
  end;
end;

procedure TframArvore.btMovGrupoEsqClick(Sender: TObject);
var nd,np:TTreeNode;
begin
  nd := tv2.Selected;
  np := tv.Selected;
  if (nd.Level>0) then
  begin
    tv.Items.AddChildObject(np,nd.Text,nd.Data);
    nd.Delete;
  end;
end;

procedure TframArvore.btSalvarGrupoClick(Sender: TObject);
var i,id, nGrupo:integer; nd:TTreeNode; sGrupo:string;
begin
   //Grupo
   for i:=0 to tv2.Items.Count-1 do
   begin
      nd := tv2.Items[i];

      if nd.Level>0 then
      begin
        pRec := nd.data;
        id := pRec.id;

        pRec := nd.Parent.data;
        nGrupo := pRec.grupo;
        sGrupo := nd.Parent.Text;

        if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
        begin
          dmDIG.tbArquivo_Digital.Edit;
          dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
          dmDIG.tbArquivo_Digital.Post;
        end;
      end;
   end;

   //Ordem
   for i:=0 to tv.Items.Count-1 do
   begin
      nd := tv.Items[i];

      if nd.Level>0 then
      begin
        pRec := nd.data;
        id := pRec.id;

        pRec := nd.Parent.data;
        nGrupo := pRec.grupo;
        sGrupo := nd.Parent.Text;

        if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
        begin
          dmDIG.tbArquivo_Digital.Edit;
          dmDIG.tbArquivo_DigitalNU_ORDEM.AsInteger := nd.AbsoluteIndex;
          dmDIG.tbArquivo_Digital.Post;
        end;
      end;
   end;

   dmDIG.Commit(dmDIG.tbArquivo_Digital);

   //Refresh
   tv2.Items.Clear;
   CarregaGrupo(true, tv2);
end;

procedure TframArvore.tvEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
var id:integer;
begin
  if Node.Level>0 then
  begin
    pRec := Node.data;
    id := pRec.id;
    if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
    begin
      dmDIG.tbArquivo_Digital.Edit;
      dmDIG.tbArquivo_DigitalNM_ARQUIVO.AsString := S;
      dmDIG.tbArquivo_Digital.Post;
    end;
  end;
  dmDIG.Commit(dmDIG.tbArquivo_Digital);
end;

procedure TframArvore.btUpClick(Sender: TObject);
var nd:TTreeNode;
begin
  nd := tv.Selected;
  if nd.GetPrev <> nil then
   if nd.GetPrev.Level > 0 then
    nd.MoveTo(nd.GetPrev, naInsert);
end;

procedure TframArvore.btDownClick(Sender: TObject);
var nd:TTreeNode;
begin
  nd := tv.Selected;
  if nd.GetNext <> nil then
   if nd.GetNext.Level > 0 then
    nd.GetNext.MoveTo(nd, naInsert);
end;

end.
