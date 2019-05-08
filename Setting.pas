unit Setting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scStyledForm, se_effect,
  se_ani, se_form, scControls, scGPControls, Vcl.StdCtrls, Vcl.Mask,
  scGPExtControls;

type
  TFm_Setting = class(TForm)
    AF_Main: TseAnimationForm;
    AL_Main: TseAnimationList;
    ShowF: TseAnimation;
    SF_Main: TscStyledForm;
    PN_Main: TscGPPanel;
    PN_Top: TscGPPanel;
    SpinEDT_Search: TscGPSpinEdit;
    LB_Caption: TscGPLabel;
    BTN_Close: TscGPGlyphButton;
    procedure BTN_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Setting: TFm_Setting;

implementation

{$R *.dfm}

procedure TFm_Setting.BTN_CloseClick(Sender: TObject);
begin
  Close;
end;

end.

