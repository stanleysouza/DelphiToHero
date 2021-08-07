program DelphiToHero;

uses
  Vcl.Forms,
  DelphiToHero.View.Main in 'src\View\DelphiToHero.View.Main.pas' {formPrincipal},
  DelphiToHero.View.Styles.Colors in 'src\View\Styles\DelphiToHero.View.Styles.Colors.pas',
  DelphiToHero.View.Pages.Principal in 'src\View\Pages\DelphiToHero.View.Pages.Principal.pas' {PagePrincipal},
  DelphiToHero.View.Routers in 'src\View\Routers\DelphiToHero.View.Routers.pas',
  DelphiToHero.View.Pages.Form.Template in 'src\View\Pages\DelphiToHero.View.Pages.Form.Template.pas' {FormTemplate},
  DelphiToHero.View.Pages.Usuarios in 'src\View\Pages\DelphiToHero.View.Pages.Usuarios.pas' {PageUsuarios},
  DelphiToHero.Model.DAO.Interfaces in 'src\Model\DAO\DelphiToHero.Model.DAO.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
