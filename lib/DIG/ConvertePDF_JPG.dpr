program ConvertePDF_JPG;

uses
  Forms,
  ufrmConvertePDF_JPG in 'ufrmConvertePDF_JPG.pas' {frmConverterPDF_JPG},
  UDMDIG in '..\DM\UDMDIG.pas' {dmDIG: TDataModule},
  UDM in '..\DM\UDM.pas' {DM: TDataModule},
  UGeral in '..\GERAL\UGeral.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TdmDIG, dmDIG);
  Application.CreateForm(TfrmConverterPDF_JPG, frmConverterPDF_JPG);
  Application.Run;
end.
