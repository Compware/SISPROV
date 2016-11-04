unit uFuncaoGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, dxExEdtr, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, DB, uGeral;

  procedure ImprimeGrid(Grid:TdxDBGrid; sNome:String);
  function RetornaColuna(oGrid: TdxDBGrid; nRow, nBand, nCol: integer): TdxDBTreeListColumn;

var
  sArqGridHtml:String;

const
  sExt = '.html';

implementation

procedure ImprimeGrid(Grid:TdxDBGrid; sNome:String);
var nRow,nCol,nBand,ix:integer;
  mBasico,mGrupo,mCampo,lCampo,lDados, lNode:TStringList;
  oCol:TdxDBTreeListColumn; oCol2:TdxDBGridColumn;
  vGrupo: array of TStringList;

  function isGrupo(oCol:TdxDBTreeListColumn):boolean;
  var i:integer;
  begin
    result := false;
    for i:=0 to Grid.GroupColumnCount-1 do
      if Grid.GroupColumns[i] = oCol then
      begin
        result := true;
        exit;
      end;
  end;

  procedure ImprimeNode(nd:TdxTreeListNode);
  var r,c:integer;
  begin
    lNode.Add(nd.Strings[0]);
    if nd.Expanded then
    begin
      for r:=0 to nd.Count-1 do
        if  nd.Items[r].HasChildren then
          ImprimeNode(nd.Items[r])
        else
        begin
           lCampo.Clear;
           for c:=0 to Grid.ColumnCount-1 do
            if Grid.Columns[c].Visible then
             if not isGrupo(Grid.Columns[c]) then
               lCampo.Add('<td>' + nd.Items[r].Strings[c] + '</td>');

          lDados.Add('<tr class="ExpCabLn2" valign="top">');
          lDados.Add(lCampo.Text);
          lDados.Add('</tr>');
        end;
    end;
  end;

begin
  mBasico := TStringList.Create;
  mGrupo  := TStringList.Create;
  mCampo  := TStringList.Create;
  lCampo  := TStringList.Create;
  lDados  := TStringList.Create;
  lNode   := TStringList.Create;
  try

    mBasico.LoadFromFile(sPathConsulta + 'Modelo Basico' + sExt);
    mGrupo.LoadFromFile (sPathConsulta + 'Modelo Grupo'  + sExt);
    mCampo.LoadFromFile (sPathConsulta + 'Modelo Campo'  + sExt);

    mBasico.Text := StringReplace(mBasico.Text, '<!--NOME-->', sNome,[]);

    for nRow := 0 to Grid.HeaderPanelRowCount-1 do
    begin
      for nBand := 0 to Grid.Bands.Count-1 do
        for nCol := 0 to Grid.Bands[nBand].HeaderColCount[nRow]-1 do
        begin
          oCol := RetornaColuna(Grid,nRow,nBand,nCol);
          lCampo.Add('<td>'+oCol.Caption+'</td>');
        end;
    end;
    mCampo.Text := StringReplace(mCampo.Text,'<!--TITULO-->',lCampo.Text,[]);

    for nRow := 0 to Grid.Count-1 do
    begin
      if Grid.Items[nRow].HasChildren then
         ImprimeNode(Grid.Items[nRow])
      else
      begin
          lCampo.Clear;
          for nCol:=0 to Grid.ColumnCount-1 do
            if Grid.Columns[nCol].Visible then
             if not isGrupo(Grid.Columns[nCol]) then
               lCampo.Add('<td>' + Grid.Items[nRow].Strings[nCol] + '</td>');

          lDados.Add('<tr class="ExpCabLn2" valign="top">');
          lDados.Add(lCampo.Text);
          lDados.Add('</tr>');
      end;
    end;

    SetLength(vGrupo, Grid.GroupColumnCount);
    for nCol:=0 to Grid.GroupColumnCount-1 do
    begin
      oCol2 := Grid.GroupColumns[nCol];
      vGrupo[nCol] := TStringList.Create;
      vGrupo[nCol].Text := StringReplace(mGrupo.Text,'<!--NOME GRUPO-->', lNode.Strings[oCol2.GroupIndex],[]);
    end;

    mGrupo.Text := vGrupo[0].Text;
    for ix:=High(vGrupo) downto Low(vGrupo)+1 do
    begin
       mGrupo.Text := StringReplace(mGrupo.Text,'<!--GRUPO-->',vGrupo[ix].Text,[]);
    end;

    mCampo.Text := StringReplace(mCampo.Text,'<!--VALOR-->',lDados.Text,[]);
    mGrupo.Text := StringReplace(mGrupo.Text,'<!--GRUPO-->',mCampo.Text,[]);
    mBasico.Text := StringReplace(mBasico.Text, '<!--GRUPO-->', mGrupo.Text,[]);
    mBasico.SaveToFile(sArqGridHtml);
  finally
     FreeAndNil(mBasico);
     FreeAndNil(mGrupo);
     FreeAndNil(mCampo);
     FreeAndNil(lCampo);
     FreeAndNil(lDados);
     FreeAndNil(lNode);
  end;
end;

function RetornaColuna(oGrid: TdxDBGrid; nRow, nBand,
  nCol: integer): TdxDBTreeListColumn;
var
  i: integer;
begin
  result := nil;
  if oGrid.VisibleColumnCount = 0 then
    exit;
  i := 0;
  repeat
    if (oGrid.VisibleColumns[i].RowIndex = nRow) and
       (oGrid.VisibleColumns[i].ColIndex = nCol) and
       (oGrid.VisibleColumns[i].BandIndex= nBand) then
    begin
      result := oGrid.VisibleColumns[i];
      i := oGrid.VisibleColumnCount;
    end
    else
      inc(i);
  until i >= oGrid.VisibleColumnCount;
end;

end.
