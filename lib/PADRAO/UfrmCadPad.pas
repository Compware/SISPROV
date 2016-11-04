unit UfrmCadPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, dxExEdtr, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, DB, ufrmCadBase, Menus;

type
  TfrmCadPad = class(TfrmCadBase)
    sbPadrao: TStatusBar;
    Panel1: TPanel;
    btAnterior: TBitBtn;
    btProximo: TBitBtn;
    btPesquisar: TBitBtn;
    btIncluir: TBitBtn;
    btexcluir: TBitBtn;
    bteditar: TBitBtn;
    btgravar: TBitBtn;
    btimprimir: TBitBtn;
    Panel2: TPanel;
    pgGeral: TPageControl;
    tabLista: TTabSheet;
    tabGeral: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    grDados: TdxDBGrid;
    btfechar: TBitBtn;
    dsControle: TDataSource;
    dsGrid: TDataSource;
    btCancelar: TBitBtn;
    PopupMenu1: TPopupMenu;
    AtualizarLista1: TMenuItem;
    procedure btfecharClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grDadosDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pgGeralChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgGeralChange(Sender: TObject);
    procedure dsControleStateChange(Sender: TObject);
    procedure AtualizarLista1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FbPermiteMudarPagina: boolean;
    FbManterAberto: boolean;
    procedure InicializaControles;
    procedure AtualizaLista; virtual;
    procedure FocoControle; virtual;
    procedure CriaGrid; virtual;
    procedure Limpar; virtual;
  end;

var
  frmCadPad: TfrmCadPad;

implementation

uses UDM, UGeral, uRelatorioWEB, ufuncaoGrid, uPermissao;

{$R *.dfm}

procedure TfrmCadPad.btfecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadPad.btIncluirClick(Sender: TObject);
  procedure Insercao;
  begin
    if FbPermiteMudarPagina then
      pgGeral.ActivePageIndex := 1;
    btIncluir.Enabled := false;
    btexcluir.Enabled := false;
    bteditar.Enabled := false;
    btgravar.Enabled := true;
    btCancelar.Enabled := true;
    btimprimir.Enabled := false;
    btAnterior.Enabled := false;
    btProximo.Enabled := false;
    btPesquisar.Enabled := false;
    DM.Transacao(dsControle.DataSet);
    dsControle.DataSet.Insert;
    FocoControle;
  end;

begin
  if prmBloqueio = 'S' then
  begin
    frmPermissao := TfrmPermissao.Create(self);
    if  frmPermissao.ShowModal = mrOk then
      Insercao
    else
      abort;

    frmPermissao.Free;
  end
  else
  begin
    Insercao;
  end;
end;

procedure TfrmCadPad.btexcluirClick(Sender: TObject);
  procedure exclusao;
  begin
    if not (dsControle.DataSet.State in [dsEdit, dsInsert]) and
      (dsControle.DataSet.RecordCount > 0) then
    begin
      DM.Transacao(dsControle.DataSet);
      dsControle.DataSet.Delete;
      InicializaControles;
      AtualizaLista;
      DM.Commit(dsControle.DataSet);
    end;
  end;
begin

  if prmBloqueio = 'S' then
  begin
    frmPermissao := TfrmPermissao.Create(self);
    if  frmPermissao.ShowModal = mrOk then
      exclusao
    else
      abort;

    frmPermissao.Free;
  end
  else
  begin
    exclusao;
  end;

end;

procedure TfrmCadPad.bteditarClick(Sender: TObject);
begin
  if not(dsControle.DataSet.State in [dsEdit, dsInsert]) and
    (dsControle.DataSet.RecordCount > 0) then
  begin
    if FbPermiteMudarPagina then
      pgGeral.ActivePageIndex := 1;
    btIncluir.Enabled := false;
    btexcluir.Enabled := false;
    bteditar.Enabled := false;
    btgravar.Enabled := true;
    btCancelar.Enabled := true;
    btimprimir.Enabled := false;
    btAnterior.Enabled := false;
    btProximo.Enabled := false;
    btPesquisar.Enabled := false;
    dm.Transacao(dsControle.DataSet);
    dsControle.DataSet.Edit;
  end
  else
    Abort;
end;

procedure TfrmCadPad.btgravarClick(Sender: TObject);
begin
  if dsControle.DataSet.State in [dsEdit, dsInsert] then
    dsControle.DataSet.Post;
  AtualizaLista;
  DM.Commit(dsControle.DataSet);
  InicializaControles;
end;

procedure TfrmCadPad.btAnteriorClick(Sender: TObject);
begin
  if not (dsControle.DataSet.State in [dsEdit, dsInsert]) then
    dsControle.DataSet.Prior;
end;

