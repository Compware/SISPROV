unit udmClienteEDI;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TdmClienteEDI = class(TDataModule)
    dcmEDI: TDCOMConnection;
    procedure dcmEDIBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClienteEDI: TdmClienteEDI;



implementation

uses udm, Ugeral;

{$R *.dfm}

procedure TdmClienteEDI.dcmEDIBeforeConnect(Sender: TObject);
begin
  dcmEDI.ComputerName := sComputerName;
end;

end.
