unit ufrmInfoEstat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons;

type
  TfrmInfoEstat = class(TForm)
    qyInfo: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    lbProc: TLabel;
    lbPaginas: TLabel;
    mmProcData: TMemo;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfoEstat: TfrmInfoEstat;

implementation

uses UDMDIG, UDM;

{$R *.dfm}

procedure TfrmInfoEstat.FormShow(Sender: TObject);
begin
  qyInfo.Sql.Text := 'select count(*) from (select distinct nr_processo'+
                     ' from arquivo_digital)';
  qyInfo.Open;
  lbProc.Caption := qyInfo.Fields[0].AsString;

  qyInfo.Close;
  qyInfo.Sql.Text := 'select count(*) from arquivo_digital';
  qyInfo.Open;
  lbPaginas.Caption := qyInfo.Fields[0].AsString;

  qyInfo.Close;
  qyInfo.Sql.Text := 'select count(*), dt_arquivo from '+
                     ' (select distinct nr_processo, '+
                     ' substring(cast(dt_arquivo as varchar(24)) '+
                     ' from 1 for 10) dt_arquivo'+
                     ' from arquivo_digital)'+
                     ' group by dt_arquivo '+
                     ' order by 2 desc';
  qyInfo.Open;
  while not qyInfo.Eof do
  begin
    mmProcData.Lines.add(StringOfChar(' ', 10 -
                         Length(qyInfo.Fields[1].AsString)) +
                         qyInfo.Fields[1].AsString + '   ' +
                         qyInfo.Fields[0].AsString);
    qyInfo.Next;
  end;
end;

end.
