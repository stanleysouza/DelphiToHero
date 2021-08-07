unit DelphiToHero.View.Pages.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Router4D.Interfaces;

type
  TPagePrincipal = class(TForm, iRouter4DComponent)
    Panel1: TPanel;
    Label1: TLabel;

  private
    { Private declarations }
  public
    { Public declarations }
    function Render : TForm;
    procedure UnRender;
  end;

var
  PagePrincipal: TPagePrincipal;

implementation

uses
  DelphiToHero.View.Styles.Colors;

{$R *.dfm}



{ TPagePrincipal }

function TPagePrincipal.Render: TForm;
begin
  Result := Self;

  Panel1.Color := COLOR_BACKGROUND;
end;

procedure TPagePrincipal.UnRender;
begin

end;

end.
