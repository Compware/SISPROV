library Project2;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Dialogs,
  Classes,
  Unit1 in 'Unit1.pas' {ConvertePDF};

{$R *.RES}

  function Carregar(sFile: string): boolean; stdcall;
  begin
    result := ConvertePDF.Carregar(sFile);
  end;

  function Converter(sFile: string): boolean; stdcall;
  begin
    result := ConvertePDF.Converter(sFile);
  end;

  procedure CarregarBt; stdcall;
  begin
    ConvertePDF.btn1Click(nil);
  end;

  procedure ConverterBt; stdcall;
  begin
    ConvertePDF.btn2Click(nil);
  end;

  procedure Abrir(bShow: boolean); stdcall;
  begin
    ConvertePDF := TConvertePDF.Create(nil);
    if bShow then
    begin
      ConvertePDF.Show;
      ConvertePDF.Hide;
    end;
  end;

  procedure Fechar; stdcall;
  begin
    ConvertePDF.Free;
  end;

exports  Carregar  index 1;
exports  Converter index 2;
exports  Abrir index 3;
exports  Fechar index 4;
exports  CarregarBt index 5;
exports  ConverterBt index 6;

begin
end.

