unit ufrmProcessoDigital;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uspViewPDF, uspWPViewPDFCompatible, ExtCtrls, uframArvore,
  Buttons, StdCtrls, Menus, DB, Grids, DBGrids, ComCtrls, DBCtrls,
  IBCustomDataSet, IBTable, ShellApi, imageenproc, ieview, imageenview,
  imageen, imageenio, iemview;


type
  TfrmProcessoDigital = class(TForm)
    pnTopo: TPanel;
    pnCentro: TPanel;
    framArvore1: TframArvore;
    Splitter1: TSplitter;
    pdf: TspWPViewPDFCompatible;
    Label1: TLabel;
    edProcesso: TEdit;
    btProcesso: TSpeedButton;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Grupos1: TMenuItem;
    btRedigitalizar: TSpeedButton;
    btDigitalizar: TSpeedButton;
    Grupo: TSpeedButton;
    btRotacionar: TSpeedButton;
    btZoomMais: TSpeedButton;
    btZoomMenos: TSpeedButton;
    btEditor: TSpeedButton;
    btImportar: TSpeedButton;
    btExportar: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    btExcluir: TSpeedButton;
    btSair: TSpeedButton;
    btExpandir: TSpeedButton;
    btRecolher: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Editar1: TMenuItem;
    Importar1: TMenuItem;
    Redigitalizar1: TMenuItem;
    btNovoProcesso: TSpeedButton;
    GruposModelo1: TMenuItem;
    ModeloDocumento1: TMenuItem;
    StatusBar1: TStatusBar;
    lbNome: TLabel;
    Propriedade1: TMenuItem;
    btMover: TSpeedButton;
    Help1: TMenuItem;
    Verso10021: TMenuItem;
    btSalvar: TSpeedButton;
    N1: TMenuItem;
    InfoEstatistica1: TMenuItem;
    Exportar1: TMenuItem;
    ConverterJPG1: TMenuItem;
    procedure Grupos1Click(Sender: TObject);
    procedure btProcessoClick(Sender: TObject);
    procedure btRedigitalizarClick(Sender: TObject);
    procedure btDigitalizarClick(Sender: TObject);
    procedure GrupoClick(Sender: TObject);
    procedure btRotacionarClick(Sender: TObject);
    procedure btZoomMaisClick(Sender: TObject);
    procedure btZoomMenosClick(Sender: TObject);
    procedure btEditorClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btRecolherClick(Sender: TObject);
    procedure btExpandirClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Importar1Click(Sender: TObject);
    procedure Redigitalizar1Click(Sender: TObject);
    procedure btNovoProcessoClick(Sender: TObject);
    procedure GruposModelo1Click(Sender: TObject);
    procedure ModeloDocumento1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Propriedade1Click(Sender: TObject);
    procedure btMoverClick(Sender: TObject);
    procedure framArvore1tv2Change(Sender: TObject; Node: TTreeNode);
    procedure framArvore1tvChange(Sender: TObject; Node: TTreeNode);
    procedure framArvore1btSalvarGrupoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InfoEstatistica1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure ConverterJPG1Click(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaBotoes(pbHabilitar:Boolean);
  public
    { Public declarations }
    FbAtualizando:boolean;
    procedure AtualizaDocumento(tv:TTreeView);
    procedure CriaProcessoDigital(psProcesso:string);
  end;

var
  frmProcessoDigital: TfrmProcessoDigital;
  nOrdem:Integer;
  fNome, sProp:string;

implementation

uses ufrmCadGrupoDoc, UDMDIG, ufrmDigitalizar, UDM, UfrmLocalizar, ufrmEditor,
  ufrmCadGrupoMod, ufrmCadModelo, ufrmDlgInfoDoc, ufrmCadProcesso,
  ufrmDlgStatus, ufrmInfoEstat, ufrmConvertePDF_JPG, UGeral;

{$R *.dfm}

procedure TfrmProcessoDigital.Grupos1Click(Sender: TObject);
begin
  frmCadGrupoDoc := TfrmCadGrupoDoc.Create(nil);
  frmCadGrupoDoc.ShowModal;
  frmCadGrupoDoc.Free;
end;

procedure TfrmProcessoDigital.btProcessoClick(Sender: TObject);
var bExiste:Boolean; sNome:String;
begin
  framArvore1.tv.Items.Clear;
  pdf.Clear;

  //Validando Paciente
  dmDIG.qyPaciente.Close;
  dmDIG.qyPaciente.ParamByName('NR_PROCESSO').AsString := edProcesso.Text;
  dmDIG.qyPaciente.Open;
  if dmDIG.qyPaciente.IsEmpty then
  begin
    dmDIG.tbDig_Processo.Close;
    dmDIG.tbDig_Processo.ParamByName('NR_PROCESSO').AsString := edProcesso.Text;
    dmDIG.tbDig_Processo.Open;
    if not dmDIG.tbDig_Processo.IsEmpty then
      sNome := dmDIG.tbDig_Processo.FieldByName('NM_PACIENTE').AsString;
  end
  else
    sNome := dmDIG.qyPaciente.FieldByName('NM_PACIENTE').AsString;

  lbNome.Caption := sNome;

  if sNome='' then
  begin
    ShowMessage('Processo não cadastrado!');
    Exit;
  end;
  //--------------------
  HabilitaBotoes(sNome<>'');
  dmDIG.tbArquivo_Digital.Close;
  if edProcesso.Text<>'' then
    dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString := edProcesso.Text
  else
    dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').Clear;
  dmDIG.tbArquivo_Digital.Open;
  bExiste := dmDIG.tbArquivo_Digital.RecordCount>0;

  if bExiste then
    framArvore1.CarregaArvore
  else
  begin
    framArvore1.tv.Items.Clear;
    framArvore1.CarregaGrupo(true, framArvore1.tv);
  end;
  framArvore1.tv.SetFocus;

end;

procedure TfrmProcessoDigital.AtualizaDocumento(tv:TTreeView);
var nd:TTreeNode;
    id, nRotacao:integer;
    ms:TMemoryStream;
begin
  nd := tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.Data;
      id := pRec.id;
      if (id>0) then
      begin
        ms := framArvore1.RetornaStreamBlob(id,sProp);
        try
         if Assigned(ms) then
         begin
           ms.Position := 0;
           pdf.LoadFromStream(ms,0);
           pdf.FitPage;
           nRotacao := 0;
           if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
              nRotacao := dmDIG.tbArquivo_DigitalNR_ROTACAO.AsInteger;
           if nRotacao<>0 then
             pdf.GiraPagina(nRotacao);
           StatusBar1.Panels[1].Text := nd.Text + ' - ' +
               FormatFloat('0.00', ms.Size / 1024) + ' kb';
         end;
        finally
         ms.Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcessoDigital.btRedigitalizarClick(Sender: TObject);
var id:integer; nd:TTreeNode; ms:TMemoryStream; rs:TRecStream;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin

      pRec := nd.data;
      id := pRec.id;

      dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger := id;
      dmDIG.tbDig_Arquivo.Open;
      if not dmDIG.tbDig_Arquivo.IsEmpty then
      begin
        ms := TMemoryStream.Create;
        frmDigitalizar := TfrmDigitalizar.Create(nil);
        if frmDigitalizar.ShowModal = mrOK then
        begin
          rs := frmDigitalizar.RetornaStreamDigitalizado(true);
          ms := rs.MyStream[0];
        end;
        frmDigitalizar.Free;
        dmDIG.tbDig_Arquivo.Edit;
        dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
        dmDIG.tbDig_ArquivoDS_ARQUIVO.AsString :=
          'Tamanho: ' + FormatFloat('0.00', ms.Size / 1024) + ' kb' + chr(13) +
          'DPI: ' + rs.Dpi + chr(13) +
          'Tipo:' + rs.Tipo + chr(13) +
          'Scanner:' + rs.Scanner;
        dmDIG.tbDig_Arquivo.Post;
        try
         ms.Position := 0;
         pdf.LoadFromStream(ms,0);
        except
        end;
        ms.Free;
      end;
      dmDIG.tbDig_Arquivo.Close;
    end;
  end;
end;

procedure TfrmProcessoDigital.btDigitalizarClick(Sender: TObject);
var nd,ndc:TTreeNode; ms:TMemoryStream; rs:TRecStream;
    nGrupo, i, id: Integer;
begin
  FbAtualizando := true;
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
      nd := nd.Parent;

    pRec := nd.data;
    nGrupo := pRec.grupo;

    AdicionaLog('Iniciando a Digitalização do Processo:' + edProcesso.Text);
    if frmDigitalizar.ShowModal = mrOK then
    begin
      dmDIG.tbDig_Arquivo.Open;
      rs := frmDigitalizar.RetornaStreamDigitalizado(false);
      for i:= Low(rs.MyStream) to High(rs.MyStream) do
      begin
       try
         frmDlgStatus.pbStatus.Max := High(rs.MyStream);
         frmDlgStatus.pbStatus.Position := i;
         frmDlgStatus.lbStatus.Caption := Format('Salvando imagem %d de %d', [i+1,High(rs.MyStream)+1]);
         AdicionaLog(frmDlgStatus.lbStatus.Caption);
         Application.ProcessMessages;
         if rs.Salvar[i] then
         begin
            ms := rs.MyStream[i];
            try
              dmDIG.tbDig_Arquivo.Insert;
              dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
              dmDIG.tbDig_ArquivoDS_ARQUIVO.AsString :=
                'Tamanho: ' + FormatFloat('0.00', ms.Size / 1024) + ' kb' + chr(13) +
                'DPI: ' + rs.Dpi + chr(13) +
                'Tipo:' + rs.Tipo + chr(13) +
                'Scanner:' + rs.Scanner;
              dmDIG.tbDig_Arquivo.Post;
            except
              raise;
            end;
            nOrdem := dmDIG.tbArquivo_Digital.RecordCount+1;
            dmDIG.tbArquivo_Digital.Last;
            try
              dmDIG.tbArquivo_Digital.Insert;
              dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := edProcesso.Text;
              dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
                dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
              dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
              dmDIG.tbArquivo_DigitalNU_ORDEM.AsInteger := nOrdem;
              dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 1; //PDF Dig
              dmDIG.tbArquivo_Digital.Post;
            except
              raise;
            end;
            id := dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
            ndc := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
            New(pRec);
            pRec^.id := id;
            pRec^.tipo := 1;
            ndc.Data := pRec;
            ndc.Selected := true;
         end;
       except
         if (dmDIG.tbArquivo_Digital.state in [dsEdit, dsInsert])then
           dmDIG.tbArquivo_Digital.Cancel;

         if (dmDIG.tbDig_Arquivo.state in [dsEdit, dsInsert])then
           dmDIG.tbDig_Arquivo.Cancel;
       end;
      end;
      {TODO:Marcar Processo Digital}
      CriaProcessoDigital(edProcesso.Text);
      dmDIG.Commit(dmDIG.tbDig_Arquivo);
      dm.Commit(dm.qyGeral);
      dmDIG.tbDig_Arquivo.Close;

      try
        if ms.size>0 then
        begin
          ms.Position := 0;
          pdf.LoadFromStream(ms,0);
        end;
      except
        pdf.Clear;
      end;
    end;
    {TODO:Verificar se é necessário limpar todos do Objeto RS}
    for i:= Low(rs.MyStream) to High(rs.MyStream) do
    begin
       frmDlgStatus.pbStatus.Position := i;
       frmDlgStatus.pbStatus.max :=  High(rs.MyStream) ;
       frmDlgStatus.lbStatus.Caption := Format('Finalizando imagem %d de %d', [i,High(rs.MyStream)]);
       AdicionaLog(frmDlgStatus.lbStatus.Caption);
       Application.ProcessMessages;
       rs.MyStream[i].Free;
    end;
    frmDlgStatus.Close;
  end;
  FbAtualizando := false;
end;

procedure TfrmProcessoDigital.GrupoClick(Sender: TObject);
begin
  frmLocalizar := TfrmLocalizar.Create(Application);
  frmLocalizar.qyDados.Database := dmDig.dbDig;
  frmLocalizar.qyDados.Transaction := dmDig.tsDig;
  frmLocalizar.qyDados.SQL.Text := 'SELECT * FROM DIG_GRUPO';
  frmLocalizar.Where := false;
  SetLength(VCampo,2);
  VCampo[0].Titulo  := 'Cód.';
  VCampo[0].Width := 5;
  VCampo[1].Titulo  := 'Nome';
  VCampo[1].Width := 25;
  VCampo[0].Visivel := True;
  VCampo[1].Visivel := True;

  if frmLocalizar.ShowModal = mrOK then
  begin
     New(pRec);
     pRec^.grupo := frmLocalizar.qyDados.FieldByName('CD_GRUPO').AsInteger;
     framArvore1.tv.Items.AddObject(nil,
       frmLocalizar.qyDados.FieldByName('DS_GRUPO').AsString, pRec);
  end;
  frmLocalizar.Free;
end;

procedure TfrmProcessoDigital.btRotacionarClick(Sender: TObject);
var nd:TTreeNode;
    i, id:integer;
begin
  i := pdf.RotacaoAtual;
  inc(i);
  if i>3 then i:=0;
  pdf.GiraPagina(i);

  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.Data;
      id := pRec.id;
      if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
      begin
         dmDIG.tbArquivo_Digital.Edit;
         dmDIG.tbArquivo_DigitalNR_ROTACAO.AsInteger := i;
         dmDIG.tbArquivo_Digital.Post;
         dmDIG.Commit(dmDIG.tbArquivo_Digital);
      end;
    end;
  end;
end;

procedure TfrmProcessoDigital.btZoomMaisClick(Sender: TObject);
begin
  pdf.ZoomIn;
end;

procedure TfrmProcessoDigital.btZoomMenosClick(Sender: TObject);
begin
  pdf.ZoomOut;
end;

procedure TfrmProcessoDigital.btEditorClick(Sender: TObject);
var nd,ndc:TTreeNode; ms : TMemoryStream;
    nGrupo, id: Integer;
    bContinuar:Boolean;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
      nd := nd.Parent;

    pRec := nd.data;
    nGrupo := pRec.grupo;

    dmDIG.tbDig_Arquivo.Open;
    dmDIG.tbEdt_Arquivo.Open;
    ms := TMemoryStream.Create;

    frmDlgInfoDoc := TfrmDlgInfoDoc.Create(Application);
    frmEditor := TfrmEditor.Create(Application);
    frmEditor.bPastaDigital := true;
    bContinuar := (frmDlgInfoDoc.ShowModal = mrOk);
    if bContinuar then
    begin
      dmDIG.tbEdt_Arquivo.Close;
      dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
            frmDlgInfoDoc.Documento;
      dmDIG.tbEdt_Arquivo.Open;
      if dmDIG.tbEdt_Arquivo.RecordCount>0 then
      begin
        dmDIG.tbEdt_ArquivoBL_ARQUIVO.SaveToFile('c:\compware\temp\teste.rtf');
        frmEditor.editor.LoadFromFile('c:\compware\temp\teste.rtf');
        frmEditor.Documento := frmDlgInfoDoc.Documento;
      end;
    end;
    bContinuar := (frmEditor.ShowModal = mrOK);

    if bContinuar then
    begin
      //RTF
      frmEditor.editor.SaveToStream(ms);
      dmDIG.tbEdt_Arquivo.Insert;
      dmDIG.tbEdt_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbEdt_Arquivo.Post;

      //PDF
      ms.LoadFromFile('c:\compware\temp\teste.pdf');
      dmDIG.tbDig_Arquivo.Insert;
      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbDig_Arquivo.Post;

      dmDIG.tbArquivo_Digital.Last;

      dmDIG.tbArquivo_Digital.Insert;
      dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := edProcesso.Text;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger :=
        dmDIG.tbEdt_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
      dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 2; //RTF Edt
      dmDIG.tbArquivo_Digital.Post;
      nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
      
      id := dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
      ndc := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
      
      New(pRec);
      pRec^.id := id;
      pRec^.tipo := 2;
      ndc.Data := pRec;
      ndc.Selected := true;
    
      dmDIG.Commit(dmDIG.tbDig_Arquivo);

      try
       ms.Position := 0;
       pdf.LoadFromStream(ms,0);
      except
      end;
    end;

    frmDlgInfoDoc.Free;
    frmEditor.Free;
    ms.Free;
    dmDIG.tbDig_Arquivo.Close;
    dmDIG.tbEdt_Arquivo.Close;
  end;
end;

procedure TfrmProcessoDigital.btImportarClick(Sender: TObject);
var nd:TTreeNode; ms : TMemoryStream;
    nGrupo, id: Integer;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
      nd := nd.Parent;

    pRec := nd.data;
    nGrupo := pRec.grupo;

    dmDIG.tbDig_Arquivo.Open;
    ms := TMemoryStream.Create;
    if OpenDialog1.Execute then
    begin
      ms.LoadFromFile(OpenDialog1.FileName);

      dmDIG.tbDig_Arquivo.Insert;
      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbDig_Arquivo.Post;

      dmDIG.tbArquivo_Digital.Last;

      dmDIG.tbArquivo_Digital.Insert;
      dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := edProcesso.Text;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
      dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 3; //PDF Imp
      dmDIG.tbArquivo_Digital.Post;
      nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
      
      nd := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
      id := dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
      
      New(pRec);
      pRec^.id := id;
      pRec^.tipo := 3;
      nd.Data := pRec;
      nd.Selected := true;

      //dmDIG.Commit(dmDIG.tbDig_Arquivo);
      dm.Commit(dmDIG.tbArquivo_Digital);
    end;

    try
     ms.Position := 0;
     pdf.LoadFromStream(ms,0);
    except
    end;

    ms.Free;
    dmDIG.tbDig_Arquivo.Close;
  end;
end;

procedure TfrmProcessoDigital.btExportarClick(Sender: TObject);
var nd:TTreeNode;
    id:integer;
    ms:TMemoryStream;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
    
      pRec := nd.data;
      id := pRec.id;

      ms := framArvore1.RetornaStreamBlob(id, sProp);
      try
       ms.Position := 0;
       pdf.LoadFromStream(ms,0);
       if SaveDialog1.Execute then
         ms.SaveToFile(SaveDialog1.FileName);
      finally
       ms.Free;
      end;
    end;
  end;
end;

procedure TfrmProcessoDigital.btExcluirClick(Sender: TObject);
var id:integer; nd:TTreeNode; bAtualizar:Boolean;
begin
  FbAtualizando := true;
  bAtualizar := false;
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin

      pRec := nd.data;
      id := pRec.id;

      dmDIG.tbDig_Arquivo.Close;
      dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger := id;
      dmDIG.tbDig_Arquivo.Open;
      if not dmDIG.tbDig_Arquivo.IsEmpty then
        dmDIG.tbDig_Arquivo.Delete;

      if dmDig.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
      begin
        if dmDig.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger>0 then
        begin
          dmDIG.tbEdt_Arquivo.Close;
          dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
            dmDig.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger;
          dmDIG.tbEdt_Arquivo.Open;
          if not dmDIG.tbEdt_Arquivo.IsEmpty then
            dmDIG.tbEdt_Arquivo.Delete;
        end;

        dmDig.tbArquivo_Digital.Delete;
        nd.Delete;
        bAtualizar := true;
      end;

      dmDIG.Commit(dmDIG.tbDig_Arquivo);

      dmDIG.tbDig_Arquivo.Close;
    end
    else if not nd.HasChildren then
    begin
      nd.Delete;
      bAtualizar :=  true;
    end;
  end;
  FbAtualizando := false;
  if bAtualizar then
    AtualizaDocumento(framArvore1.tv);
end;

procedure TfrmProcessoDigital.HabilitaBotoes(pbHabilitar: Boolean);
var i:integer;
begin
  for i := 0 to ComponentCount-1 do
    if (Components[i] is TSpeedButton) then
      if (Components[i] as TSpeedButton).Tag=1 then
        (Components[i] as TSpeedButton).Enabled := pbHabilitar;
end;

procedure TfrmProcessoDigital.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProcessoDigital.btRecolherClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to framArvore1.tv.Items.Count-1 do
    framArvore1.tv.Items.Item[i].Collapse(true);
end;

procedure TfrmProcessoDigital.btExpandirClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to framArvore1.tv.Items.Count-1 do
    framArvore1.tv.Items.Item[i].Expand(true);
end;

procedure TfrmProcessoDigital.PopupMenu1Popup(Sender: TObject);
var nd:TTreeNode;
begin
  nd := framArvore1.tv.Selected;
  if nd<>nil then
  begin
    pRec := nd.Data;
    Redigitalizar1.Enabled := (nd.Level>0)and(pRec.tipo=1);
    Editar1.Enabled := (nd.Level>0)and(pRec.tipo=2);
    Importar1.Enabled := (nd.Level>0)and(pRec.tipo=3);
  end;
end;

procedure TfrmProcessoDigital.Editar1Click(Sender: TObject);
var nd:TTreeNode; ms : TMemoryStream;
    bContinuar:Boolean;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.data;
      if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',pRec.id,[]) then
      begin
        dmDIG.tbEdt_Arquivo.Close;
        dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
              dmDIG.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger;
        dmDIG.tbEdt_Arquivo.Open;
        if dmDIG.tbEdt_Arquivo.RecordCount>0 then
        begin
          ms := TMemoryStream.Create;
          dmDIG.tbEdt_ArquivoBL_ARQUIVO.SaveToFile('c:\compware\temp\teste.rtf');

          frmEditor := TfrmEditor.Create(Application);
          frmEditor.bPastaDigital := true;
          frmEditor.editor.LoadFromFile('c:\compware\temp\teste.rtf');
          bContinuar := (frmEditor.ShowModal = mrOK);

          if bContinuar then
          begin
            //RTF
            frmEditor.editor.SaveToStream(ms);
            dmDIG.tbEdt_Arquivo.Edit;
            dmDIG.tbEdt_ArquivoBL_ARQUIVO.LoadFromStream(ms);
            dmDIG.tbEdt_Arquivo.Post;

            //PDF
            ms.LoadFromFile('c:\compware\temp\teste.pdf');
            dmDIG.tbDig_Arquivo.Close;
            dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
                   dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
            dmDIG.tbDig_Arquivo.Open;
            if dmDIG.tbDig_Arquivo.RecordCount>0 then
            begin
              dmDIG.tbDig_Arquivo.Edit;
              dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
              dmDIG.tbDig_Arquivo.Post;
            end;

            dmDIG.Commit(dmDIG.tbDig_Arquivo);

            try
             ms.Position := 0;
             pdf.LoadFromStream(ms,0);
            except
            end;
          end;

          frmEditor.Free;
          ms.Free;
          dmDIG.tbDig_Arquivo.Close;
        end;
        dmDIG.tbEdt_Arquivo.Close;
      end;
    end;
  end;
end;

procedure TfrmProcessoDigital.Importar1Click(Sender: TObject);
var nd:TTreeNode; ms : TMemoryStream;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.data;
      if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',pRec.id,[]) then
      begin
        dmDIG.tbDig_Arquivo.Close;
        dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
          dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
        dmDIG.tbDig_Arquivo.Open;
        if dmDIG.tbDig_Arquivo.RecordCount>0 then
        begin
          ms := TMemoryStream.Create;
          if OpenDialog1.Execute then
          begin
            ms.LoadFromFile(OpenDialog1.FileName);

            dmDIG.tbDig_Arquivo.Edit;
            dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
            dmDIG.tbDig_Arquivo.Post;

            dmDIG.Commit(dmDIG.tbDig_Arquivo);
          end;

          try
           ms.Position := 0;
           pdf.LoadFromStream(ms,0);
          except
          end;

          ms.Free;
        end;
        dmDIG.tbDig_Arquivo.Close;
      end;
    end;
  end;
end;

procedure TfrmProcessoDigital.Redigitalizar1Click(Sender: TObject);
begin
  btRedigitalizarClick(sender);
end;

procedure TfrmProcessoDigital.btNovoProcessoClick(Sender: TObject);
begin
  frmCadProcesso := TfrmCadProcesso.Create(Application);
  frmCadProcesso.fnProcesso := strToInt(edProcesso.text);
  frmCadProcesso.FbPermiteMudarPagina := false;
  frmCadProcesso.FbManterAberto := true;
  frmCadProcesso.ShowModal;
  lbNome.Caption := dmDIG.tbDig_Processo.FieldByName('NM_PACIENTE').AsString;
  edProcesso.Text := dmDIG.tbDig_Processo.FieldByName('NR_PROCESSO').AsString;
  frmCadProcesso.Free;

  dmDIG.tbArquivo_Digital.Close;
  dmDIG.tbArquivo_Digital.Open;
  HabilitaBotoes(true);
  framArvore1.tv.Items.Clear;
  pdf.Clear;
  framArvore1.CarregaGrupo(true, framArvore1.tv);
end;

procedure TfrmProcessoDigital.GruposModelo1Click(Sender: TObject);
begin
  frmCadGrupoMod := TfrmCadGrupoMod.Create(nil);
  frmCadGrupoMod.ShowModal;
  frmCadGrupoMod.Free;
end;

procedure TfrmProcessoDigital.ModeloDocumento1Click(Sender: TObject);
begin
  frmCadModelo := TfrmCadModelo.Create(application);
  frmCadModelo.showmodal;
  frmCadModelo.free;
end;

procedure TfrmProcessoDigital.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Base DIG:' + dmDIG.dbDig.DatabaseName +
                           '    Base SIS:' + dm.db.DatabaseName;
end;

procedure TfrmProcessoDigital.Propriedade1Click(Sender: TObject);
begin
  SHowMessage(sProp);
end;

procedure TfrmProcessoDigital.btMoverClick(Sender: TObject);
begin
  framArvore1.HabilitaMover(btMover.Down);
  if btMover.Down then
    framArvore1.Width := 350
  else
    framArvore1.Width := 150;
end;

procedure TfrmProcessoDigital.framArvore1tv2Change(Sender: TObject;
  Node: TTreeNode);
begin
  if not FbAtualizando then
    AtualizaDocumento(framArvore1.tv2);
end;

procedure TfrmProcessoDigital.framArvore1tvChange(Sender: TObject;
  Node: TTreeNode);
begin
  if not FbAtualizando then
    AtualizaDocumento(framArvore1.tv);
end;

procedure TfrmProcessoDigital.framArvore1btSalvarGrupoClick(
  Sender: TObject);
begin
  framArvore1.btSalvarGrupoClick(Sender);
  btProcessoClick(sender);
end;

procedure TfrmProcessoDigital.btSalvarClick(Sender: TObject);
var id:integer; nd:TTreeNode; ms:TMemoryStream; rs:TRecStream;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin

      pRec := nd.data;
      id := pRec.id;

      dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger := id;
      dmDIG.tbDig_Arquivo.Open;
      if not dmDIG.tbDig_Arquivo.IsEmpty then
      begin
        ms := TMemoryStream.Create;
        //ImageEnIO1.SaveToStreamPDF(ms);
        dmDIG.tbDig_Arquivo.Edit;
        dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
        dmDIG.tbDig_Arquivo.Post;

        try
         ms.Position := 0;
         pdf.LoadFromStream(ms,0);
        except
        end;
        ms.Free;
      end;
      dmDIG.tbDig_Arquivo.Close;
    end;
  end;
end;

procedure TfrmProcessoDigital.FormCreate(Sender: TObject);
begin
  fNome := 'c:\compware';
  if not DirectoryExists(fNome) then
    MkDir(fNome);

  fNome := fNome + '\Log';
  if not DirectoryExists(fNome) then
    MkDir(fNome);

  fNome :=  fNome + '\Digitalizacao' + FormatdateTime('ddmmyyhhnnss',now)+ '.log';
  AssignFile(fLog, fNome);
  Rewrite(fLog);
end;

procedure TfrmProcessoDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseFile(fLog);
end;

procedure TfrmProcessoDigital.InfoEstatistica1Click(Sender: TObject);
begin
  frmInfoEstat := TfrmInfoEstat.Create(self);
  frmInfoEstat.ShowModal;
  frmInfoEstat.Free;
end;

procedure TfrmProcessoDigital.Exportar1Click(Sender: TObject);
{var
  pageno: Integer;
begin
  pageno := PDF.PageNumber-1;
  SaveDialog1.Title := 'Save Page ' + IntToStr(pageno) + ' as JPEG';
  SaveDialog1.Filter := 'JPEG Files|*.JPG;*.JPEG|PNG Files|*.PNG';
  if SaveDialog1.Execute then
  begin
    if CompareText(ExtractFileExt(SaveDialog1.FileName), '.png') = 0 then
    begin
      PDF.CommandEx(COMPDF_MakePNGSetRes, 200);
      PDF.CommandStrEx()
      PDF.CommandStr(COMPDF_MakePNG, IntToStr(pageno)
          + '=' + SaveDialog1.FileName);
    end
    else
    begin
      PDF.CommandEx(COMPDF_MakeJPEGSetRes, 200);
      PDF.CommandStr(COMPDF_MakeJPEG, IntToStr(pageno)
          + '=' + SaveDialog1.FileName);
    end;
  end; }

var nd:TTreeNode;
    id, nRotacao:integer;
    ms:TMemoryStream;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.Data;
      id := pRec.id;
      if (id>0) then
      begin
        ms := framArvore1.RetornaStreamBlob(id,sProp);
        try
         if Assigned(ms) then
         begin
           ms.Position := 0;
           if SaveDialog1.Execute then
             ms.SaveToFile(SaveDialog1.FileName);
         end;
        finally
         ms.Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcessoDigital.ConverterJPG1Click(Sender: TObject);
var sPDF, sJPG:string;
begin
  Exportar1Click(sender);
  sPDF := SaveDialog1.FileName;
  sJPG := StringReplace(sPDF, '.pdf', '.jpg',[]);
  frmConverterPDF_JPG := TfrmConverterPDF_JPG.Create(self);
  frmConverterPDF_JPG.bExterno := true;
  frmConverterPDF_JPG.ConverterPDFJPG(sPDF,sJPG);
  frmConverterPDF_JPG.Free;
end;

procedure TfrmProcessoDigital.CriaProcessoDigital(psProcesso: string);
var sSQL, sAux:string;
begin
  try
    sSQL := dmDIG.qyArquivoDigital.SQL.Text;
    dmDIG.qyArquivoDigital.Close;
    dmDIG.qyArquivoDigital.SQL.Text :=
      'select distinct NR_PROCESSO ' +
      ' from ARQUIVO_DIGITAL ' +
      ' where CD_GRUPO <> :CD_GRUPO ' +
      ' and NR_PROCESSO = :NR_PROCESSO';

    dmDIG.qyArquivoDigital.ParamByName('CD_GRUPO').AsString :=
      prmPastaParecer;
    dmDIG.qyArquivoDigital.ParamByName('NR_PROCESSO').AsString := psProcesso;
    dmDIG.qyArquivoDigital.Open;

    dm.qyGeral.Close;
    dm.qyGeral.SQL.Text := 'SELECT 1 FROM PROCESSO WHERE NR_PROCESSO = :NR_PROCESSO';
    dm.qyGeral.ParamByName('NR_PROCESSO').AsInteger :=
        dmDIG.qyArquivoDigital.FieldByName('NR_PROCESSO').AsInteger;
    dm.qyGeral.Open;
    if dm.qyGeral.IsEmpty then
    begin
      dm.qyGeral.Close;
      dm.qyGeral.SQL.Text := 'INSERT INTO PROCESSO(NR_PROCESSO, FL_DIGITAL) VALUES(:NR_PROCESSO,1)';
      while not dmDIG.qyArquivoDigital.Eof do
      begin
        dm.qyGeral.ParamByName('NR_PROCESSO').AsInteger :=
          dmDIG.qyArquivoDigital.FieldByName('NR_PROCESSO').AsInteger;
        try
          dm.qyGeral.ExecSQL;
        finally
          dmDIG.qyArquivoDigital.Next;
        end;
      end;
    end;
    //DM.Commit(IBQ2);
  finally
    dmDIG.qyArquivoDigital.Close;
    dmDIG.qyArquivoDigital.SQL.Text := sSQL;
  end;
end;

end.
