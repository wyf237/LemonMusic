(**************************************************)
(*                                                *)
(*            本单元用于爬取酷我音乐              *)
(*                                                *)
(*              Copyright (c) 2019                *)
(*                     南烛                       *)
(*                                                *)
(**************************************************)
unit Music_KuWo_Spider;

interface

uses
  System.Classes, system.sysutils, IdHTTP, IdIOHandlerSocket, superobject,
  Winapi.Windows, MSGs, VMsgMonitor;

type
  Get_KuWo_Info = class(TTHread)
  private
    const
      UserAgent = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3408.400 QQBrowser/9.6.12028.400';
      KuWoInfo = 'http://search.kuwo.cn/r.s?ft=music&rformat=json&encoding=utf8&vipver=MUSIC_8.0.3.1&rn='; // +歌名/歌手
      KuWoDownLoad = 'http://antiserver.kuwo.cn/anti.s?type=convert_url&format=mp3&response=url&rid='; // +歌曲ID
      KuWoImg = 'http://www.kuwo.cn/webmusic/sj/dtflagdate?flag=6&rid='; // 图片地址
    var
      KuWo: Word; // 搜索结果计数
  public
    var
      Key_Word: string; //搜索关键字
      Num: integer; //搜索数量
    constructor Create(S_Key_Word: string; S_Num: Integer); overload; //构造函数
  protected
    function KuWo_Music_Info(KW: string; S_Count: integer): string; // 获取酷我音乐信息
    procedure Execute; override;
  end;

implementation

uses
  System.NetEncoding, Main;
{ Get_KuGou_Info }

constructor Get_KuWo_Info.Create(S_Key_Word: string; S_Num: Integer);
begin
  Key_Word := S_Key_Word; //搜索关键字
  Num := S_Num; //搜索数量
  inherited Create(false);
end;

procedure Get_KuWo_Info.Execute;
var
  HPX: TIdHTTP;
  SSLX: TIdIOHandlerSocket;
  joKuWo, itemKuWo: Isuperobject; // 酷我音乐API
  strKuWo: string; //歌曲信息返回JSON
  Img_Ls: TStringList; // 酷我图片获取
  vMsg: TSearch_KuWo_Song_MSG;
begin
  FreeOnTerminate := True;
  OnTerminate := Fm_Main.Search_Over;
  KuWo := 0;
  strKuWo := KuWo_Music_Info(Key_Word, Num);
  joKuWo := SO(strKuWo);
  Img_Ls := TStringList.Create;
  HPX := TIdHTTP.Create(nil);
  SSLX := TIdIOHandlerSocket(nil);
  HPX.IOHandler := SSLX;
  HPX.Request.UserAgent := UserAgent; // 设置UserAgent
  for itemKuWo in joKuWo['abslist'] do
  begin
    vMsg := TSearch_KuWo_Song_MSG.Create;
    vMsg.Song_Name := StringReplace(joKuWo['abslist[' + inttostr(KuWo) + '].NAME'].AsString, '&nbsp;', '', [rfReplaceAll]); // 歌名
    vMsg.Song_Album := StringReplace(joKuWo['abslist[' + inttostr(KuWo) + '].ALBUM'].AsString, '&nbsp;', '', [rfReplaceAll]); // 专辑名
    vMsg.Song_Singer := joKuWo['abslist[' + inttostr(KuWo) + '].ARTIST'].AsString; // 歌手名
    vMsg.Song_Time := joKuWo['abslist[' + inttostr(KuWo) + '].DURATION'].AsString; //时长秒
    vMsg.Song_From := '3';
    Img_Ls.Delimiter := ',';
    Img_Ls.DelimitedText := HPX.Get(KuWoImg + joKuWo['abslist[' + inttostr(KuWo) + '].MUSICRID'].AsString);
    vMsg.Song_Img := Img_Ls[1];  // 图片
    vMsg.Song_ID := joKuWo['abslist[' + inttostr(KuWo) + '].MUSICRID'].AsString; // ID
    vMsg.Song_AlbumID := joKuWo['abslist[' + inttostr(KuWo) + '].ALBUMID'].AsString; //专辑ID
    vMsg.Song_SingerID := joKuWo['abslist[' + inttostr(KuWo) + '].ARTISTID'].AsString; //歌手ID
    vMsg.Song_MVID := joKuWo['abslist[' + inttostr(KuWo) + '].MUSICRID'].AsString; //歌MV_ID
    vMsg.Song_Lrc := '';
    GlobalVMsgMonitor.PostVMsg(vMsg); //发送消息
//    Song_Url := HPX.Get(KuWoDownLoad + joKuWo['abslist[' + inttostr(KuWo) + '].MUSICRID'].AsString); // 下载地址
    inc(KuWo);
  end;
  FreeAndNil(Img_Ls);
  FreeAndNil(HPX);
  FreeAndNil(SSLX);
end;

function Get_KuWo_Info.KuWo_Music_Info(KW: string; S_Count: integer): string;
var
  HP: TIdHTTP;
  SSL: TIdIOHandlerSocket;
begin
  HP := TIdHTTP.Create(nil);
  SSL := TIdIOHandlerSocket(nil);
  HP.IOHandler := SSL;
  HP.Request.UserAgent := UserAgent; // 设置UserAgent
  result := HP.Get(KuWoInfo + inttostr(S_Count) + '&all=' + TNetEncoding.URL.Encode(Trim(KW)));
  FreeAndNil(HP);
  FreeAndNil(SSL);
end;

end.

