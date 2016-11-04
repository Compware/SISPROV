unit UfrmRelPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet,
  IBQuery, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, RpRenderRTF,
  RpRenderHTML, RpRender, RpRenderPDF;

type
  TfrmRelPad = class(TForm)
    pgFiltros: TPageControl;
    Label1: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    btImprimir: TBitBtn;
    btCancelar: TBitBtn;
    qyGeral: TIBQuery;
    rvGeral: TRvProject;
    rvSystem: TRvSystem;
    rvDtGeral: TRvDataSetConnection;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderRTF1: TRvRenderRTF;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPad: TfrmRelPad;

implementation

Uses
  UDM, UDMGERAL, Ugeral;

{$R *.dfm}

end.
