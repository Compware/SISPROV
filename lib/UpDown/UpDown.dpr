program UpDown;

uses
  Forms,
  ufrmMenu in 'ufrmMenu.pas' {frmMenuEDI};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenuEDI, frmMenuEDI);
  Application.Run;
end.
