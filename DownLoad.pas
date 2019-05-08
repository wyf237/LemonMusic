unit DownLoad;

interface

uses
  Classes, Windows, SysUtils, IdHTTP, IdIOHandlerSocket, IdComponent, Math,
  Messages;

const
  WM_DownProgres = WM_USER + 1001;

type
  Down = class(TThread)
  private
    var
      HP: TidHttp;
      SSL: TIdIOHandlerSocket;
      Work_Size: Int64;
      Url: string;
      Path: string;
      HandleX: THandle;
    procedure DoExecute;
    procedure DoWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure DoWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure DoWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  public
    constructor Create(const A_URL, A_Path: string; const A_Handle: THandle);
    destructor Destroy; override;
  protected
    procedure Execute; override;
  end;

implementation

uses
  Main;
{ Down }

constructor Down.Create(const A_URL, A_Path: string; const A_Handle: THandle);
begin(*构造时传递参数*)
  Url := A_URL;
  Path := A_Path;
  Handlex := A_Handle;
  HP := TIdHTTP.Create(nil);
  SSL := TIdIOHandlerSocket(nil);
  HP.OnWorkBegin := DoWorkBegin;
  HP.OnWork := DoWork;
  HP.OnWorkEnd := DoWorkEnd;
  inherited Create(True);
end;

destructor Down.Destroy;
begin
  FreeAndNil(HP);
  FreeAndNil(SSL);
  inherited;
end;

procedure Down.DoExecute;
var(*下载*)
  MS: TMemoryStream;
begin
  MS := TMemoryStream.Create;
  try
    try
      HP.Get(URL, MS);
      MS.SaveToFile(Path);
    except
      // 记录日志
      // 处理重试
    end;
  finally
    MS.Free;
  end;
end;

procedure Down.DoWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var(*通过消息传递下载进度*)
  Progress: Integer;
begin
  if Work_Size <> 0 then
  begin
    Progress := Ceil(AWorkCount / Work_Size * 100);
    PostMessage(HandleX, WM_DownProgres, 0, Progress);
  end;
end;

procedure Down.DoWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin(*开始时记录文件最大值*)
  Work_Size := AWorkCountMax;
end;

procedure Down.DoWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Fm_Main.ASMB.Messages[4].Show;
end;

procedure Down.Execute;
begin
//  FreeOnTerminate := True;
  DoExecute;
end;

end.

