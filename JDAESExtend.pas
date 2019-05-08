(**************************************************)
(*                                                *)
(* Advanced Encryption Standard (AES) Extend      *)
(*                                                *)
(* Copyright (c) 2005-2016                        *)
(* aisino, qiaobu@139.com qiaohaidong@aisino.com  *)
(*                                                *)
(**************************************************)

unit JDAESExtend;

interface

{$WARN IMPLICIT_STRING_CAST OFF} // 关闭警告
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses
  SysUtils, Classes, Math, ElAES, System.Generics.Collections, Soap.EncdDecd;

type
  TPaddingType = (PKCS5Padding { , PKCS7Padding } );
  TKeyBit = (kb128, kb192, kb256);
  TalgoMode = (amECB, amCBC { , amCFB, amOFB, amCTR } );
  TCipherType = (ctBase64, ctHex);

  TArrayPadding = array of Byte;
  TArrayByte = array of Byte;

var
  AESKey128: TAESKey128;
  AESKey192: TAESKey192;
  AESKey256: TAESKey256;

  InitVector: TAESBuffer;

function EncryptString(Value: AnsiString; Key: AnsiString; KeyBit: TKeyBit = kb128; algoMode: TalgoMode = amECB; padding: TPaddingType = PKCS5Padding; sInitVector: AnsiString = '0000000000000000';
  CipherType: TCipherType = ctHex): AnsiString;
function DecryptString(Value: AnsiString; Key: AnsiString; KeyBit: TKeyBit = kb128; algoMode: TalgoMode = amECB; padding: TPaddingType = PKCS5Padding; sInitVector: AnsiString = '0000000000000000';
  CipherType: TCipherType = ctHex): AnsiString;

implementation

//字符串转16进制（字符串）
function StrToHex(Value: AnsiString): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Value) do
    Result := Result + IntToHex(Ord(Value[i]), 2);
end;
//16进制（字符串）转字符串
function HexToStr(Value: AnsiString): AnsiString;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Value) do
  begin
    if ((i mod 2) = 1) then
      Result := Result + ansichar(StrToInt('0x' + Copy(Value, i, 2)));
  end;
end;

//PKCS5规则补码
function PKCS5_Padding(Value: AnsiString; out arrayValue: TArrayByte): Int64;
var
  Valueutf8: UTF8String;
  BytesValue: array of Byte;
  intMod: Byte;
  valueLen: Integer;
  i: Integer;
begin
  Valueutf8 := Value;
  SetLength(BytesValue, Length(Valueutf8));
  Move(Valueutf8[1], BytesValue[0], Length(Valueutf8));
  intMod := 16 - Length(BytesValue) mod 16;

  valueLen := Length(BytesValue);
  SetLength(BytesValue, valueLen + intMod);
  for i := 0 to intMod - 1 do
  begin
    BytesValue[valueLen + i] := intMod;
  end;
  SetLength(arrayValue, Length(BytesValue));
  Move(BytesValue[0], arrayValue[0], Length(BytesValue));
  Result := Length(BytesValue);
end;

//PKCS5规则去补码
function PKCS5_DePadding(bytes: TBytes): string;
var
  Encoding: TEncoding;
  size: Integer;
  paddingByte: Byte;
  tmpBytes: TBytes;
begin
  paddingByte := bytes[Length(bytes) - 1];

  SetLength(tmpBytes, Length(bytes) - paddingByte);
  Move(bytes[0], tmpBytes[0], Length(tmpBytes));
  Encoding := TEncoding.UTF8;
  size := TEncoding.GetBufferEncoding(tmpBytes, Encoding);
  Result := Encoding.GetString(tmpBytes, size, Length(tmpBytes) - size)
end;

//密钥不足位数0补码
procedure ZeroPadding(KeyBit: TKeyBit);
begin
  case KeyBit of
    kb128:
      FillChar(AESKey128, SizeOf(AESKey128), 0);
    kb192:
      FillChar(AESKey192, SizeOf(AESKey192), 0);
    kb256:
      FillChar(AESKey256, SizeOf(AESKey256), 0);
  end;
end;

function EncryptString(Value: AnsiString; Key: AnsiString; KeyBit: TKeyBit = kb128; algoMode: TalgoMode = amECB; padding: TPaddingType = PKCS5Padding; sInitVector: AnsiString = '0000000000000000';
  CipherType: TCipherType = ctHex): AnsiString;
var
  SS, DS: TMemoryStream;
  str: AnsiString;
  byteContent: TArrayByte;
