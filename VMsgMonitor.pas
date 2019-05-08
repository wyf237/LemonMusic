{-----------------------------------------------------------------------------
-----------------------回调函数转消息的基类和监控器---------------------------
-----------------------------------------------------------------------------}
unit VMsgMonitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Contnrs, TypInfo, SyncObjs;

type
  //所有消息的基类
  TVMsg = class(TPersistent)
  private
    FHandled: Boolean;
    FNeedFree: Boolean;
    FReturn: Integer;
  public
    constructor Create; virtual;
    procedure Assign(Source: TPersistent); override;
    function Clone: TVMsg;
  published
    property Handled: Boolean read FHandled write FHandled;
    property NeedFree: Boolean read FNeedFree write FNeedFree;
    property Return: Integer read FReturn write FReturn;
  end;

  //所有Stream消息的基类
  TBaseStreamVMsg = class(TVMsg)
  private
    FStream: TMemoryStream;
    function GetDataLen: Integer;
    function GetDataMem: Pointer;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure WriteData(ADataMem: Pointer; ADataLen: Integer);
    property DataLen: Integer read GetDataLen;
    property DataMem: Pointer read GetDataMem;
  end;
  TUploadFileMsg = class (TVMsg)
  private
    FFileId:Integer;
  public
    property FileId: Integer read FFileId write FFileId;
  end;
  //所有具有附加对象的Stream消息的基类
  TBaseAttachObjectStreamVMsg = class(TBaseStreamVMsg)
  private
    FAttachedObject: TObject;
    FOwnsObject: Boolean;
  public
    destructor Destroy; override;
    procedure AttachObject(AObject: TObject; AOwnsObject: Boolean);
    property AttachedObject: TObject read FAttachedObject;
  end;

  TVMsgClass = class of TVMsg;
  
  TVMsgHandlerEvent = procedure(Sender: TObject; AMsg: TVMsg) of object;

  //消息处理函数类
  TVMsgHandler = class(TObject)
  private
    FEvent: TVMsgHandlerEvent;
    FOwner: TObject;
    FOwnerClassName: WideString;
  public
    constructor Create(AOwner: TObject);
    procedure Execute(AMsg: TVMsg);
    property Owner: TObject read FOwner;
    property OwnerClassName: WideString read FOwnerClassName;
    property Event: TVMsgHandlerEvent read FEvent write FEvent;
  end;

  //消息处理函数对象列表
  TVMsgHandlerList = class(TObjectList)
  private
    function GetItems(Index: Integer): TVMsgHandler;
  public
    procedure Execute(AMsg: TVMsg);
    function FindOrNew(AOwner: TObject): TVMsgHandler;
    function IndexOfOwner(AOwner: TObject): Integer;
    procedure RemoveOwner(AOwner: TObject);
    property Items[Index: Integer]: TVMsgHandler read GetItems; default;
  end;

  //消息监听器(一个消息下可以挂多个消息处理函数)
  TVMsgListener = class(TObject)
  private
    FHandlerList: TVMsgHandlerList;
    FVMsgClass: TVMsgClass;
  public
    constructor Create(AMsgClass: TVMsgClass);
    destructor Destroy; override;
    procedure DispatchMsg(AMsg: TVMsg; AOwner: TObject = nil);
    property HandlerList: TVMsgHandlerList read FHandlerList;
    property VMsgClass: TVMsgClass read FVMsgClass;
  end;

  //消息监听器列表
  TVMsgListenerList = class(TObjectList)
  private
    function FindOrNew(AClass: TVMsgClass): TVMsgListener;
    function GetItems(Index: Integer): TVMsgListener;
  protected
    procedure DispatchMsg(AMsg: TVMsg; AOwner: TObject = nil);
  public
    procedure RegMsg(AOwner: TObject; AClass: TVMsgClass;
      AEvent: TVMsgHandlerEvent);
    destructor Destroy; override;
    function IndexOfVMsgClass(AClass: TClass): Integer;
    procedure RemoveOwner(AOwner: TObject; AClass: TVMsgClass = nil);
    property Items[Index: Integer]: TVMsgListener read GetItems; default;
  end;

  TLogTypeEnum = (
    lteSend,
    lteRecv
  );

  TLogEvent = procedure(Sender: TObject; AType: TLogTypeEnum;
    const AText: WideString; ADataMem: Pointer; ADataLen: Integer) of object;

  TVMsgMonitor = class(TObject)
  private
    FInterWindow: HWND;
    FListenerList: TVMsgListenerList;
    FLock: TCriticalSection;
    FMessageID: Cardinal;
    FOnLog: TLogEvent;
    FRecvMsgsStoped: Boolean;
    procedure DoLog(AType: TLogTypeEnum; const AText: WideString;
      ADataMem: Pointer; ADataLen: Integer);
  protected
    procedure InterWindowProc(var AMsg: TMessage);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LogRecv(const S: WideString; ADataMem: Pointer = nil;
      ADataLen: Integer = 0); 
    procedure LogSend(const S: WideString; ADataMem: Pointer = nil;
      ADataLen: Integer = 0);
    procedure PostVMsg(AMsg: TVMsg); overload;
    procedure PostVMsg(AMsgClass: TVMsgClass); overload;
    procedure RegMsg(AOwner: TObject; AClass: TVMsgClass;
      AEvent: TVMsgHandlerEvent);
    procedure RemoveOwner(AOwner: TObject);
    function SendVMsg(AMsg: TVMsg): Integer;
    procedure StopRecvMsgs;
  published
    property OnLog: TLogEvent read FOnLog write FOnLog;
  end;

