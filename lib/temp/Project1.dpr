program Project1;

uses
  Forms,
  ufrmGridFilter in 'ufrmGridFilter.pas' {frmGridFilter};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGridFilter, frmGridFilter);
  Application.Run;
end.
