unit FullScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFm_FullScreen = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_FullScreen: TFm_FullScreen;

implementation

uses
  Play_MV;
{$R *.dfm}

procedure TFm_FullScreen.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
  end;
end;

procedure TFm_FullScreen.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.

