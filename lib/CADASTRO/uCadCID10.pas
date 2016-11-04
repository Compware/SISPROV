unit uCadCID10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, ExtCtrls, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, DB;

type
  TfrmCID10 = class(TForm)
    dsCID10: TDataSource;
    dxGrid: TdxDBGrid;
    dxGridColumn1: TdxDBGridColumn;
    dxGridColumn2: TdxDBGridColumn;
    dxGridColumn3: TdxDBGridColumn;
    dxColUsar: TdxDBGridCheckColumn;
    Panel1: TPanel;
    btSelecionar: TBitBtn;
    btGravar: TBitBtn;
    btFechar: TBitBtn;
    dxColCID10: TdxDBGridColumn;
    Panel2: TPanel;
    edLocalizar: TEdit;
    rbCodigo: TRadioButton;
    rbDescricao: TRadioButton;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsCID10StateChange(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure rbDescricaoClick(Sender: TObject);
    procedure rbCodigoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCID10:integer;
    FSG:string;
    bSelecionar:boolean;
  end;

var
  frmCID10: TfrmCID10;
  sSQL:string;

implementation

uses UDMGERAL, UGeral, UDM;

{$R *.dfm}

procedure TfrmCID10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCID10 := dmGeral.TB_CID10CD_SUBCATEGORIA.AsInteger;
  FSG := dmGeral.TB_CID10CD_SUBCAT.AsString;
  dmGeral.TB_CID10.Close;
  dmGeral.TB_CID10.SelectSQL.Text := sSQL;
end;

procedure TfrmCID10.FormCreate(Sender: TObject);
begin
  sSQL := dmGeral.TB_CID10.SelectSQL.Text;
end;

procedure TfrmCID10.btSelecionarClick(Sender: TObject);
begin
  FCID10 := dmGeral.TB_CID10CD_SUBCATEGORIA.AsInteger;
  ModalResult := mrOK;
end;

procedure TfrmCID10.FormShow(Sender: TObject);
begin
  FCID10 := NUMERO_INDEFINIDO;
  FSG := STRING_INDEFINIDO;

  dxGrid.OptionsView := dxGrid.OptionsView - [edgoRowSelect];
  if bSelecionar then
  begin
     dmGeral.TB_CID10.SelectSQL.Text :=
       StringReplace(sSQL, '/*WHERE*/', 'WHERE FL_USAR = ''S''', []);
     dxGrid.OptionsView := dxGrid.OptionsView + [edgoRowSelect];
  end;
  dmGeral.TB_CID10.Open;
  btSelecionar.Visible := bSelecionar;
  dxColUsar.Visible := not bSelecionar;
  dxColCID10.Visible := bSelecionar;
end;

procedure TfrmCID10.dsCID10StateChange(Sender: TObject);
begin
  btGravar.Enabled := (dsCID10.State in [dsEdit, dsInsert]);
end;

procedure TfrmCID10.btGravarClick(Sender: TObject);
begin
  dm.Commit(dmGeral.TB_CID10);
end;

procedure TfrmCID10.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCID10.rbDescricaoClick(Sender: TObject);
begin
  if rbDescricao.Checked then
    rbCodigo.Checked := false;

end;

procedure TfrmCID10.rbCodigoClick(Sender: TObject);
begin
  if rbCodigo.Checked then
    rbDescricao.Checked := false;

end;

procedure TfrmCID10.BitBtn1Click(Sender: TObject);
begin

    if (edLocalizar.Text <> '')then
    begin
      try
        if rbCodigo.Checked then
            try
              DMGERAL.TB_CID10.Close;
              if bSelecionar then
                   dmGeral.TB_CID10.SelectSQL.Text :=
                     StringReplace(sSQL, '/*WHERE*/', 'WHERE FL_USAR = ''S''AND UPPER(CD_SUBCAT) LIKE '+QuotedStr('%'+edLocalizar.text+'%'), [])
              else
                   dmGeral.TB_CID10.SelectSQL.Text :=
                     StringReplace(sSQL, '/*WHERE*/', 'WHERE UPPER(CD_SUBCAT) LIKE '+QuotedStr('%'+edLocalizar.text+'%'), []);

              DMGERAL.TB_CID10.Open;

              if DMGERAL.TB_CID10.Eof then
                  MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
            except
              MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
            end;
                                             
        if rbDescricao.Checked then
            try
              DMGERAL.TB_CID10.Close;
              if bSelecionar then
                   dmGeral.TB_CID10.SelectSQL.Text :=
                     StringReplace(sSQL, '/*WHERE*/', 'WHERE FL_USAR = ''S''AND UPPER(CID10_SUBCATEGORIA.DS_DESCRABREV) LIKE '+QuotedStr('%'+edLocalizar.text+'%'), [])
              else
                   dmGeral.TB_CID10.SelectSQL.Text :=
                     StringReplace(sSQL, '/*WHERE*/', 'WHERE UPPER(CID10_SUBCATEGORIA.DS_DESCRABREV) LIKE '+QuotedStr('%'+edLocalizar.text+'%'), []);

              DMGERAL.TB_CID10.Open;

              if DMGERAL.TB_CID10.Eof then
                  MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
            except
              MessageDlg('Dados não encontrados!',mtWarning,[mbOK],0);
            end;

       except
         MessageDlg('Erro Inesperado!',mtError,[mbOK],0);
       end;
    end;

end;

end.
