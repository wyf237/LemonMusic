program LemonMusic;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Fm_Main},
  Mini in 'Mini.pas' {Fm_MiniBox},
  Music_163_Spider in 'Music_163_Spider.pas',
  Music_KuGou_Spider in 'Music_KuGou_Spider.pas',
  Music_KuWo_Spider in 'Music_KuWo_Spider.pas',
  List in 'List.pas' {Fm_List},
  DownLoad in 'DownLoad.pas',
  InfoFromID in 'InfoFromID.pas',
  INIX in 'INIX.pas',
  Data in 'Data.pas',
  TaskBar in 'TaskBar.pas' {Fm_TaskBar},
  SetAndAbout in 'SetAndAbout.pas' {Fm_ALS},
  Task_Menu in 'Task_Menu.pas' {Fm_Task_Menu},
  Msg in 'Msg.pas' {Fm_Msg},
  Loading in 'Loading.pas' {Fm_Loading},
  Start in 'Start.pas' {Fm_Start},
  Music_QQ_Spider in 'Music_QQ_Spider.pas',
  VMsgMonitor in 'VMsgMonitor.pas',
  MSGs in 'MSGs.pas',
  Top_Recom in 'Top_Recom.pas' {Fr_Top_Recom: TFrame},
  Top_Search in 'Top_Search.pas' {Fr_Top_Search: TFrame},
  Play_MV in 'Play_MV.pas' {Fm_MV},
  FullScreen in 'FullScreen.pas' {Fm_FullScreen},
  Setting in 'Setting.pas' {Fm_Setting};

{$R *.res}

begin
  Application.Initialize;
  Fm_Start:=TFm_Start.Create(Fm_Start);
  Fm_Start.Show;
  Fm_Start.Update;
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm:=false;
  Application.CreateForm(TFm_Main, Fm_Main);
  Application.CreateForm(TFm_MiniBox, Fm_MiniBox);
  Application.CreateForm(TFm_List, Fm_List);
  Application.CreateForm(TFm_TaskBar, Fm_TaskBar);
  Application.CreateForm(TFm_ALS, Fm_ALS);
  Application.CreateForm(TFm_Task_Menu, Fm_Task_Menu);
  Application.CreateForm(TFm_Msg, Fm_Msg);
  Application.CreateForm(TFm_Loading, Fm_Loading);
  Application.CreateForm(TFm_Setting, Fm_Setting);
  //  Application.CreateForm(TFm_Start, Fm_Start);
  Application.CreateForm(TFm_MV, Fm_MV);
  Application.CreateForm(TFm_FullScreen, Fm_FullScreen);
  Application.Run;
end.
