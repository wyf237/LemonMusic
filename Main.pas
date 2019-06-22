unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Hash, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  scImageCollection, scGPImages, scControls, scGPControls, scGPPagers,
  scStyledForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxCustomTileControl, cxClasses, scModernControls, Vcl.StdCtrls, Vcl.Mask,
  scGPExtControls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxGDIPlusClasses, Data.DB, dxmdaset, System.ImageList, Vcl.ImgList,
  cxImageList, pngimage, Vcl.ExtCtrls, se_effect, se_ani, bass,
  AdvSmartMessageBox, AdvSmoothScrollBar, scGrids, Vcl.Menus, AdvMenus,
  dxCalloutPopup, AdvTrackBar, DownLoad, Data, System.Actions, Vcl.ActnList,
  System.Win.TaskbarCore, Vcl.Taskbar, scExtControls, AdvSmoothPanel, scAppPager,
  cxScrollBox, dxSkinsCore, dxSkinDevExpressStyle, dxTileControl,
  dxSkinMetropolisDark, VMsgMonitor, MSGs, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData, cxTextEdit,
  cxButtonEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, dxSkinSharpPlus,
  dxLayoutContainer, cxGridCustomLayoutView, cxGridLayoutView,
  cxGridDBLayoutView, cxImage, cxGridViewLayoutContainer, dxTileBar, se_form;

type
  TFm_Main = class(TForm)
    IC_Main: TscGPImageCollection;
    SF_Main: TscStyledForm;
    BTN_Close: TscGPGlyphButton;
    BTN_Min: TscGPGlyphButton;
    HTTP: TIdHTTP;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    EDT_Search: TscGPEdit;
    IL_Btn_Ico: TcxImageList;
    PN_Main: TscGPPanel;
    PN_Top: TscGPPanel;
    PN_Bottom: TscGPPanel;
    BTN_Play_Pause: TscGPButton;
    BTN_Last: TscGPButton;
    BTN_Next: TscGPButton;
    BTN_Voice: TscGPButton;
    IC_Wave: TscGPImageCollection;
    TMR_Play: TTimer;
    ASMB: TAdvSmartMessageBox;
    PN_Bottom_Wave: TscGPPanel;
    LB_Play_Time: TscLabel;
    LB_All_Time: TscLabel;
    LB_H: TscLabel;
    TMR_Bottom_Wave: TTimer;
    POP_More: TAdvPopupMenu;
    N_Play: TMenuItem;
    MEM_PlayList: TdxMemData;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    CP_Voice: TdxCalloutPopup;
    BTN_Loop: TscGPButton;
    CP_Loop: TdxCalloutPopup;
    PN_Loop: TPanel;
    BTN_Random_Loop: TscGPButton;
    BTN_List_Loop: TscGPButton;
    BTN_One_Loop: TscGPButton;
    PN_Voice: TPanel;
    N_Add_To: TMenuItem;
    BTN_PlayList: TscGPButton;
    IL_Pop_Ico: TcxImageList;
    HTTP_Down: TIdHTTP;
    BTN_Small: TscGPGlyphButton;
    POP_Tray: TAdvPopupMenu;
    N_Show_Form: TMenuItem;
    N_Last: TMenuItem;
    N_Play_Pause: TMenuItem;
    N_Next: TMenuItem;
    N_Setting: TMenuItem;
    N_Quite: TMenuItem;
    M_Normal: TMenuItem;
    M_Mini: TMenuItem;
    M_MinSize: TMenuItem;
    M_Tray: TMenuItem;
    Tray_Main: TTrayIcon;
    IL_Tray_Ico: TcxImageList;
    Music_Info_Img: TscGPImage;
    Trc_Play: TAdvTrackBar;
    LB_Music_Name: TscLabel;
    Trc_Voice: TscGPTrackBar;
    MEM_PlayListS_ID: TStringField;
    N_Share: TMenuItem;
    N_Search: TMenuItem;
    POP_STY: TAdvMenuStyler;
    POP_Options: TAdvPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BTN_Like: TscGPButton;
    LB_Voive: TscGPLabel;
    TB_Main: TTaskbar;
    AL_TaskBar: TActionList;
    Prev: TAction;
    PlayPause: TAction;
    AP_Main: TscAppPager;
    APP_Home: TscAppPagerPage;
    APP_Top: TscAppPagerPage;
    APP_Radio: TscAppPagerPage;
    BTN_Open_Close_Home: TscGPGlyphButton;
    PN_Right_Shadow: TscGPPanel;
    AL_Main: TseAnimationList;
    Roll: TseAnimation;
    ShowF: TseAnimation;
    IMG_Logo: TscGPImage;
    TC_Home: TdxTileControl;
    TCG_Recom_List: TdxTileControlGroup;
    APP_Music: TscAppPagerPage;
    CG_Search: TcxGrid;
    TBV_Songs: TcxGridDBTableView;
    TBV_Songs1: TcxGridDBColumn;
    TBV_Songs3: TcxGridDBColumn;
    TBV_Songs4: TcxGridDBColumn;
    TBV_Songs5: TcxGridDBColumn;
    TBV_Songs2: TcxGridDBColumn;
    CL_Search: TcxGridLevel;
    SR_Main: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    MEM_Pub: TdxMemData;
    MEM_Pubtt: TStringField;
    MEM_Pubyy: TStringField;
    MEM_Pubuu: TStringField;
    MEM_Pubii: TStringField;
    MEM_PubSong_From: TStringField;
    MEM_PubSong_Img: TStringField;
    MEM_PubSong_ID: TStringField;
    MEM_PubSong_AlbumID: TStringField;
    MEM_PubSong_SingerID: TStringField;
    MEM_PubSong_MVID: TStringField;
    MEM_PubSong_Lrc: TStringField;
    DS_Songs: TDataSource;
    MEM_QQ: TdxMemData;
    StringField6: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    MEM_QQSong_No: TStringField;
    MEM_PubList_Title: TStringField;
    MEM_PubList_Des: TStringField;
    Next: TAction;
    N_WX: TMenuItem;
    N_QQ: TMenuItem;
    N_QZone: TMenuItem;
    N_XLWB: TMenuItem;
    N_Link: TMenuItem;
    MEM_163: TdxMemData;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    IL_Menu_Ico: TcxImageList;
    N_PlayList: TMenuItem;
    N_CreateList: TMenuItem;
    N_Album: TMenuItem;
    N_Singer: TMenuItem;
    N_HS: TMenuItem;
    N_MV: TMenuItem;
    MEM_KuWo: TdxMemData;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    MEM_KuGou: TdxMemData;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField51: TStringField;
    StringField52: TStringField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    N3: TMenuItem;
    BTN_About: TscGPButton;
    LOV_SearchGroup_Root: TdxLayoutGroup;
    LOV_Search: TcxGridDBLayoutView;
    DS_MV: TDataSource;
    LOV_SearchDBLayoutViewItem9: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem10: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem11: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem12: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem1: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem2: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem3: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem4: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem6: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem5: TcxGridDBLayoutViewItem;
    LOV_SearchDBLayoutViewItem7: TcxGridDBLayoutViewItem;
    LOV_SearchLayoutItem1: TcxGridLayoutItem;
    LOV_SearchLayoutItem2: TcxGridLayoutItem;
    LOV_SearchLayoutItem3: TcxGridLayoutItem;
    LOV_SearchLayoutItem4: TcxGridLayoutItem;
    LOV_SearchLayoutItem5: TcxGridLayoutItem;
    LOV_SearchLayoutItem6: TcxGridLayoutItem;
    LOV_SearchLayoutItem7: TcxGridLayoutItem;
    LOV_SearchLayoutItem8: TcxGridLayoutItem;
    LOV_SearchLayoutItem9: TcxGridLayoutItem;
    LOV_SearchLayoutItem10: TcxGridLayoutItem;
    LOV_SearchLayoutItem11: TcxGridLayoutItem;
    IL_MV_Ico: TcxImageList;
    MEM_MV_Urls: TdxMemData;
    MEM_MV_UrlsUrl1: TStringField;
    MEM_MV_UrlsUrl2: TStringField;
    MEM_MV_UrlsUrl3: TStringField;
    MEM_MV_UrlsUrl4: TStringField;
    MEM_MV_UrlsUrl5: TStringField;
    RB_Song: TscGPRadioButton;
    RB_MV: TscGPRadioButton;
    MEM_MV: TdxMemData;
    MEM_MVSong_Name: TWideStringField;
    MEM_MVSong_Singer: TWideStringField;
    MEM_MVSong_From: TStringField;
    MEM_MVSong_Img: TWideStringField;
    MEM_MVSong_SingerID: TStringField;
    MEM_MVSong_MVID: TStringField;
    MEM_MVSong_Dec: TWideStringField;
    MEM_MVSong_Pub: TStringField;
    MEM_MVSong_No: TStringField;
    MEM_MVSong_Pic: TBlobField;
    SV_Recome: TscSplitView;
    TC_Recome: TdxTileControl;
    dxTileControl1Group1: TdxTileControlGroup;
    dxTileControl1Group2: TdxTileControlGroup;
    dxTileControl1Group3: TdxTileControlGroup;
    dxTileControl1Group4: TdxTileControlGroup;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Item2: TdxTileControlItem;
    dxTileControl1Item3: TdxTileControlItem;
    dxTileControl1Item4: TdxTileControlItem;
    dxTileControl1Item5: TdxTileControlItem;
    dxTileControl1Item6: TdxTileControlItem;
    dxTileControl1Item7: TdxTileControlItem;
    dxTileControl1Item8: TdxTileControlItem;
    dxTileControl1Item9: TdxTileControlItem;
    dxTileControl1Item10: TdxTileControlItem;
    dxTileControl1Item11: TdxTileControlItem;
    dxTileControl1Item12: TdxTileControlItem;
    dxTileControl1Item13: TdxTileControlItem;
    dxTileControl1Item14: TdxTileControlItem;
    dxTileControl1Item15: TdxTileControlItem;
    dxTileControl1Item16: TdxTileControlItem;
    dxTileControl1Item17: TdxTileControlItem;
    TC_Top: TdxTileControl;
    dxTileControlGroup1: TdxTileControlGroup;
    dxTileControlGroup2: TdxTileControlGroup;
    dxTileControlGroup3: TdxTileControlGroup;
    TC_Radio: TdxTileControl;
    dxTileControl2Item1: TdxTileControlItem;
    dxTileControl2Group1: TdxTileControlGroup;
    TC_RadioGroup1: TdxTileControlGroup;
    TC_RadioGroup2: TdxTileControlGroup;
    TC_RadioGroup3: TdxTileControlGroup;
    TC_RadioGroup4: TdxTileControlGroup;
    TC_RadioGroup5: TdxTileControlGroup;
    TC_RadioGroup6: TdxTileControlGroup;
    TC_RadioGroup7: TdxTileControlGroup;
    TC_RadioGroup8: TdxTileControlGroup;
    TC_TopItem1: TdxTileControlItem;
    TC_TopItem2: TdxTileControlItem;
    AF_Main: TseAnimationForm;
    TC_TopItem3: TdxTileControlItem;
    TC_TopItem4: TdxTileControlItem;
    TC_TopItem5: TdxTileControlItem;
    TC_TopItem6: TdxTileControlItem;
    TC_TopItem7: TdxTileControlItem;
    TC_TopItem8: TdxTileControlItem;
    TC_TopItem9: TdxTileControlItem;
    TC_TopItem10: TdxTileControlItem;
    TC_TopItem11: TdxTileControlItem;
    TC_TopItem12: TdxTileControlItem;
    TC_TopItem13: TdxTileControlItem;
    TC_TopItem14: TdxTileControlItem;
    TC_TopItem15: TdxTileControlItem;
    TC_TopItem16: TdxTileControlItem;
    TC_TopItem17: TdxTileControlItem;
    TC_TopItem18: TdxTileControlItem;
    TC_TopItem19: TdxTileControlItem;
    TC_TopItem20: TdxTileControlItem;
    TC_TopItem21: TdxTileControlItem;
    TC_TopItem22: TdxTileControlItem;
    TC_TopItem23: TdxTileControlItem;
    TC_TopItem24: TdxTileControlItem;
    TC_TopItem25: TdxTileControlItem;
    TC_TopItem26: TdxTileControlItem;
    TC_TopItem27: TdxTileControlItem;
    TC_TopItem28: TdxTileControlItem;
    TC_TopItem29: TdxTileControlItem;
    TC_TopItem30: TdxTileControlItem;
    TC_TopItem31: TdxTileControlItem;
    TC_TopItem32: TdxTileControlItem;
    TC_TopItem33: TdxTileControlItem;
    TC_TopItem34: TdxTileControlItem;
    TC_TopItem35: TdxTileControlItem;
    TC_TopItem36: TdxTileControlItem;
    TC_TopItem37: TdxTileControlItem;
    TC_TopItem38: TdxTileControlItem;
    TC_TopItem39: TdxTileControlItem;
    TC_TopItem40: TdxTileControlItem;
    TC_TopItem41: TdxTileControlItem;
    TC_TopItem42: TdxTileControlItem;
    TC_TopItem43: TdxTileControlItem;
    TC_TopItem44: TdxTileControlItem;
    TC_TopItem45: TdxTileControlItem;
    TC_TopItem46: TdxTileControlItem;
    TC_TopItem47: TdxTileControlItem;
    TC_TopItem48: TdxTileControlItem;
    TC_TopItem49: TdxTileControlItem;
    TC_TopItem50: TdxTileControlItem;
    TC_TopItem51: TdxTileControlItem;
    TC_TopItem52: TdxTileControlItem;
    TC_TopItem53: TdxTileControlItem;
    TC_TopItem54: TdxTileControlItem;
    TC_TopItem55: TdxTileControlItem;
    TC_TopItem56: TdxTileControlItem;
    TC_TopItem57: TdxTileControlItem;
    TC_TopItem58: TdxTileControlItem;
    TC_TopItem59: TdxTileControlItem;
    TC_TopItem60: TdxTileControlItem;
    TC_TopItem61: TdxTileControlItem;
    TC_TopItem62: TdxTileControlItem;
    TC_TopItem63: TdxTileControlItem;
    TC_TopItem64: TdxTileControlItem;
    TC_TopItem65: TdxTileControlItem;
    TC_TopItem66: TdxTileControlItem;
    TC_TopItem67: TdxTileControlItem;
    TC_TopItem68: TdxTileControlItem;
    TC_TopItem69: TdxTileControlItem;
    scGPButton1: TscGPButton;
    procedure BTN_CloseClick(Sender: TObject);
    procedure BTN_MinClick(Sender: TObject);
    procedure EDT_SearchRightButtonClick(Sender: TObject);
    procedure EDT_SearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure TMR_PlayTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTN_Play_PauseClick(Sender: TObject);
    procedure TMR_Bottom_WaveTimer(Sender: TObject);
    procedure LB_Music_NameMouseEnter(Sender: TObject);
    procedure BTN_VoiceClick(Sender: TObject);
    procedure BTN_One_LoopClick(Sender: TObject);
    procedure BTN_List_LoopClick(Sender: TObject);
    procedure BTN_Random_LoopClick(Sender: TObject);
    procedure BTN_NextClick(Sender: TObject);
    procedure BTN_LastClick(Sender: TObject);
    procedure BTN_PlayListClick(Sender: TObject);
    procedure BTN_SmallClick(Sender: TObject);
    procedure M_TrayClick(Sender: TObject);
    procedure M_NormalClick(Sender: TObject);
    procedure M_MinSizeClick(Sender: TObject);
    procedure M_MiniClick(Sender: TObject);
    procedure N_NormalClick(Sender: TObject);
    procedure N_HSClick(Sender: TObject);
    procedure N_MVClick(Sender: TObject);
    procedure Trc_PlayMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PN_Bottom_WaveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Trc_VoiceChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTN_LikeClick(Sender: TObject);
    procedure AP_MainCanChangePage(APage: TscAppPagerPage; var ACanChange: Boolean);
    procedure AP_MainChangingPage(Sender: TObject);
    procedure AP_MainChangePage(Sender: TObject);
    procedure BTN_Open_Close_HomeClick(Sender: TObject);
    procedure TBV_Songs1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure TBV_Pub1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure N_WXClick(Sender: TObject);
    procedure TBV_1631GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure TBV_KuWo1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure TBV_KuGou1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure TBV_KuGouCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure TBV_KuWoCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure TBV_163CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure TBV_SongsCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure N_PlayListClick(Sender: TObject);
    procedure N_PlayClick(Sender: TObject);
    procedure LOV_SearchCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure BTN_VoiceMouseEnter(Sender: TObject);
    procedure BTN_VoiceMouseLeave(Sender: TObject);
    procedure BTN_LoopMouseEnter(Sender: TObject);
    procedure BTN_LoopMouseLeave(Sender: TObject);
    procedure BTN_AboutClick(Sender: TObject);
    procedure N_LinkClick(Sender: TObject);
    procedure dxTileControl1Item2Click(Sender: TdxTileControlItem);
  private
