program ConvertePDF;

uses
  Forms,
  ufrmConvertePDF in 'ufrmConvertePDF.pas' {frmConvertePDF};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConvertePDF, frmConvertePDF);
  Application.Run;
end.
