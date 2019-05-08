(**************************************************)
(*                                                *)
(*            本单元用于爬取网易音乐              *)
(*                                                *)
(*              Copyright (c) 2019                *)
(*                     南烛                       *)
(*                                                *)
(**************************************************)
//方法：
//1、Key_Word传入歌名或歌手名关键字
//2、Num传入搜索数量
//3、执行线程开始搜索并添加到NextGrid
unit Music_163_Spider;

interface

uses
  System.Classes, system.sysutils, IdHTTP, IdIOHandlerSocket, superobject,
  JDAESExtend, Winapi.Windows, MSGs, VMsgMonitor;

type
  Get_163_Info = class(TTHread)
  private
    const
      UserAgent = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.3408.400 QQBrowser/9.6.12028.400';
      skey = 'a8dfcd22f776d072cde96b0bc309dc8e845d0a145b11f5e02d1144e61e619aedd3c4ee2a1774b5e998c6e3f85a3ae64a1defc66e4896aa92decd9e132a20a413819509abc0552' + 'f3b1885340f4eaa0ac2f19239f197a41120747205082b77c944e9541fc67a6fc6f7e5c770923748f5b4f48d55be9585bd930918b92888a9102b';
      OnceKey = '0CoJUm6Qyw8W8jud';
      Music_Post = 'http://music.163.com/weapi/song/enhance/player/url?csrf_token=';
      MV_Post = 'https://music.163.com/weapi/song/enhance/play/mv/url?csrf_token=';
    var
//      S_Type: Integer; //搜索类型，0为歌曲。1为MV。2为列表
//      M_Type: Integer; //MV的清晰度，输入240,480，720，,1080
      WY163: Word; // 搜索结果计数
  public
    var
      HTTP: TIdHTTP;
      SSL: TIdIOHandlerSocket;
      Key_Word: string; //搜索关键字
      Num: integer; //搜索数量
    constructor Create(S_Key_Word: string; S_Num: Integer); overload; //构造函数
  protected
    function AES_Params(i: integer; Video_HD: Integer; str: string): string; //根据需要的内容获取对应的POST参数，返回值为params
    function Post(url, params: string): string; //根据POST接口地址和POST内容获取返回值，返回值为JOSN
    function JO_Song_ID(jo_str: string): TStringList; //解析JSON获取歌曲ID列表
    function JO_SOng_Time(jo_str: string): TStringList; //解析JSON获取歌曲时长列表
    procedure Execute; override;
  end;

implementation

uses
  System.NetEncoding, Main;
{ Get_163_Info }

procedure Get_163_Info.Execute;
var(*线程内执行*)
  Params_Str: string;
  str163: string;
  jo163, item163: Isuperobject; // 网易音乐API
  Time_Ls: TStringList; // 网易数据列表
  vMsg: TSearch_163_Song_MSG;
begin
  FreeOnTerminate := true;
  OnTerminate := Fm_Main.Search_Over;
  WY163 := 0;
  Time_Ls := TStringList.Create; // 网易时间列表
  Params_Str := AES_Params(2, 720, Key_Word); //搜索获得歌曲列表的Params
  str163 := Post('http://music.163.com/weapi/cloudsearch/get/web?csrf_token=', Params_Str);
  jo163 := SO(str163);
  Time_Ls.Assign(JO_Song_TIME(str163)); // 网易音乐下载地址获取
  for item163 in jo163['result.songs'] do
  begin
    vMsg := TSearch_163_Song_MSG.Create;
    vMsg.Song_Name := jo163['result.songs[' + inttostr(WY163) + '].name'].AsString; // 歌名
    vMsg.Song_Album := jo163['result.songs[' + inttostr(WY163) + '].al.name'].AsString; // 专辑名
    vMsg.Song_Singer := jo163['result.songs[' + inttostr(WY163) + '].ar[0].name'].AsString; // 歌手名
    vMsg.Song_Time := inttostr(Trunc(strtofloat(Time_Ls[WY163]) / 1000)); //时长秒
    vMsg.Song_From := '2';
    vMsg.Song_Img := jo163['result.songs[' + inttostr(WY163) + '].al.picUrl'].AsString; // 图片
    vMsg.Song_ID := jo163['result.songs[' + inttostr(WY163) + '].id'].AsString; // ID
    vMsg.Song_AlbumID := jo163['result.songs[' + inttostr(WY163) + '].al.id'].AsString; //专辑ID
    vMsg.Song_SingerID := jo163['result.songs[' + inttostr(WY163) + '].ar[0].id'].AsString; //歌手ID
    vMsg.Song_MVID := jo163['result.songs[' + inttostr(WY163) + '].mv'].AsString; //歌MV_ID
    vMsg.Song_Lrc := '';
    GlobalVMsgMonitor.PostVMsg(vMsg); //发送消息
    inc(WY163);
  end;
