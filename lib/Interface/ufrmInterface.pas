unit ufrmInterface;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ufrmInterfaceP80, ufrmInterfaceKX21,
  ufrmInterfaceAbacus,  ufrmInterfaceDEPARA, ufrmInterfaceFacsCount;

type
  TfrmInterface = class(TForm)
    Panel1: TPanel;
    lbPentra80: TLabel;
    lbKX21: TLabel;
    lbAbacus: TLabel;
    lbConfigurar: TLabel;
    lbFacscount: TLabel;
    sbConteudo: TScrollBox;
    imMaquina: TImage;
    lbXT8000: TLabel;
    procedure lbPentra80Click(Sender: TObject);
    procedure lbKX21Click(Sender: TObject);
    procedure lbAbacusClick(Sender: TObject);
    procedure lbConfigurarClick(Sender: TObject);
    procedure lbFacscountClick(Sender: TObject);
    procedure lbXT8000Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInterface: TfrmInterface;

implementation

uses ufrmInterfaceXT8000, ufrmInterfaceConfig, ufrmSenha;

{$R *.dfm}

procedure TfrmInterface.lbPentra80Click(Sender: TObject);
begin
  imMaquina.Picture.LoadFromFile('C:\Compware\Imagem\P80.bmp');
  frmInterfaceP80.Parent := sbConteudo;
  frmInterfaceP80.BorderStyle := bsNone;
  frmInterfaceP80.WindowState := wsMaximized;
  frmInterfaceP80.FTipo := P80;
  frmInterfaceP80.Show;
end;

procedure TfrmInterface.lbKX21Click(Sender: TObject);
begin
  imMaquina.Picture.LoadFromFile('C:\Compware\Imagem\KX21.bmp');
  frmInterfaceKX21.Parent := sbConteudo;
  frmInterfaceKX21.BorderStyle := bsNone;
  frmInterfaceKX21.WindowState := wsMaximized;
  frmInterfaceKX21.Show;
end;

procedure TfrmInterface.lbAbacusClick(Sender: TObject);
begin
  imMaquina.Picture.LoadFromFile('C:\Compware\Imagem\ABACUS.bmp');
  frmInterfaceAbacus.Parent := sbConteudo;
  frmInterfaceAbacus.BorderStyle := bsNone;
  frmInterfaceAbacus.WindowState := wsMaximized;
  frmInterfaceAbacus.Show;
end;

procedure TfrmInterface.lbFacscountClick(Sender: TObject);
begin
  imMaquina.Picture.LoadFromFile('C:\Compware\Imagem\FACSCOUNT.bmp');
  frmInterfaceFacsCount.Parent := sbConteudo;
  frmInterfaceFacsCount.BorderStyle := bsNone;
  frmInterfaceFacsCount.WindowState := wsMaximized;
  frmInterfaceFacsCount.Show;
end;

procedure TfrmInterface.lbConfigurarClick(Sender: TObject);
begin
  if  frmSenha.ShowModal = mrOk then
    frmInterfaceConfig.Show;
end;

{SCRIPT
create table interface(
cd_interface integer not null primary key,
FL_CONFIRMADO CHAR(1),
cd_id integer not null,
dt_interface timestamp not null,
cd_maquina varchar(10) not null,
ds_interface varchar(6000));

create generator gen_interface;

CREATE INDEX INTERFACE_IX1 ON INTERFACE(FL_CONFIRMADO);
}

procedure TfrmInterface.lbXT8000Click(Sender: TObject);
begin
  imMaquina.Picture.LoadFromFile('C:\Compware\Imagem\XT8000.bmp');
  frmInterfaceXT8000.Parent := sbConteudo;
  frmInterfaceXT8000.BorderStyle := bsNone;
  frmInterfaceXT8000.WindowState := wsMaximized;
  frmInterfaceXT8000.FTipo := XT8000;
  frmInterfaceXT8000.Show;
end;

end.
