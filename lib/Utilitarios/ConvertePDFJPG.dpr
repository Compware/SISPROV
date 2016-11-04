program ConvertePDFJPG;

uses
  Forms,
  uConvertePDFJPG in 'uConvertePDFJPG.pas' {frmConvertePDFJPG};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConvertePDFJPG, frmConvertePDFJPG);
  Application.Run;
end.
