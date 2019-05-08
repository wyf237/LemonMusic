unit Music_Play;

interface

uses
  bass, System.Classes, system.sysutils;

type
  Play_Go = class(TTHread)
  public
    var
      Url: string;
    procedure Play;
  protected
    procedure Execute; override;
  end;

implementation

{ Play_Go }

procedure Play_Go.Execute;
begin
  FreeOnTerminate;
  Play;
end;

procedure Play_Go.Play;
begin

end;

end.

