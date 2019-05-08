unit Top_Recom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scGPControls, scControls,
  scGPImages;

type
  TFr_Top_Recom = class(TFrame)
    PN_Top_Start: TscGPPanel;
    BTN_Start_Play_All: TscGPGlyphButton;
    IMG_Start: TscGPImage;
    LB_Start_Title: TscGPLabel;
    LB_Start_Info: TscGPLabel;
    BTN_More_Info: TscGPButton;
    BTN_Start_Down_All: TscGPGlyphButton;
    BTN_Start_Add_All: TscGPGlyphButton;
    BTN_Start_Batch: TscGPGlyphButton;
    BTN_Back: TscGPGlyphButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Main;
{$R *.dfm}

end.

