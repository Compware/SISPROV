unit ufrmCorrecao2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, IBSQL,
  Grids, DBGrids, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  TfrmCorrecao2 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    qyPaciente: TIBQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBSQL1: TIBSQL;
    edProcesso: TEdit;
    btPesquisar: TSpeedButton;
    DataSource1: TDataSource;
    qyPacienteCD_PACIENTE: TIntegerField;
    qyPacienteNM_PACIENTE: TIBStringField;
    qyPacienteNM_MAE: TIBStringField;
    qyPacienteIDADE: TSmallintField;
    grDados: TdxDBGrid;
    grDadosCD_PACIENTE: TdxDBGridMaskColumn;
    grDadosNM_PACIENTE: TdxDBGridMaskColumn;
    grDadosNM_MAE: TdxDBGridMaskColumn;
    grDadosIDADE: TdxDBGridMaskColumn;
    qyPacienteFARMACIA: TIntegerField;
    qyPacienteLABORATORIO: TIntegerField;
    qyPacienteMEDICO: TIntegerField;
    qyPacienteRAPIDO: TIntegerField;
    qyPacienteAGENDA: TIntegerField;
    qyPacienteNOTIFICACAO: TIntegerField;
    grDadosFARMACIA: TdxDBGridMaskColumn;
    grDadosLABORATORIO: TdxDBGridMaskColumn;
    grDadosMEDICO: TdxDBGridMaskColumn;
    grDadosRAPIDO: TdxDBGridMaskColumn;
    grDadosAGENDA: TdxDBGridMaskColumn;
    grDadosNOTIFICACAO: TdxDBGridMaskColumn;
    procedure BitBtn2Click(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCorrecao2: TfrmCorrecao2;

implementation

{$R *.dfm}

procedure TfrmCorrecao2.BitBtn2Click(Sender: TObject);
var i:integer;
  sSQL, sUpdate, sTabela:string;
  OldPaciente, NewPaciente:integer;
begin

  sSQL := 'update  %s                      ' + chr(13) +
          'set CD_PACIENTE = %d            ' + chr(13) +
          'where CD_PACIENTE = %d';

  Memo1.Lines.Clear;
  Memo1.Lines.Add('--------------------------------');
  NewPaciente := qyPacienteCD_PACIENTE.AsInteger;
  qyPaciente.First;
  while Not qyPaciente.Eof do
  begin
    OldPaciente := qyPacienteCD_PACIENTE.AsInteger;
    if (OldPaciente <> NewPaciente) then
    begin
      Memo1.Lines.Add('Paciente - De:' + intToStr(OldPaciente) +
                              ' Para:' + intToStr(NewPaciente));
      for i:=1 to 6 do
      begin
         case i of
           1:sTabela := 'NOTIFICACAO';
           2:sTabela := 'AGENDA';
           3:sTabela := 'MAPA_FARMACIA_LINHA';
           4:sTabela := 'MAPA_LAB_PACIENTE';
           5:sTabela := 'MAPA_MEDICO_LINHA';
           6:sTabela := 'MAPA_TESTE_RAPIDO_PACIENTE';
         end;
         try
           sUpdate := Format(sSQL,[sTabela,NewPaciente,OldPaciente]);
           IBSQL1.SQL.Text := sUpdate;
           IBSQL1.ExecQuery;
         finally
           Memo1.Lines.Add(sTabela + ':' + intToStr(IBSQL1.RowsAffected));
         end;
      end;
    end;
    qyPaciente.Next;
  end;

  dm.Commit(qyPaciente);
end;

procedure TfrmCorrecao2.btPesquisarClick(Sender: TObject);
begin
  qyPaciente.Close;
  qyPaciente.ParamByName('NR_PROCESSO').ASString := edProcesso.Text;
  qyPaciente.Open;
end;

end.
