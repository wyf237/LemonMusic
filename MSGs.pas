unit MSGs;

interface

uses
  System.Classes, VMsgMonitor, Vcl.Graphics;

type
// 此部分用来传递每日推荐【歌单】的消息，开启线程获取每日推荐内容
  TQQ_Recom_List_MSG = class(TVMsg)
  private
    FName: string;
    FNum: string;
    FID: string;
    FImg: string;
  published
    property List_Name: string read FName write FName;
    property List_ID: string read FID write FID;
    property List_Num: string read FNum write FNum;
    property List_Img: string read FImg write FImg;
  end;

type
//此部分用来显示【歌单】列表的详细曲目
  TQQ_List_Song_MSG = class(TVMsg)
  private
    FSong_Info: array[0..12] of string;
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  published
    property Song_Name: string index 0 read GetValue write SetValue;
    property Song_Album: string index 1 read GetValue write SetValue;
    property Song_Singer: string index 2 read GetValue write SetValue;
    property Song_Time: string index 3 read GetValue write SetValue;
    property Song_From: string index 4 read GetValue write SetValue;
    property Song_Img: string index 5 read GetValue write SetValue;
    property Song_ID: string index 6 read GetValue write SetValue;
    property Song_AlbumID: string index 7 read GetValue write SetValue;
    property Song_SingerID: string index 8 read GetValue write SetValue;
    property Song_MVID: string index 9 read GetValue write SetValue;
    property Song_Lrc: string index 10 read GetValue write SetValue;
    property List_Title: string index 10 read GetValue write SetValue;
    property List_Des: string index 10 read GetValue write SetValue;
  end;

type
// 此部分用来传递每日推荐【专辑】的消息，开启线程获取每日推荐内容
  TQQ_Recom_Album_MSG = class(TVMsg)
  private
    FName: string;
    FSinger: string;
    FID: string;
    FImg: string;
  published
    property Album_Name: string read FName write FName;
    property Album_ID: string read FID write FID;
    property Album_Singer: string read FSinger write FSinger;
    property Album_Img: string read FImg write FImg;
  end;

type
//此部分用来显示【专辑】列表的详细曲目
  TQQ_Album_Song_MSG = class(TVMsg)
  private
    FSong_Info: array[0..10] of string;
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  published
    property Song_Name: string index 0 read GetValue write SetValue;
    property Song_Album: string index 1 read GetValue write SetValue;
    property Song_Singer: string index 2 read GetValue write SetValue;
    property Song_Time: string index 3 read GetValue write SetValue;
    property Song_From: string index 4 read GetValue write SetValue;
    property Song_Img: string index 5 read GetValue write SetValue;
    property Song_ID: string index 6 read GetValue write SetValue;
    property Song_AlbumID: string index 7 read GetValue write SetValue;
    property Song_SingerID: string index 8 read GetValue write SetValue;
    property Song_MVID: string index 9 read GetValue write SetValue;
    property Song_Lrc: string index 10 read GetValue write SetValue;
  end;

type
// 此部分用来传递每日推荐【歌曲】的消息，开启线程获取每日推荐内容
  TQQ_Recom_Song_MSG = class(TVMsg)
  private
    FSONG_Info: array[0..10] of string;
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  published
    property Song_Name: string index 0 read GetValue write SetValue;
    property Song_Album: string index 1 read GetValue write SetValue;
    property Song_Singer: string index 2 read GetValue write SetValue;
    property Song_Time: string index 3 read GetValue write SetValue;
    property Song_From: string index 4 read GetValue write SetValue;
    property Song_Img: string index 5 read GetValue write SetValue;
    property Song_ID: string index 6 read GetValue write SetValue;
    property Song_AlbumID: string index 7 read GetValue write SetValue;
    property Song_SingerID: string index 8 read GetValue write SetValue;
    property Song_MVID: string index 9 read GetValue write SetValue;
    property Song_Lrc: string index 10 read GetValue write SetValue;
  end;