function GlobalVMsgMonitor: TVMsgMonitor;

implementation

const
  conVMsgMessageIDString = '{2373A24F-386A-444F-9FC3-F7BE3C1B89DF}';

var
  gVMsgMonitor: TVMsgMonitor;

{-----------------------------------------------------------------------------
---------------------------全局消息监听器列表---------------------------------
-----------------------------------------------------------------------------}
function GlobalVMsgMonitor: TVMsgMonitor;
begin
  if gVMsgMonitor = nil then
    gVMsgMonitor := TVMsgMonitor.Create;
  Result := gVMsgMonitor;
end;

{ TVMsg }

constructor TVMsg.Create;
begin
  FHandled := False;
  FReturn := 0;
  FNeedFree := True;
end;

{-----------------------------------------------------------------------------
---------------基类实现复制即可, 派生类可以少写很多实现复制的代码-------------
-----------------------------------------------------------------------------}
procedure TVMsg.Assign(Source: TPersistent);
var
  I, nCount: Integer;
  PropList: PPropList;
  PropInfo: PPropInfo;
  strValueW: WideString;
  nValue: Integer;
  dValue: Extended;
  nValue64: Int64;
  strPropName: WideString;
begin
  if not (Source is TVMsg) then
  begin
    inherited Assign(Source);
    Exit;
  end;
  nCount := GetTypeData(Self.ClassInfo)^.PropCount;
  if nCount > 0 then
  begin
    GetMem(PropList, nCount * SizeOf(Pointer));
    try
      GetPropInfos(Self.ClassInfo, PropList);
      for I := 0 to nCount - 1 do
      begin
        PropInfo := PropList^[I];
        if PropInfo = nil then
          Continue;

        if (PropInfo^.PropType^.Kind <> tkClass) and (PropInfo^.SetProc = nil) then
          Continue;

        {$WARNINGS OFF}
        strPropName := PropInfo^.Name;
        {$WARNINGS ON}

        if not IsPublishedProp(Source, strPropName) then Continue;

        case PropInfo^.PropType^.Kind of
          tkClass:  //对象
          begin
            Assert(False);
          end;

          tkInteger, tkChar, tkWChar:  //整型
          begin
            nValue := GetOrdProp(Source, strPropName);
            SetOrdProp(Self, PropInfo, nValue);
          end;

          tkEnumeration:  //枚举
          begin
            strValueW := GetEnumProp(Source, strPropName);
            SetEnumProp(Self, PropInfo, strValueW);
          end;

          tkSet:   //集合
          begin
            strValueW := GetSetProp(Source, strPropName);
            SetSetProp(Self, PropInfo, strValueW);
          end;

          tkFloat: //浮点型
          begin
            dValue := GetFloatProp(Source, strPropName);
            SetFloatProp(Self, PropInfo, dValue);
          end;

          tkString, tkLString: //Ansi字符串
          begin
            strValueW := GetStrProp(Source, strPropName);
            SetStrProp(Self, PropInfo, strValueW);
          end;

          {$IFDEF UNICODE}
          tkUString:
          begin
            strValueW := GetUnicodeStrProp(Source, strPropName);
            SetUnicodeStrProp(Self, PropInfo, strValueW);
          end;
          {$ENDIF}

          tkWString:   //宽字符串
          begin
            strValueW := GetWideStrProp(Source, strPropName);
            TypInfo.SetWideStrProp(Self, PropInfo, strValueW);
          end;

          tkInt64:   //64位整型
          begin
            nValue64 := GetInt64Prop(Source, strPropName);
            SetInt64Prop(Self, PropInfo, nValue64);
          end;

          tkMethod:
          begin
            //DoNoting;
          end;

          else
            Assert(False);
        end;
      end;
    finally
      FreeMem(PropList, nCount * SizeOf(Pointer));
    end;
  end;
