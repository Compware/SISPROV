unit ufrmCadCD4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, RxDBComb, Mask, DBCtrls, ToolEdit,
  RXDBCtrl, IBCustomDataSet, IBQuery, RxLookup, dxEditor, dxEdLib, RpCon,
  RpConDS, RpRender, RpRenderPDF, RpRave, RpDefine, RpBase, RpSystem, Menus;

type
  TfrmCadCD4 = class(TfrmCadPad)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label5: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    dtResultado: TDBDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    edCD4: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    edCD8: TDBEdit;
    Label11: TLabel;
    edCD3: TDBEdit;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    qyResp: TIBQuery;
    dsResp: TDataSource;
    qyRespCD_CODIGO: TIntegerField;
    qyRespDS_DESCRICAO: TIBStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qyAgenda: TIBQuery;
    qyAgendaCD_AGENDA: TIntegerField;
    qyAgendaCD_PACIENTE: TIntegerField;
    qyAgendaNR_PROCESSO: TIntegerField;
    qyAgendaNM_PACIENTE: TIBStringField;
    qyAgendaIDADE: TSmallintField;
    qyAgendaTP_SEXO: TIBStringField;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaNR_LAB: TIntegerField;
    qyAgendaCD_AGENDA2: TIntegerField;
    qyAgendaNR_CD3: TIBBCDField;
    qyAgendaNR_CD4: TIBBCDField;
    qyAgendaNR_CD8: TIBBCDField;
    qyAgendaCD_RESPONSAVEL: TIntegerField;
    qyAgendaDT_RESULTADO: TDateField;
    btNumLab: TdxButtonEdit;
    qyGrid: TIBQuery;
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    grDadosColumn3: TdxDBGridColumn;
    grDadosColumn4: TdxDBGridColumn;
    grDadosColumn5: TdxDBGridColumn;
    grDadosColumn6: TdxDBGridColumn;
    grDadosColumn7: TdxDBGridColumn;
    grDadosColumn8: TdxDBGridColumn;
    grDadosColumn9: TdxDBGridColumn;
    qyAgendaDT_CONFIRMACAO: TDateTimeField;
    RvRenderPDF1: TRvRenderPDF;
    RvDataSetConnection1: TRvDataSetConnection;
    qyGridCD_AGENDA2: TIntegerField;
    qyGridCD_AGENDA: TIntegerField;
    qyGridNR_CD3: TIBBCDField;
    qyGridNR_CD4: TIBBCDField;
    qyGridNR_CD8: TIBBCDField;
    qyGridCD_RESPONSAVEL: TIntegerField;
    qyGridDT_RESULTADO: TDateField;
    qyGridCD_PACIENTE: TIntegerField;
    qyGridNR_PROCESSO: TIntegerField;
    qyGridNM_PACIENTE: TIBStringField;
    qyGridIDADE: TSmallintField;
    qyGridTP_SEXO: TIBStringField;
    qyGridDT_AGENDA: TDateTimeField;
    qyGridDT_CONFIRMACAO: TDateTimeField;
    qyGridNR_LAB: TIntegerField;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    ckRefazer: TDBCheckBox;
    procedure qyRespBeforeOpen(DataSet: TDataSet);
    procedure edNumLabExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btNumLabButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure tabListaShow(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SalvaArquivo:boolean;
  end;

var
  frmCadCD4: TfrmCadCD4;
  sGrid:string;

implementation

uses UDMGERAL, UDM, UGeral, UDMDIG;

{$R *.dfm}

procedure TfrmCadCD4.qyRespBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyResp.ParamByName('CD_TABELA').AsString := prmTabRespLab;
end;

procedure TfrmCadCD4.edNumLabExit(Sender: TObject);
begin
  inherited;
  qyAgenda.Close;
  qyAgenda.ParamByName('NR_LAB').AsString := trim(btNumLab.Text);
  qyAgenda.Open;

  if qyAgendaCD_AGENDA.AsInteger > 0 then
  begin

    DMGERAL.TB_RESULTADO_CD4.Close;
    DMGERAL.TB_RESULTADO_CD4.ParamByName('NR_LAB').AsString := btNumLab.Text;
    DMGERAL.TB_RESULTADO_CD4.Open;

{    if not btgravar.Enabled then
      bteditarClick(Sender);

    if not (DMGERAL.TB_RESULTADO_CD4.State = dsEdit) then
      DMGERAL.TB_RESULTADO_CD4.Edit;
}
  end
  else
  begin

    if not btgravar.Enabled then
      btIncluirClick(Sender);

    DMGERAL.TB_RESULTADO_CD4CD_AGENDA.AsInteger := qyAgendaCD_AGENDA2.AsInteger;
    DMGERAL.TB_RESULTADO_CD4DT_CONFIRMACAO.AsDateTime := qyAgendaDT_CONFIRMACAO.AsDateTime;
    DMGERAL.TB_RESULTADO_CD4CD_PACIENTE.AsInteger := qyAgendaCD_PACIENTE.AsInteger;
    DMGERAL.TB_RESULTADO_CD4NM_PACIENTE.AsString := qyAgendaNM_PACIENTE.AsString;
    DMGERAL.TB_RESULTADO_CD4IDADE.AsInteger := qyAgendaIDADE.AsInteger;
    DMGERAL.TB_RESULTADO_CD4TP_SEXO.AsString := qyAgendaTP_SEXO.AsString;
    DMGERAL.TB_RESULTADO_CD4NR_PROCESSO.AsString := qyAgendaNR_PROCESSO.AsString;
    DMGERAL.TB_RESULTADO_CD4NR_LAB.AsString := btNumLab.Text;

  end;

end;

procedure TfrmCadCD4.FormShow(Sender: TObject);
begin
  inherited;
  qyResp.Open;
  qyGrid.Open;
end;

procedure TfrmCadCD4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qyResp.Close;
end;

procedure TfrmCadCD4.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  sGrid := qyGrid.SQL.Text;
  qyResp.Open;
  qyGrid.Open;
end;

procedure TfrmCadCD4.btNumLabButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  edNumLabExit(Sender);
end;

procedure TfrmCadCD4.tabListaShow(Sender: TObject);
begin
  inherited;
{
  qyGrid.Close;
  qyGrid.SQL.Text := StringReplace(sGrid, '/* CONDICAO */', 'and DT_RESULTADO = CAST(''NOW'' AS DATE)',[]);
  qyGrid.Open;
}
end;

procedure TfrmCadCD4.btimprimirClick(Sender: TObject);
begin
  if pgGeral.ActivePageIndex = 0 then
    inherited
  else
  begin
    RvSystem1.DefaultDest  := rdPreview;
    RvSystem1.DoNativeOutput := False;
    //RvSystem1.OutputFileName := sNome;
    RvSystem1.RenderObject := RvRenderPDF1;
    RvSystem1.SystemSetups := RvSystem1.SystemSetups + [ssAllowSetup];
    RvProject1.Execute;
  end;
end;

procedure TfrmCadCD4.grDadosDblClick(Sender: TObject);
begin
  inherited;
  btNumLab.Text := qyGridNR_LAB.AsString;
  edNumLabExit(Sender);
end;

function TfrmCadCD4.SalvaArquivo:boolean;
var ms:TMemoryStream;  sNome:string;
    nGrupo:Integer;
begin
  ms := TMemoryStream.Create;
  try
    result := false;
    nGrupo := ValorParametro(nParGrupoExames);

    sNome := 'c:\compware\temp\ResultadoCD4.pdf';
    if FileExists(sNome) then DeleteFile(sNome);

    //Preciso do Post aqui, pois o Execute vai cancelar o Edit
    if dmGeral.TB_RESULTADO_CD4.State in [dsInsert, dsEdit] then
      dmGeral.TB_RESULTADO_CD4.Post;

    RvSystem1.DefaultDest  := rdFile;
    RvSystem1.DoNativeOutput := False;
    RvSystem1.OutputFileName := sNome;
    RvSystem1.RenderObject := RvRenderPDF1;
    RvSystem1.SystemSetups := RvSystem1.SystemSetups - [ssAllowSetup];
    RvProject1.Execute;

    if not FileExists(sNome) then
    begin
      ShowMessage('Arquivo nao encontrado!');
      Exit;
    end
    else
      ShowMessage('Arquivo OK!');

    ms.LoadFromFile(sNome);

    dmDIG.tbDig_Arquivo.Close;
    dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
      dmGeral.TB_RESULTADO_CD4CD_ARQUIVO.AsInteger;
    dmDIG.tbDig_Arquivo.Open;

    if dmDIG.tbDig_Arquivo.isEmpty then
      dmDIG.tbDig_Arquivo.Insert
    else
      dmDIG.tbDig_Arquivo.Edit;
    dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
    dmDIG.tbDig_Arquivo.Post;

    if (dmGeral.TB_RESULTADO_CD4NR_PROCESSO.AsString <> '') then
    begin
      dmDIG.tbArquivo_Digital.Close;
      dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString :=
        dmGeral.TB_RESULTADO_CD4NR_PROCESSO.AsString;
      dmDIG.tbArquivo_Digital.Open;

      if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger,[]) then
        dmDIG.tbArquivo_Digital.Edit
      else
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

      dmDIG.tbArquivo_Exame.Close;
      dmDIG.tbArquivo_Exame.ParamByName('CD_ARQUIVO').AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_Exame.Open;

      if dmDIG.tbArquivo_Exame.IsEmpty then
        dmDIG.tbArquivo_Exame.Insert
      else
        dmDIG.tbArquivo_Exame.Edit;

      dmDIG.tbArquivo_ExameCD_AGENDA.AsString := dmGeral.TB_RESULTADO_CD4CD_AGENDA.AsString;
      dmDIG.tbArquivo_ExameCD_ARQUIVO.AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_Exame.Post;
    end;

    if not (dmGeral.TB_RESULTADO_CD4.State = dsEdit) then
      dmGeral.TB_RESULTADO_CD4.Edit;
    dmGeral.TB_RESULTADO_CD4CD_ARQUIVO.AsInteger :=
       dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
    result := true;

  finally
    ms.Free;
    dmDIG.tbDig_Arquivo.Close;
    dmDIG.tbArquivo_Exame.Close;
  end;
end;

procedure TfrmCadCD4.btgravarClick(Sender: TObject);
begin
  SalvaArquivo;
  inherited;
end;

end.
