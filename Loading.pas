unit Loading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, scStyledForm, scGPControls, scControls;

type
  TFm_Loading = class(TForm)
    SF_Main: TscStyledForm;
    LB_Hint: TscGPLabel;
    PN_Loading: TscGPPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Loading: TFm_Loading;

implementation

{$R *.dfm}

end.
