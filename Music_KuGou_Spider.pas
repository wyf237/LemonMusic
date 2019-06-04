(**************************************************)
(*                                                *)
(*            本单元用于爬取酷狗音乐              *)
(*                                                *)
(*              Copyright (c) 2019                *)
(*                     南烛                       *)
(*                                                *)
(**************************************************)
unit Music_KuGou_Spider;

interface

uses
  System.Classes, system.sysutils, IdHTTP, IdIOHandlerSocket, superobject,
  Winapi.Windows, MSGs, VMsgMonitor;

type
  Get_KuGou_Info = class(TTHread)
  private
    const
      UserAgent = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3408.400 QQBrowser/9.6.12028.400';
      KuGouInfo = 'http://songsearch.kugou.com/song_search_v2?&page=1&platform=WebFilter&filter=2&iscorrection=1&pagesize='; // +歌名
      KuGouDownLoad = 'http://www.kugou.com/yy/index.php?r=play/getdata&mid=a55266deb33310dfea9f642586c6a04e';
    var
      KuGou: Word; // 搜索结果计数
  public
    var
      Key_Word: string; //搜索关键字
      Num: integer; //搜索数量
    constructor Create(S_Key_Word: string; S_Num: Integer); overload; //构造函数
  protected
    function KuGou_Music_Info(KW: string; S_Count: integer): string; // 获取酷我音乐信息
    procedure Execute; override;
  end;

implementation

uses
  System.NetEncoding, Main;
{ Get_KuGo_Info }

constructor Get_KuGou_Info.Create(S_Key_Word: string; S_Num: Integer);
begin
  Key_Word := S_Key_Word; //搜索关键字
  Num := S_Num; //搜索数量
  inherited Create(false);
end;

procedure Get_KuGou_Info.Execute;
var
  HPX: TIdHTTP;
  SSLX: TIdIOHandlerSocket;
  joKuGou, jox, itemKuGou: Isuperobject; // 酷狗音乐API
  strKuGou, str_Other: string;
  KuGouX: string;
  vMsg: TSearch_KuGou_Song_MSG;
begin
  FreeOnTerminate := true;
  OnTerminate := Fm_Main.Search_Over;
  KuGou := 0;
  HPX := TIdHTTP.Create(nil);
  SSLX := TIdIOHandlerSocket(nil);
  HPX.IOHandler := SSLX;
  HPX.Request.UserAgent := UserAgent; // 设置UserAgent
  strKuGou := KuGou_Music_Info(Key_Word, Num);
  joKuGou := SO(strKuGou);
  for itemKuGou in joKuGou['data.lists'] do
  begin
    KuGouX := KuGouDownLoad + '&album_id=' + joKuGou['data.lists[' + inttostr(KuGou) + '].AlbumID'].AsString + '&hash=' + joKuGou['data.lists[' + inttostr(KuGou) + '].FileHash'].AsString;
    str_Other := HPX.Get(KuGouX);
    jox := SO(str_Other);

    vMsg :=  TSearch_KuGou_Song_MSG.Create;
    vMsg.Song_Name := joKuGou['data.lists[' + inttostr(KuGou) + '].SongName'].AsString; // 歌名
    vMsg.Song_Album := joKuGou['data.lists[' + inttostr(KuGou) + '].AlbumName'].AsString; // 专辑名
    vMsg.Song_Singer := joKuGou['data.lists[' + inttostr(KuGou) + '].SingerName'].AsString; // 歌手名
    vMsg.Song_Time := joKuGou['data.lists[' + inttostr(KuGou) + '].Duration'].AsString; //时长秒
    vMsg.Song_From := '4';
    vMsg.Song_Img := jox['data.img'].AsString;  // 图片
    vMsg.Song_ID := joKuGou['data.lists[' + inttostr(KuGou) + '].FileHash'].AsString; // ID
    vMsg.Song_AlbumID := joKuGou['data.lists[' + inttostr(KuGou) + '].AlbumID'].AsString; //专辑ID
    vMsg.Song_SingerID := joKuGou['data.lists[' + inttostr(KuGou) + '].SingerId[0]'].AsString; //歌手ID
    vMsg.Song_MVID := joKuGou['data.lists[' + inttostr(KuGou) + '].MvHash'].AsString; //歌MV_ID
    vMsg.Song_Lrc := '';
    GlobalVMsgMonitor.PostVMsg(vMsg); //发送消息
    inc(KuGou);
  end;
  FreeAndNil(HPX);
  FreeAndNil(SSLX);
end;

function Get_KuGou_Info.KuGou_Music_Info(KW: string; S_Count: integer): string;
var
  HP: TIdHTTP;
  SSL: TIdIOHandlerSocket;
begin
  HP := TIdHTTP.Create(nil);
  SSL := TIdIOHandlerSocket(nil);
  HP.IOHandler := SSL;
  HP.Request.UserAgent := UserAgent; // 设置UserAgent
  result := HP.Get(KuGouInfo + inttostr(S_Count) + '&keyword=' + TNetEncoding.URL.Encode(Trim(KW)));
  FreeAndNil(HP);
  FreeAndNil(SSL);
end;

end.

