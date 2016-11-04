unit UfrmFiltroProdutividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  ExtCtrls, ComCtrls;

type
  TfrmFiltroProdutividade = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    btLocMedico: TdxButtonEdit;
    Label3: TLabel;
    edMedico: TdxEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMedicoChange(Sender: TObject);
    procedure btLocMedicoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroProdutividade: TfrmFiltroProdutividade;

implementation

Uses
  UfrmConProdutividadeMedico, IBQuery, Udm, UgeralSQL, UfrmLocalizar;
{$R *.dfm}

procedure TfrmFiltroProdutividade.BitBtn1Click(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Aguarde...';
  frmConProdutividadeMedico.qyAgenda.Close;
  frmConProdutividadeMedico.qyAgenda.SQL.Text := sSQLAGENDA;

  If btLocMedico.Text <> '' then
  begin
    frmConProdutividadeMedico.qyAgenda.SQL.Add('AND A.CD_MEDICO = ''' +
                            btLocMedico.Text + '''');
  end;

  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    frmConProdutividadeMedico.qyAgenda.SQL.Add('AND A.DT_AGENDA between :de and :ate');
    frmConProdutividadeMedico.qyAgenda.ParamByName('de').AsDateTime := dtde.Date;
    frmConProdutividadeMedico.qyAgenda.ParamByName('ate').AsDateTime := dtate.Date;
    frmConProdutividadeMedico.qyAgenda.SQL.Add('order by cd_agenda');
  end;

  frmConProdutividadeMedico.qyAgenda.Open;
end;

procedure TfrmFiltroProdutividade.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Médico';
  frmLocalizar.qyDados := SelectDadosMedico;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,3);
    frmLocalizar.KeyField := 'cd_medico';
    VCampo[0].Titulo  := 'Cód.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := false;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocMedico.Text := frmLocalizar.qyDados.FieldByname('cd_medico').AsString;
    edMedico.Text := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmFiltroProdutividade.btLocMedicoChange(Sender: TObject);
begin
  if btLocMedico.Text = '' then
    edMedico.Clear
  else if btLocMedico.Modified then
  begin
    try
      edMedico.Text := PegaValor('NM_MEDICO','MEDICO',['CD_MEDICO'],
        [btLocMedico.Text],nil);
    except
      begin
        edMedico.Clear;
      end;
    end;
  end;

end;

procedure TfrmFiltroProdutividade.btLocMedicoExit(Sender: TObject);
begin
  if btLocMedico.Text <> '' then
  begin
    try
      edMedico.Text := PegaValor('NM_MEDICO','MEDICO',['CD_MEDICO'],
        [btLocMedico.Text],nil);
    except
      begin
        MessageDlg('Medico não encontrado!',mtWarning,[mbOK],0);
        btLocMedico.Clear;
        edMedico.Clear;
      end;
    end;
  end;

end;

end.
