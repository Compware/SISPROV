unit ufrmRelListagemGeralExames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls,
  ComCtrls, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, DB,
  IBCustomDataSet, IBQuery, Buttons, ExtCtrls;

type
  TfrmRelListagemGeralExames = class(TfrmRelPad)
    TabSheet1: TTabSheet;
    GroupBox6: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    GroupBox7: TGroupBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    GroupBox9: TGroupBox;
    CheckBox23: TCheckBox;
    GroupBox8: TGroupBox;
    CheckBox22: TCheckBox;
    GroupBox10: TGroupBox;
    CheckBox24: TCheckBox;
    GroupBox11: TGroupBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    qyGeralDS_EXAMES: TIBStringField;
    qyGeralDT_AGENDA: TDateTimeField;
    qyGeralNR_LAB: TIntegerField;
    qyGeralNM_PACIENTE: TIBStringField;
    qyGeralNR_PROCESSO: TIntegerField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    dtde: TdxDateEdit;
    Label8: TLabel;
    dtate: TdxDateEdit;
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelListagemGeralExames: TfrmRelListagemGeralExames;
  strSQL:string;
implementation

uses
  UDM, UDMGERAL, UGeral;

{$R *.dfm}

procedure TfrmRelListagemGeralExames.btImprimirClick(Sender: TObject);
var
  sAnd, sTrue:Boolean;
  i:Integer;
begin
  if dtDe.Date < 1 then
  begin
    MessageDlg('É necessário, incluir o período INICIO!',mtWarning,[mbOK],0);
    abort;
  end;
  if dtAte.Date < 1 then
  begin
    MessageDlg('É necessário, incluir o período FINAL!',mtWarning,[mbOK],0);
    abort;
  end;

  if dtde.Date > dtAte.Date then
  begin
    MessageDlg('Data FINAL não pode ser menor que a data INICIO!',mtWarning,[mbOK],0);
    abort;
  end;
  inherited;

  try
    qyGeral.Close;
    qyGeral.SQL.Text := strSQL;
    qyGeral.SQL.Add('and a.dt_agenda between :de and :ate');
    qyGeral.ParamByName('de').AsDate := dtDe.Date;
    qyGeral.ParamByName('ate').AsDate := dtAte.Date;

    sAnd := false;
    sTrue := false;
    for i:=0 to (ComponentCount - 1) do
      if (Components[i] is TCheckBox) then
        if (Components[i] as TCheckBox).Checked then
          if sAnd then
            begin
              qyGeral.SQL.Add(','+ IntToStr((Components[i] as TCheckBox).tag));
              sTrue := true;
            end
          else
          begin
            qyGeral.SQL.Add('and ea.cd_exames in (' + IntToStr((Components[i] as TCheckBox).tag));
            sAnd := true;
            sTrue := true;
          end;

    if sTrue then
      qyGeral.SQL.Add(')');

    qyGeral.open;
    RvGeral.Execute;

  finally
    qyGeral.Close;
  end;



end;

procedure TfrmRelListagemGeralExames.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;
  RvGeral.ProjectFile := sPathLayout +'\RelListagemGeralExames.rav'; 
end;

end.
