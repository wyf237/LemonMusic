(**************************************************)
(*                                                *)
(*         本单元用于操作XML作为歌曲列表          *)
(*                                                *)
(*              Copyright (c) 2019                *)
(*                     南烛                       *)
(*                                                *)
(**************************************************)
unit XMLX;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  NxControls6, NxVirtualGrid6, NxGrid6, dxmdaset,ActiveX;

type
  XML_RW = class
  public
    procedure CreateXml; // 创建列表XML
    function AddNewList(TCOM: TControl; List_Name: string): boolean; // 创建新列表
    function AddSongs(TCOM: TControl; ListName: string; Music_Info: array of string): boolean; // 向列表写入歌曲信息
    procedure DelSongs(TCOM: TControl; NodeText, SearchText: string); // 删除歌单歌曲

    function Show_List(TCOM: TControl): TStringList; // 显示自定义列表
//    function Add_Song_List(TCOM: TControl; LB: TscGPListBox; ListName: string): TStringList; // 把歌曲添加到播放列表
  end;

type
  ShowList = class(TThread)
  private
    var
      Filed_ID, Song_Name, Song_Album, Song_Singer, Song_Time, Song_Img, Song_Url, Song_ID, Song_From: string;
  public
    var
      TCOM_S: TControl;
      NG_S: TNextGrid6;
      MEM_S: TdxMemData;
    // function ShowSongs(TCOM: TControl; NG: TNextGrid6; MEM: TdxMemData): string; // 显示歌曲列表
    constructor Create(TCOM: TControl; NG: TNextGrid6; MEM: TdxMemData); overload; // 构造函数
  protected
    procedure Add_To; // 显示歌曲到到列表
    procedure Execute; override;
  end;

implementation

uses
  InfoFromID, Main, List;

{// 把歌曲添加到播放列表
function XML_RW.Add_Song_List(TCOM: TControl; LB: TscGPListBox; ListName: string): TStringList;
var
  XMLDoc: TXMLDocument;
  FileName: string;
  NodeList, SongList: IXMLNodeList;
  i: Integer;
begin
  result := TStringList.Create;
  FileName := ExtractFileDir(ParamStr(0)) + '\MusicList.xml';
  if FileExists(FileName) then // 如果文件存在
  begin
    XMLDoc := TXMLDocument.Create(TCOM);
    XMLDoc.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
    XMLDoc.Active := True;
    NodeList := XMLDoc.DocumentElement.ChildNodes; // 对应根节点下子节点列表
    for i := 0 to NodeList.Count - 1 do
    begin
      if NodeList[i].AttributeNodes[0].Text = ListName then
      begin
        SongList := NodeList[i].ChildNodes;
      end;
    end;
    for i := 0 to SongList.Count - 1 do
    begin
      with LB.Items.Add do
      begin
        Caption := SongList[i].ChildNodes['Name'].Text;
        Detail := SongList[i].ChildNodes['Singer'].Text;
        result.Add(SongList[i].ChildNodes['Url'].Text);
        if SongList[i].ChildNodes['From'].Text = '某易' then
          ImageIndex := 0;
        if SongList[i].ChildNodes['From'].Text = '某Q' then
          ImageIndex := 1;
        if SongList[i].ChildNodes['From'].Text = '某狗' then
          ImageIndex := 2;
        if SongList[i].ChildNodes['From'].Text = '某我' then
          ImageIndex := 3;
        if SongList[i].ChildNodes['From'].Text = '某度' then
          ImageIndex := 4;
        if SongList[i].ChildNodes['From'].Text = '某豆' then
          ImageIndex := 5;
        if SongList[i].ChildNodes['From'].Text = '某咪' then
          ImageIndex := 6;
      end;
    end;
    XMLDoc.Free;
  end;
end;
*/}
procedure ShowList.Add_To;
begin
  with MEM_S do
  begin
    Open;
    Append;
    FieldByName('S_ID').AsString := Filed_ID; // 序号
    FieldByName('S_Name').AsString := Song_Name; // 歌名
    FieldByName('S_Album').AsString := Song_Album; // 专辑
    FieldByName('S_Singer').AsString := Song_Singer; // 歌手
    FieldByName('S_Time').AsString := Song_Time; // 时长
    FieldByName('S_From').AsString := Song_From; // 来源
    FieldByName('S_Url').AsString := Song_Url; // 下载地址
    FieldByName('S_Img').AsString := Song_Img; // 图片地址
    FieldByName('S_MusicId').AsString := Song_ID; // 歌曲ID
    Post;
  end;
  with NG_S.AddRow.Cells do
  begin
    Item[1].AsString := Filed_ID;
    Item[2].AsString := Song_Name;
    Item[3].AsString := Song_Album;
    Item[4].AsString := Song_Singer;
    Item[5].AsString := Song_Time;
    Item[6].AsString := Song_From;
    Item[7].AsString := Song_Url;
    Item[8].AsString := Song_Img;
    Item[9].AsString := Song_ID;
    // Item[10].AsString := SongList[i].ChildNodes['SingerID'].Text;
    // Item[10].AsString := SongList[i].ChildNodes['AlbumID'].Text;
    // Item[10].AsString := SongList[i].ChildNodes['MVID'].Text;
  end;