//    procedure Down_Progress(var Msg: TMessage); message WM_DownProgres; // 下载进度
    { Private declarations }
  public
    function Get_Img(Url: string; X, Y: Integer): TBitmap; // 加载网络图片
    function Get_Music_HS(Url: string): HSTREAM; // 获取音频流
    function Get_New_Url(M_From: Integer; Music_ID: string): string; // 重新获取一次歌曲链接
    procedure DownLoad(Url, SongName, FileStyle: string); // 下载音乐
    procedure Play_Music; // 播放音乐
    procedure Last_Music; // 上一首
    procedure Loop_List; // 列表循环
    procedure Loop_Random; // 随即循环
    procedure ItemClick(Sender: TdxTileControlItem); //推荐歌单、专辑单击事件
    procedure ItemXClick(Sender: TdxTileControlItem); //推荐种类的单击事件
    procedure Search_Over(Sender: TObject); //搜索结束执行
    procedure VMsgListSong(Sender: TObject; AMsg: TVMsg); //注册【歌单】推荐列表消息
    procedure VMsgRcomList(Sender: TObject; AMsg: TVMsg); //注册【歌单】推荐内容消息
    procedure VMsgRcomAlbum(Sender: TObject; AMsg: TVMsg); //注册【专辑】推荐内容消息
    procedure VMsgAlbumSong(Sender: TObject; AMsg: TVMsg); //注册【专辑】详细列表消息
    procedure VMsgRecomSong(Sender: TObject; AMsg: TVMsg); //注册【专辑】详细列表消息
    procedure VMsgSearchSong_QQ(Sender: TObject; AMsg: TVMsg); //注册【QQ】歌曲搜索消息
    procedure VMsgSearchSong_WY(Sender: TObject; AMsg: TVMsg); //注册【网易】歌曲搜索消息
    procedure VMsgSearchSong_KuWo(Sender: TObject; AMsg: TVMsg); //注册【酷我】歌曲搜索消息
    procedure VMsgSearchSong_KuGou(Sender: TObject; AMsg: TVMsg); //注册【酷狗】歌曲搜索消息
    procedure VMsgRecom_MV(Sender: TObject; AMsg: TVMsg); //注册【MV】推荐列表消息
    procedure DB_Click_Play; //双击播放
    function ToQRCode(Url: string): TBitmap; //生成QQ，网易，酷我分享二维码
    function GetQRCode(FileName, Hash, AlbumID: string): string; //获取酷狗分享二维码
    { Public declarations }
  end;

var
  Fm_Main: TFm_Main;
  Bo_Play: Boolean; // 播放、声音、置顶、滚动条件状态
  Search_Count: Integer; // 搜索数量
  png_bottom: tpngimage; // Png图片
  ico_Play, ico_Pause: TIcon; //任务栏按钮图标
  HS: HSTREAM; // Bass数据流
  MeM: TMemoryStream; // 存储http获取的文件流
  Timex: Double; // 乐曲总时间
  VoiceX: Word; // 记录音量
  Loop_Type: Word = 0; // 记录歌曲循环类型 0：列表循环（默认）；1：单曲循环；2：随机循环
  Search_Type: Word = 0; //记录搜索的类型为qq还是网易等
  FFTData: array[0..512] of Single;
  FFTPeacks: array[0..128] of Integer;
  FFTFallOff: array[0..128] of Integer;
  IO: IO_List; // 实例化JSON配置读写操作的自定义类
  F_Top_Search, F_Top_Recom: TFrame; //存储显示数据页面的头部内容，搜索来则显示按钮，列表详细则显示歌单或专辑内容

const
  UserAgent = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3408.400 QQBrowser/9.6.12028.400';
  DouBanInfo = 'https://douban.fm/j/v2/query/all?start=0&limit='; // +歌名

implementation

uses
  Web.HTTPApp, Winapi.GDIPOBJ, Winapi.GDIPAPI, superobject, Mini, List, Taskbar,
  SetAndAbout, Msg, InfoFromID, Music_QQ_Spider, Music_163_Spider,
  Music_KuGou_Spider, Music_KuWo_Spider, Loading, Start, Top_Search, Top_Recom,
  Play_MV, uZintInterface, uZintBarcode, QRCode, Clipbrd;
{$R *.dfm}

procedure TFm_Main.DB_Click_Play;
// 思路
// 1、先把音乐各个信息，显示到底部和小窗口中
// 2、查询该音乐是否存在于列表，如果存在，那么定位到歌曲，如果不存在，那么添加到列表并定位到歌曲
// 3、和2一样，把歌曲id添加到list作为唯一查找标识
// 4、异常处理，如果播放失败，则提示歌曲链接失效
var
  Music: array[0..9] of string; // 存储歌曲信息，用来添加到文件
  bo: Boolean;
  idx: Integer; // 定位
  i: Integer;
  Url: string;
  MEM: TdxMemData;
  id_idx: Integer; //根据对应的歌曲id解析下载地址
