unit List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scStyledForm, scControls,
  scGPControls, scGPImages, Vcl.ExtCtrls, scGPPagers, NxColumns6, NxGridView6,
  NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6, AdvSmoothScrollBar,
  Data.DB, Vcl.Menus, AdvMenus;

type
  TFm_List = class(TForm)
    PN_List: TscGPPanel;
    BTN_Play: TscGPGlyphButton;
    BTN_Del: TscGPGlyphButton;
    BTN_Clear: TscGPGlyphButton;
    SP_Info: TShape;
    PN_SB_List: TPanel;
    SB_List: TAdvSmoothScrollBar;
    SF_List: TscStyledForm;
    NG_List: TNextGrid6;
    NV_List: TNxReportGridView6;
    Col_No: TNxTextColumn6;
    Col_Name: TNxTextColumn6;
    Col_Album: TNxTextColumn6;
    Col_Singer: TNxTextColumn6;
    Col_Time: TNxTextColumn6;
    Col_From: TNxTextColumn6;
    Col_Url: TNxTextColumn6;
    Col_Img: TNxTextColumn6;
    Col_Lrc: TNxTextColumn6;
    Col_ID: TNxTextColumn6;
    Col_Singer_ID: TNxTextColumn6;
    Col_Album_ID: TNxTextColumn6;
    Col_MV_ID: TNxTextColumn6;
    Col_Flag: TNxTextColumn6;
    POP_List: TAdvPopupMenu;
    N_Play: TMenuItem;
    N_Del: TMenuItem;
    N_Clear: TMenuItem;
    PN_Top: TscGPPanel;
    procedure NG_ListVerticalScroll(Sender: TObject);
    procedure SB_ListPositionChanged(Sender: TObject; Position: Integer);
    procedure NG_ListDblClick(Sender: TObject);
    procedure BTN_ClearClick(Sender: TObject);
    procedure BTN_DelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_List: TFm_List;

implementation

uses
  Main, Mini, Data;
{$R *.dfm}

procedure TFm_List.BTN_DelClick(Sender: TObject);
var
  i: Integer;
  loc: string;
  IO: IO_List; // 实例化JSON列表读写操作的自定义类
begin
  if NG_List.SelectedCount > 0 then
  begin
    IO := IO_List.Create;
    loc := Fm_Main.MEM_PlayList.FieldByName('S_MusicId').asstring;
    Fm_Main.MEM_PlayList.Locate('S_MusicId', NG_List.Cells[Col_ID.Index, NG_List.SelectedRow], []);
    Fm_Main.MEM_PlayList.Delete;
    IO.DelSongs('playlist', NG_List.Cells[Col_ID.Index, NG_List.SelectedRow]);
    NG_List.DeleteSelected;
    Fm_Main.MEM_PlayList.Locate('S_MusicId', loc, []);
    for i := 0 to NG_List.RowCount - 1 do
    begin
      NG_List.Cells[Col_No.Index, i] := inttostr(i + 1);
    end;
    Fm_Main.BTN_PlayList.Caption := inttostr(strtoint(Fm_Main.BTN_PlayList.Caption) - 1);
    IO.Free;
  end;
end;

procedure TFm_List.FormCreate(Sender: TObject);
var
  IO: LD_List; // 实例化读取列表自定义类
begin
  IO := LD_List.Create('playlist', Fm_List.NG_List, Fm_Main.MEM_PlayList);
  IO.Start;
end;

procedure TFm_List.BTN_ClearClick(Sender: TObject);
begin
  Fm_Main.MEM_PlayList.Close;
  Fm_Main.MEM_PlayList.Open;
  NG_List.ClearRows;
  Fm_Main.BTN_PlayList.Caption := '0';
  DeleteFile(ExtractFileDir(ParamStr(0)) + '\Data.json');
end;

procedure TFm_List.NG_ListDblClick(Sender: TObject);
var
  i: Integer;
