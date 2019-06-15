unit Mini;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scStyledForm, scControls,
  scGPControls, dxGDIPlusClasses, scGPImages, scGPPagers, Vcl.ExtCtrls,  scModernControls;

const
  WM_MouseEnter = $B013;
  WM_MouseLeave = $B014;

type
  TFm_MiniBox = class(TForm)
    SF_MinBox: TscStyledForm;
    PN_MinBox: TscGPPanel;
    BTN_Play_Pause: TscGPButton;
    BTN_Last: TscGPButton;
    BTN_Next: TscGPButton;
    BTN_Close: TscGPGlyphButton;
    BTN_Small: TscGPGlyphButton;
    BTN_Voice: TscGPButton;
    BTN_PlayList: TscGPButton;
    Lb_Song_Name: TscGPLabel;
    Lb_Song_Singer: TscGPLabel;
    Music_Logo_Img: TscGPImage;
    PV_Main: TscGPPageViewer;
    PVP_Control: TscGPPageViewerPage;
    PVP_Info: TscGPPageViewerPage;
    procedure BTN_Play_PauseClick(Sender: TObject);
    procedure BTN_SmallClick(Sender: TObject);
    procedure BTN_CloseClick(Sender: TObject);
    procedure BTN_NextClick(Sender: TObject);
    procedure BTN_LastClick(Sender: TObject);
    procedure BTN_VoiceClick(Sender: TObject);
    procedure BTN_PlayListClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Lb_Song_SingerMouseEnter(Sender: TObject);
    procedure Lb_Song_NameMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMMouseEnter(var Msg: TMessage); message WM_MouseEnter;
    procedure WMMouseLeave(var Msg: TMessage); message WM_MouseLeave;
    procedure WMForm_Move(var Msg: TMessage); message WM_MOVE;
    { Public declarations }
  end;

var
  Fm_MiniBox: TFm_MiniBox;
  bo: Boolean;

implementation

uses
  Main, List, Bass;
{$R *.dfm}

procedure TFm_MiniBox.BTN_CloseClick(Sender: TObject);
begin //关闭程序
  Fm_Main.TMR_Play.Enabled := False;
  Fm_Main.TMR_Bottom_Wave.Enabled := false;
  BASS_ChannelStop(HS);
  Application.Terminate;
end;

procedure TFm_MiniBox.BTN_LastClick(Sender: TObject);
begin
  case Loop_Type of
    0: //列表循环的上一首
      begin
        try
          Fm_Main.Last_Music;
        except
          Fm_Main.Last_Music;
        end;
      end;
    2: //随机上一首
      begin
        try
          Fm_Main.Loop_Random;
        except
          Fm_Main.Loop_Random;
        end;
      end;
  end;
end;

procedure TFm_MiniBox.BTN_NextClick(Sender: TObject);
begin
  case Loop_Type of
    0: //列表循环的下一首
      begin
        try
          Fm_Main.Loop_List;
        except
          Fm_Main.Loop_List;
        end;
      end;
    1: //列表循环的下一首
      begin
        try
          Fm_Main.Loop_List;
        except
          Fm_Main.Loop_List;
        end;
      end;
    2: //随机循环的下一首
      begin
        try
          Fm_Main.Loop_Random;
        except
          Fm_Main.Loop_Random;
        end;
      end;
  end;
end;

procedure TFm_MiniBox.BTN_PlayListClick(Sender: TObject);
begin
  Fm_List.SF_List.DropDown(Fm_MiniBox, Fm_MiniBox.Left, Fm_MiniBox.Top + 50);
end;

procedure TFm_MiniBox.BTN_Play_PauseClick(Sender: TObject);
begin
  if MEM.Size > 0 then
  begin
    if Bo_Play then
    begin
      BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Fm_Main.Trc_Voice.Value / Fm_Main.Trc_Voice.MaxValue);
      Fm_Main.Tmr_Play.Enabled := True;  //播放音乐
      BASS_ChannelPlay(HS, false);
      BTN_Play_Pause.ImageIndex := 1;
      Fm_Main.BTN_Play_Pause.ImageIndex := 1; //播放按钮显示为暂停
      Fm_Main.N_Play_Pause.ImageIndex := 5; //任务栏按钮显示为暂停
      Fm_Main.N_Play_Pause.Caption := '暂停';
      Bo_Play := false;
    end
    else
    begin
      Fm_Main.Tmr_Play.Enabled := false; //停止播放音乐
      BASS_ChannelPause(HS);
      BTN_Play_Pause.ImageIndex := 0;
      Fm_Main.BTN_Play_Pause.ImageIndex := 0; //播放按钮显示为播放
      Fm_Main.N_Play_Pause.ImageIndex := 4; //任务栏按钮显示为播放
      Fm_Main.N_Play_Pause.Caption := '播放';
      Bo_Play := True;
    end;
  end;