begin
  bo := True;
  idx := 0;
  id_idx := 0;
  MEM := TdxMemData.Create(self);
  if DS_Songs.DataSet = MEM_QQ then
  begin
    MEM := MEM_QQ;
    id_idx := 1;
  end
  else if DS_Songs.DataSet = MEM_163 then
  begin
    MEM := MEM_163;
    id_idx := 2;
  end
  else if DS_Songs.DataSet = MEM_KuWo then
  begin
    MEM := MEM_KuWo;
    id_idx := 3;
  end
  else if DS_Songs.DataSet = MEM_KuGou then
  begin
    MEM := MEM_KuGou;
    id_idx := 4;
  end
  else if DS_Songs.DataSet = MEM_Pub then
  begin
    MEM := MEM_Pub;
    id_idx := 1;
    //暂时为1，当推荐列表增加其他平台时，这里要做判断/////////////////////////////////////////////
  end;

  if MEM.RecordCount > 0 then
  begin
    try
      for i := 0 to Fm_List.NG_List.RowCount - 1 do
      begin//清空播放列表的播放标识为白色，后面播放再显示红色
        Fm_List.NG_List.Cell[0, i].Color := clWhite;
      end;
      Url := Get_New_Url(id_idx, MEM.FieldByName('Song_ID').AsString); //获取歌曲地址
      HS := Get_Music_HS(Url);
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Get_Img(MEM.FieldByName('Song_Img').AsString, 50, 50)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := MEM.FieldByName('Song_Name').AsString; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := MEM.FieldByName('Song_Singer').AsString; // Mini窗口显示歌手
      LB_All_Time.Caption := MEM.FieldByName('Song_Time').AsString; // 显示时长
      Fm_Main.Music_Info_Img.Picture.Assign(Get_Img(MEM.FieldByName('Song_Img').AsString, 40, 40)); // 下方显示图片
      LB_Music_Name.Caption := MEM.FieldByName('Song_Name').AsString + ' - ' + MEM.FieldByName('Song_Singer').AsString; // 显示歌名
      Application.Title := MEM.FieldByName('Song_Name').AsString + ' - ' + MEM.FieldByName('Song_Singer').AsString; // 任务栏显示歌名
      Play_Music; // 播放
      MEM_PlayList.Open;
      MEM_PlayList.First;
      while not MEM_PlayList.Eof do
      begin
        if MEM_PlayList.FieldByName('S_MusicId').AsString = MEM.FieldByName('Song_ID').AsString then
        begin
          bo := false; // 判断歌曲是否存在于列表
          idx := MEM_PlayList.FieldByName('S_ID').AsInteger;
        end;
        MEM_PlayList.Next;
      end;
      if bo then // 如果不存在
      begin
        with MEM_PlayList do // 把歌曲添加到播放列表
        begin
          Open;
          Append;
          FieldByName('S_ID').AsString := IntToStr(MEM_PlayList.RecordCount); // 序号
          FieldByName('S_Name').AsString := MEM.FieldByName('Song_Name').AsString; // 歌名
          FieldByName('S_Album').AsString := MEM.FieldByName('Song_Album').AsString; // 专辑
          FieldByName('S_Singer').AsString := MEM.FieldByName('Song_Singer').AsString; // 歌手
          FieldByName('S_Time').AsString := MEM.FieldByName('Song_Time').AsString; // 时长
          FieldByName('S_From').AsString := MEM.FieldByName('Song_From').AsString; // 来源
          FieldByName('S_Url').AsString := Url; // 下载地址
          FieldByName('S_Img').AsString := MEM.FieldByName('Song_Img').AsString; // 图片地址
          FieldByName('S_Lyric').AsString := MEM.FieldByName('Song_Lrc').AsString; // 歌词地址或歌词
          FieldByName('S_MusicId').AsString := MEM.FieldByName('Song_ID').AsString; // 歌曲ID
          Post;
        end;
        with Fm_List.NG_List.AddRow.Cells do
        begin
          Item[Fm_List.Col_No.Index].AsString := IntToStr(MEM_PlayList.RecordCount); // 序号
          Item[Fm_List.Col_Name.Index].AsString := MEM.FieldByName('Song_Name').AsString; // 歌名
          Item[Fm_List.Col_Album.Index].AsString := MEM.FieldByName('Song_Album').AsString; // 专辑
          Item[Fm_List.Col_Singer.Index].AsString := MEM.FieldByName('Song_Singer').AsString; // 歌手
          Item[Fm_List.Col_Time.Index].AsString := MEM.FieldByName('Song_Time').AsString; // 时长
          Item[Fm_List.Col_From.Index].AsString := MEM.FieldByName('Song_From').AsString; // 来源
          Item[Fm_List.Col_Img.Index].AsString := MEM.FieldByName('Song_Img').AsString; // 图片地址
          Item[Fm_List.Col_Url.Index].AsString := Url; // 下载地址
          Item[Fm_List.Col_Lrc.Index].AsString := MEM.FieldByName('Song_Lrc').AsString; // 歌词地址或歌词
          Item[Fm_List.Col_ID.Index].AsString := MEM.FieldByName('Song_ID').AsString; // 歌曲ID
        end;
        Fm_List.NG_List.Cell[0, Fm_List.NG_List.RowCount - 1].Color := clred;
        BTN_PlayList.Caption := IntToStr(Fm_List.NG_List.RowCount);
        Fm_List.SB_List.Max := Fm_List.NG_List.RowCount; // 以下添加到JSON列表
        Music[0] := MEM.FieldByName('Song_From').AsString; // 来源
        Music[1] := MEM.FieldByName('Song_Name').AsString; // 歌名
        Music[2] := MEM.FieldByName('Song_Album').AsString; // 专辑
        Music[3] := MEM.FieldByName('Song_Singer').AsString; // 歌手
        Music[4] := MEM.FieldByName('Song_Time').AsString; // 时长
        Music[5] := MEM.FieldByName('Song_Img').AsString; // 图片地址
        Music[6] := MEM.FieldByName('Song_ID').AsString; // 歌曲ID
        Music[7] := MEM.FieldByName('Song_SingerId').AsString;  // 歌手ID
        Music[8] := MEM.FieldByName('Song_AlbumId').AsString;  // 专辑ID
        Music[9] := MEM.FieldByName('Song_MVID').AsString;  // MV ID
        IO.AddSongs('playlist', Music); // 添加歌曲到列表文件
      end
      else // 如果存在，那么定位到这首歌曲
      begin
        // MEM_PlayList.MoveBy(idx); //虚定位
        MEM_PlayList.Locate('S_ID', idx, []); // 真定位
        Fm_List.NG_List.Cell[0, MEM_PlayList.RecNo - 1].Color := clred; // 标记为红色正在播放
      end;
      Trc_Play.Visible := false;
    except
      // ASMB.Messages[0].Show;
    end;
  end;
end;

procedure TFm_Main.DownLoad(Url, SongName, FileStyle: string);
var // 下载
  dir: string;
  DownLoadFile: TFileStream;
begin
  dir := ExtractFilePath(Application.Exename);
  DownLoadFile := TFileStream.Create(dir + 'DownLoad/' + SongName + '.' + FileStyle, fmCreate);
  HTTP_Down.Get(Url, DownLoadFile);
  DownLoadFile.Free;
end;

procedure TFm_Main.dxTileControl1Item2Click(Sender: TdxTileControlItem);
begin
  ItemXClick(Sender);
end;

procedure TFm_Main.Play_Music;
begin // 右键菜单和双击播放
  try
    Timex := BASS_ChannelBytes2Seconds(HS, BASS_ChannelGetLength(HS, BASS_POS_BYTE)); // 总秒数
    Trc_Play.Max := Trunc(Timex * 1000);
    TMR_Play.Enabled := True;
    BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
    BASS_ChannelPlay(HS, false);
    BTN_Play_Pause.ImageIndex := 1; // 播放图标为暂停
    Fm_MiniBox.BTN_Play_Pause.ImageIndex := 1; // 迷你窗口播放图标为暂停
    TB_Main.TaskBarButtons[1].Icon := ico_Pause; //任务栏缩略图按钮显示为暂停
    N_Play_Pause.ImageIndex := 5; // 任务栏播放图标为暂停
    N_Play_Pause.Caption := '暂停';
    Bo_Play := false;
    LB_Play_Time.Caption := '00:00';
    TMR_Bottom_Wave.Enabled := True;
  except
    ASMB.Messages[0].Show; // 提示播放失败
    Trc_Play.Max := 0;
    Trc_Play.Position := 0;
    TMR_Play.Enabled := false;
    BTN_Play_Pause.ImageIndex := 0; // 播放图标为播放
    Fm_MiniBox.BTN_Play_Pause.ImageIndex := 0; // 迷你窗口播放图标为播放
    TB_Main.TaskBarButtons[1].Icon := ico_Play; //任务栏缩略图按钮显示为播放
    N_Play_Pause.ImageIndex := 4; // 任务栏播放图标为播放
    N_Play_Pause.Caption := '播放';
    LB_Play_Time.Caption := '00:00';
    LB_All_Time.Caption := '00:00';
    LB_Music_Name.Caption := '';
    Bo_Play := True;
  end;
end;

procedure TFm_Main.PN_Bottom_WaveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if TMR_Play.Enabled then
  begin
    if (Y >= 14) and (Y <= 28) then
    begin
      if Trc_Play.Visible = false then
      begin
        Trc_Play.Visible := True;
      end;
    end
    else
    begin
      Trc_Play.Visible := false;
    end;
  end
  else
  begin
    Trc_Play.Visible := True;
  end;
end;

procedure TFm_Main.Search_Over(Sender: TObject);
begin
  try
    if Sender.ClassName = 'Get_QQ_Info' then
    begin//搜索结束执行
      MEM_QQ.First;
    end
    else if Sender.ClassName = 'Get_163_Info' then
    begin
      MEM_163.First;
    end
    else if Sender.ClassName = 'Get_KuWo_Info' then
    begin
      MEM_KuWo.First;
    end
    else if Sender.ClassName = 'Get_KuGou_Info' then
    begin
      MEM_KuGou.First;
    end
    else if Sender.classname = 'Get_New_Song' then
    begin
      MEM_Pub.First;
      MEM_Pub.Active := true;
    end
    else if Sender.ClassName = 'Get_Album_From_AlbumID' then
    begin
      MEM_Pub.First;
      MEM_Pub.Active := true;
    end
    else if Sender.ClassName = 'Get_Song_From_ListID' then
    begin
      MEM_Pub.First;
      MEM_Pub.Active := true;
    end
    else if Sender.ClassName = 'Get_Recom_MV' then
    begin
      MEM_MV.First;
      MEM_MV.Active := true;
    end
    else if Sender.ClassName = 'LD_List' then
    begin
      Fm_Start.Hide;
      Fm_Start.Free;
      Fm_Main.Show;
      Tray_Main.Visible := True;
    end;
  finally
    Fm_Loading.Close;
  end;
end;

procedure TFm_Main.Loop_Random;
var // 随机循环，以随机下一首播放
  i: Integer;
begin
  if MEM_PlayList.RecordCount > 0 then
  begin
    Randomize; // 初始化随机数
    i := Random(Fm_List.NG_List.RowCount); // 取随机值
    MEM_PlayList.Locate('S_MusicId', Fm_List.NG_List.Cells[Fm_List.Col_ID.Index, i], []); // 取随机位置的值
    try
      HS := Get_Music_HS(MEM_PlayList.FieldByName('S_Url').AsString);
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 100, 100)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := MEM_PlayList.FieldByName('S_Singer').AsString; // Mini窗口显示歌手
      LB_All_Time.Caption := MEM_PlayList.FieldByName('S_Time').AsString;
      Fm_Main.Music_Info_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 40, 40)); // 下方显示图片
      LB_Music_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 显示歌名
      Application.Title := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 任务栏显示歌名
      Play_Music;
    except
      // 如果链接失效，那么根据该歌曲ID重新搜索该歌曲，如果播放再次失败，那么跳到上一首
      HS := Get_Music_HS(Get_New_Url(MEM_PlayList.FieldByName('S_From').AsInteger, MEM_PlayList.FieldByName('S_MusicId').AsString));
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 100, 100)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := MEM_PlayList.FieldByName('S_Singer').AsString; // Mini窗口显示歌手
      LB_All_Time.Caption := MEM_PlayList.FieldByName('S_Time').AsString;
      Fm_Main.Music_Info_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 40, 40)); // 下方显示图片
      LB_Music_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 显示歌名
      Application.Title := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 任务栏显示歌名
      Play_Music;
    end;
  end;
end;

procedure TFm_Main.LOV_SearchCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  GT: GetMvUrlFromId;
  x: string;
begin
  case ACellViewInfo.Item.ID of
    10:
      begin
        GT.GetMvUrlFromId_QQ(MEM_MV.FieldByName('Song_MVID').AsString);
        Fm_MV.LB_Caption.Caption := MEM_MV.FieldByName('Song_Name').AsString + ' - ' + MEM_MV.FieldByName('Song_Singer').AsString;
        Fm_MV.Position := poMainFormCenter;
        Fm_MV.Show;
        Fm_MV.PLVP_MV.Play(MEM_MV_Urls.FieldByName('Url3').AsString);
        Fm_MV.Trc_MV_Video.OnChange := NIL;
      end;
    1:
      begin
        ShowMessage('单击了作者名');
      end;
    2:
      begin
        ShowMessage('单击了歌曲名');
      end;
  end;
end;

