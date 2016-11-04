unit ufrmCadModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, dxEditor, dxEdLib,
  dxDBELib;

type
  TfrmCadModelo = class(TfrmCadPad)
    grDadosColumn1: TdxDBGridColumn;
    grDadosColumn2: TdxDBGridColumn;
    grDadosColumn3: TdxDBGridColumn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btLocGrupo: TdxDBButtonEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dsGrupo: TDataSource;
    btEditor: TBitBtn;
    procedure btEditorClick(Sender: TObject);
    procedure btLocGrupoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsControleStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadModelo: TfrmCadModelo;

implementation

uses UDMDIG, UfrmLocalizar, ufrmEditor, UDM;

{$R *.dfm}

procedure TfrmCadModelo.btEditorClick(Sender: TObject);
var nd,ndc:TTreeNode; ms : TMemoryStream;
    nGrupo, id: Integer;
    bContinuar:Boolean;
begin
    inherited;

    dmDIG.tbEdt_Arquivo.Open;
    ms := TMemoryStream.Create;
    frmEditor := TfrmEditor.Create(Application);

    if dsControle.DataSet.FieldByName('CD_DOCUMENTO').AsInteger>0 then
    begin
      dmDIG.tbEdt_Arquivo.Close;
      dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
          dsControle.DataSet.FieldByName('CD_DOCUMENTO').AsInteger;
      dmDIG.tbEdt_Arquivo.Open;
      dmDIG.tbEdt_ArquivoBL_ARQUIVO.SaveToFile('c:\compware\temp\teste.rtf');
      frmEditor.editor.LoadFromFile('c:\compware\temp\teste.rtf');
    end;

    bContinuar := (frmEditor.ShowModal = mrOK);

    if bContinuar then
    begin
      //RTF
      frmEditor.editor.SaveToStream(ms);
      if dsControle.DataSet.FieldByName('CD_DOCUMENTO').AsInteger>0 then
      begin
        dmDIG.tbEdt_Arquivo.Edit;
        dmDIG.tbEdt_ArquivoBL_ARQUIVO.LoadFromStream(ms);
        dmDIG.tbEdt_Arquivo.Post;
      end
      else
      begin
        dmDIG.tbEdt_Arquivo.Insert;
        dmDIG.tbEdt_ArquivoBL_ARQUIVO.LoadFromStream(ms);
        dmDIG.tbEdt_Arquivo.Post;
        dsControle.DataSet.FieldByName('CD_DOCUMENTO').AsInteger :=
          dmDIG.tbEdt_ArquivoCD_ARQUIVO.AsInteger;
      end;

      dmDIG.Commit(dmDIG.tbEdt_Arquivo);

    end;

    frmEditor.Free;
    ms.Free;
    dmDIG.tbEdt_Arquivo.Close;

end;

procedure TfrmCadModelo.btLocGrupoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Grupo';
    frmLocalizar.qyDados.Database := dmDig.dbDig;
    frmLocalizar.qyDados.Transaction := dmDig.tsDig;
    frmLocalizar.qyDados.Sql.Text := 'SELECT * FROM DIG_GRUPO_MODELO';

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,2);
      frmLocalizar.KeyField := 'cd_grupo';
      VCampo[0].Titulo  := 'Código';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Descrição';
      VCampo[1].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      dsControle.DataSet.FieldByname('CD_GRUPO').AsString := frmLocalizar.qyDados.FieldByname('CD_GRUPO').AsString;
      dsControle.DataSet.FieldByname('DS_GRUPO').AsString := frmLocalizar.qyDados.FieldByname('DS_GRUPO').AsString;
    end;
    frmLocalizar.qyDados.Close;
    frmLocalizar.Free;
  end;
end;

procedure TfrmCadModelo.FormCreate(Sender: TObject);
begin
  inherited;
  dmDIG.qyGrupo.Open;
end;

procedure TfrmCadModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmDIG.qyGrupo.Close;
end;

procedure TfrmCadModelo.dsControleStateChange(Sender: TObject);
begin
  inherited;
  if dsControle.State in [dsEdit, dsInsert] then
    btEditor.Enabled := true
  else
    btEditor.Enabled := false;
end;

end.