end;

procedure TFm_MiniBox.BTN_SmallClick(Sender: TObject);
begin
  Fm_Main.TMR_Bottom_Wave.Enabled := True;
  Fm_Main.Show;
  Fm_MiniBox.Hide;
end;

procedure TFm_MiniBox.BTN_VoiceClick(Sender: TObject);
begin
  Fm_Main.CP_Voice.Popup(BTN_Voice);
end;

procedure TFm_MiniBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := 0;
  Params.ExStyle := Params.ExStyle or WS_EX_TOOLWINDOW; //如果不想在任务栏显示窗口图标
end;

procedure TFm_MiniBox.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  bo := true;
end;

procedure TFm_MiniBox.Lb_Song_NameMouseEnter(Sender: TObject);
begin
  Lb_Song_Name.Hint := Lb_Song_Name.Caption;
end;

procedure TFm_MiniBox.Lb_Song_SingerMouseEnter(Sender: TObject);
begin
  Lb_Song_Singer.Hint := Lb_Song_Singer.Caption;
end;

procedure TFm_MiniBox.WMForm_Move(var Msg: TMessage);
begin
  if (self.Top < 10) and (Self.Top <> 0) and bo then
  begin
    self.Top := 0;
    Sleep(20);
  end;
end;

procedure TFm_MiniBox.WMMouseEnter(var Msg: TMessage);
var
  rc, rcF: TRECT;
  pt, ptF: TPOINT;
  i: Word;
begin
  GetWindowRect(Self.PVP_Info.Handle, rc); //取矩形区域
  GetCursorPos(pt); //取得当前鼠标所在位置
  if PtInRect(rc, pt) then //如果鼠标不在窗体范围内
  begin
//    if PV_Main.PageIndex <> 0 then
//    begin
//      Change.FreezeControlClient(PV_Main, PV_Main.ClientRect);
      PV_Main.PageIndex := 0;
//      try
//        Change.Execute;
//      finally
//        Change.Restore;
//      end;
//    end;
//    PV_Main.ActivePage := PVP_Control;
  end;
  GetWindowRect(Self.Handle, rcF); //取矩形区域
  GetCursorPos(ptF); //取得当前鼠标所在位置
  if PtInRect(rcF, ptF) and (Self.Top < 0) then //如果鼠标在窗体范围内
  begin
    bo := false;
    for i := 9 downto 1 do
    begin
      Self.Top := Self.Top + i;
      Sleep(20);
    end;
  end;
end;

procedure TFm_MiniBox.WMMouseLeave(var Msg: TMessage);
var
  rc, rcF: TRECT;
  pt, ptF: TPOINT;
  i: Word;
begin
  GetWindowRect(Self.PVP_Info.Handle, rc); //取矩形区域
  GetCursorPos(pt); //取得当前鼠标所在位置
  if (not PtInRect(rc, pt)) then //如果鼠标不在窗体范围内
  begin
//    if PV_Main.PageIndex <> 1 then
//    begin
//      Change.FreezeControlClient(PV_Main, PV_Main.ClientRect);
      PV_Main.PageIndex := 1;
//      try
//        Change.Execute;
//      finally
//        Change.Restore;
//      end;
//    end;
//    PV_Main.ActivePage := PVP_Info;
  end;
  GetWindowRect(Self.Handle, rcF); //取矩形区域
  GetCursorPos(ptF); //取得当前鼠标所在位置
  if (not PtInRect(rcF, ptF)) and (Self.Top = 0) then //如果鼠标不在窗体范围内
  begin
    bo := false;
    for i := 1 to 9 do
    begin
      Self.Top := Self.Top - i;
      Sleep(20);
    end;
  end
  else
  begin
    bo := TRUE;
  end;
end;

end.