end;

constructor ShowList.Create(TCOM: TControl; NG: TNextGrid6; MEM: TdxMemData);
begin
  TCOM := TCOM_S;
  NG := NG_S;
  MEM := MEM_S;
  inherited Create(True);
end;

// 显示歌曲列表
procedure ShowList.Execute;
var
  XMLDoc: TXMLDocument;
  NodeList, SongList: IXMLNodeList;
  FileName: string;
  i, Index: Integer;
  gt: GetFromId;
begin
  FreeOnTerminate := True;
  FileName := ExtractFileDir(ParamStr(0)) + '\MusicList.xml';
  if FileExists(FileName) then // 如果文件存在
  begin
    CoInitialize(nil);
    try
    XMLDoc := TXMLDocument.Create(TCOM_S);
    XMLDoc.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
    XMLDoc.Active := True;
    NodeList := XMLDoc.DocumentElement.ChildNodes; // 对应根节点下子节点列表
    for i := 0 to NodeList.Count - 1 do
    begin
      if NodeList[i].AttributeNodes[0].Text = 'PlayList' then
      begin
        SongList := NodeList[i].ChildNodes;
      end;
    end;
    MEM_S.Open;
    MEM_S.First;
    for i := 0 to SongList.Count - 1 do
    begin
      case strtoint(SongList[i].ChildNodes['From'].Text) of
        1: // QQ音乐
          begin
            gt := GetFromId.Create(SongList[i].ChildNodes['ID'].Text);
            Song_Url := gt.GetFromId_QQ;
            gt.Free;
          end;
        2: // 网易音乐
          begin
            gt := GetFromId.Create(SongList[i].ChildNodes['ID'].Text);
            Song_Url := gt.GetFromId_WangYi;
            gt.Free;
          end;
        3: // 酷狗音乐
          begin
            gt := GetFromId.Create(SongList[i].ChildNodes['ID'].Text);
            Song_Url := gt.GetFromId_KuGou;
            gt.Free;
          end;
        4: // 酷我音乐
          begin
            gt := GetFromId.Create(SongList[i].ChildNodes['ID'].Text);
            Song_Url := gt.GetFromId_Kuwo;
            gt.Free;
          end;
      end;
      Filed_ID := inttostr(i + 1);
      Song_Name := SongList[i].ChildNodes['Name'].Text;
      Song_Album := SongList[i].ChildNodes['Album'].Text;
      Song_Singer := SongList[i].ChildNodes['Singer'].Text;
      Song_Time := SongList[i].ChildNodes['Time'].Text;
      Song_Img := SongList[i].ChildNodes['Img'].Text;
      Song_ID := SongList[i].ChildNodes['ID'].Text;
      Song_From := SongList[i].ChildNodes['From'].Text;
    end;
    Synchronize(Add_To);
    Fm_Main.BTN_PlayList.Caption := inttostr(SongList.Count);
    XMLDoc.Free;
    finally
      CoUninitialize;
    end;
  end;
end;

// 创建新的XML，在文件被删除的情况下创建<Down>
procedure XML_RW.CreateXml;
var
  Root, PlayList, DownLoadList: IXmlNode;
  NewXml: IXmlDocument;
begin
  NewXml := NewXmlDocument();
  try
    NewXml.Encoding := 'UTF-8';
    Root := NewXml.AddChild('Lists');
    PlayList := Root.AddChild('MusicList'); // 创建时自动创建一个播放列表节点
    PlayList.Attributes['ListName'] := 'PlayList'; // 列表节点备注
    // DownLoadList := Root.AddChild('MusicList'); // 创建时自动创建一个下载列表节点
    // DownLoadList.Attributes['ListName'] := 'DownLoadList'; // 列表节点备注
    NewXml.SaveToFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
  finally
    NewXml := nil;
  end;
end;

// 向列表写入歌曲信息<Down>
function XML_RW.AddSongs(TCOM: TControl; ListName: string; Music_Info: array of string): boolean;
var
  Songs: IXmlNode;
  Music_Node: array[0..9] of IXmlNode;
  XMLDoc: TXMLDocument;
  FileName: string;
  NodeList: IXMLNodeList; // 存储根节点下的子节点列表，用于查找曲目列表是否存在
  i: Integer; // 计数变量