procedure TfrmCadPad.btProximoClick(Sender: TObject);
begin
  if not (dsControle.DataSet.State in [dsEdit, dsInsert]) then
    dsControle.DataSet.Next;
end;

procedure TfrmCadPad.FormShow(Sender: TObject);
begin
  grDados.LoadFromIniFile(grDados.IniFileName);
  grDados.ShowGroupPanel := true;
  InicializaControles;
  if dsControle.DataSet = nil then
    dsControle.DataSet := dsGrid.DataSet;

  dsControle.DataSet.Open;

end;

procedure TfrmCadPad.btimprimirClick(Sender: TObject);
var sArq, sExt, sAuxDe, sAuxPara:string; s:TStringList;
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  s := TStringList.Create;
  try
    sExt := '.html';
    sArq := sPathConsulta + FormatDateTime('ddmmyyhhnnss',now) + sExt;
    sArqGridHtml := sArq;
    grDados.SaveToHTML(sArq, false);
    s.LoadFromFile(sArq);
    sAuxDe := '<TITLE>grDados</TITLE>';
    sAuxPara := '<TITLE>'+caption+'</TITLE>';
    s.text := StringReplace(s.Text,sAuxDe,sAuxPara,[]);
    sAuxDe := '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=1 BGCOLOR=#C0C0C0>';
    sAuxPara := sAuxDe +
       '<TR class="Header"><TD HEIGHT=30 COLSPAN="'+intToStr(grDados.ColumnCount)
       +'" ALIGN="CENTER" BGCOLOR=#ECE9D8><b>'+Caption+'</b></TD></TR>';
    s.text := StringReplace(s.Text,sAuxDe,sAuxPara,[]);
    s.SaveToFile(sArq);
    //ImprimeGrid(grDados, Self.Caption);
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
    FreeAndNil(s);
  end;
end;

procedure TfrmCadPad.btCancelarClick(Sender: TObject);
begin
  InicializaControles;
  if dsControle.DataSet.State in [dsEdit, dsInsert] then
  begin
    dsControle.DataSet.Cancel;
    DM.Rollback(dsControle.DataSet);
  end;
end;

procedure TfrmCadPad.InicializaControles;
begin
  if FbPermiteMudarPagina then
    pgGeral.ActivePageIndex := 0;
  btIncluir.Enabled := true;
  btexcluir.Enabled := true;
  bteditar.Enabled := true;
  btgravar.Enabled := false;
  btCancelar.Enabled := false;
  btimprimir.Enabled := true;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
  btPesquisar.Enabled := true;
end;

procedure TfrmCadPad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not FbManterAberto then
    dsControle.DataSet.Close;
end;

procedure TfrmCadPad.grDadosDblClick(Sender: TObject);
begin
  pgGeral.ActivePage := tabGeral;
end;

procedure TfrmCadPad.FormCreate(Sender: TObject);
begin
  inherited;
  grDados.IniFileName := sPathGrid  + self.Name + '.ini';
  FbPermiteMudarPagina := True;
end;

procedure TfrmCadPad.pgGeralChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := pgGeral.ActivePage.TabVisible;
  if pgGeral.ActivePageIndex = 1 then
     AllowChange := not(dsControle.DataSet.State in dsEditModes);
end;

procedure TfrmCadPad.AtualizaLista;
begin
  //Atualizar a Consulta do Grid - Somente se Extiver na Pagina de Listagem
  if (pgGeral.ActivePageIndex = 0) and (dsControle.DataSet <> dsGrid.DataSet) then
  begin
    dsGrid.DataSet.Close; dsGrid.DataSet.Open;
  end;
end;

procedure TfrmCadPad.FocoControle;
begin
//
end;

procedure TfrmCadPad.pgGeralChange(Sender: TObject);
begin
  inherited;
  //AR Quando estiver com state dsBrowse não atualizar a lista
  {if pgGeral.ActivePageIndex = 0 then
     AtualizaLista;
  }
  if pgGeral.ActivePageIndex = 1 then
    FocoControle;
end;

procedure TfrmCadPad.dsControleStateChange(Sender: TObject);
begin
  inherited;
  if  dsControle.State = dsEdit then
    sbPadrao.Panels[0].Text := 'Alterando'
  else if  dsControle.State = dsInsert then
    sbPadrao.Panels[0].Text := 'Inserindo'
  else
    sbPadrao.Panels[0].Text := 'Navegando';
end;


procedure TfrmCadPad.CriaGrid;
begin
//
end;

procedure TfrmCadPad.Limpar;
begin
//
end;

procedure TfrmCadPad.AtualizarLista1Click(Sender: TObject);
begin
  if not (dsControle.State in [dsEdit, dsInsert]) then
  begin
    AtualizaLista;
    pgGeral.ActivePageIndex := 0;
  end;
end;

end.
