unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, ExtCtrls, StdCtrls, Mask, DBCtrls, dxTL,
  dxDBCtrl, dxDBGrid, DB, dxCntner, ComCtrls, Buttons, IBCustomDataSet,
  IBQuery, Menus;

type
  TfrmCadUsuario = class(TfrmCadPad)
    grDadosCD_USUARIO: TdxDBGridMaskColumn;
    grDadosNM_USUARIO: TdxDBGridMaskColumn;
    grDadosNM_LOGIN: TdxDBGridMaskColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    edSenha: TDBEdit;
    Label5: TLabel;
    edconfirma: TEdit;
    Image1: TImage;
    Image2: TImage;
    tabPermissao: TTabSheet;
    Panel5: TPanel;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    CheckBox50: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    GroupBox3: TGroupBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    TabSheet7: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    Panel6: TPanel;
    btMarcarTodos: TBitBtn;
    btDesmarcarTodos: TBitBtn;
    qyPermissao: TIBQuery;
    TabSheet4: TTabSheet;
    CheckBox11: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    GroupBox9: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    GroupBox10: TGroupBox;
    CheckBox10: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    GroupBox11: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    GroupBox12: TGroupBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    TabSheet1: TTabSheet;
    GroupBox5: TGroupBox;
    CheckBox8: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox7: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox31: TCheckBox;
    CheckBox34: TCheckBox;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    CheckBox9: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    GroupBox7: TGroupBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    CheckBox51: TCheckBox;
    GroupBox8: TGroupBox;
    CheckBox52: TCheckBox;
    CheckBox53: TCheckBox;
    CheckBox54: TCheckBox;
    GroupBox13: TGroupBox;
    CheckBox55: TCheckBox;
    CheckBox56: TCheckBox;
    CheckBox57: TCheckBox;
    GroupBox14: TGroupBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox58: TCheckBox;
    GroupBox15: TGroupBox;
    CheckBox59: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    procedure btIncluirClick(Sender: TObject);
    procedure edconfirmaExit(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btMarcarTodosClick(Sender: TObject);
    procedure btDesmarcarTodosClick(Sender: TObject);
    procedure tabPermissaoShow(Sender: TObject);
    procedure tabPermissaoExit(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure pgGeralChange(Sender: TObject);
    procedure pgGeralChanging(Sender: TObject; var AllowChange: Boolean);
    procedure CheckBox45Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaMedicoVinc;
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

USES
  UDM, UDMDIG, UDMGERAL, UfrmLocalizar, UGeralSQL, Ugeral;

{$R *.dfm}

procedure TfrmCadUsuario.btIncluirClick(Sender: TObject);
begin
  inherited;
  btMarcartodos.Enabled := true;
  btDesmarcarTodos.Enabled := true;
  pgGeral.ActivePage := tabGeral;
  if pgGeral.ActivePage = tabGeral then
    DBEdit2.SetFocus;
end;

procedure TfrmCadUsuario.edconfirmaExit(Sender: TObject);
begin
  inherited;
  if edconfirma.Text <> DMGERAL.TB_USUARIO_CMPDS_SENHA.AsString then
  begin
    MessageDlg('Senha Incorreta! Tente novamente.',mtWarning,
     [mbOK],0);
    edSenha.SetFocus;
  end;
end;

procedure TfrmCadUsuario.edSenhaExit(Sender: TObject);
begin
  inherited;
  edconfirma.SetFocus;
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := false;
  btMarcartodos.Enabled := false;
  btDesmarcarTodos.Enabled := false;
end;

procedure TfrmCadUsuario.btPesquisarClick(Sender: TObject);
begin
  inherited;
  pgGeral.ActivePageIndex := 1;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Usuário';
  frmLocalizar.qyDados:=SelectDadosUsuario;
  try
    frmLocalizar.Where := FALSE;
    frmLocalizar.OrderBy:='CD_USUARIO';
    SetLength(VCampo,3);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Nome Completo';
    VCampo[2].Titulo  := 'Usuário';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    DMGERAL.TB_USUARIO_CMP.Locate('cd_usuario', frmLocalizar.qyDados.FieldByname('cd_usuario').AsInteger, [loCaseInsensitive]);
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

procedure TfrmCadUsuario.btMarcarTodosClick(Sender: TObject);
var a : word;
begin
  inherited;
  // marca todos os CheckBoxs
  for a:=0 to ComponentCount - 1 do
    if (Components[a] is TCheckBox) then
      (Components[a] as TCheckBox).Checked := true;
end;

procedure TfrmCadUsuario.btDesmarcarTodosClick(Sender: TObject);
var b : word;
begin
  inherited;
  // desmarca todos os CheckBoxs
  for b:=0 to ComponentCount - 1 do
    if (Components[b] is TCheckBox) then
      (Components[b] as TCheckBox).Checked := false;

end;

procedure TfrmCadUsuario.tabPermissaoShow(Sender: TObject);
var c : word;
begin
  inherited;
    // desabilita todos os CheckBoxs
    for c:=0 to ComponentCount - 1 do
      if (Components[c] is TCheckBox) then
        (Components[c] as TCheckBox).Checked := false;

    // habilita os CheckBoxs para esse usuário
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('select cd_permissao, ds_modulo from permissao_usuario');
      sql.Add('where cd_usuario = '''+IntToStr(DMGERAL.TB_USUARIO_CMPCD_USUARIO.asInteger)+'''');
      open;
      while not Eof do
      begin
        for c:=0 to frmCadUsuario.ComponentCount - 1 do
        begin
          if (frmCadUsuario.Components[c] is TCheckBox) then
            if ((frmCadUsuario.Components[c] as TCheckBox).Hint =
                                                     FieldByName('ds_modulo').AsString) and
               ((frmCadUsuario.Components[c] as TCheckBox).Tag =
                                                FieldByName('cd_permissao').AsInteger) then
            begin
              (frmCadUsuario.Components[c] as TCheckBox).Checked := true;
              Break;
            end;
        end;
        Next;
      end;
      close;
      free;
    end;

end;

procedure TfrmCadUsuario.tabPermissaoExit(Sender: TObject);
var d : word;
begin
  inherited;

  if (DMGERAL.TB_USUARIO_CMP.STATE in [dsedit,dsinsert]) then
  begin
    try
      // deleta todas as permissões do usuário
      with TIBQuery.Create(nil) do
      begin
        Database := DM.DB;
        sql.Add('delete from permissao_usuario');
        sql.Add('where cd_usuario = '''+IntToStr(DMGERAL.TB_USUARIO_CMPCD_USUARIO.asInteger)+'''');
        ExecSQL;
        close;
        free;
      end;

      // inclui as que estiverem marcadas nos checkboxs
      for d:=0 to ComponentCount - 1 do
        if (Components[d] is TCheckBox) then
          if (Components[d] as TCheckBox).Checked then
          begin
            qyPermissao.close;
            qyPermissao.SQL.Clear;
            qyPermissao.SQL.Add('insert into permissao_usuario (cd_perusu, cd_und,  cd_permissao, ' +
                             'ds_modulo, cd_usuario)');
            qyPermissao.SQL.Add('values('+ inttoStr(dm.GeraCodigo('GEN_PERMISSAO_USUARIO')) +
                             ','''+ prmUnidade +
                             ''', '+ IntToStr((Components[d] as TCheckBox).tag) +
                             ', ''' + (Components[d] as TCheckBox).Hint +
                             ''',  '''+IntToStr(DMGERAL.TB_USUARIO_CMPCD_USUARIO.asInteger)+''')');
            qyPermissao.ExecSQL;
          end;
      DM.Commit(dm.IBD);
    except
       on Ex:Exception do
        showmessage('Tag: ' + IntToStr((Components[d] as TCheckBox).tag) +
                    '    Hint: ' + (Components[d] as TCheckBox).Hint + chr(13) +
                    'Erro: ' + ex.message);
    end;
  end;
end;

procedure TfrmCadUsuario.btgravarClick(Sender: TObject);
var e : word;
begin
  inherited;
  try
    // deleta todas as permissões do usuário
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('delete from permissao_usuario');
      sql.Add('where cd_usuario = '''+IntToStr(DMGERAL.TB_USUARIO_CMPCD_USUARIO.asInteger)+'''');
      ExecSQL;
      close;
      free;
    end;

    // inclui as que estiverem marcadas nos checkboxs
    for e:=0 to ComponentCount - 1 do
      if (Components[e] is TCheckBox) then
        if (Components[e] as TCheckBox).Checked then
        begin
          qyPermissao.close;
          qyPermissao.SQL.Clear;
          qyPermissao.SQL.Add('insert into permissao_usuario (cd_perusu, cd_und,  cd_permissao, ' +
                           'ds_modulo, cd_usuario)');
          qyPermissao.SQL.Add('values('+ inttoStr(dm.GeraCodigo('GEN_PERMISSAO_USUARIO')) +
                           ','''+ prmUnidade +
                           ''', '+ IntToStr((Components[e] as TCheckBox).tag) +
                           ', ''' + (Components[e] as TCheckBox).Hint +
                           ''',  '''+IntToStr(DMGERAL.TB_USUARIO_CMPCD_USUARIO.asInteger)+''')');
          qyPermissao.ExecSQL;
        end;
    DM.Commit(dm.IBD);
  except
    on Ex:Exception do
    showmessage('Tag: ' + IntToStr((Components[e] as TCheckBox).tag) +
                '    Hint: ' + (Components[e] as TCheckBox).Hint + chr(13) +
                'Erro: ' + ex.message);
  end;

  btMarcartodos.Enabled := false;
  btDesmarcarTodos.Enabled := false;

end;

procedure TfrmCadUsuario.btexcluirClick(Sender: TObject);
begin
  inherited;
  btMarcartodos.Enabled := false;
  btDesmarcarTodos.Enabled := false;
end;

procedure TfrmCadUsuario.bteditarClick(Sender: TObject);
begin
  inherited;
  btMarcartodos.Enabled := true;
  btDesmarcarTodos.Enabled := true;
  if pgGeral.ActivePage = tabGeral then
    DBEdit2.SetFocus;
end;

procedure TfrmCadUsuario.AtualizaMedicoVinc;
begin
end;

procedure TfrmCadUsuario.pgGeralChange(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadUsuario.pgGeralChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
//  inherited;

end;

procedure TfrmCadUsuario.CheckBox45Exit(Sender: TObject);
  procedure verificaConsultarMarcado(TagRequisito: integer);
  var
    c : integer;
  begin
    for c:=0 to ComponentCount - 1 do
    begin
      if (Components[c] is TCheckBox) then
        if ((Components[c] as TCheckBox).Hint = 'GERAL') and
           ((Components[c] as TCheckBox).Tag = TagRequisito) and
           ((Components[c] as TCheckBox).Checked = False) then
        begin
          ShowMessage('Antes de habilitar insersão ou exclusão é necessário habilitar consulta!');
          (Sender as TCheckBox).Checked := False;
          Break;
        end;
    end;
  end;
begin
  if (Sender.ClassType <> TCheckBox) then
    Exit;
  if not (Sender as TCheckBox).Checked then
    Exit;
  case (Sender as TCheckBox).Tag of
    48, 49: verificaConsultarMarcado(42);
    50, 51: verificaConsultarMarcado(43);
    52, 53: verificaConsultarMarcado(44);
    54, 55: verificaConsultarMarcado(45);
    56, 57: verificaConsultarMarcado(46);
    58, 59: verificaConsultarMarcado(47);
  end;
end;

end.

