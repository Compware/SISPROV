unit uframeDigPaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RxLookup, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask,
  ToolEdit, RXDBCtrl, RxDBComb, DB, IBCustomDataSet, IBQuery, dxExEdtr,
  DBCtrls, Buttons, ExtCtrls, ImgList, RXCtrls;

type
  TframDigPaciente = class(TFrame)
    dsPaciente: TDataSource;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    DBDateEdit3: TDBDateEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    dxDBEdit5: TdxDBEdit;
    dxDBEdit4: TdxDBEdit;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    pdica: TSecretPanel;
    Label23: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton3: TSpeedButton;
    dxDBEdit16: TdxDBEdit;
    Label30: TLabel;
    procedure DBDateEdit3Exit(Sender: TObject);
    procedure dxDBEdit3Exit(Sender: TObject);
    procedure dxDBEdit4Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure VerificarCampos;
  end;

implementation

uses UDMDIG, Dateutils;

{$R *.dfm}

{ TframPaciente }


function CalculoIdade(data: TDate): integer;
begin
  result := YearsBetween(date,data);
end;

function CalculoNasc(idade: integer): TDate;
var n:integer;
begin
  n := (idade*12)*-1;
  result := IncMonth(date,n);;
end;

function CalculoMeses(data: TDate): integer;
begin
  result := MonthsBetween (date,data);
end;

function CalculoMesesNasc(meses: integer): TDate;
var n:integer;
begin
  n := (meses*30)*-1;
  result := IncDay(date,n);;
end;

procedure TframDigPaciente.AbreConsultas;
begin
end;

procedure TframDigPaciente.FechaConsultas;
begin
end;

procedure TframDigPaciente.VerificarCampos;
begin

  if dmDIG.tbDig_ProcessoNM_PACIENTE.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Nome do Utente!',mtInformation,
     [mbOK],0);

    dxDBEdit2.SetFocus;
    Abort;
  end;

  if (dmDIG.tbDig_ProcessoIDADE.AsString = '') then
  begin
    MessageDlg('É necessário incluir a Idade ou Meses do Utente!',mtInformation,
     [mbOK],0);

    dxDBEdit3.SetFocus;
    Abort;
  end;

  if dmDIG.tbDig_ProcessoNM_MAE.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Nome da Mãe do Utente!',mtInformation,
     [mbOK],0);

    dxDBEdit5.SetFocus;
    Abort;
  end;
end;

procedure TframDigPaciente.DBDateEdit3Exit(Sender: TObject);
var idade, meses:integer;
begin
  if dmDIG.tbDig_ProcessoDT_NASCIMENTO.AsString <> '' then
  begin
    idade := CalculoIdade(DBDateEdit3.Date);
    dmDIG.tbDig_ProcessoIDADE.AsInteger := idade;
    {if dmDIG.tbDig_ProcessoIDADE.AsInteger = 0 then
      begin
        meses := CalculoMeses(DBDateEdit3.Date);
        dmDIG.tbDig_ProcessoMESES.AsInteger := meses;
      end
      else
        dmDIG.tbDig_ProcessoMESES.AsInteger := 0;}
  end;
end;

procedure TframDigPaciente.dxDBEdit3Exit(Sender: TObject);
var nasc:Tdate;  idade:integer;
begin
  if (dmDIG.tbDig_ProcessoIDADE.AsInteger > 0) and
     (dmDIG.tbDig_ProcessoDT_NASCIMENTO.AsString = '') then
  begin
    idade := dmDIG.tbDig_ProcessoIDADE.AsInteger;
    nasc := CalculoNasc(idade);
    dmDIG.tbDig_ProcessoDT_NASCIMENTO.AsDateTime:=nasc;
    //dmDIG.tbDig_ProcessoMESES.AsInteger := 0;
  end;
end;

procedure TframDigPaciente.dxDBEdit4Exit(Sender: TObject);
var nasc:Tdate;  meses, idade:integer;
begin
  {if (dmDIG.tbDig_ProcessoMESES.AsInteger > 0) then
  begin
    meses := dmDIG.tbDig_ProcessoMESES.AsInteger;
    nasc := CalculoMesesNasc(meses);
    dmDIG.tbDig_ProcessoDT_NASCIMENTO.AsDateTime:=nasc;
    if dmDIG.tbDig_ProcessoMESES.AsInteger > 12 then
      begin
        idade := CalculoIdade(DBDateEdit3.Date);
        dmDIG.tbDig_ProcessoIDADE.AsInteger := idade;
      end
      else
        dmDIG.tbDig_ProcessoIDADE.AsInteger := 0;
  end;}
end;

procedure TframDigPaciente.SpeedButton1Click(Sender: TObject);
var nasc:Tdate;  idade:integer;
begin
  if (dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if (dmDIG.tbDig_ProcessoIDADE.AsInteger > 0) then
    begin
      idade := dmDIG.tbDig_ProcessoIDADE.AsInteger;
      nasc := CalculoNasc(idade);
      dmDIG.tbDig_ProcessoDT_NASCIMENTO.AsDateTime:=nasc;
      //dmDIG.tbDig_ProcessoMESES.AsInteger := 0;
    end;
  end;
end;

procedure TframDigPaciente.SpeedButton3Click(Sender: TObject);
begin
  pdica.Visible := true;
end;

procedure TframDigPaciente.BitBtn1Click(Sender: TObject);
begin
  pdica.Visible := false;
end;

end.
