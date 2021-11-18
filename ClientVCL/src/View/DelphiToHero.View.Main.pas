unit DelphiToHero.View.Main;

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
  Vcl.ExtCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Router4D.Interfaces;

type
  TformPrincipal = class(TForm)
    pnlMain: TPanel;
    pnlMenu: TPanel;
    pnlFull: TPanel;
    pnlTop: TPanel;
    pnlPrincipal: TPanel;
    pnlLogo: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure ApplyStyle;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses
  DelphiToHero.View.Styles.Colors,
  Router4D,
  DelphiToHero.View.Pages.Principal;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
  ApplyStyle;
  TRouter4D.Render<TPagePrincipal>.SetElement(pnlPrincipal, pnlMain);


end;

procedure TformPrincipal.SpeedButton1Click(Sender: TObject);
begin
  close;
end;
procedure TformPrincipal.SpeedButton2Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Principal');
end;

procedure TformPrincipal.SpeedButton3Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Usuarios');
end;

procedure TformPrincipal.ApplyStyle;
begin
  pnlPrincipal.Color := COLOR_BACKGROUND;
  pnlTop.Color := COLOR_BACKGROUND_TOP;
  pnlMenu.Color := COLOR_BACKGROUND_MENU;
  pnlLogo.Color := COLOR_BACKGROUND_DESTAK;
  Self.Font.Color := FONT_COLOR;
  self.Font.Size := FONT_H6;

  Width := Round(Screen.Width*1);
  Height := Round(Screen.Height*1);
  Left := (Screen.Width - Width ) div 2;
  Top  := (Screen.Height - Height ) div 2;
end;

end.