end;

{-----------------------------------------------------------------------------
----------------------------------克隆一个消息--------------------------------
-----------------------------------------------------------------------------}
function TVMsg.Clone: TVMsg;
begin
  Result := TVMsg(Self.ClassType.NewInstance);
  Result.Create;
  Result.Assign(Self);
end;

{ TVMsgHandler }

constructor TVMsgHandler.Create(AOwner: TObject);
begin
  FOwner := AOwner;
  Assert(FOwner <> nil);
  FOwnerClassName := FOwner.ClassName;
end;

procedure TVMsgHandler.Execute(AMsg: TVMsg);
begin
  if Assigned(FEvent) then
    FEvent(Self, AMsg);
end;

{-----------------------------------------------------------------------
----------------------------------分派消息------------------------------
-----------------------------------------------------------------------}
procedure TVMsgHandlerList.Execute(AMsg: TVMsg);
var
  oListBk: TObjectList;
  I, nIndex: Integer;
begin
  oListBk := TObjectList.Create(False);
  try
    for I := 0 to Self.Count - 1 do
      oListBk.Add(Self[I]);

    for I := 0 to oListBk.Count - 1 do
    begin
      nIndex := Self.IndexOf(oListBk[I]);
      if nIndex <> -1 then
      begin
        Self.Items[nIndex].Execute(AMsg);
        if AMsg.Handled then
          Break;
      end;
    end;
  finally
    oListBk.Free;
  end;
end;

{-----------------------------------------------------------------------------
---------------根据拥有者查找,如果没有找到,则自动新建一个---------------------
-----------------------------------------------------------------------------}
function TVMsgHandlerList.FindOrNew(AOwner: TObject): TVMsgHandler;
var
  nIndex: Integer;
begin
  nIndex := IndexOfOwner(AOwner);
  if nIndex = -1 then
  begin
    Result := TVMsgHandler.Create(AOwner);
    Self.Add(Result);
  end
  else
    Result := Items[nIndex];
end;

function TVMsgHandlerList.GetItems(Index: Integer): TVMsgHandler;
begin
  Result := TVMsgHandler(inherited Items[Index]);
end;

{-----------------------------------------------------------------------------
---------------------------------根据拥有者索引-------------------------------
-----------------------------------------------------------------------------}
function TVMsgHandlerList.IndexOfOwner(AOwner: TObject): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
    if Items[I].Owner = AOwner then
    begin
      Result := I;
      Break;
    end;
end;

{-----------------------------------------------------------------------------
----------------------------移除拥有者----------------------------------------
-----------------------------------------------------------------------------}
procedure TVMsgHandlerList.RemoveOwner(AOwner: TObject);
var
  nIndex: Integer;
begin
  nIndex := IndexOfOwner(AOwner);
  if nIndex <> -1 then
    Delete(nIndex);
end;

{ TVMsgListener }

constructor TVMsgListener.Create(AMsgClass: TVMsgClass);
begin
  FHandlerList := TVMsgHandlerList.Create(True);
  FVMsgClass := AMsgClass;
end;

destructor TVMsgListener.Destroy;
begin
  FreeAndNil(FHandlerList);
  inherited;
end;

{-----------------------------------------------------------------------------
--------------------------分派消息命令----------------------------------------
-----------------------------------------------------------------------------}
procedure TVMsgListener.DispatchMsg(AMsg: TVMsg; AOwner: TObject = nil);
var
  nIndex: Integer;
  oHandler: TVMsgHandler;
begin
  if AOwner <> nil then
  begin
    nIndex := HandlerList.IndexOfOwner(AOwner);
    if nIndex <> -1 then
    begin
      oHandler := HandlerList[nIndex];
      oHandler.Execute(AMsg);
    end;
  end
  else begin
    HandlerList.Execute(AMsg);
  end;
end;

