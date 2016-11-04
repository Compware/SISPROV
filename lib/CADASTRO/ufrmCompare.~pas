unit ufrmCompare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfrmCompare = class(TForm)
    pnEsquerda: TPanel;
    pnDireita: TPanel;
    Splitter1: TSplitter;
    sbDireita: TScrollBox;
    sbEsquerda: TScrollBox;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure sbEsquerdaResize(Sender: TObject);
    procedure sbDireitaResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompare: TfrmCompare;

implementation

uses uRelatorioWEB;

{$R *.dfm}

procedure TfrmCompare.sbEsquerdaResize(Sender: TObject);
begin
  TfrmRelatorioWEB(sbEsquerda.controls[0]).Width := sbEsquerda.Width;
  TfrmRelatorioWEB(sbEsquerda.controls[0]).Height := sbEsquerda.Height;  
end;

procedure TfrmCompare.sbDireitaResize(Sender: TObject);
begin
  TfrmRelatorioWEB(sbDireita.controls[0]).Width := sbDireita.Width;
  TfrmRelatorioWEB(sbDireita.controls[0]).Height := sbDireita.Height;  
end;

procedure TfrmCompare.FormShow(Sender: TObject);
begin
  pnEsquerda.Width := trunc(Width/2);
end;

end.