procedure TFm_Main.M_MiniClick(Sender: TObject);
begin
  N_Show_Form.ImageIndex := 1;
  N_Show_Form.Caption := 'Mini';
  Fm_Main.Hide;
  TMR_Bottom_Wave.Enabled := false;
  Fm_MiniBox.Show;
  SetWindowPos(Fm_MiniBox.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TFm_Main.M_MinSizeClick(Sender: TObject);
begin
  if Fm_Main.Visible = True then
  begin
    Application.Minimize;
    N_Show_Form.ImageIndex := 2;
    N_Show_Form.Caption := '最小化';
  end;
end;

procedure TFm_Main.M_NormalClick(Sender: TObject);
begin
  Fm_Main.TMR_Bottom_Wave.Enabled := True;
  Self.WindowState := wsNormal;
  N_Show_Form.ImageIndex := 0;
  N_Show_Form.Caption := '常规';
  Fm_Main.Show;
  Fm_MiniBox.Hide;
end;

procedure TFm_Main.M_TrayClick(Sender: TObject);
begin
  N_Show_Form.ImageIndex := 3;
  N_Show_Form.Caption := '托盘';
  Fm_Main.Hide;
  Fm_MiniBox.Hide;
end;

procedure TFm_Main.Loop_List;
var
  i: Integer;
begin // 列表循环，以列表下一首播放
  if MEM_PlayList.RecordCount > 0 then
  begin
    for i := 0 to Fm_List.NG_List.RowCount - 1 do
    begin
      Fm_List.NG_List.Cell[0, i].Color := clWhite;
    end;
    if MEM_PlayList.RecNo = MEM_PlayList.RecordCount then
    begin
      MEM_PlayList.First;
    end
    else
    begin
      MEM_PlayList.Next;
    end;
    try
      HS := Get_Music_HS(MEM_PlayList.FieldByName('S_Url').AsString); // 跳到下一首
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 50, 50)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := MEM_PlayList.FieldByName('S_Singer').AsString; // Mini窗口显示歌手
      LB_All_Time.Caption := MEM_PlayList.FieldByName('S_Time').AsString;
      Fm_Main.Music_Info_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 40, 40)); // 下方显示图片
      LB_Music_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 显示歌名
      Application.Title := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 任务栏显示歌名
      Play_Music;
      Fm_List.NG_List.Cell[0, MEM_PlayList.RecNo - 1].Color := clred; // 标记为红色正在播放
    except
      // 如果链接失效，那么根据该歌曲ID重新搜索该歌曲，如果播放再次失败，那么跳到下一首
      HS := Get_Music_HS(Get_New_Url(MEM_PlayList.FieldByName('S_From').AsInteger, MEM_PlayList.FieldByName('S_MusicId').AsString));
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 50, 50)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := MEM_PlayList.FieldByName('S_Singer').AsString; // Mini窗口显示歌手
      LB_All_Time.Caption := MEM_PlayList.FieldByName('S_Time').AsString;
      Fm_Main.Music_Info_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 40, 40)); // 下方显示图片
      LB_Music_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 显示歌名
      Application.Title := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 任务栏显示歌名
      Play_Music;
      Fm_List.NG_List.Cell[0, MEM_PlayList.RecNo - 1].Color := clred; // 标记为红色正在播放
    end;
  end;
end;

procedure TFm_Main.Last_Music;
var
  i: Integer;
begin // 列表循环，以列表上一首播放
  if MEM_PlayList.RecordCount > 0 then
  begin
    for i := 0 to Fm_List.NG_List.RowCount - 1 do
    begin
      Fm_List.NG_List.Cell[0, i].Color := clWhite;
    end;
    if MEM_PlayList.RecNo = 1 then
    begin
      MEM_PlayList.Last; // 跳到最后一首
    end
    else
    begin
      MEM_PlayList.Prior; // 跳到上一首
    end;
    try
      HS := Get_Music_HS(MEM_PlayList.FieldByName('S_Url').AsString);
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 50, 50)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := MEM_PlayList.FieldByName('S_Singer').AsString; // Mini窗口显示歌手
      LB_All_Time.Caption := MEM_PlayList.FieldByName('S_Time').AsString;
      Fm_Main.Music_Info_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 40, 40)); // 下方显示图片
      LB_Music_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 显示歌名
      Application.Title := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 任务栏显示歌名
      Play_Music;
      Fm_List.NG_List.Cell[0, MEM_PlayList.RecNo - 1].Color := clred; // 标记为红色正在播放
    except
      // 如果链接失效，那么根据该歌曲ID重新搜索该歌曲，如果播放再次失败，那么跳到上一首
      HS := Get_Music_HS(Get_New_Url(MEM_PlayList.FieldByName('S_From').AsInteger, MEM_PlayList.FieldByName('S_MusicId').AsString));
      Fm_MiniBox.Music_Logo_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 50, 50)); // 显示图片
      Fm_MiniBox.Lb_Song_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString; // Mini窗口显示歌名
      Fm_MiniBox.Lb_Song_Singer.Caption := MEM_PlayList.FieldByName('S_Singer').AsString; // Mini窗口显示歌手
      LB_All_Time.Caption := MEM_PlayList.FieldByName('S_Time').AsString;
      Fm_Main.Music_Info_Img.Picture.Assign(Get_Img(MEM_PlayList.FieldByName('S_Img').AsString, 40, 40)); // 下方显示图片
      LB_Music_Name.Caption := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 显示歌名
      Application.Title := MEM_PlayList.FieldByName('S_Name').AsString + ' - ' + MEM_PlayList.FieldByName('S_Singer').AsString; // 任务栏显示歌名
      Play_Music;
      Fm_List.NG_List.Cell[0, MEM_PlayList.RecNo - 1].Color := clred; // 标记为红色正在播放
    end;
  end;
end;

function TFm_Main.Get_Music_HS(Url: string): HSTREAM;
var // 获取Bass播放流
  HTTPX: TIdHTTP;
  SSLX: TIdSSLIOHandlerSocketOpenSSL;
begin
  HTTPX := TIdHTTP.Create(nil);
  SSLX := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  HTTPX.IOHandler := SSLX;
  BASS_ChannelStop(HS);
  MEM.Clear;
  HTTPX.Get(Url, MEM);
  MEM.Position := 0;
  BASS_StreamFree(HS);
  HS := BASS_StreamCreateFile(True, MEM.Memory, 0, MEM.Size, 0);
  result := HS;
  HTTPX.Free;
  SSLX.Free;
end;

function TFm_Main.Get_New_Url(M_From: Integer; Music_ID: string): string;
var // 重新获取歌曲链接
  GT: GetFromId;
begin
  GT := GetFromId.Create;
  GT.ID := Music_ID;
  case M_From of // 于歌曲来源判断ID归属并搜索
    1: // QQ音乐
      begin
        result := GT.GetFromId_QQ;
      end;
    2: // 网易音乐
      begin
        result := GT.GetFromId_WangYi;
      end;
    3: // 酷我音乐
      begin
        result := GT.GetFromId_Kuwo;
      end;
    4: // 酷狗音乐
      begin
        result := GT.GetFromId_KuGou;
      end;
  end;
  GT.FREE;
end;

procedure TFm_Main.ItemClick(Sender: TdxTileControlItem);
var(*单击分类项目显示明细*)
  Get_List_Song: Get_Song_From_ListID;
  Get_Album_Song: Get_Album_From_AlbumID;
begin
  F_Top_Search.Visible := False;
  F_Top_Recom.Visible := true;
  DS_Songs.DataSet := MEM_Pub;
  MEM_Pub.Close;
  case Fm_Main.TC_Home.Items[Sender.Index].Tag of
    1:
      begin
      //根据【歌单】id搜索推荐歌单歌曲
        Get_List_Song := Get_Song_From_ListID.create(Fm_Main.TC_Home.Items[Sender.Index].DetailOptions.Caption);
      end;
    2:
      begin
     //根据【专辑】id搜索推荐歌单歌曲
        Get_Album_Song := Get_Album_From_AlbumID.Create(Fm_Main.TC_Home.Items[Sender.Index].DetailOptions.Caption);
      end;
  end;
  SF_Main.ShowClientInActiveEffect;
  Fm_Loading.Position := poMainFormCenter;
  Fm_Loading.ShowModal;
  SF_Main.HideClientInActiveEffect;
  CL_Search.GridView := TBV_Songs;
  AP_Main.ItemIndex := 0;
  TFr_Top_Recom(F_Top_Recom).IMG_Start.Picture.Bitmap.Assign(Fm_Main.TC_Home.Items[Sender.Index].Glyph.Image);
  TFr_Top_Recom(F_Top_Recom).LB_Start_Title.Caption := MEM_Pub.FieldByName('List_Title').AsString;
  TFr_Top_Recom(F_Top_Recom).LB_Start_Info.Caption := MEM_Pub.FieldByName('List_Des').AsString;
  TFr_Top_Recom(F_Top_Recom).LB_Start_Info.Hint := MEM_Pub.FieldByName('List_Des').AsString;
end;

procedure TFm_Main.ItemXClick(Sender: TdxTileControlItem);
var
  Get_New_List: Get_List_Songs;
  Get_New_Album: Get_New_Albubm;
  Get_New_MV: Get_Recom_MV;
  Get_New_Songs: Get_New_Song;
begin
  try
    case Sender.GroupIndex of
      0:
        begin
          BTN_Open_Close_Home.GlyphOptions.Kind := scgpbgkDownArrow;
          SV_Recome.Opened := false;
          TC_Home.Items.Clear;
          if Sender.DetailOptions.Caption <> '' then
          begin
            Get_New_List := Get_List_Songs.Create(Sender.DetailOptions.Caption, '20', 1);
          end
          else
          begin
            Get_New_List := Get_List_Songs.Create(Sender.DetailOptions.Caption, '20', 0);
          end;
          SF_Main.ShowClientInActiveEffect;
          Fm_Loading.Position := poMainFormCenter;
          Fm_Loading.ShowModal;
          SF_Main.HideClientInActiveEffect;
        end;
      1:
        begin (*获取推荐专辑，显示到界面*)
          BTN_Open_Close_Home.GlyphOptions.Kind := scgpbgkDownArrow;
          SV_Recome.Opened := false;
          TC_Home.Items.Clear;
          Get_New_Album := Get_New_Albubm.Create(StrToInt(Sender.DetailOptions.Caption), 20);
          SF_Main.ShowClientInActiveEffect;
          Fm_Loading.Position := poMainFormCenter;
          Fm_Loading.ShowModal;
          SF_Main.HideClientInActiveEffect;
        end;
      2:
        begin
          BTN_Open_Close_Home.GlyphOptions.Kind := scgpbgkDownArrow;
          SV_Recome.Opened := false;
          F_Top_Search.Visible := False;
          F_Top_Recom.Visible := False;
          DS_Songs.DataSet := MEM_Pub;
          MEM_Pub.Close;
          MEM_Pub.Open;
          Get_New_Songs := Get_New_Song.Create(StrToInt(Sender.DetailOptions.Caption));
          CL_Search.GridView := TBV_Songs;
          SF_Main.ShowClientInActiveEffect;
          Fm_Loading.Position := poMainFormCenter;
          Fm_Loading.ShowModal;
          SF_Main.HideClientInActiveEffect;
          AP_Main.ItemIndex := 0;
        end;
      3: (*获取推荐MV，显示到界面*)
        begin
          BTN_Open_Close_Home.GlyphOptions.Kind := scgpbgkDownArrow;
          SV_Recome.Opened := false;
          F_Top_Search.Visible := False;
          F_Top_Recom.Visible := False;
          MEM_MV.Active := false;
          MEM_MV.Close;
          MEM_MV.Open;
          Get_New_MV := Get_Recom_MV.Create(Sender.DetailOptions.Caption);
          CL_Search.GridView := LOV_Search;
          SF_Main.ShowClientInActiveEffect;
          Fm_Loading.Position := poMainFormCenter;
          Fm_Loading.ShowModal;
          SF_Main.HideClientInActiveEffect;
          AP_Main.ItemIndex := 0;
        end;
    end;
  finally

  end;
end;

procedure TFm_Main.LB_Music_NameMouseEnter(Sender: TObject);
begin
  LB_Music_Name.Hint := LB_Music_Name.Caption;
end;

//搜索栏选择
procedure TFm_Main.N_HSClick(Sender: TObject);
begin
  EDT_Search.LeftButton.ImageIndex := 11;
end;

procedure TFm_Main.N_LinkClick(Sender: TObject);
var
  Urlx: string;
//复制链接
begin
  if DS_Songs.DataSet = MEM_QQ then
  begin//qq链接
    Urlx := 'https://y.qq.com/n/yqq/song/' + MEM_QQ.FieldByName('Song_ID').AsString + '.html';
  end
  else if DS_Songs.DataSet = MEM_163 then
  begin//网易链接
    Urlx := 'https://music.163.com/song?id=' + MEM_163.FieldByName('Song_ID').AsString;
  end
  else if DS_Songs.DataSet = MEM_KuWo then
  begin//酷我链接
    Urlx := 'http://www.kuwo.cn/yinyue/' + stringreplace(MEM_KuWo.FieldByName('Song_ID').AsString, 'MUSIC_', '', [rfReplaceAll]);
  end
  else if DS_Songs.DataSet = MEM_KuGou then
  begin//酷狗链接
    Urlx := 'https://www.kugou.com/song/#hash=' + MEM_KuGou.FieldByName('Song_ID').AsString;
  end
  else if DS_Songs.DataSet = MEM_Pub then
  begin
      //此处如果添加了酷我等其他网站的推荐歌曲，需要增加判断修改//////////////////////////////////////////
    Urlx := 'https://i.y.qq.com/v8/playsong.html?ADTAG=self_share&songtype=0&songmid=' + MEM_QQ.FieldByName('Song_ID').AsString + '&hostuin=0&from=singlemessage&isappinstalled=0#wechat_redirect';
  end;
  Clipboard.SetTextBuf(PChar(Urlx));
  ASMB.Messages[4].Show;
