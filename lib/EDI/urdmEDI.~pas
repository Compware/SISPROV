unit urdmEDI;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, EDI_TLB, StdVcl;

type
  TrdmEDI = class(TRemoteDataModule, IrdmEDI)
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure RodaEDI; safecall;
  public
    { Public declarations }
  end;

implementation

uses ufrmMenuEDI;

{$R *.DFM}

class procedure TrdmEDI.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TrdmEDI.RodaEDI;
begin
  frmMenuEDI.tmEDITimer(self);
end;

initialization
  TComponentFactory.Create(ComServer, TrdmEDI,
    Class_rdmEDI, ciMultiInstance, tmApartment);
end.
