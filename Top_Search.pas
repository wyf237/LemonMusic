unit Top_Search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scControls, scGPControls,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFr_Top_Search = class(TFrame)
    PN_Search_Top: TPanel;
    LB_Chanel: TLabel;
    BTN_QQ: TscGPButton;
    BTN_WY: TscGPButton;
    BTN_KuWo: TscGPButton;
    BTN_KuGou: TscGPButton;
    procedure BTN_QQClick(Sender: TObject);
    procedure BTN_WYClick(Sender: TObject);
    procedure BTN_KuWoClick(Sender: TObject);
    procedure BTN_KuGouClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Main;
{$R *.dfm}

procedure TFr_Top_Search.BTN_KuGouClick(Sender: TObject);
begin
  Fm_Main.DS_Songs.DataSet := Fm_Main.MEM_KuGou;
  Fm_Main.MEM_KuGou.Active:=True;
end;

procedure TFr_Top_Search.BTN_KuWoClick(Sender: TObject);
begin
  Fm_Main.DS_Songs.DataSet := Fm_Main.MEM_KuWo;
  Fm_Main.MEM_KuWo.Active:=True;
end;

procedure TFr_Top_Search.BTN_QQClick(Sender: TObject);
begin
  Fm_Main.DS_Songs.DataSet := Fm_Main.MEM_QQ;
  Fm_Main.MEM_QQ.Active:=True;
end;

procedure TFr_Top_Search.BTN_WYClick(Sender: TObject);
begin
  Fm_Main.DS_Songs.DataSet := Fm_Main.MEM_163;
  Fm_Main.MEM_163.Active:=True;
end;

end.