destructor TVMsgListenerList.Destroy;
{$IFDEF DebugMode}
var
  I, J: Integer;
  S, strText: WideString;
  oList: TStrings;
{$ENDIF}
begin
  {$IFDEF DebugMode}
  oList := TStringList.Create;
  try
    for I := 0 to Self.Count - 1 do
      for J := 0 to Items[I].HandlerList.Count - 1 do
      begin
        S := Items[I].HandlerList[J].OwnerClassName;
        if oList.IndexOf(S) = -1 then
          oList.Add(S);
      end;

    if oList.Count > 0 then
    begin
      strText := WideFormat('在 %s 中以下类没有 RemoveOwner：'#13#10#13#10'%s',
        [Self.ClassName, oList.Text]);
      MessageBoxW(0, PWChar(strText), '警告', MB_ICONWARNING or MB_OK);
    end;
  finally
    oList.Free;
  end;
  {$ENDIF}  
  inherited;
end;

{-----------------------------------------------------------------------------
------------------分发消息命令到指定的拥有者的消息命令处理函数----------------
-----------------------------------------------------------------------------}
procedure TVMsgListenerList.DispatchMsg(AMsg: TVMsg; AOwner: TObject = nil);
var
  nIndex: Integer;
  oListener: TVMsgListener;
begin
  nIndex := IndexOfVMsgClass(AMsg.ClassType);
  if nIndex <> -1 then
  begin
    oListener := Items[nIndex];
    oListener.DispatchMsg(AMsg, AOwner);
  end;
end;

{ TVMsgListenerList }

{-----------------------------------------------------------------------------
---------------根所消息命令类查找,如果没找到,则自动创建一个-------------------
-----------------------------------------------------------------------------}
function TVMsgListenerList.FindOrNew(AClass: TVMsgClass): TVMsgListener;
var
  nIndex: Integer;
begin
  nIndex := IndexOfVMsgClass(AClass);
  if nIndex = -1 then
  begin
    Result := TVMsgListener.Create(AClass);
    Self.Add(Result);
  end
  else
    Result := Items[nIndex];
end;

function TVMsgListenerList.GetItems(Index: Integer): TVMsgListener;
begin
  Result := TVMsgListener(inherited Items[Index]);
end;

{-----------------------------------------------------------------------------
------------------------------根据消息命令类索引------------------------------
-----------------------------------------------------------------------------}
function TVMsgListenerList.IndexOfVMsgClass(AClass: TClass): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Count - 1 do
    if Items[I].VMsgClass = AClass then
    begin
      Result := I;
      Break;
    end;
end;

{ TVMsgHandlerList }

{-----------------------------------------------------------------------------
------------------------注册消息命令处理函数----------------------------------
-----------------------------------------------------------------------------}
procedure TVMsgListenerList.RegMsg(AOwner: TObject; AClass: TVMsgClass;
  AEvent: TVMsgHandlerEvent);
var
  oListener: TVMsgListener;
  oHandler: TVMsgHandler;
begin
  oListener := FindOrNew(AClass);
  oHandler := oListener.HandlerList.FindOrNew(AOwner);
  oHandler.Event := AEvent;
end;

{-----------------------------------------------------------------------------
--------------------从所有的消息命令中移除拥有者------------------------------
-----------------------------------------------------------------------------}
procedure TVMsgListenerList.RemoveOwner(AOwner: TObject;
  AClass: TVMsgClass = nil);
var
  I: Integer;
  oListener: TVMsgListener;
begin
  for I := Count - 1 downto 0 do
  begin
    oListener := Items[I];

    if AClass <> nil then
    begin
      if oListener.VMsgClass <> AClass then
        Continue;
    end;

    oListener.HandlerList.RemoveOwner(AOwner);
    if oListener.HandlerList.Count = 0 then
      Delete(I);
  end;
end;

constructor TVMsgMonitor.Create;
begin
  inherited;
  FListenerList := TVMsgListenerList.Create;
  FInterWindow := Classes.AllocateHWnd(InterWindowProc);
  FMessageID := RegisterWindowMessageW(conVMsgMessageIDString);
  FLock := TCriticalSection.Create;
  IsMultiThread := True;  
end;

{ TCallbackRecvForm }

destructor TVMsgMonitor.Destroy;
begin
  Classes.DeallocateHWnd(FInterWindow);
  FInterWindow := 0;

  FreeAndNil(FLock);  
  FreeAndNil(FListenerList);
  inherited;
end;

procedure TVMsgMonitor.DoLog(AType: TLogTypeEnum; const AText: WideString;
  ADataMem: Pointer; ADataLen: Integer);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, AType, 'Live3t.' + AText, ADataMem, ADataLen);
end;