end;

procedure TFm_Main.N_MVClick(Sender: TObject);
begin
  EDT_Search.LeftButton.ImageIndex := 12;
end;

procedure TFm_Main.N_NormalClick(Sender: TObject);
begin
  EDT_Search.LeftButton.ImageIndex := 10;
end;

procedure TFm_Main.N_PlayClick(Sender: TObject);
begin
  DB_Click_Play; //双击播放
end;

procedure TFm_Main.N_PlayListClick(Sender: TObject);
var
  Music: array[0..9] of string; // 存储歌曲信息，用来添加到文件
  bo: Boolean;
  MEM: TdxMemData;
  Url: string;
  id_idx: Integer; //根据对应的歌曲id解析下载地址
begin
  bo := True;
  id_idx := 0;
  MEM := TdxMemData.Create(self);
  if DS_Songs.DataSet = MEM_QQ then
  begin
    MEM := MEM_QQ;
    id_idx := 1;
  end
  else if DS_Songs.DataSet = MEM_163 then
  begin
    MEM := MEM_163;
    id_idx := 2;
  end
  else if DS_Songs.DataSet = MEM_KuWo then
  begin
    MEM := MEM_KuWo;
    id_idx := 3;
  end
  else if DS_Songs.DataSet = MEM_KuGou then
  begin
    MEM := MEM_KuGou;
    id_idx := 4;
  end;

  bo := True;
  MEM_PlayList.Open;
  MEM_PlayList.First;
  while not MEM_PlayList.Eof do
  begin
    if MEM_PlayList.FieldByName('S_MusicId').AsString = MEM.FieldByName('Song_ID').AsString then
    begin
      bo := false; // 判断歌曲是否存在于列表
    end;
    MEM_PlayList.Next;
  end;
  if bo then // 如果不存在
  begin
    with MEM_PlayList do // 把歌曲添加到播放列表
    begin
      Open;
      Append;
      FieldByName('S_ID').AsString := IntToStr(MEM_PlayList.RecordCount); // 序号
      FieldByName('S_Name').AsString := MEM.FieldByName('Song_Name').AsString; // 歌名
      FieldByName('S_Album').AsString := MEM.FieldByName('Song_Album').AsString; // 专辑
      FieldByName('S_Singer').AsString := MEM.FieldByName('Song_Singer').AsString; // 歌手
      FieldByName('S_Time').AsString := MEM.FieldByName('Song_Time').AsString; // 时长
      FieldByName('S_From').AsString := MEM.FieldByName('Song_From').AsString; // 来源
      FieldByName('S_Url').AsString := Url; // 下载地址
      FieldByName('S_Img').AsString := MEM.FieldByName('Song_Img').AsString; // 图片地址
      FieldByName('S_Lyric').AsString := MEM.FieldByName('Song_Lrc').AsString; // 歌词地址或歌词
      FieldByName('S_MusicId').AsString := MEM.FieldByName('Song_ID').AsString; // 歌曲ID
      Post;
    end;
    with Fm_List.NG_List.AddRow.Cells do
    begin
      Item[Fm_List.Col_No.Index].AsString := IntToStr(MEM_PlayList.RecordCount); // 序号
      Item[Fm_List.Col_Name.Index].AsString := MEM.FieldByName('Song_Name').AsString; // 歌名
      Item[Fm_List.Col_Album.Index].AsString := MEM.FieldByName('Song_Album').AsString; // 专辑
      Item[Fm_List.Col_Singer.Index].AsString := MEM.FieldByName('Song_Singer').AsString; // 歌手
      Item[Fm_List.Col_Time.Index].AsString := MEM.FieldByName('Song_Time').AsString; // 时长
      Item[Fm_List.Col_From.Index].AsString := MEM.FieldByName('Song_From').AsString; // 来源
      Item[Fm_List.Col_Img.Index].AsString := MEM.FieldByName('Song_Img').AsString; // 图片地址
      Item[Fm_List.Col_Url.Index].AsString := Url; // 下载地址
      Item[Fm_List.Col_Lrc.Index].AsString := MEM.FieldByName('Song_Lrc').AsString; // 歌词地址或歌词
      Item[Fm_List.Col_ID.Index].AsString := MEM.FieldByName('Song_ID').AsString; // 歌曲ID
    end;
    BTN_PlayList.Caption := IntToStr(Fm_List.NG_List.RowCount); //重新统计歌曲数量
    Fm_List.SB_List.Max := Fm_List.NG_List.RowCount; // 以下添加到JSON列表
    Music[0] := MEM.FieldByName('Song_From').AsString; // 来源
    Music[1] := MEM.FieldByName('Song_Name').AsString; // 歌名
    Music[2] := MEM.FieldByName('Song_Album').AsString; // 专辑
    Music[3] := MEM.FieldByName('Song_Singer').AsString; // 歌手
    Music[4] := MEM.FieldByName('Song_Time').AsString; // 时长
    Music[5] := MEM.FieldByName('Song_Img').AsString; // 图片地址
    Music[6] := MEM.FieldByName('Song_ID').AsString; // 歌曲ID
    Music[7] := MEM.FieldByName('Song_SingerId').AsString;  // 歌手ID
    Music[8] := MEM.FieldByName('Song_AlbumId').AsString;  // 专辑ID
    Music[9] := MEM.FieldByName('Song_MVID').AsString;  // MV ID
    IO.AddSongs('playlist', Music); // 添加歌曲到列表文件
    ASMB.Messages[3].Show;
  end;
end;

procedure TFm_Main.N_WXClick(Sender: TObject);
var
  Urlx: string;
begin
  if DS_Songs.DataSet <> MEM_KuGou then
  begin
    if DS_Songs.DataSet = MEM_QQ then
    begin
      Urlx := 'https://i.y.qq.com/v8/playsong.html?ADTAG=self_share&songtype=0&songmid=' + MEM_QQ.FieldByName('Song_ID').AsString + '&hostuin=0&from=singlemessage&isappinstalled=0#wechat_redirect';
    end
    else if DS_Songs.DataSet = MEM_163 then
    begin
      Urlx := 'https://music.163.com/m/song?id=' + MEM_163.FieldByName('Song_ID').AsString + '&from=qr';
    end
    else if DS_Songs.DataSet = MEM_KuWo then
    begin
      Urlx := 'http://m.kuwo.cn/?f=h5&mid=MUSIC_' + MEM_KuWo.FieldByName('Song_ID').AsString + '&bdfrom=wx';
    end
    else if DS_Songs.DataSet = MEM_Pub then
    begin
      //此处如果添加了酷我等其他网站的推荐歌曲，需要增加判断修改//////////////////////////////////////////
      Urlx := 'https://i.y.qq.com/v8/playsong.html?ADTAG=self_share&songtype=0&songmid=' + MEM_QQ.FieldByName('Song_ID').AsString + '&hostuin=0&from=singlemessage&isappinstalled=0#wechat_redirect';
    end;
    Fm_ALS.IMG_Share.Picture.Assign(ToQRCode(Urlx));
  end
  else
  begin
    Fm_ALS.IMG_Share.Picture.Assign(Get_Img(GetQRCode(MEM_KuGou.FieldByName('Song_Singer').AsString + '-' + MEM_KuGou.FieldByName('Song_Name').AsString, MEM_KuGou.FieldByName('Song_ID').AsString, MEM_KuGou.FieldByName('Song_AlbumID').AsString), 250, 250));
  end;
//  SF_Main.ShowClientInActiveEffect;
//  Fm_ALS.LB_SAA.Caption := '请打开微信扫一扫分享歌曲！';
  Fm_ALS.PV_ALS.ActivePage := Fm_ALS.PVP_Share;
  Fm_ALS.SF_ALS.DropDown(Fm_Main, Fm_Main.Left + 280, Fm_Main.Top + 130);
//  SF_Main.HideClientInActiveEffect;
end;

procedure TFm_Main.BTN_PlayListClick(Sender: TObject);
begin
  Fm_List.SF_List.DropDown(Fm_Main, Fm_Main.Left + 499, Fm_Main.Top + 59);
end;

function TFm_Main.GetQRCode(FileName, Hash, AlbumID: string): string;
var//获取酷狗分享二维码
  jo: ISuperObject;
  HP: TIdHTTP;
  SSL: TIdIOHandlerSocket;
  strMD5, strJSON: string;
  md5: THashMD5;
begin
  HP := TIdHTTP.Create(nil);
  SSL := TIdIOHandlerSocket(nil);
  HP.IOHandler := SSL;
  HP.Request.UserAgent := UserAgent; // 设置UserAgent
  strMD5 := md5.GetHashString(Hash + 'kgclientshare');
  strJSON := HP.Get('https://tservice.kugou.com/app/?cmid=1&filename=' + FileName + '&hash=' + Hash + '&album_id=' + AlbumID + '&md5=' + strMD5 + '&codes=1&from=webCode');
  jo := SO(strJSON);
  result := jo['codes_url'].AsString;
  FreeAndNil(HP);
  FreeAndNil(SSL);
end;

function TFm_Main.Get_Img(Url: string; X, Y: Integer): TBitmap;
var (* 加载网络图片 *)
  Pic_MS: TMemoryStream;
  MyIStream: TStreamAdapter;
  Bmp: TBitmap;
  BmpX: TGPBitmap;
  Graphic: TGPGraphics;
begin
  Bmp := TBitmap.Create;
  Pic_MS := TMemoryStream.Create();
  try
    HTTP.Get(Url, Pic_MS);
  except
    Pic_MS.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Img\DefeatLogo.png');
  end;
  Pic_MS.Position := 0;
  MyIStream := TStreamAdapter.Create(Pic_MS);
  BmpX := TGPBitmap.Create(MyIStream);
  Bmp.Width := X;
  Bmp.Height := Y;
  Graphic := TGPGraphics.Create(Bmp.Canvas.Handle);
  Graphic.SetInterpolationMode(InterpolationModeHighQualityBicubic);
  Graphic.DrawImage(BmpX, 0.0, 0.0, Bmp.Width, Bmp.Height);
  BmpX.Free;
  Graphic.Free;
  Pic_MS.Free;
  result := Bmp;
end;

procedure TFm_Main.BTN_NextClick(Sender: TObject);
begin
  case Loop_Type of
    0: // 列表循环的下一首
      begin
        try
          Loop_List;
        except
          Loop_List;
        end;
      end;
    1: // 列表循环的下一首
      begin
        try
          Loop_List;
        except
          Loop_List;
        end;
      end;
    2: // 随机循环的下一首
      begin
        try
          Loop_Random;
        except
          Loop_Random;
        end;
      end;
  end;
end;

procedure TFm_Main.AP_MainCanChangePage(APage: TscAppPagerPage; var ACanChange: Boolean);
begin
  ACanChange := not Roll.IsControlFrozen(AP_Main);
end;

procedure TFm_Main.AP_MainChangePage(Sender: TObject);
begin
  try
    Roll.Execute;
  finally
    Roll.Restore;
  end;
end;

procedure TFm_Main.AP_MainChangingPage(Sender: TObject);
begin
  Roll.FreezeControlClient(AP_Main, AP_Main.ActivePage.BoundsRect);
end;

procedure TFm_Main.BTN_AboutClick(Sender: TObject);
begin
  Fm_ALS.PV_ALS.ActivePage := Fm_ALS.PVP_About;
  Fm_ALS.SF_ALS.DropDown(Fm_Main, Fm_Main.Left + 280, Fm_Main.Top + 130);
end;

procedure TFm_Main.BTN_CloseClick(Sender: TObject);
begin
  TMR_Play.Enabled := false;
  TMR_Bottom_Wave.Enabled := false;
  BASS_ChannelStop(HS);
  Application.Terminate;
end;

