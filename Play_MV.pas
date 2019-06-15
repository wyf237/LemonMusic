﻿unit Play_MV;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scStyledForm, scControls,
  scGPControls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, PasLibVlcPlayerUnit,
  PasLibVlcUnit, FullScreen;

const
  MAX_ARGS = 255;

type
  TFm_MV = class(TForm)
    SF_MV: TscStyledForm;
    Trc_MV_Video: TscGPTrackBar;
    PN_MV: TscGPPanel;
    PN_Ctrl: TscGPPanel;
    Trc_MV_Voice: TscGPTrackBar;
    BTN_Play_Pause: TscGPButton;
    BTN_Stop: TscGPButton;
    PLVP_MV: TPasLibVlcPlayer;
    PN_Top: TscGPPanel;
    BTN_Close: TscGPButton;
    LB_Caption: TscGPLabel;
    BTN_Max_Min: TscGPButton;
    BTN_Type: TscGPButton;
    procedure BTN_Play_PauseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Trc_MV_VoiceChange(Sender: TObject);
    procedure PLVP_MVMediaPlayerLengthChanged(Sender: TObject; time: Int64);
    procedure PLVP_MVMediaPlayerTimeChanged(Sender: TObject; time: Int64);
    procedure Trc_MV_VideoChange(Sender: TObject);
    procedure BTN_CloseClick(Sender: TObject);
    procedure BTN_Max_MinClick(Sender: TObject);
    procedure BTN_StopClick(Sender: TObject);
    procedure Trc_MV_VideoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Trc_MV_VideoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_MV: TFm_MV;
  p_li: libvlc_instance_t_ptr;
  p_mi: libvlc_media_player_t_ptr;

implementation

{$R *.dfm}
uses
  Main;
{ TFm_MV }

procedure TFm_MV.BTN_CloseClick(Sender: TObject);
begin
  PLVP_MV.Pause();
  Fm_MV.Hide;
//close;
end;

procedure TFm_MV.BTN_Max_MinClick(Sender: TObject);
var
  oldL, oldT, oldW, oldH: Integer;
  oldA: TAlign;
begin
  oldL := PLVP_MV.Left;
  oldT := PLVP_MV.Top;
  oldW := PLVP_MV.Width;
  oldH := PLVP_MV.Height;
  oldA := PLVP_MV.Align;

  if BTN_Max_Min.ImageIndex = 29 then
  begin
    if (oldA <> alNone) then
      PLVP_MV.Align := alNone;
    Fm_FullScreen.SetBounds(Monitor.Left, Monitor.Top, Monitor.Width, Monitor.Height);
//    PLVP_MV.Parent := Fm_FullScreen;
    Windows.SetParent(PLVP_MV.Handle, Fm_FullScreen.Handle);
//    PLVP_MV.Align := alClient;
    PLVP_MV.SetBounds(0, 0, Fm_FullScreen.Width, Fm_FullScreen.Height);
    BTN_Max_Min.ImageIndex := 30;
    Fm_FullScreen.Show;
//    Fm_FullScreen.Free;
//    BTN_Max_Min.ImageIndex := 29;
//    PLVP_MV.SetBounds(oldL, oldT, oldW, oldH);
//    Windows.SetParent(PLVP_MV.Handle, SELF.Handle);
//    if (oldA <> alNone) then
//      PLVP_MV.Align := oldA;
  end
  else
  begin
//    Fm_FullScreen.Close;
//    Fm_FullScreen.Free;
    BTN_Max_Min.ImageIndex := 29;
    Windows.SetParent(PLVP_MV.Handle, SELF.Handle);
    PLVP_MV.SetBounds(oldL, oldT, oldW, oldH);
//     PLVP_MV.Parent := Self.PN_MV;

//    Fm_FullScreen.Close;
    Fm_FullScreen.Close;
//    aFullScreenForm.Free;
    if (oldA <> alNone) then
      PLVP_MV.Align := oldA;
  end;
end;

procedure TFm_MV.BTN_Play_PauseClick(Sender: TObject);
begin
  if BTN_Play_Pause.ImageIndex = 26 then
  begin
    PLVP_MV.Resume();
    Trc_MV_Video.OnChange := NIL;
    BTN_Play_Pause.ImageIndex := 27;
  end
  else
  begin
    PLVP_MV.Pause();
    Trc_MV_Video.OnChange := Trc_MV_VideoChange;
    BTN_Play_Pause.ImageIndex := 26;
  end;
end;

procedure TFm_MV.BTN_StopClick(Sender: TObject);
begin
  PLVP_MV.Stop;
end;

procedure TFm_MV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PLVP_MV.Stop;
end;

procedure TFm_MV.FormShow(Sender: TObject);
begin(*初始化插件位置并载入*)
  libvlc_dynamic_dll_init_with_path(ExtractFileDir(ParamStr(0)));
  libvlc_dynamic_dll_init();

  if (libvlc_dynamic_dll_error <> '') then
  begin
    MessageDlg(libvlc_dynamic_dll_error, mtError, [mbOK], 0);
    Close;
    exit;
  end;

  with TArgcArgs.Create([libvlc_dynamic_dll_path, '--intf=dummy', '--ignore-config', '--quiet', '--no-video-title-show', '--no-video-on-top']) do
  begin
    p_li := libvlc_new(ARGC, ARGS);
    Free;
  end;

  if (p_li <> NIL) then
  begin
    p_mi := libvlc_media_player_new(p_li);
  end;
end;

procedure TFm_MV.PLVP_MVMediaPlayerLengthChanged(Sender: TObject; time: Int64);
begin
  Trc_MV_Video.MaxValue := time;
end;

procedure TFm_MV.PLVP_MVMediaPlayerTimeChanged(Sender: TObject; time: Int64);
var
  oldOnChange: TNotifyEvent;
begin
//  ProgLabel1.Caption := time2str(time, 'hh:mm:ss.ms');
  oldOnChange := Trc_MV_Video.OnChange;
  Trc_MV_Video.OnChange := NIL;
  Trc_MV_Video.Value := time;
  Trc_MV_Video.OnChange := oldOnChange;
end;

procedure TFm_MV.Trc_MV_VideoChange(Sender: TObject);
begin
  if PLVP_MV.CanSeek() then
  begin
    PLVP_MV.SetVideoPosInMs(Trc_MV_Video.Value);
  end;
end;

procedure TFm_MV.Trc_MV_VideoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Trc_MV_Video.OnChange := Trc_MV_VideoChange;
end;

procedure TFm_MV.Trc_MV_VideoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Trc_MV_Video.OnChange := NIL;
end;

procedure TFm_MV.Trc_MV_VoiceChange(Sender: TObject);
begin
  if Trc_MV_Voice.Value > 0 then
    PLVP_MV.SetAudioVolume(Trc_MV_Voice.Value);
end;

end.

