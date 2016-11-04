program NovaBase;

uses
  Forms,
  ufrmNovaBase in 'ufrmNovaBase.pas' {frmNovaBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmNovaBase, frmNovaBase);
  Application.Run;
end.
