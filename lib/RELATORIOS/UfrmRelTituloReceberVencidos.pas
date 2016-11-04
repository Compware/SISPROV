unit UfrmRelTituloReceberVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls,
  ComCtrls, RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS, DB,
  IBCustomDataSet, IBQuery, Buttons, ExtCtrls;

type
  TfrmRelTituloReceberVencidos = class(TfrmRelPad)
    RvDtCnTituloReceberVencidos: TRvDataSetConnection;
    RvDtCnTituloReceberVencidosConfRel: TRvDataSetConnection;
    RvSysTituloReceberVencidos: TRvSystem;
    RvPrjTituloReceberVencidos: TRvProject;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    TabSheet1: TTabSheet;
    dtate: TdxDateEdit;
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
    procedure RvPrjTituloReceberVencidosCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtdeExit(Sender: TObject);
    procedure dtateExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTituloReceberVencidos: TfrmRelTituloReceberVencidos;

implementation

uses UDM, UDMGERAL, Ugeral, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelTituloReceberVencidos.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyGeral.ParamByName('DATA').AsDate := DM.GetDate;
  qyGeral.ParamByName('de').AsDate := dtDe.Date;
  qyGeral.ParamByName('ate').AsDate := dtAte.Date;

end;

procedure TfrmRelTituloReceberVencidos.RvPrjTituloReceberVencidosCreate(Sender: TObject);
begin
  inherited;
  RvPrjTituloReceberVencidos.ProjectFile := sPathLayout +'\RelTituloReceberVencidos.rav';
end;

procedure TfrmRelTituloReceberVencidos.btImprimirClick(Sender: TObject);
begin
  inherited;
  if (dtDe.Text = '  /  /    ') then
  begin
    MessageDlg('Data (Inicio) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtDe.setfocus;
    Exit;
  end;

  if (dtAte.Text = '  /  /    ') then
  begin
    MessageDlg('Data (Final) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtAte.setfocus;
    Exit;
  end;

  try
    dmRelatorios.tbTmpParametro.Open;  
    dmRelatorios.tbTmpParametro.Insert;
    dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
    dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := dtde.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := dtate.text;
    dmRelatorios.tbTmpParametro.Post;
    qyGeral.open;
    RvPrjTituloReceberVencidos.Execute;
  finally
    qyGeral.Close;
    dmRelatorios.tbTmpParametro.Delete;
    dmRelatorios.tbTmpParametro.Close;
    close;    
  end;

end;

procedure TfrmRelTituloReceberVencidos.FormCreate(Sender: TObject);
begin
  inherited;
  RvPrjTituloReceberVencidos.ProjectFile := sPathLayout +'\RelTituloReceberVencidos.rav';
end;

procedure TfrmRelTituloReceberVencidos.dtdeExit(Sender: TObject);
begin
  inherited;
  if dtde.Date > DM.GetDate then
    begin
      MessageDlg('Data Inicio não pode ser maior que a data atual! Favor inserir novamente!',mtInformation,
       [mbOK],0);
      dtde.setfocus;
    end;

end;

procedure TfrmRelTituloReceberVencidos.dtateExit(Sender: TObject);
begin
  inherited;
  if dtate.Date > DM.GetDate then
    begin
      MessageDlg('Data Final não pode ser maior que a data atual! Favor inserir novamente!',mtInformation,
       [mbOK],0);
      dtate.setfocus;
    end;

end;

end.
