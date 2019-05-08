unit Task_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scGPControls, scControls,
  Vcl.ExtCtrls, scStyledForm;

type
  TFm_Task_Menu = class(TForm)
    SF_Task_Menu: TscStyledForm;
    PN_Task_Menu: TPanel;
    Trc_Voice: TscGPTrackBar;
    BTN_Voice: TscGPButton;
    BTN_Normal: TscGPButton;
    BTN_Quite: TscGPButton;
    BTN_List: TscGPButton;
    BTN_One: TscGPButton;
    BTN_Random: TscGPButton;
    LB_Voice_Task: TscGPLabel;
    procedure BTN_QuiteClick(Sender: TObject);
    procedure BTN_NormalClick(Sender: TObject);
    procedure BTN_ListClick(Sender: TObject);
    procedure BTN_OneClick(Sender: TObject);
    procedure BTN_RandomClick(Sender: TObject);
    procedure Trc_VoiceChange(Sender: TObject);
    procedure BTN_VoiceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Task_Menu: TFm_Task_Menu;

implementation

uses
  Main, TaskBar, Bass;
{$R *.dfm}

procedure TFm_Task_Menu.BTN_ListClick(Sender: TObject);
begin
  Fm_Main.BTN_Loop.ImageIndex := 8;
  Fm_Main.BTN_Loop.HotImageIndex := 9;
  Fm_Main.BTN_Loop.Hint := '列表循环';
  Loop_Type := 0;
end;

procedure TFm_Task_Menu.BTN_NormalClick(Sender: TObject);
begin
  Fm_TaskBar.Hide;
  Fm_Main.TMR_Bottom_Wave.Enabled := True;
  Fm_Main.WindowState := wsNormal;
  Fm_Main.N_Show_Form.ImageIndex := 0;
  Fm_Main.N_Show_Form.Caption := '常规';
  Fm_Main.Show;
  MoveWindow(SecH, 0, 0, SecR.Right - SecR.Left, SecR.Bottom - SecR.Top, True);
end;

procedure TFm_Task_Menu.BTN_OneClick(Sender: TObject);
begin
  Fm_Main.BTN_Loop.ImageIndex := 10;
  Fm_Main.BTN_Loop.HotImageIndex := 11;
  Fm_Main.BTN_Loop.Hint := '单曲循环';
  Loop_Type := 1;
end;

procedure TFm_Task_Menu.BTN_QuiteClick(Sender: TObject);
begin
  Fm_Main.TMR_Play.Enabled := false;
  Fm_Main.TMR_Bottom_Wave.Enabled := false;
  BASS_ChannelStop(HS);
  MoveWindow(SecH, 0, 0, SecR.Right - SecR.Left, SecR.Bottom - SecR.Top, True);
  Application.Terminate;
end;

procedure TFm_Task_Menu.BTN_RandomClick(Sender: TObject);
begin
  Fm_Main.BTN_Loop.ImageIndex := 12;
  Fm_Main.BTN_Loop.HotImageIndex := 13;
  Fm_Main.BTN_Loop.Hint := '随机循环';
  Loop_Type := 2;
end;

procedure TFm_Task_Menu.BTN_VoiceClick(Sender: TObject);
begin
if Trc_Voice.Value = 0 then
  begin
    Fm_Main.BTN_Voice.ImageIndex := 4;
//    Fm_Main.BTN_Multi.ImageIndex := 4;
    Fm_Main.BTN_Voice.HotImageIndex := 5;
//    Fm_Main.BTN_Multi.HotImageIndex := 5;
    BTN_Voice.ImageIndex:=4;
    BTN_Voice.HotImageIndex:=5;
    Fm_Main.Trc_Voice.Value := VoiceX;
    BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
  end
  else
  begin
    VoiceX := Fm_Main.Trc_Voice.Value;
    Fm_Main.BTN_Voice.ImageIndex := 6;
//    Fm_Main.BTN_Multi.ImageIndex := 6;
    Fm_Main.BTN_Voice.HotImageIndex := 7;
//    Fm_Main.BTN_Multi.HotImageIndex := 7;
    BTN_Voice.ImageIndex:=6;
    BTN_Voice.HotImageIndex:=7;
    Trc_Voice.Value := 0;
    BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
  end;
end;

procedure TFm_Task_Menu.Trc_VoiceChange(Sender: TObject);
begin
 if MeM.Size > 0 then
  begin
    BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
  end;
  if Trc_Voice.Value = 0 then
  begin
    Fm_Main.BTN_Voice.ImageIndex := 6;
//    Fm_Main.BTN_Multi.ImageIndex := 6;
    Fm_Main.BTN_Voice.HotImageIndex := 7;
//    Fm_Main.BTN_Multi.HotImageIndex := 7;
  end
  else
  begin
    Fm_Main.BTN_Voice.ImageIndex := 4;
//    Fm_Main.BTN_Multi.ImageIndex := 4;
    Fm_Main.BTN_Voice.HotImageIndex := 5;
//    Fm_Main.BTN_Multi.HotImageIndex := 5;
  end;
  Fm_Main.Trc_Voice.Value:=Trc_Voice.Value;
  Fm_Main.LB_Voive.Caption := IntToStr(Fm_Main.Trc_Voice.Value);
  LB_Voice_Task.Caption := IntToStr(Trc_Voice.Value);
end;

end.

