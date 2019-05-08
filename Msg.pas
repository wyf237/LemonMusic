unit Msg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scStyledForm,
  scStyleManager, scGPControls, scControls, scGPImages;

type
  TFm_Msg = class(TForm)
    PN_Top: TscGPPanel;
    BTN_Close: TscGPGlyphButton;
    LB_MSG: TscGPLabel;
    PN_Bottom: TscGPPanel;
    BTN_Normal: TscGPButton;
    LB_Onclose: TscGPLabel;
    scGPCheckBox1: TscGPCheckBox;
    RB_Tray: TscGPRadioButton;
    RB_Quite: TscGPRadioButton;
    SF_Msg: TscStyledForm;
    scGPPanel1: TscGPPanel;
    procedure BTN_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MsgBox(const MsgCaption, Msg: string): Integer;
  end;


var
  Fm_Msg: TFm_Msg;

implementation

{$R *.dfm}

{ TFm_Msg }

procedure TFm_Msg.BTN_CloseClick(Sender: TObject);
begin
  Close;
end;

function TFm_Msg.MsgBox(const MsgCaption, Msg: string): Integer;
var
  F: TFm_Msg;
begin
  F := TFm_Msg.Create(nil);
//  F.CaptionLabel.Caption := MsgCaption;
//  F.MessageImage.ImageIndex := 89;
//  F.MessageLabel.Caption := Msg;
  F.ShowModal;
  Result := F.ModalResult;
  F.Free;
end;

end.

