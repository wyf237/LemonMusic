unit INIX;

interface

uses
  IniFiles, System.SysUtils, System.Classes;

type
  INI_RW = class
    function Read(Root_Name, Sec_Name, Sec_Text: string): string;
    function Write(Root_Name, Sec_Name, Sec_Text: string): boolean;
  end;

implementation

//读取保存位置和搜索数量配置
function INI_RW.Read(Root_Name, Sec_Name, Sec_Text: string): string;
var
  SettingIniFile: TIniFile; // iniFiles变量
begin
  if FileExists(ExtractFilePath(Paramstr(0)) + 'Setting.ini') then
  begin
    SettingIniFile := TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Setting.ini');
    if SettingIniFile.SectionExists(Root_Name) then
    begin
      result := SettingIniFile.Readstring(' ' + Root_Name + ' ', ' ' + Sec_Name + ' ', Sec_Text);
    end
    else
    begin
      Result := ExtractFilePath(Paramstr(0));
    end;
    SettingIniFile.Destroy;
  end;
end;
//写入保存位置和搜索数量配置
function INI_RW.Write(Root_Name, Sec_Name, Sec_Text: string): boolean;
var
  SettingIniFile: TIniFile; // iniFiles变量
begin
  if not FileExists(ExtractFilePath(Paramstr(0)) + 'Setting.ini') then
  begin
    SettingIniFile := TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Setting.ini');
  end;
  SettingIniFile := TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Setting.ini');
  SettingIniFile.writestring(Root_Name, Sec_Name, Sec_Text);
  SettingIniFile.Destroy;
  result := True;
end;

end.

