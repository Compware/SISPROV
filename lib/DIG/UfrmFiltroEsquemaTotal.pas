unit UfrmFiltroEsquemaTotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  ExtCtrls, ComCtrls, RxGIF;

type
  TfrmFiltroEsquemaTotal = class(TForm)
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
    GroupBox1: TGroupBox;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edEsquema: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroEsquemaTotal: TfrmFiltroEsquemaTotal;

implementation

Uses
  UfrmConEsquemaTotal, DB, UfrmLocalizar, UGeralSQL;

{$R *.dfm}

procedure TfrmFiltroEsquemaTotal.BitBtn1Click(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Aguarde...';
  frmConEsquemaTotal.qyAgenda.Close;
  frmConEsquemaTotal.qyAgenda.SQL.Text := sSQL1;

  if edEsquema.text <> '' then
  begin
    frmConEsquemaTotal.qyAgenda.SQL.Text :=
      ' select count(*), esquema                                                '+
      ' from (                                                                  '+
      ' select                                                                  '+
      '   (select ds_esquema from agenda                                        '+
      '   where agenda.cd_paciente = paciente.cd_paciente                       '+
      '   and ("AGENDA".DT_AGENDA >= :DT_DE and "AGENDA".DT_AGENDA < :DT_ATE)   '+
      '    and ds_esquema = :ESQUEMA                                             '+
      '   and cd_agenda = (select max(cd_agenda) from agenda                    '+
      '                     where agenda.cd_paciente = paciente.cd_paciente     '+
      '                     and fl_esquema = 0))esquema                         '+
      ' from  paciente                                                          '+
      ' where exists(                                                           '+
      ' select  1 from agenda                                                   '+
      ' where fl_esquema = 0                                                    '+
      ' and nr_processo is not null                                             '+
      ' and ("AGENDA".DT_AGENDA >= :DT_DE2 and "AGENDA".DT_AGENDA < :DT_ATE2)   '+
      '    and ds_esquema = :ESQUEMA2                                             '+
      ' and agenda.cd_paciente = paciente.cd_paciente)                          '+
      ' )                                                                       '+
      ' group by esquema                                                        ';

      frmConEsquemaTotal.qyAgenda.ParamByName('ESQUEMA').AsString := edEsquema.Text;
      frmConEsquemaTotal.qyAgenda.ParamByName('ESQUEMA2').AsString := edEsquema.Text;
  end;

  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    frmConEsquemaTotal.qyAgenda.ParamByName('dt_de').AsDateTime := dtde.Date;
    frmConEsquemaTotal.qyAgenda.ParamByName('dt_ate').AsDateTime := dtate.Date;
    frmConEsquemaTotal.qyAgenda.ParamByName('dt_de2').AsDateTime := dtde.Date;
    frmConEsquemaTotal.qyAgenda.ParamByName('dt_ate2').AsDateTime := dtate.Date;
  end;

  frmConEsquemaTotal.qyAgenda.Open;
end;

procedure TfrmFiltroEsquemaTotal.SpeedButton4Click(Sender: TObject);
begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Esquema';
    frmLocalizar.qyDados := SelectDadosEsquema;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,7);
      frmLocalizar.KeyField := 'cd_esquema';
      VCampo[0].Titulo  := 'C�digo';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome Medicamento';
      VCampo[1].Width := 30;
      VCampo[2].Titulo  := 'Sigla';
      VCampo[2].Width := 25;
      VCampo[3].Titulo  := 'Apresenta��o';
      VCampo[3].Width := 30;
      VCampo[4].Titulo  := 'Nome Comercial';
      VCampo[4].Width := 30;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := True;
      VCampo[3].Visivel := True;
      VCampo[4].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      if edEsquema.text <> '' then
        edEsquema.text := edEsquema.text + '+' + frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
      else
        edEsquema.text := frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
    end;
    frmLocalizar.qyDados.Close;
    frmLocalizar.Free;

end;

procedure TfrmFiltroEsquemaTotal.SpeedButton3Click(Sender: TObject);
begin
  edEsquema.Clear;
end;

end.