procedure TFm_Main.BTN_LastClick(Sender: TObject);
begin(*上一首歌播放*)
  try
    Last_Music;
  except
    Last_Music;
  end;
end;

procedure TFm_Main.BTN_LikeClick(Sender: TObject);
begin(*显示捐助窗口*)
//  Fm_SAA.LB_SAA.Caption := '感谢对本软件的支持！';
  Fm_ALS.PV_ALS.ActivePage := Fm_ALS.PVP_Like;
  Fm_ALS.SF_ALS.DropDown(Fm_Main, Fm_Main.Left + 280, Fm_Main.Top + 130);

end;

procedure TFm_Main.BTN_List_LoopClick(Sender: TObject);
begin (* 设置为单曲循环 *)
  BTN_Loop.ImageIndex := 10;
  BTN_Loop.HotImageIndex := 11;
  BTN_Loop.Hint := '单曲循环';
  Loop_Type := 1;
  CP_Loop.Close;
end;

procedure TFm_Main.BTN_LoopMouseEnter(Sender: TObject);
begin
  CP_Loop.Popup(BTN_Loop);
end;

procedure TFm_Main.BTN_LoopMouseLeave(Sender: TObject);
begin
//  CP_Loop.Close;
end;

procedure TFm_Main.BTN_MinClick(Sender: TObject);
begin(*最小化*)
//  Fm_Msg.ShowModal;
  if Fm_Msg.MsgBox('UWP Message Caption', 'Question message text') = mrOK then
  begin
    if Fm_Msg.RB_Tray.Checked then
    begin
      M_Tray.OnClick(Sender);
    end;
    if Fm_Msg.RB_Quite.Checked then
    begin
      BTN_Close.OnClick(Sender);
    end;
  end;
end;

procedure TFm_Main.BTN_One_LoopClick(Sender: TObject);
begin (* 设置为列表循环 *)
  BTN_Loop.ImageIndex := 8;
  BTN_Loop.HotImageIndex := 9;
  BTN_Loop.Hint := '列表循环';
  Loop_Type := 0;
  CP_Loop.Close;
end;

procedure TFm_Main.BTN_Open_Close_HomeClick(Sender: TObject);
begin(*显示推荐项目分类*)
  if BTN_Open_Close_Home.GlyphOptions.Kind = scgpbgkDownArrow then
  begin
    BTN_Open_Close_Home.GlyphOptions.Kind := scgpbgkUpArrow;
    SV_Recome.Opened := true;
  end
  else
  begin
    BTN_Open_Close_Home.GlyphOptions.Kind := scgpbgkDownArrow;
    SV_Recome.Opened := false;
  end;
end;

procedure TFm_Main.BTN_Play_PauseClick(Sender: TObject);
begin(*单击播放暂停*)
  if MEM.Size > 0 then
  begin
    if Bo_Play then
    begin
      BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
      TMR_Play.Enabled := True; // 播放音乐
      BASS_ChannelPlay(HS, false);
      Fm_MiniBox.BTN_Play_Pause.ImageIndex := 1; // 迷你窗口播放按钮显示为暂停
      BTN_Play_Pause.ImageIndex := 1; // 播放按钮显示为暂停
      N_Play_Pause.ImageIndex := 5; // 任务栏按钮显示为暂停
      TB_Main.TaskBarButtons[1].Icon := ico_Pause; //任务栏缩略图按钮显示为暂停
      N_Play_Pause.Caption := '暂停';
      Bo_Play := false;
      Trc_Play.Visible := false;
    end
    else
    begin
      TMR_Play.Enabled := false; // 停止播放音乐
      BASS_ChannelPause(HS);
      Fm_MiniBox.BTN_Play_Pause.ImageIndex := 0; // 迷你窗口播放按钮显示为播放
      BTN_Play_Pause.ImageIndex := 0; // 播放按钮显示为播放
      N_Play_Pause.ImageIndex := 4; // 任务栏按钮显示为播放
      TB_Main.TaskBarButtons[1].Icon := ico_Play; //任务栏缩略图按钮显示为播放
      N_Play_Pause.Caption := '播放';
      Bo_Play := True;
      Trc_Play.Visible := True;
    end;
  end;
end;

procedure TFm_Main.BTN_Random_LoopClick(Sender: TObject);
begin(*设置随机播放*)
  BTN_Loop.ImageIndex := 12;
  BTN_Loop.HotImageIndex := 13;
  BTN_Loop.Hint := '随机循环';
  Loop_Type := 2;
  CP_Loop.Close;
end;

procedure TFm_Main.BTN_SmallClick(Sender: TObject);
begin(*显示迷你窗口*)
  Fm_Main.Hide;
  TMR_Bottom_Wave.Enabled := false;
  Fm_MiniBox.Lb_Song_Name.Hint := Fm_MiniBox.Caption;
  Fm_MiniBox.Lb_Song_Singer.Hint := Fm_MiniBox.Lb_Song_Singer.Caption;
  Fm_MiniBox.Show;
  SetWindowPos(Fm_MiniBox.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TFm_Main.BTN_VoiceClick(Sender: TObject);
begin(* 单击音量按钮设置静音 *)
  if Trc_Voice.Value = 0 then
  begin
    BTN_Voice.ImageIndex := 4;
//    BTN_Multi.ImageIndex := 4;
    BTN_Voice.HotImageIndex := 5;
//    BTN_Multi.HotImageIndex := 5;
    Trc_Voice.Value := VoiceX;
    BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
  end
  else
  begin
    VoiceX := Trc_Voice.Value;
    BTN_Voice.ImageIndex := 6;
//    BTN_Multi.ImageIndex := 6;
    BTN_Voice.HotImageIndex := 7;
//    BTN_Multi.HotImageIndex := 7;
    Trc_Voice.Value := 0;
    BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
  end;
end;

procedure TFm_Main.BTN_VoiceMouseEnter(Sender: TObject);
begin
  CP_Voice.Popup(BTN_Voice);
end;

procedure TFm_Main.BTN_VoiceMouseLeave(Sender: TObject);
begin
//  CP_Voice.Close;
end;

procedure TFm_Main.EDT_SearchKeyPress(Sender: TObject; var Key: Char);
begin(*回车搜索*)
  if Key = #13 then
  begin
    EDT_SearchRightButtonClick(Sender);
  end;
end;

procedure TFm_Main.EDT_SearchRightButtonClick(Sender: TObject);
var (* 单击执行歌曲搜索 *)
  G_QQ: Get_QQ_Info;
//  G_HS_QQ: Get_HS_Info;
//  G_MV_QQ: Get_MV_Info;
  G_163: Get_163_Info;
  G_KuWo: Get_KuWo_Info;
  G_KuGou: Get_KuGou_Info;
begin
  if RB_Song.Checked then
  begin
    F_Top_Search.Visible := True;
    F_Top_Recom.Visible := False;

    Search_Count := 50;

    MEM_QQ.Active := false;
    MEM_QQ.Close;
    MEM_QQ.Open;
    G_QQ := Get_QQ_Info.Create(EDT_Search.Text, Search_Count); // QQ搜索线程创建

    MEM_163.Active := false;
    MEM_163.Close;
    MEM_163.Open;
    G_163 := Get_163_Info.Create(EDT_Search.Text, Search_Count); // 网易搜索线程创建

    MEM_KuWo.Active := false;
    MEM_KuWo.Close;
    MEM_KuWo.Open;
    G_KuWo := Get_KuWo_Info.Create(EDT_Search.Text, Search_Count); // 酷我搜索线程创建

    MEM_KuGou.Active := false;
    MEM_KuGou.Close;
    MEM_KuGou.Open;
    G_KuGou := Get_KuGou_Info.Create(EDT_Search.Text, Search_Count); // 酷狗搜索线程创建
  end
  else
  begin
    F_Top_Search.Visible := False;
    F_Top_Recom.Visible := False;
  end;

//

//    2:
//      begin
//        NG_HS.ClearRows;
//        G_HS_QQ := Get_HS_Info.Create(EDT_Search.Text, 50);
//        G_HS_QQ.Start;
//      end;
//    3:
//      begin
//
//      end;
//    4:
//      begin
//        NG_MV.ClearRows;
//        G_MV_QQ := Get_MV_Info.Create(EDT_Search.Text, 50 { Search_Count } );
//        // QQ_MV搜索线程创建
//        G_MV_QQ.Start; // 执行QQ_MV搜索线程
//      end;
//  end;
//  SF_Main.ShowClientInActiveEffect;
//  Fm_Loading.Position := poMainFormCenter;
//  Fm_Loading.ShowModal;
//  SF_Main.HideClientInActiveEffect;
  TFr_Top_Search(F_Top_Search).BTN_QQ.Down := True;
  DS_Songs.DataSet := MEM_QQ;
  MEM_QQ.Active := true;
  CL_Search.GridView := TBV_Songs;
  AP_Main.ItemIndex := 0;
//  AP_Main.ItemIndex := -1;
end;

procedure TFm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin (* 程序结束时释放对象 *)
  MEM.Free;
  BASS_Free;
  png_bottom.Free;
  ico_Play.Free;
  ico_Pause.Free;
end;

procedure TFm_Main.FormCreate(Sender: TObject);
var(*启动时加载*)
  Get_List: Get_List_Songs;
  Show_RecType: Get_List_Type;
begin
  Fm_Start.LB_Satate.Caption := '正在检测音频解码单元……';
  if HiWord(BASS_GetVersion) <> BASSVERSION then
    MessageBox(0, '"Bass.dll" 文件版本不合适! ', '提示', MB_ICONERROR);
  if not BASS_Init(-1, 44100, 0, 0, nil) then
    MessageBox(0, '初始化错误！ ', '提示', MB_ICONERROR);
  MEM := TMemoryStream.Create;
  Fm_Start.LB_Satate.Caption := '正在绘制底部频谱区域……';
  png_bottom := tpngimage.Create;
  png_bottom.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Img\Wave_Bottom.png');
  ico_Play := TIcon.Create;
  ico_Pause := TIcon.Create;
  ico_Play.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\img\Play.ico');
  ico_Pause.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\img\Pause.ico');
  Fm_Start.LB_Satate.Caption := '正在注册搜索消息……';
  with GlobalVMsgMonitor do
  begin(*程序启动时候开始注册消息*)
    RegMsg(self, TQQ_List_Song_MSG, VMsgListSong); //推荐【歌单】列表
    RegMsg(self, TQQ_Recom_List_MSG, VMsgRcomList); //推荐【歌单】列表
    RegMsg(self, TQQ_Recom_Album_MSG, VMsgRcomAlbum); //推荐【专辑】列表
    RegMsg(self, TQQ_Album_Song_MSG, VMsgAlbumSong); //推荐【专辑】详细歌曲
    RegMsg(self, TQQ_Recom_Song_MSG, VMsgRecomSong); //推荐【歌曲】列表
    RegMsg(self, TSearch_QQ_Song_MSG, VMsgSearchSong_QQ); //搜索【QQ】歌曲
    RegMsg(self, TSearch_163_Song_MSG, VMsgSearchSong_WY); //搜索【网易】歌曲
    RegMsg(self, TSearch_KuWo_Song_MSG, VMsgSearchSong_KuWo); //搜索【酷我】歌曲
    RegMsg(self, TSearch_KuGou_Song_MSG, VMsgSearchSong_KuGou); //搜索【酷狗】歌曲
    RegMsg(self, TQQ_Recom_MV_MSG, VMsgRecom_MV); //推荐【MV】列表
  end;

  F_Top_Search := TFr_Top_Search.Create(self);
  F_Top_Search.Parent := APP_Music;
  F_Top_Search.Align := alTop;
  F_Top_Search.Visible := false;

  F_Top_Recom := TFr_Top_Recom.Create(self);
  F_Top_Recom.Parent := APP_Music;
  F_Top_Recom.Align := alTop;
  F_Top_Recom.Visible := false;

  Fm_Start.LB_Satate.Caption := '正在加载推荐分类……';
  Show_RecType := Get_List_Type.Create(TC_Recome); //获取推荐分类
  Get_List := Get_List_Songs.Create('', '10', 0);
  //这里两条线程，在程序退出前如果未完成，应该释放，包括播放列表加载歌曲线程也应当释放
  //以及程序运行过程中，若有线程在执行，则应该在程序退出之前释放
  //程序退出之前做线程检查，确保全部线程已完成退出
end;

procedure TFm_Main.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_SHOW);
end;

