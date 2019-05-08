unit Start;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, se_effect,
  se_ani, se_form, scControls, scGPControls, dxGDIPlusClasses,
  scImageCollection, scGPImages;

type
  TFm_Start = class(TForm)
    AL_Main: TseAnimationList;
    Splash: TseAnimation;
    AF_Main: TseAnimationForm;
    PN_State: TscGPPanel;
    PN_BackGround: TscGPPanel;
    LB_Satate: TscGPLabel;
    IC_Main: TscGPImageCollection;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Start: TFm_Start;

implementation

{$R *.dfm}

procedure TFm_Start.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

end.

