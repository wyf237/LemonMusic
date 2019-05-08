unit SetAndAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scGPPagers, scControls,
  scGPControls, dxGDIPlusClasses, Vcl.ExtCtrls, scStyledForm, scGPImages,
  cxGraphics, System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls,
  scHtmlControls;

type
  TFm_ALS = class(TForm)
    PN_Top: TscGPPanel;
    PV_ALS: TscGPPageViewer;
    PVP_Share: TscGPPageViewerPage;
    PVP_About: TscGPPageViewerPage;
    SF_ALS: TscStyledForm;
    PVP_Like: TscGPPageViewerPage;
    PGC_Like: TscGPPageControl;
    PG_Alipay: TscGPPageControlPage;
    PG_WX: TscGPPageControlPage;
    IMG_Alipay: TscGPImage;
    IMG_WX: TscGPImage;
    IL_Pay: TcxImageList;
    IMG_Share: TscGPImage;
    Img_Scan: TImage;
    LB_Scan: TLabel;
    Label1: TLabel;
    scHTMLLabel1: TscHTMLLabel;
    scHTMLLabel2: TscHTMLLabel;
    scHTMLLabel3: TscHTMLLabel;
    scHTMLLabel4: TscHTMLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_ALS: TFm_ALS;

implementation

{$R *.dfm}

end.

