unit uConsDuplicidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, IBCustomDataSet, IBQuery, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  dxDBTLCl, dxGrClms, Menus, uFramePaciente;

type
  TfrmConsDuplicidade = class(TfrmCadPad)
    qyGrid: TIBQuery;
    grDadosTOTAL: TdxDBGridMaskColumn;
    grDadosNM_PACIENTE: TdxDBGridMaskColumn;
    grDadosDT_NASCIMENTO: TdxDBGridDateColumn;
    grDadosNM_MAE: TdxDBGridMaskColumn;
    grDetalhe: TdxDBGrid;
    dsDetalhe: TDataSource;
    qyPaciente: TIBQuery;
    grDetalheColumn1: TdxDBGridColumn;
    grDetalheColumn2: TdxDBGridColumn;
    grDetalheColumn3: TdxDBGridColumn;
    grDetalheColumn5: TdxDBGridColumn;
    grDetalheColumn6: TdxDBGridColumn;
    grDetalheColumn7: TdxDBGridColumn;
    PopupMenu2: TPopupMenu;
    AbrirNotificao1: TMenuItem;
    Panel5: TPanel;
    grDetalheColumn8: TdxDBGridColumn;
    qyGridTOTAL_NOTIFICACAO: TIntegerField;
    qyGridNM_PACIENTE: TIBStringField;
    qyGridDT_NASCIMENTO: TDateField;
    qyGridNM_MAE: TIBStringField;
    qyPacienteDT_NOTIFICACAO: TDateField;
    qyPacienteNR_NOTIFICACAO: TIBStringField;
    qyPacienteCD_PACIENTE: TIntegerField;
    qyPacienteNM_PACIENTE: TIBStringField;
    qyPacienteDT_NASCIMENTO: TDateField;
    qyPacienteNM_MAE: TIBStringField;
    qyPacienteESTADO_CIVIL: TIntegerField;
    qyPacienteDS_MUNICIPIO: TIBStringField;
    qyPacienteDS_PROVINCIA: TIBStringField;
    Eliminar1: TMenuItem;
    grDetalheColumn9: TdxDBGridColumn;
    qyPacienteCD_UND: TIntegerField;
    AbrirCadUtente1: TMenuItem;
    N1: TMenuItem;
    TabSheet1: TTabSheet;
    framPaciente1: TframPaciente;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AbrirNotificao1Click(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsDuplicidade: TfrmConsDuplicidade;

implementation

uses UDM, uCadNotificacao, UDMGERAL;

{$R *.dfm}

procedure TfrmConsDuplicidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qyGrid.Close;
  qyPaciente.Close;
  dmGeral.TB_PACIENTE.Close;
  dmGeral.TB_PACIENTE.DataSource := nil;
end;

procedure TfrmConsDuplicidade.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  qyPaciente.Open;
  dmGeral.TB_PACIENTE.DataSource := dsDetalhe;
  dmGeral.TB_PACIENTE.Open;
end;

procedure TfrmConsDuplicidade.AbrirNotificao1Click(Sender: TObject);
var sSQL:String;
begin
  inherited;
  frmCadNotificacao := TfrmCadNotificacao.Create(self);
  try
    sSQL := frmCadNotificacao.qyLocalizarNotificacao.Sql.Text;
    frmCadNotificacao.qyLocalizarNotificacao.Sql.Text := StringReplace(sSQL,'1=2',
     'NR_NOTIFICACAO='+QuotedStr(qyPacienteNR_NOTIFICACAO.AsString),[]);
    frmCadNotificacao.qyLocalizarNotificacao.Open;
    if frmCadNotificacao.qyLocalizarNotificacao.IsEmpty then
        MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);

    frmCadNotificacao.ShowModal;
  finally
    frmCadNotificacao.qyLocalizarNotificacao.Sql.Text := sSQL;
    frmCadNotificacao.Free;
  end;
end;

procedure TfrmConsDuplicidade.grDadosDblClick(Sender: TObject);
begin
  pgGeral.ActivePage := tabGeral;

end;

end.