procedure TFm_Main.TBV_1631GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin(*【网易】列表显示序号*)
  AText := inttostr(ARecord.Index + 1);
end;

procedure TFm_Main.TBV_163CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DB_Click_Play;
end;

procedure TFm_Main.TBV_KuGou1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin(*【酷狗】列表显示序号*)
  AText := inttostr(ARecord.Index + 1);
end;

procedure TFm_Main.TBV_KuGouCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DB_Click_Play;
end;

procedure TFm_Main.TBV_KuWo1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin(*【酷我】列表显示序号*)
  AText := inttostr(ARecord.Index + 1);
end;

procedure TFm_Main.TBV_KuWoCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DB_Click_Play;
end;

procedure TFm_Main.TBV_Pub1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin(*【推荐详细】列表显示序号*)
  AText := inttostr(ARecord.Index + 1);
end;

procedure TFm_Main.TBV_Songs1GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin(*【QQ】列表显示序号*)
  AText := inttostr(ARecord.Index + 1);
end;

procedure TFm_Main.TBV_SongsCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DB_Click_Play; //双击播放
end;

procedure TFm_Main.TMR_Bottom_WaveTimer(Sender: TObject);
var (* 底部频谱显示 *)
  c1, c2: TGPColor; // 渐变色起始色
  i, di: Integer;
var
  gx: TGPGraphics;
//  PC:TControlCanvas;//控件画布
  CountX: Word; // 点数
  p: TGPPen; // 画笔
  b: TGPBrush; // 画笔渐变画刷
  PtArr_R_T: array[0..99] of TGPPointf; // 右上角
  PtArr_L_T: array[0..99] of TGPPointf; // 左上角
  PtArr_R_B: array[0..99] of TGPPointf; // 右下角
  PtArr_L_B: array[0..99] of TGPPointf; // 左下角
  PtArr: array[0..399] of TGPPointf; // 所有点
  pb: TGPLinearGradientBrush;
  r: TGPRect;
  BmpX: TBitmap;
  n: Integer;
begin
  CountX := 100;
  r := MakeRect(0, 0, 420, 40);
  c1 := MakeColor(250, 250, 250, 0);
  c2 := MakeColor(250, 50, 200, 50);
  b := TGPLinearGradientBrush.Create(MakePoint(0, 0), MakePoint(420, 40), c1, c2);
  if BASS_ChannelIsActive(HS) <> BASS_ACTIVE_PLAYING then
    Exit;
  BASS_ChannelGetData(HS, @FFTData, BASS_DATA_FFT1024);
  BmpX := TBitmap.Create;
  BmpX.Assign(png_bottom);
  BmpX.Width := 420;
  BmpX.Height := 40;
//  PC:=TControlCanvas.Create;
//  PC.Control:=PN_Bottom_Wave;

  gx := TGPGraphics.Create(BmpX.Canvas.Handle);
//  gx := TGPGraphics.Create(PC.Handle);
  // gx.SetSmoothingMode(SmoothingModeHighQuality);
  gx.SetSmoothingMode(SmoothingModeAntiAlias); // 绘制抗锯齿
  p := TGPPen.Create(b, 2);
  for i := 0 to CountX - 1 do
  begin
    di := Trunc(Abs(FFTData[i]) * 100);
    if di > 18 then
      di := 18;
    if di >= FFTFallOff[i] then
      FFTFallOff[i] := di
    else
      FFTFallOff[i] := FFTFallOff[i] - 3;
    if (20 - FFTFallOff[i]) > 20 then
      FFTFallOff[i] := 0;
    PtArr_R_T[i] := MakePoint(200 + i * 3.0, 20 - FFTFallOff[i]); // 右上角图形点【200到398】
    PtArr_L_T[i] := MakePoint(200 - i * 3.0, 20 - FFTFallOff[i]); // 左上角图形点【2到200】
    PtArr_R_B[i] := MakePoint(200 + i * 3.0, 20 + FFTFallOff[i]); // 右下角图形点【200到298】
    PtArr_L_B[i] := MakePoint(200 - i * 3.0, 20 + FFTFallOff[i]); // 左下角图形点【2到200】
  end;
  for n := 99 downto 0 do
  begin
    PtArr[99 - n] := PtArr_L_T[n]; // 0到99的坐标点
    PtArr[299 - n] := PtArr_R_B[n]; // 200到299的坐标点
  end;
  for n := 0 to 99 do
  begin
    PtArr[n + 100] := PtArr_R_T[n]; // 100到199的坐标点
    PtArr[n + 300] := PtArr_L_B[n]; // 300到399的坐标点
  end;
  pb := TGPLinearGradientBrush.Create(r, c1, c2, LinearGradientModeForwardDiagonal); // 创建渐变色画刷
  gx.DrawClosedCurve(p, PGPPointF(@PtArr), Length(PtArr), 0.5); // 绘制闭合曲线
  gx.FillClosedCurve(pb, PGPPointF(@PtArr), Length(PtArr), FillModeAlternate, 0.5); // 闭合曲线内部填充渐变色
  // gx.DrawCurve(p, PGPPointF(@PtArr_R_T), Length(PtArr_R_T), 0.5);
  // gx.DrawCurve(p, PGPPointF(@PtArr_L_T), Length(PtArr_L_T), 0.5);
  // gx.DrawCurve(p, PGPPointF(@PtArr_R_B), Length(PtArr_R_B), 0.5);
  // gx.DrawCurve(p, PGPPointF(@PtArr_L_B), Length(PtArr_L_B), 0.5);
  BitBlt(IC_Wave.Images[1].Bitmap.Canvas.Handle, 0, 0, IC_Wave.Images[1].Bitmap.Width, IC_Wave.Images[1].Bitmap.Height, BmpX.Canvas.Handle, 0, 0, SRCCOPY); // 全图复制到背景
  PN_Bottom_Wave.Repaint; // 刷新界面上的背景Panel
  Trc_Play.Repaint; // 刷新界面上的进度条控件
  LB_Music_Name.Repaint; // 刷新界面上的歌名Label
  LB_Play_Time.Repaint; // 刷新界面上的时间进度Label
  LB_All_Time.Repaint; // 刷新界面上的总时间Label
  LB_H.Repaint; // 刷新界面上的斜杠Label
  gx.Free;
  p.Free;
  pb.Free;
  BmpX.Free;
end;

procedure TFm_Main.TMR_PlayTimer(Sender: TObject);
var (* 播放控制，设置循环 *)
  s: Double;
begin
  s := BASS_ChannelBytes2Seconds(HS, BASS_ChannelGetPosition(HS, BASS_POS_BYTE));
  Trc_Play.Position := Trunc(s * 1000);
  LB_Play_Time.Caption := Format('%.2d', [Trunc(s) div 60]) + ':' + Format('%.2d', [Trunc(s) mod 60]);
  if BASS_ChannelIsActive(HS) = BASS_ACTIVE_STOPPED then // 如果播放结束
  begin
    if MEM_PlayList.RecordCount > 1 then // 判断列表里的歌曲数量
    begin
      case Loop_Type of
        0: // 列表循环
          begin
            if MEM_PlayList.RecordCount > 0 then
            begin
              try
                Loop_List; // 尝试播放下一首
              except
                Loop_List; // 如果失败，再继续跳到下一首
              end;
            end;
          end;
        1:
          begin
            Play_Music; // 单曲循环
          end;
        2:
          begin
            try
              Loop_Random; // 尝试随机播放一首
            except
              Loop_Random; // 如果失败，再继续随机播放一首
            end;
          end;
      end;
    end
    else // 如果<=1，那么就单曲循环
    begin
      Play_Music; // 单曲循环
    end;
  end;
end;

function TFm_Main.ToQRCode(Url: string): TBitmap;
var//生成分享二维码
  mydll: PZSymbol;
  g: TBitmap;
  astr: AnsiString;
begin
  mydll := ZBarcode_Create();
  if (mydll = nil) then
  begin
    Exit();
  end;
  g := TBitmap.Create;
  mydll.symbology := BARCODE_QRCODE;
  astr := AnsiString(Url);
  ZBarcode_Encode_and_Buffer(mydll, PAnsiChar(astr), Length(astr), 0);
  ZBarcodeToBitmap(mydll, g);
  result := g;
  ZBarcode_Delete(mydll);
end;

procedure TFm_Main.Trc_PlayMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var (* 滑块调整播放进度 *)
  Position: Int64;
begin
  if MEM.Size > 0 then
  begin
    TMR_Play.Enabled := false;
    BASS_ChannelPause(HS);
    Position := BASS_ChannelSeconds2Bytes(HS, Trc_Play.Position / 1000);
    BASS_ChannelSetPosition(HS, Position, BASS_POS_BYTE);
    if BTN_Play_Pause.ImageIndex = 1 then
    begin
      BASS_ChannelPlay(HS, false); // 播放歌曲
      TMR_Play.Enabled := True;
    end;
  end;
end;

procedure TFm_Main.Trc_VoiceChange(Sender: TObject);
begin (*调整音量*)
  if MEM.Size > 0 then
  begin
    BASS_ChannelSetAttribute(HS, BASS_ATTRIB_VOL, Trc_Voice.Value / Trc_Voice.MaxValue);
  end;
  if Trc_Voice.Value = 0 then
  begin
    BTN_Voice.ImageIndex := 6;
//    BTN_Multi.ImageIndex := 6;
    BTN_Voice.HotImageIndex := 7;
//    BTN_Multi.HotImageIndex := 7;
  end
  else
  begin
    BTN_Voice.ImageIndex := 4;
//    BTN_Multi.ImageIndex := 4;
    BTN_Voice.HotImageIndex := 5;
//    BTN_Multi.HotImageIndex := 5;
  end;
  LB_Voive.Caption := IntToStr(Trc_Voice.Value);
end;

procedure TFm_Main.VMsgAlbumSong(Sender: TObject; AMsg: TVMsg);
var (*处理【专辑】详细列表消息*)
  vMsg: TQQ_Album_Song_MSG;
begin
  if (AMsg is TQQ_Album_Song_MSG) then
  begin
    vMsg := TQQ_Album_Song_MSG(AMsg);
    with MEM_Pub do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.Song_Name;
      Fieldbyname('Song_Album').AsString := vMsg.Song_Album;
      Fieldbyname('Song_Singer').AsString := vMsg.Song_Singer;
      Fieldbyname('Song_Time').AsString := Format('%.2d', [StrToInt(vMsg.Song_Time) div 60]) + ':' + Format('%.2d ', [StrToInt(vMsg.Song_Time) mod 60]); // 时长
      Fieldbyname('Song_From').AsString := vMsg.Song_From;
      Fieldbyname('Song_Img').AsString := vMsg.Song_Img;
      Fieldbyname('Song_ID').AsString := vMsg.Song_ID;
      Fieldbyname('Song_AlbumID').AsString := vMsg.Song_AlbumID;
      Fieldbyname('Song_SingerID').AsString := vMsg.Song_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.Song_MVID;
      Fieldbyname('Song_Lrc').AsString := vMsg.Song_Lrc;
      Fieldbyname('List_Title').AsString := vMsg.List_Title;
      Fieldbyname('List_Des').AsString := vMsg.List_Des;
      Post;
      EnableControls;
    end;
  end;
end;

procedure TFm_Main.VMsgListSong(Sender: TObject; AMsg: TVMsg);
var (*处理【歌单】详细列表消息*)
  vMsg: TQQ_List_Song_MSG;
begin
  if (AMsg is TQQ_List_Song_MSG) then
  begin
    vMsg := TQQ_List_Song_MSG(AMsg);
    with MEM_Pub do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.Song_Name;
      Fieldbyname('Song_Album').AsString := vMsg.Song_Album;
      Fieldbyname('Song_Singer').AsString := vMsg.Song_Singer;
      Fieldbyname('Song_Time').AsString := Format('%.2d', [StrToInt(vMsg.Song_Time) div 60]) + ':' + Format('%.2d ', [StrToInt(vMsg.Song_Time) mod 60]); // 时长
      Fieldbyname('Song_From').AsString := vMsg.Song_From;
      Fieldbyname('Song_Img').AsString := vMsg.Song_Img;
      Fieldbyname('Song_ID').AsString := vMsg.Song_ID;
      Fieldbyname('Song_AlbumID').AsString := vMsg.Song_AlbumID;
      Fieldbyname('Song_SingerID').AsString := vMsg.Song_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.Song_MVID;
      Fieldbyname('Song_Lrc').AsString := vMsg.Song_Lrc;
      Fieldbyname('List_Title').AsString := vMsg.List_Title;
      Fieldbyname('List_Des').AsString := vMsg.List_Des;
      Post;
      EnableControls;
    end;
  end;