type
//此部分用来搜索【QQ】歌曲，并将获得的内容返回到主界面，可以为正常搜索，或者推荐部分详细列表
  TSearch_QQ_Song_MSG = class(TVMsg)
  private
    FSong_Info: array[0..10] of string;
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  published
    property Song_Name: string index 0 read GetValue write SetValue;
    property Song_Album: string index 1 read GetValue write SetValue;
    property Song_Singer: string index 2 read GetValue write SetValue;
    property Song_Time: string index 3 read GetValue write SetValue;
    property Song_From: string index 4 read GetValue write SetValue;
    property Song_Img: string index 5 read GetValue write SetValue;
    property Song_ID: string index 6 read GetValue write SetValue;
    property Song_AlbumID: string index 7 read GetValue write SetValue;
    property Song_SingerID: string index 8 read GetValue write SetValue;
    property Song_MVID: string index 9 read GetValue write SetValue;
    property Song_Lrc: string index 10 read GetValue write SetValue;
  end;

type
//此部分用来搜索【网易】歌曲，并将获得的内容返回到主界面
  TSearch_163_Song_MSG = class(TVMsg)
  private
    FSong_Info: array[0..10] of string;
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  published
    property Song_Name: string index 0 read GetValue write SetValue;
    property Song_Album: string index 1 read GetValue write SetValue;
    property Song_Singer: string index 2 read GetValue write SetValue;
    property Song_Time: string index 3 read GetValue write SetValue;
    property Song_From: string index 4 read GetValue write SetValue;
    property Song_Img: string index 5 read GetValue write SetValue;
    property Song_ID: string index 6 read GetValue write SetValue;
    property Song_AlbumID: string index 7 read GetValue write SetValue;
    property Song_SingerID: string index 8 read GetValue write SetValue;
    property Song_MVID: string index 9 read GetValue write SetValue;
    property Song_Lrc: string index 10 read GetValue write SetValue;
  end;

type
//此部分用来搜索【酷我】歌曲，并将获得的内容返回到主界面
  TSearch_KuWo_Song_MSG = class(TVMsg)
  private
    FSong_Info: array[0..10] of string;
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  published
    property Song_Name: string index 0 read GetValue write SetValue;
    property Song_Album: string index 1 read GetValue write SetValue;
    property Song_Singer: string index 2 read GetValue write SetValue;
    property Song_Time: string index 3 read GetValue write SetValue;
    property Song_From: string index 4 read GetValue write SetValue;
    property Song_Img: string index 5 read GetValue write SetValue;
    property Song_ID: string index 6 read GetValue write SetValue;
    property Song_AlbumID: string index 7 read GetValue write SetValue;
    property Song_SingerID: string index 8 read GetValue write SetValue;
    property Song_MVID: string index 9 read GetValue write SetValue;
    property Song_Lrc: string index 10 read GetValue write SetValue;
  end;

type
//此部分用来搜索【酷狗】歌曲，并将获得的内容返回到主界面
  TSearch_KuGou_Song_MSG = class(TVMsg)
  private
    FSong_Info: array[0..10] of string;
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  published
    property Song_Name: string index 0 read GetValue write SetValue;
    property Song_Album: string index 1 read GetValue write SetValue;
    property Song_Singer: string index 2 read GetValue write SetValue;
    property Song_Time: string index 3 read GetValue write SetValue;
    property Song_From: string index 4 read GetValue write SetValue;
    property Song_Img: string index 5 read GetValue write SetValue;
    property Song_ID: string index 6 read GetValue write SetValue;
    property Song_AlbumID: string index 7 read GetValue write SetValue;
    property Song_SingerID: string index 8 read GetValue write SetValue;
    property Song_MVID: string index 9 read GetValue write SetValue;
    property Song_Lrc: string index 10 read GetValue write SetValue;
  end;