begin
  Result := '';
  PKCS5_Padding(Value, byteContent);

  SS := TMemoryStream.Create;
  SS.WriteBuffer(byteContent[0], Length(byteContent));

  SS.Position := SS.size;
  DS := TMemoryStream.Create;

  try
    case KeyBit of
      kb128:
        begin
          ZeroPadding(kb128);
          Move(PAnsiChar(Key)^, AESKey128, Length(Key));
          case algoMode of
            amECB:
              begin
                EncryptAESStreamECB(SS, 0, AESKey128, DS);
              end;
            amCBC:
              begin
                // 不足16位用0补齐
                FillChar(InitVector, SizeOf(InitVector), 0);
                Move(PAnsiChar(sInitVector)^, InitVector, Length(sInitVector));
                EncryptAESStreamCBC(SS, 0, AESKey128, InitVector, DS);
              end;
          end;
        end;
      kb192:
        begin
          ZeroPadding(kb192);
          Move(PAnsiChar(Key)^, AESKey192, Length(Key));
          case algoMode of
            amECB:
              begin
                EncryptAESStreamECB(SS, 0, AESKey192, DS);
              end;
            amCBC:
              begin
                FillChar(InitVector, SizeOf(InitVector), 0);
                Move(PAnsiChar(sInitVector)^, InitVector, Length(sInitVector));
                EncryptAESStreamCBC(SS, 0, AESKey192, InitVector, DS);
              end;
          end;
        end;
      kb256:
        begin
          ZeroPadding(kb256);
          Move(PAnsiChar(Key)^, AESKey256, Length(Key));
          case algoMode of
            amECB:
              begin
                EncryptAESStreamECB(SS, 0, AESKey256, DS);
              end;
            amCBC:
              begin
                FillChar(InitVector, SizeOf(InitVector), 0);
                Move(PAnsiChar(sInitVector)^, InitVector, Length(sInitVector));
                EncryptAESStreamCBC(SS, 0, AESKey256, InitVector, DS);
              end;
          end;
        end;
    end;

    SetLength(str, DS.size);
    DS.Position := 0;
    DS.ReadBuffer(PAnsiChar(str)^, DS.size);
    if CipherType = ctHex then
      Result := StrToHex(str)
    else
      Result := EncodeBase64(PChar(str),Length(str));
  finally
    SS.Free;
    DS.Free;
  end;
end;

function DecryptString(Value: AnsiString; Key: AnsiString; KeyBit: TKeyBit = kb128; algoMode: TalgoMode = amECB; padding: TPaddingType = PKCS5Padding; sInitVector: AnsiString = '0000000000000000';
  CipherType: TCipherType = ctHex): AnsiString;
var
  SS,DS: TMemoryStream;
  str: AnsiString;
  byteContent: TBytes;
  BytesValue: TBytes;
begin
  Result := '';

  // pcharValue := pchar(Value);
  if CipherType = ctHex then
  begin
    str := HexToStr(Value);
    SetLength(byteContent, Length(str));
    Move(str[1], byteContent[0], Length(str));
  end
  else
    byteContent:= DecodeBase64(Value);

  SS := TMemoryStream.Create;
  SS.WriteBuffer(byteContent[0], Length(byteContent));

  DS := TMemoryStream.Create;

  try
    case KeyBit of
      kb128:
        begin
          ZeroPadding(kb128);
          Move(PAnsiChar(Key)^, AESKey128, Length(Key));
          case algoMode of
            amECB:
              begin
                DecryptAESStreamECB(SS, 0, AESKey128, DS);
              end;
            amCBC:
              begin
                // 不足16位用0补齐
                FillChar(InitVector, SizeOf(InitVector), 0);
                Move(PAnsiChar(sInitVector)^, InitVector, Length(sInitVector));
                DecryptAESStreamCBC(SS, 0, AESKey128, InitVector, DS);
              end;
          end;
        end;
      kb192:
        begin
          ZeroPadding(kb192);
          Move(PAnsiChar(Key)^, AESKey192, Length(Key));
          case algoMode of
            amECB:
              begin
                DecryptAESStreamECB(SS, 0, AESKey192, DS);
              end;
            amCBC:
              begin
                FillChar(InitVector, SizeOf(InitVector), 0);
                Move(PAnsiChar(sInitVector)^, InitVector, Length(sInitVector));
                DecryptAESStreamCBC(SS, 0, AESKey192, InitVector, DS);
              end;
          end;
        end;
      kb256:
        begin
          ZeroPadding(kb256);
          Move(PAnsiChar(Key)^, AESKey256, Length(Key));
          case algoMode of
            amECB:
              begin
                DecryptAESStreamECB(SS, 0, AESKey256, DS);
              end;
            amCBC:
              begin
                FillChar(InitVector, SizeOf(InitVector), 0);
                Move(PAnsiChar(sInitVector)^, InitVector, Length(sInitVector));
                DecryptAESStreamCBC(SS, 0, AESKey256, InitVector, DS);
              end;
          end;
        end;
    end;
    DS.Position := 0;
    SetLength(BytesValue, DS.size);
    DS.ReadBuffer(BytesValue[0], DS.size);
    Result := PKCS5_DePadding(BytesValue);
  finally
    SS.Free;
    DS.Free;
  end;
end;

END.