begin
  if NG_List.SelectedCount > 0 then
  begin
    try
      HS := Fm_Main.Get_Music_HS(NG_List.Cells[Col_Url.Index, NG_List.SelectedRow]);
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Fm_Main.Get_Img(NG_List.Cells[Col_Img.Index, NG_List.SelectedRow], 50, 50)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := NG_List.Cells[Col_Name.Index, NG_List.SelectedRow]; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := NG_List.Cells[Col_Singer.Index, NG_List.SelectedRow]; // Mini窗口显示歌手
      Fm_Main.LB_All_Time.Caption := NG_List.Cells[Col_Time.Index, NG_List.SelectedRow]; // 显示时长
      Fm_Main.Music_Info_Img.Picture.Assign(Fm_Main.Get_Img(NG_List.Cells[Col_Img.Index, NG_List.SelectedRow], 40, 40)); // 下方显示图片
      Fm_Main.LB_Music_Name.Caption := NG_List.Cells[Col_Name.Index, NG_List.SelectedRow] + ' - ' + NG_List.Cells[Col_Singer.Index, NG_List.SelectedRow]; // 显示歌名
      Application.Title := NG_List.Cells[Col_Name.Index, NG_List.SelectedRow] + ' - ' + NG_List.Cells[Col_Singer.Index, NG_List.SelectedRow]; // 任务栏显示歌名
      Fm_Main.Play_Music; // 播放
      for i := 0 to Fm_List.NG_List.RowCount - 1 do
      begin
        Fm_List.NG_List.Cell[0, i].Color := clWhite;
      end;
      NG_List.Cell[0, NG_List.SelectedRow].Color := clred; // 标记为红色正在播放
      Fm_Main.MEM_PlayList.Locate('S_MusicId', NG_List.Cells[Col_ID.Index, NG_List.SelectedRow], []); //内存表定位到该歌曲
      Fm_Main.Trc_Play.Visible := false;
    except
      try
        NG_List.Cells[Col_Url.Index, NG_List.SelectedRow] := Fm_Main.Get_New_Url(StrToInt(NG_List.Cells[Col_From.Index, NG_List.SelectedRow]), NG_List.Cells[Col_ID.Index, NG_List.SelectedRow]);
        HS := Fm_Main.Get_Music_HS(NG_List.Cells[Col_url.Index, NG_List.SelectedRow]);
        Fm_MiniBox.Music_Logo_Img.Picture.Assign(Fm_Main.Get_Img(NG_List.Cells[Col_Img.Index, NG_List.SelectedRow], 50, 50)); // 显示图片
        Fm_MiniBox.Lb_Song_Name.Caption := NG_List.Cells[Col_Name.Index, NG_List.SelectedRow]; // Mini窗口显示歌名
        Fm_MiniBox.Lb_Song_Singer.Caption := NG_List.Cells[Col_Singer.Index, NG_List.SelectedRow]; // Mini窗口显示歌手
        Fm_Main.LB_All_Time.Caption := NG_List.Cells[Col_Time.Index, NG_List.SelectedRow]; // 显示时长
        Fm_Main.Music_Info_Img.Picture.Assign(Fm_Main.Get_Img(NG_List.Cells[Col_Img.Index, NG_List.SelectedRow], 40, 40)); // 下方显示图片
        Fm_Main.LB_Music_Name.Caption := NG_List.Cells[Col_Name.Index, NG_List.SelectedRow] + ' - ' + NG_List.Cells[Col_Singer.Index, NG_List.SelectedRow]; // 显示歌名
        Application.Title := NG_List.Cells[Col_Name.Index, NG_List.SelectedRow] + ' - ' + NG_List.Cells[Col_Singer.Index, NG_List.SelectedRow]; // 任务栏显示歌名
        Fm_Main.Play_Music; // 播放
        for i := 0 to Fm_List.NG_List.RowCount - 1 do
        begin
          Fm_List.NG_List.Cell[0, i].Color := clWhite;
        end;
        NG_List.Cell[0, NG_List.SelectedRow].Color := clred; // 标记为红色正在播放
        Fm_Main.Trc_Play.Visible := false;
        Fm_Main.MEM_PlayList.Locate('S_MusicId', NG_List.Cells[Col_ID.Index, NG_List.SelectedRow], []); //内存表定位到该歌曲
      except
        Fm_Main.ASMB.Messages[0].Show; //提示失效
      end;
    end;
  end;
end;

procedure TFm_List.NG_ListVerticalScroll(Sender: TObject);
begin
  if NG_List.VertScrollBar.Position <> 0 then
  begin
    SB_List.Position := NG_List.VertScrollBar.Position + 9;
  end
  else
  begin
    SB_List.Position := 0;
  end;
end;

procedure TFm_List.SB_ListPositionChanged(Sender: TObject; Position: Integer);
begin
  NG_List.VertScrollBar.Position := SB_List.Position - 9;
end;

end.