type
//此部分用来搜索【QQ】【MV】，并将获得的内容返回到主界面
  TQQ_Recom_MV_MSG = class(TVMsg)
  private
    FMV_Info: array[0..8] of string;
    FMV_Pic: TMemoryStream; //图片流
    function GetValue(index: integer): string;
    procedure SetValue(index: Integer; Value: string);
  public
    constructor Create; overload;
    destructor Destory; overload;
  published
    property MV_Name: string index 0 read GetValue write SetValue;
    property MV_Singer: string index 1 read GetValue write SetValue;
    property MV_From: string index 2 read GetValue write SetValue;
    property MV_Img: string index 3 read GetValue write SetValue;
    property MV_SingerID: string index 4 read GetValue write SetValue;
    property MV_MVID: string index 5 read GetValue write SetValue;
    property MV_Des: string index 6 read GetValue write SetValue;
    property MV_Pub: string index 7 read GetValue write SetValue;
    property MV_No: string index 8 read GetValue write SetValue;
    property MV_Pic: TMemoryStream read FMV_Pic write FMV_Pic;
  end;

implementation


{ TSearch_Song_MSG }

function TSearch_QQ_Song_MSG.GetValue(index: integer): string;
begin
  Result := FSong_Info[index];
end;

procedure TSearch_QQ_Song_MSG.SetValue(index: Integer; Value: string);
begin
  FSong_Info[index] := Value;
end;

{ TQQ_Recom_Songs_MSG }

function TQQ_List_Song_MSG.GetValue(index: integer): string;
begin
  Result := FSong_Info[index];
end;

procedure TQQ_List_Song_MSG.SetValue(index: Integer; Value: string);
begin
  FSong_Info[index] := Value;
end;

{ TSearch_163_Song_MSG }

function TSearch_163_Song_MSG.GetValue(index: integer): string;
begin
  Result := FSong_Info[index];
end;

procedure TSearch_163_Song_MSG.SetValue(index: Integer; Value: string);
begin
  FSong_Info[index] := Value;
end;

{ TSearch_KuWo_Song_MSG }

function TSearch_KuWo_Song_MSG.GetValue(index: integer): string;
begin
  Result := FSong_Info[index];
end;

procedure TSearch_KuWo_Song_MSG.SetValue(index: Integer; Value: string);
begin
  FSong_Info[index] := Value;
end;

{ TSearch_KuGou_Song_MSG }

function TSearch_KuGou_Song_MSG.GetValue(index: integer): string;
begin
  Result := FSong_Info[index];
end;

procedure TSearch_KuGou_Song_MSG.SetValue(index: Integer; Value: string);
begin
  FSong_Info[index] := Value;
end;

{ TAlbum_Song_MSG }

function TQQ_Album_Song_MSG.GetValue(index: integer): string;
begin
  Result := FSong_Info[index];
end;

procedure TQQ_Album_Song_MSG.SetValue(index: Integer; Value: string);
begin
  FSong_Info[index] := Value;
end;

{ TQQ_Recom_MV_MSG }

constructor TQQ_Recom_MV_MSG.Create;
begin
  FMV_Pic := TMemoryStream.Create; //图片流
end;

destructor TQQ_Recom_MV_MSG.Destory;
begin
  FMV_Pic.Free;
end;

function TQQ_Recom_MV_MSG.GetValue(index: integer): string;
begin
  Result := FMV_Info[index];
end;

procedure TQQ_Recom_MV_MSG.SetValue(index: Integer; Value: string);
begin
  FMV_Info[index] := Value;
end;

{ TQQ_Recom_Song_MSG }

function TQQ_Recom_Song_MSG.GetValue(index: integer): string;
begin
  Result := FSONG_Info[index];
end;

procedure TQQ_Recom_Song_MSG.SetValue(index: Integer; Value: string);
begin
  FSONG_Info[index] := Value;
end;

end.