begin
  result := false;
  FileName := ExtractFileDir(ParamStr(0)) + '\MusicList.xml';
  if not FileExists(FileName) then // 如果文件不存在，那么创建一个
  begin
    CreateXml; // 如果不存在，那么先创建
  end;
  XMLDoc := TXMLDocument.Create(TCOM);
  XMLDoc.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
  XMLDoc.Active := True; // 连接XML文件
  NodeList := XMLDoc.DocumentElement.ChildNodes; // 对应根节点下子节点列表
  for i := 0 to NodeList.Count - 1 do
  begin
    try
      if NodeList[i].AttributeNodes[0].Text = ListName then // 如果该节点存在
      begin
        Songs := NodeList[i].AddChild('Songs'); // 添加主节点名
        Music_Node[0] := Songs.AddChild('From'); // 来源
        Music_Node[0].Text := Music_Info[0];
        Music_Node[1] := Songs.AddChild('Name'); // 歌名
        Music_Node[1].Text := Music_Info[1];
        Music_Node[2] := Songs.AddChild('Album'); // 专辑
        Music_Node[2].Text := Music_Info[2];
        Music_Node[3] := Songs.AddChild('Singer'); // 歌手
        Music_Node[3].Text := Music_Info[3];
        Music_Node[4] := Songs.AddChild('Time'); // 时长
        Music_Node[4].Text := Music_Info[4];
        Music_Node[5] := Songs.AddChild('Img'); // 图片
        Music_Node[5].Text := Music_Info[5];
        Music_Node[6] := Songs.AddChild('ID'); // 歌曲ID
        Music_Node[6].Text := Music_Info[6];
        Music_Node[7] := Songs.AddChild('SingerID'); // 歌手ID
        Music_Node[7].Text := Music_Info[7];
        Music_Node[8] := Songs.AddChild('AlbumID'); // 专辑ID
        Music_Node[8].Text := Music_Info[8];
        Music_Node[9] := Songs.AddChild('MVID'); // MV ID
        Music_Node[9].Text := Music_Info[9];
        XMLDoc.SaveToFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
        result := True;
        Break;
      end; // 如果不存在则提示
    except

    end;
  end;
  XMLDoc.Free;
end;

// 创建新列表，在新建个人列表的时候创建
function XML_RW.AddNewList(TCOM: TControl; List_Name: string): boolean;
var
  NewList: IXmlNode;
  XMLDoc: TXMLDocument;
  FileName: string;
  NodeList: IXMLNodeList; // 存储根节点下的子节点列表，用于查找曲目列表是否存在
  i: Integer; // 计数变量
  bo: boolean;
begin
  bo := True;
  result := false;
  FileName := ExtractFileDir(ParamStr(0)) + '\MusicList.xml';
  if not FileExists(FileName) then // 如果文件不存在，那么创建一个
  begin
    CreateXml;
  end;
  XMLDoc := TXMLDocument.Create(TCOM);
  XMLDoc.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
  XMLDoc.Active := True;
  NodeList := XMLDoc.DocumentElement.ChildNodes; // 对应根节点下子节点列表
  for i := 0 to NodeList.Count - 1 do
  begin
    try
      if NodeList[i].AttributeNodes[0].Text = List_Name then
      begin
        bo := false;
      end;
    finally

    end;
  end;
  if bo then
  begin
    NewList := XMLDoc.DocumentElement.AddChild('MusicList'); // 添加列表节点
    NewList.Attributes['ListName'] := List_Name; // 列表节点备注
    XMLDoc.SaveToFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
    result := bo;
  end;
  XMLDoc.Free;
end;

// 删除歌单里的歌曲<Down>
procedure XML_RW.DelSongs(TCOM: TControl; NodeText, SearchText: string);
var
  XMLDoc: TXMLDocument;
  FileName: string;
  NodeList: IXMLNodeList;
  i: Integer;
begin
  FileName := ExtractFileDir(ParamStr(0)) + '\MusicList.xml';
  if FileExists(FileName) then // 如果文件存在
  begin
    XMLDoc := TXMLDocument.Create(TCOM);
    XMLDoc.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
    XMLDoc.Active := True;
    for i := 0 to XMLDoc.DocumentElement.ChildNodes.Count - 1 do
    begin
      if XMLDoc.DocumentElement.ChildNodes[i].AttributeNodes[0].Text = NodeText then
      begin
        NodeList := XMLDoc.DocumentElement.ChildNodes[i].ChildNodes;
      end;
    end;
  end;
  for i := 0 to NodeList.Count - 1 do
  begin
    if NodeList[i].ChildNodes['ID'].Text = SearchText then
    begin
      NodeList.Delete(i);
      XMLDoc.SaveToFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
      Exit;
    end;
  end;
  XMLDoc.SaveToFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
end;

// 显示自定义列表
function XML_RW.Show_List(TCOM: TControl): TStringList;
var
  XMLDoc: TXMLDocument;
  FileName: string;
  i: Integer;
begin
  result := TStringList.Create;
  FileName := ExtractFileDir(ParamStr(0)) + '\MusicList.xml';
  if FileExists(FileName) then // 如果文件存在
  begin
    XMLDoc := TXMLDocument.Create(TCOM);
    XMLDoc.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\MusicList.xml');
    XMLDoc.Active := True;
    for i := 0 to XMLDoc.DocumentElement.ChildNodes.Count - 1 do
    begin
      if (XMLDoc.DocumentElement.ChildNodes[i].AttributeNodes[0].Text <> 'LikeList') and (XMLDoc.DocumentElement.ChildNodes[i].AttributeNodes[0].Text <> 'DownLoadList') then
      begin
        result.Add(XMLDoc.DocumentElement.ChildNodes[i].AttributeNodes[0].Text);
      end;
    end;
  end;
end;

end.

