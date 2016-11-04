unit UfrmCadPadSG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, Menus, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids,uDM;

type
  TfrmCadPadSG = class(TfrmCadPad)
    procedure btexcluirClick(Sender: TObject);
    procedure CMDialogKey(var msg: TCMDialogKey); message CM_DIALOGKEY;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPadSG: TfrmCadPadSG;

implementation

{$R *.dfm}

procedure TfrmCadPadSG.btexcluirClick(Sender: TObject);
begin
  try
    try
      DM.Transacao(dsControle.DataSet);
      dsControle.Dataset.First;
      while not dsControle.Dataset.Eof do
        dsControle.Dataset.Delete;

      DM.Commit(dsControle.DataSet);
    except
      DM.Rollback(dsControle.DataSet);
      Abort;
    end;
  finally
    dsControle.Dataset.Close; dsControle.Dataset.Open;
    InicializaControles;
    CriaGrid;
    Limpar;
  end;
end;

procedure TfrmCadPadSG.CMDialogKey(var msg: TCMDialogKey);
begin
  if (ActiveControl is TStringGrid) then
  begin
    if (msg.CharCode = VK_TAB) then
    begin
      with  (ActiveControl as TStringGrid) do
      begin
        if col<ColCount-1 then
          col := col + 1
        else
         if Row<rowcount-1 then
           begin
             Row:=row+1;
             col:=FixedCols;
           end
         else
           begin
             Row:=FixedRows;
             col:=FixedCols;
           end;

      end;
      msg.result := 1;
      Exit;
    end;
  end;
end;

end.
