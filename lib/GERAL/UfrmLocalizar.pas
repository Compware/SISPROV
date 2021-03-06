unit UfrmLocalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmLocPad, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls,
  Grids, DBGrids;

type
  TfrmLocalizar = class(TfrmLocPad)
    procedure TabControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridDblClick(Sender: TObject);
    procedure edLocalizarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure PropriedadeColuna;
    procedure Pesquisa;

  public
    { Public declarations }
    Where:Boolean;
    OrderBy, KeyField:String;
  end;

  type
    RCampo=Record
    Nome:String;
    Titulo:String;
    Visivel:Boolean;
    Width:Integer;
    Formato:string;
    Grupo:Boolean;
    ixGrupo:integer;
  end;

var
  frmLocalizar: TfrmLocalizar;
  Tx_SQL,Tx_Where,Tx_OrderBy:string;
  Campo:string;
  Tipo_Campo:TFieldType;
  VCampo:Array of RCampo;

implementation

uses
  UDM, UDMGERAL;

{$R *.dfm}


Procedure TfrmLocalizar.PropriedadeColuna;
Var i:integer; Adiciona:Boolean;
    col: TdxDBTreeListColumn;
begin
    Adiciona:=tabControl1.tabs.Count=0;
    for i:=0 to qyDados.FieldCount-1 do
    begin
       //Adicionar Coluna na Grid
       if (grDados.ColumnCount<qyDados.FieldCount) then
       begin
         col := grDados.CreateColumn(TdxDBGridColumn);
         col.FieldName := qyDados.Fields[i].FieldName;
         col.Caption := VCampo[i].Titulo;
         col.Visible := VCampo[i].Visivel;
         if VCampo[i].Grupo then
         begin
           grDados.ShowGroupPanel := true;
           grDados.InsertGroupColumn(VCampo[i].ixGrupo,col);
         end;
       end;
       //Formatar Colunas
       qyDados.Fields[i].DisplayLabel:=VCampo[i].Titulo;
       if VCampo[i].Width>0 then
          qyDados.Fields[i].DisplayWidth:=VCampo[i].Width;
       qyDados.Fields[i].Visible:=VCampo[i].Visivel;

       if ((qyDados.Fields[i] is TFloatField) and
           (VCampo[i].Formato <> '')) then
         (qyDados.Fields[i] as TFloatField).DisplayFormat := VCampo[i].Formato;

       if ((qyDados.Fields[i] is TDateField)and
           (VCampo[i].Formato <> '')) then
         (qyDados.Fields[i] as TDateField).DisplayFormat := VCampo[i].Formato;

       if ((qyDados.Fields[i] is TDateTimeField)and
           (VCampo[i].Formato <> '')) then
         (qyDados.Fields[i] as TDateTimeField).DisplayFormat := VCampo[i].Formato;

       if (qyDados.Fields[i].Visible) and (Adiciona) then
         tabControl1.tabs.add(qyDados.Fields[i].DisplayLabel);
    end;
end;

procedure TfrmLocalizar.Pesquisa;
Var Texto:String;
begin
    begin
        Texto:=UPPERCASE(edLocalizar.text);

        if Tipo_Campo in [ftDateTime, ftDate] then
        begin
          if Where then
             Tx_Where:=' And ' + Campo + ' = ''' +
                        FormatDateTime('mm/dd/yyyy', StrToDateTime(Texto)) + ''''
          else
             Tx_Where:=' Where ' + Campo + ' = ''' +
                        FormatDateTime('mm/dd/yyyy', StrToDateTime(Texto)) + '''';
        end
        else
        begin
          if Where then
             Tx_Where:=' And UPPER('+Campo+') like ''%'+Texto+'%'''
          else
             Tx_Where:=' Where UPPER('+Campo+') like ''%'+Texto+'%''';
        end;

        // Adiciona Cl�usula Where ou AND
        with (qyDados) do begin
             Active:=False;
             Tx_OrderBy:=' Order by '+inttostr(TabControl1.TabIndex+1);
             SQl.Text:=Tx_SQL+Tx_Where+Tx_OrderBy;
             Active:=True;
             dsGrid.DataSet := qyDados;
             PropriedadeColuna;
        end;
    end;
end;

procedure TfrmLocalizar.TabControl1Change(Sender: TObject);
Var i:integer;
begin
    Campo:='';
    with TabControl1 do begin
        if Tabs.Count>0 then
          for i:=0 to qyDados.FieldCount-1 do
          begin
              if qyDados.Fields[i].DisplayName=tabs[TabIndex] then
              begin
                 edLocalizar.Hint := 'Pesquisar por ' + tabs[TabIndex];
                 StatusBar1.Panels[0].Text := 'Pesquisar por ' + tabs[TabIndex];
                 if VCampo[i].Nome <> '' then
                   campo := VCampo[i].Nome
                 else
                   campo := qyDados.Fields[i].FieldName;
                 Tipo_Campo := qyDados.Fields[i].DataType;
                 break;
              end;
          end;


        // Adiciona Cl�usula order by
        with (qyDados) do begin
             Active:=False;
             if OrderBy<>'' then
             begin
               Tx_OrderBy:=' Order by '+OrderBy;
               OrderBy:='';
             end
             else
             begin
               if Tabs.Count>0 then
                 Tx_OrderBy:=' Order by '+inttostr(TabIndex+1)
               else
                 Tx_OrderBy:=' Order by 1';
             end;
             SQl.Text:=Tx_SQL+Tx_OrderBy;
             Active:=True;
             dsGrid.DataSet := qyDados;
             if Campo='' then
               if VCampo[0].Nome <> '' then
                 campo := VCampo[0].Nome
               else
                 campo:=qyDados.Fields[0].FieldName;
             PropriedadeColuna;
        end;
    end;
end;

procedure TfrmLocalizar.FormShow(Sender: TObject);
begin
  inherited;
  //Armazena o SQL inicial
  Tx_SQL:=qyDados.sql.text;
  TabControl1Change(NIL);
  Tipo_Campo := ftString;
  if (KeyField<>'') then
    grDados.KeyField := KeyField;
end;

procedure TfrmLocalizar.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key=13 then
     ModalResult:=mrOk;
end;

procedure TfrmLocalizar.gridDblClick(Sender: TObject);
begin
  inherited;
  ModalResult:=mrOk;
end;

procedure TfrmLocalizar.edLocalizarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key=vk_f5 then
       Pesquisa;
end;

procedure TfrmLocalizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  VCampo:=Copy(VCampo,0,0);
end;

procedure TfrmLocalizar.FormCreate(Sender: TObject);
begin
  inherited;
  OrderBy:='';
end;

end.