{-----------------------------------------------------------------------------
--------------------------内部隐藏窗口的窗口过程------------------------------
-----------------------------------------------------------------------------}
procedure TVMsgMonitor.InterWindowProc(var AMsg: TMessage);
var
  oMsg: TVMsg;
begin
  if AMsg.Msg = FMessageID then
  begin
    if not FRecvMsgsStoped then
    begin
      oMsg := TVMsg(AMsg.LParam);
      try
        FListenerList.DispatchMsg(oMsg);
        AMsg.Result := oMsg.Return;
      finally
        if oMsg.NeedFree then
          oMsg.Free;
      end;
    end;
  end
  else begin
    AMsg.Result := DefWindowProcW(FInterWindow, AMsg.Msg, AMsg.WParam, AMsg.LParam);
  end;
end;

procedure TVMsgMonitor.LogRecv(const S: WideString; ADataMem: Pointer;
  ADataLen: Integer);
begin
  FLock.Enter;
  try
    DoLog(lteRecv, S, ADataMem, ADataLen);
  finally
    FLock.Leave;
  end;
end;

procedure TVMsgMonitor.LogSend(const S: WideString; ADataMem: Pointer = nil;
  ADataLen: Integer = 0);
begin
  FLock.Enter;
  try
    DoLog(lteSend, S, ADataMem, ADataLen);
  finally
    FLock.Leave;
  end;
end;

procedure TVMsgMonitor.PostVMsg(AMsg: TVMsg);
begin
  FLock.Enter;
  try
    if FRecvMsgsStoped then
    begin
      AMsg.Free;
      Exit;
    end;
    
    PostMessageW(FInterWindow, FMessageID, 0, Integer(AMsg));
  finally
    FLock.Leave;
  end;
end;

procedure TVMsgMonitor.PostVMsg(AMsgClass: TVMsgClass);
var
  oMsg: TVMsg;
begin
  oMsg := TVMsg(AMsgClass.NewInstance).Create;
  Self.PostVMsg(oMsg);
end;

procedure TVMsgMonitor.RegMsg(AOwner: TObject; AClass: TVMsgClass;
  AEvent: TVMsgHandlerEvent);
begin
  FListenerList.RegMsg(AOwner, AClass, AEvent);
end;

procedure TVMsgMonitor.RemoveOwner(AOwner: TObject);
begin
  FListenerList.RemoveOwner(AOwner);
end;

function TVMsgMonitor.SendVMsg(AMsg: TVMsg): Integer;
begin
  FLock.Enter;
  try
    Result := 0;
    if FRecvMsgsStoped then Exit;

    AMsg.NeedFree := False;
    Result := SendMessageW(FInterWindow, FMessageID, 0, Integer(AMsg));
  finally
    FLock.Leave;
  end;
end;

procedure TVMsgMonitor.StopRecvMsgs;
begin
  FRecvMsgsStoped := True;
end;

{ TVMsg }

constructor TBaseStreamVMsg.Create;
begin
  inherited;
  FStream := TMemoryStream.Create;
end;

destructor TBaseStreamVMsg.Destroy;
begin
  FreeAndNil(FStream);
  inherited;
end;

procedure TBaseStreamVMsg.Assign(Source: TPersistent);
var
  oSource: TBaseStreamVMsg;
begin
  inherited;
  if Source is TBaseStreamVMsg then
  begin
    oSource := TBaseStreamVMsg(Source);
    Self.WriteData(oSource.DataMem, oSource.DataLen);
  end;
end;

function TBaseStreamVMsg.GetDataLen: Integer;
begin
  Result := FStream.Size;
end;

function TBaseStreamVMsg.GetDataMem: Pointer;
begin
  Result := FStream.Memory;
end;

procedure TBaseStreamVMsg.WriteData(ADataMem: Pointer; ADataLen: Integer);
begin
  FStream.Clear;
  if (ADataMem <> nil) and (ADataLen > 0) then
    FStream.Write(PAnsiChar(ADataMem)^, ADataLen);
end;

destructor TBaseAttachObjectStreamVMsg.Destroy;
begin
  if FOwnsObject then
    FreeAndNil(FAttachedObject);
  inherited;
end;

{ TBaseAttachObjectStreamVMsg }

procedure TBaseAttachObjectStreamVMsg.AttachObject(AObject: TObject;
  AOwnsObject: Boolean);
begin
  if FOwnsObject then
    FreeAndNil(FAttachedObject);

  FAttachedObject := AObject;
  FOwnsObject := AOwnsObject;
end;      

initialization

finalization
  FreeAndNil(gVMsgMonitor);

end.