end;

procedure TFm_Main.VMsgRcomAlbum(Sender: TObject; AMsg: TVMsg);
var(*处理推荐【专辑】消息*)
  vMsg: TQQ_Recom_Album_MSG;
  it: TdxTileControlItem;
begin
  if (AMsg is TQQ_Recom_Album_MSG) then
  begin
    vMsg := TQQ_Recom_Album_MSG(AMsg);
    Fm_Main.TC_Home.BeginUpdate;
    it := Fm_Main.tc_home.Items.Add;
    with it do
    begin
      Text1.Align := oaBottomLeft;
      Text1.IndentHorz := 5;
      Text1.IndentVert := 20;
      Text2.Align := oaBottomLeft;
      Text2.IndentHorz := 5;
      Text2.IndentVert := 5;
      Glyph.Align := oaTopCenter;
      Style.GradientBeginColor := $493C39;
      Style.GradientEndColor := $493C39;
      Text1.Font.Name := '微软雅黑 Light';
      Text1.Font.Size := 8;
      Text1.Font.Color := clwhite;
      Text1.WordWrap := True;
      Text2.Font.Name := '微软雅黑 Light';
      Text2.Font.Size := 8;
      Text1.Value := vMsg.Album_Name; //专辑名
      Text2.Value := vMsg.Album_Singer; //歌手
      tag := 2; //为2表示【专辑】列表
      GroupIndex := 0;
      Glyph.IndentHorz := 5;
      Glyph.IndentVert := 5;
      Glyph.Image.Assign(Get_Img(vMsg.Album_Img, 110, 110));
      DetailOptions.Caption := vMsg.Album_ID;
      it.OnClick := Fm_Main.ItemClick;
    end;
    Fm_Main.TC_Home.EndUpdate;
  end;
end;

procedure TFm_Main.VMsgRcomList(Sender: TObject; AMsg: TVMsg);
var(*处理推荐【歌单】消息*)
  vMsg: TQQ_Recom_List_MSG;
  it: TdxTileControlItem;
begin(*歌单信息添加到列表*)
  if (AMsg is TQQ_Recom_List_MSG) then
  begin
    vMsg := TQQ_Recom_List_MSG(AMsg);
    Fm_Main.TC_Home.BeginUpdate;
    it := Fm_Main.tc_home.Items.Add;
    with it do
    begin
      Text1.Align := oaBottomLeft;
      Text1.IndentHorz := 5;
      Text1.IndentVert := 20;
      Text2.Align := oaBottomLeft;
      Text2.IndentHorz := 5;
      Text2.IndentVert := 5;
      Glyph.Align := oaTopCenter;
      Style.GradientBeginColor := $493C39;
      Style.GradientEndColor := $493C39;
      Text1.Font.Name := '微软雅黑 Light';
      Text1.Font.Size := 8;
      Text1.Font.Color := clwhite;
      Text1.WordWrap := True;
      Text2.Font.Name := '微软雅黑 Light';
      Text2.Font.Size := 8;
      Text1.Value := vMsg.List_Name;
      Text2.Value := '播放量：' + vMsg.List_Num;
      tag := 1; //为1表示【歌单】列表
      GroupIndex := 0;
      Glyph.IndentHorz := 5;
      Glyph.IndentVert := 5;
      Glyph.Image.Assign(Get_Img(vMsg.List_Img, 110, 110));
      DetailOptions.Caption := vMsg.List_ID;
      it.OnClick := Fm_Main.ItemClick;
    end;
    Fm_Main.TC_Home.EndUpdate;
  end;
end;

procedure TFm_Main.VMsgRecomSong(Sender: TObject; AMsg: TVMsg);
var(*处理【歌曲】推荐消息*)
  vMsg: TQQ_Recom_Song_MSG;
begin
  if (AMsg is TQQ_Recom_Song_MSG) then
  begin
    vMsg := TQQ_Recom_Song_MSG(AMsg);
    with MEM_Pub do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.Song_Name;
      Fieldbyname('Song_Album').AsString := vMsg.Song_Album;
      Fieldbyname('Song_Singer').AsString := vMsg.Song_Singer;
      Fieldbyname('Song_Time').AsString := Format('%.2d', [StrToInt(vMsg.Song_Time) div 60]) + ':' + Format('%.2d ', [StrToInt(vMsg.Song_Time) mod 60]); // 时长
      Fieldbyname('Song_From').AsString := vMsg.Song_From;
      Fieldbyname('Song_Img').AsString := vMsg.Song_Img;
      Fieldbyname('Song_ID').AsString := vMsg.Song_ID;
      Fieldbyname('Song_AlbumID').AsString := vMsg.Song_AlbumID;
      Fieldbyname('Song_SingerID').AsString := vMsg.Song_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.Song_MVID;
      Fieldbyname('Song_Lrc').AsString := vMsg.Song_Lrc;
      Post;
      EnableControls;
    end;
  end;
end;

procedure TFm_Main.VMsgRecom_MV(Sender: TObject; AMsg: TVMsg);
var(*处理【MV】推荐消息*)
  vMsg: TQQ_Recom_MV_MSG;
begin
  if (AMsg is TQQ_Recom_MV_MSG) then
  begin
    vMsg := TQQ_Recom_MV_MSG(AMsg);
    with MEM_MV do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.MV_Name;
      Fieldbyname('Song_Singer').AsString := vMsg.MV_Singer;
      Fieldbyname('Song_From').AsString := vMsg.MV_From;
      Fieldbyname('Song_Img').AsString := vMsg.MV_Img;
      Fieldbyname('Song_SingerID').AsString := vMsg.MV_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.MV_MVID;
      Fieldbyname('Song_Dec').AsString := vMsg.MV_Des;
      Fieldbyname('Song_Pub').AsString := vMsg.MV_Pub;
      if strtoint(vMsg.MV_No) > 10000 then
        Fieldbyname('Song_No').AsString := Format('%.2f', [StrTofloat(vMsg.MV_No) / 10000]) + '万'
      else
        Fieldbyname('Song_No').AsString := vMsg.MV_No;
      TBlobField(FieldByName('Song_Pic')).LoadFromStream(vMsg.MV_Pic);
      Post;
      EnableControls;
    end;
  end;
end;

procedure TFm_Main.VMsgSearchSong_KuGou(Sender: TObject; AMsg: TVMsg);
var(*处理【酷狗】音乐搜索消息*)
  vMsg: TSearch_KuGou_Song_MSG;
begin
  if (AMsg is TSearch_KuGou_Song_MSG) then
  begin
    vMsg := TSearch_KuGou_Song_MSG(AMsg);
    with MEM_KuGou do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.Song_Name;
      Fieldbyname('Song_Album').AsString := vMsg.Song_Album;
      Fieldbyname('Song_Singer').AsString := vMsg.Song_Singer;
      Fieldbyname('Song_Time').AsString := Format('%.2d', [StrToInt(vMsg.Song_Time) div 60]) + ':' + Format('%.2d ', [StrToInt(vMsg.Song_Time) mod 60]); // 时长
      Fieldbyname('Song_From').AsString := vMsg.Song_From;
      Fieldbyname('Song_Img').AsString := vMsg.Song_Img;
      Fieldbyname('Song_ID').AsString := vMsg.Song_ID;
      Fieldbyname('Song_AlbumID').AsString := vMsg.Song_AlbumID;
      Fieldbyname('Song_SingerID').AsString := vMsg.Song_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.Song_MVID;
      Fieldbyname('Song_Lrc').AsString := vMsg.Song_Lrc;
      Post;
      EnableControls;
    end;
  end;
end;

procedure TFm_Main.VMsgSearchSong_KuWo(Sender: TObject; AMsg: TVMsg);
var(*处理【酷我】音乐搜索消息*)
  vMsg: TSearch_KuWo_Song_MSG;
begin
  if (AMsg is TSearch_KuWo_Song_MSG) then
  begin
    vMsg := TSearch_KuWo_Song_MSG(AMsg);
    with MEM_KuWo do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.Song_Name;
      Fieldbyname('Song_Album').AsString := vMsg.Song_Album;
      Fieldbyname('Song_Singer').AsString := vMsg.Song_Singer;
      Fieldbyname('Song_Time').AsString := Format('%.2d', [StrToInt(vMsg.Song_Time) div 60]) + ':' + Format('%.2d ', [StrToInt(vMsg.Song_Time) mod 60]); // 时长
      Fieldbyname('Song_From').AsString := vMsg.Song_From;
      Fieldbyname('Song_Img').AsString := vMsg.Song_Img;
      Fieldbyname('Song_ID').AsString := vMsg.Song_ID;
      Fieldbyname('Song_AlbumID').AsString := vMsg.Song_AlbumID;
      Fieldbyname('Song_SingerID').AsString := vMsg.Song_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.Song_MVID;
      Fieldbyname('Song_Lrc').AsString := vMsg.Song_Lrc;
      Post;
      EnableControls;
    end;
  end;
end;

procedure TFm_Main.VMsgSearchSong_QQ(Sender: TObject; AMsg: TVMsg);
var(*处理【QQ】音乐搜索消息*)
  vMsg: TSearch_QQ_Song_MSG;
begin
  if (AMsg is TSearch_QQ_Song_MSG) then
  begin
    vMsg := TSearch_QQ_Song_MSG(AMsg);
    with MEM_QQ do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.Song_Name;
      Fieldbyname('Song_Album').AsString := vMsg.Song_Album;
      Fieldbyname('Song_Singer').AsString := vMsg.Song_Singer;
      Fieldbyname('Song_Time').AsString := Format('%.2d', [StrToInt(vMsg.Song_Time) div 60]) + ':' + Format('%.2d ', [StrToInt(vMsg.Song_Time) mod 60]); // 时长
      Fieldbyname('Song_From').AsString := vMsg.Song_From;
      Fieldbyname('Song_Img').AsString := vMsg.Song_Img;
      Fieldbyname('Song_ID').AsString := vMsg.Song_ID;
      Fieldbyname('Song_AlbumID').AsString := vMsg.Song_AlbumID;
      Fieldbyname('Song_SingerID').AsString := vMsg.Song_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.Song_MVID;
      Fieldbyname('Song_Lrc').AsString := vMsg.Song_Lrc;
      Post;
      EnableControls;
    end;
  end;
end;

procedure TFm_Main.VMsgSearchSong_WY(Sender: TObject; AMsg: TVMsg);
var(*处理【网易】音乐搜索消息*)
  vMsg: TSearch_163_Song_MSG;
begin
  if (AMsg is TSearch_163_Song_MSG) then
  begin
    vMsg := TSearch_163_Song_MSG(AMsg);
    with MEM_163 do
    begin
      DisableControls;
      Open;
      Append;
      Fieldbyname('Song_Name').AsString := vMsg.Song_Name;
      Fieldbyname('Song_Album').AsString := vMsg.Song_Album;
      Fieldbyname('Song_Singer').AsString := vMsg.Song_Singer;
      Fieldbyname('Song_Time').AsString := Format('%.2d', [StrToInt(vMsg.Song_Time) div 60]) + ':' + Format('%.2d ', [StrToInt(vMsg.Song_Time) mod 60]); // 时长
      Fieldbyname('Song_From').AsString := vMsg.Song_From;
      Fieldbyname('Song_Img').AsString := vMsg.Song_Img;
      Fieldbyname('Song_ID').AsString := vMsg.Song_ID;
      Fieldbyname('Song_AlbumID').AsString := vMsg.Song_AlbumID;
      Fieldbyname('Song_SingerID').AsString := vMsg.Song_SingerID;
      Fieldbyname('Song_MVID').AsString := vMsg.Song_MVID;
      Fieldbyname('Song_Lrc').AsString := vMsg.Song_Lrc;
      Post;
      EnableControls;
    end;
  end;
end;

end.