//  Url_Ls.Free;
  Time_Ls.Free;
end;


function Get_163_Info.AES_Params(i: integer; Video_HD: Integer; str: string): string;
var  (*根据需要的内容获取对应的POST参数，返回值为2次加密后的params*)
  OneceEncode: string;
  TwiceEncode: string;
  strx: string;
begin
  case i of
    0:
      begin
      //post获取的歌曲id列表
        strx := '{"ids":"[' + str + ']","br":128000,"csrf_token":""}';
      end;
    1:
      begin
      //post获取的视频id列表
        strx := '{"id":"' + str + '","r":"' + inttostr(Video_HD) + '","csrf_token":""}';
      end;
    2:
      begin
        //post获取搜索歌名得到的歌曲列表
        strx := '{"hlpretag":"<span class=\"s-fc7\">","hlposttag":"</span>","s":"' + str + '","type":"1","offset":"0","total":"true","limit":"' + inttostr(NUM) + '","csrf_token":""}';
      end;
  end;
  OneceEncode := string(EncryptString(AnsiString(strx), OnceKey, kb128, amCBC, PKCS5Padding, '0102030405060708', ctBase64)); //第一次AES加密
  OneceEncode := stringreplace(OneceEncode, #13#10, '', [rfReplaceall]);
  TwiceEncode := string(EncryptString(AnsiString(OneceEncode), 'svoXIdz7ZwOI1bXm', kb128, amCBC, PKCS5Padding, '0102030405060708', ctBase64)); //第二次AES加密
  TwiceEncode := stringreplace(TwiceEncode, #13#10, '', [rfReplaceall]);
  result := TNetEncoding.URL.Encode(UTF8Encode(TwiceEncode));
end;

constructor Get_163_Info.Create(S_Key_Word: string; S_Num: Integer);
begin
  Key_Word := S_Key_Word; //搜索关键字
  Num := S_Num; //搜索数量
  inherited Create(false);
end;

function Get_163_Info.JO_Song_ID(jo_str: string): TStringList;
var(*解析JSON获取歌曲ID，返回值为歌曲ID列表*)
  jo163, item163: Isuperobject; // 网易音乐API
  jo_music: Isuperobject; // 下载地址
  ct163: Integer;
begin
  ct163 := 0;
  result := TStringList.Create;
  jo163 := so(jo_str);
  try
    for item163 in jo163['result.songs'] do
    begin
      jo_music := SO(Post(Music_Post, AES_Params(0, 0, jo163['result.songs[' + inttostr(ct163) + '].id'].AsString)));
      result.Add(jo_music['data[0].url'].AsString);
      inc(ct163);
    end;
  except
    begin
      //不做任何事
    end;
  end;
end;

function Get_163_Info.JO_SOng_Time(jo_str: string): TStringList;
var (*解析JSON获取歌曲时长，返回值为歌曲时长列表*)
  jo163, item163: Isuperobject;
  ct163: Integer;
begin
  ct163 := 0;
  result := TStringList.Create;
  jo163 := so(jo_str);
  try
    for item163 in jo163['result.songs'] do
    begin
      result.Add(jo163['result.songs[' + inttostr(ct163) + '].dt'].AsString);
      inc(ct163);
    end;
  except
    begin
      //不做任何事
    end;
  end;
end;

function Get_163_Info.Post(url, params: string): string;
var (*根据POST接口地址和POST内容获取返回值，返回值为JOSN*)
  st, stb: tstringstream;
begin
  HTTP := TIdHTTP.Create(nil);
  SSL := TIdIOHandlerSocket(nil);
  HTTP.IOHandler := SSL;
  st := tstringstream.Create;
  stb := tstringstream.Create('', tencoding.UTF8);
  st.WriteString('params=' + params + '&encSecKey=' + skey);
  HTTP.Request.ContentType := 'application/x-www-form-urlencoded';
  HTTP.Request.UserAgent := UserAgent;
  HTTP.Request.Referer := 'http://music.163.com/';
  HTTP.post(url, st, stb);
  result := stb.DataString;
  st.free;
  stb.free;
  HTTP.Free;
  SSL.Free;
end;

end.

