unit UfrmRelTransferenciaLocal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS,
  StdCtrls, Buttons, ExtCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  ComCtrls, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelTransferenciaLocal = class(TfrmRelPad)
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    btLocal: TSpeedButton;
    btFamiliaLimpar: TSpeedButton;
    edCod: TEdit;
    edLocal: TEdit;
    qyGeralCD_TRANSFERENCIA: TIntegerField;
    qyGeralCD_PRODUTO: TIntegerField;
    qyGeralQT_PRODUTO: TIBBCDField;
    qyGeralCD_LOCAL_DE: TIntegerField;
    qyGeralCD_LOCAL_PARA: TIntegerField;
    qyGeralCD_USUARIO: TIntegerField;
    qyGeralDT_CADASTRO: TDateField;
    qyGeralCD_EMPRESA: TIntegerField;
    qyGeralSALDO: TIBBCDField;
    qyGeralNM_LOCAL_DE: TIBStringField;
    qyGeralNM_LOCAL_PARA: TIBStringField;
    qyGeralNM_USUARIO: TIBStringField;
    qyGeralDS_PRODUTO: TIBStringField;
    rgordenar: TRadioGroup;
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btLocalClick(Sender: TObject);
    procedure btFamiliaLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTransferenciaLocal: TfrmRelTransferenciaLocal;
  strSQL:string;

implementation

uses UDMGERAL, UfrmLocalizar, Ugeral;

{$R *.dfm}

procedure TfrmRelTransferenciaLocal.btImprimirClick(Sender: TObject);
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

  if (edCod.Text = '') then
  begin
    MessageDlg('Local inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    edLocal.setfocus;
    Exit;
  end;

  qyGeral.Close;
  qyGeral.SQL.Text := strSQL;
  qyGeral.SQL.Add('and T.DT_CADASTRO between :de and :ate');
  qyGeral.ParamByName('de').AsDate := dtDe.Date;
  qyGeral.ParamByName('ate').AsDate := dtAte.Date;

  if rgordenar.ItemIndex = 0 then
  begin
    qyGeral.SQL.Add('and T.CD_LOCAL_DE =:LOCAL');
    qyGeral.ParamByName('LOCAL').AsInteger := StrToInt(edCod.Text);
  end;

  if rgordenar.ItemIndex = 1 then
  begin
    qyGeral.SQL.Add('and T.CD_LOCAL_PARA =:LOCAL');
    qyGeral.ParamByName('LOCAL').AsInteger := StrToInt(edCod.Text);
  end;

  qyGeral.open;
  rvGeral.Execute;
  qyGeral.Close;
end;

procedure TfrmRelTransferenciaLocal.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;  
  rvGeral.ProjectFile := sPathLayout +'\RelTransferenciaLocal.rav';
end;

procedure TfrmRelTransferenciaLocal.btLocalClick(Sender: TObject);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Local';
  frmLocalizar.qyDados.sql.add('select cd_Local, nm_Local from Local');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='cd_local';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Local';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCod.text := frmLocalizar.qyDados.FieldByname('cd_Local').AsString;
    edLocal.text := frmLocalizar.qyDados.FieldByname('nm_Local').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;

end;

procedure TfrmRelTransferenciaLocal.btFamiliaLimparClick(Sender: TObject);
begin
  inherited;
  edCod.Clear;
  edLocal.Clear;
end;

end.
