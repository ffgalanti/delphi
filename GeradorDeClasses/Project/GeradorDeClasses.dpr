program GeradorDeClasses;

uses
  Vcl.Forms,
  View.Principal in '..\Source\View\View.Principal.pas' {FPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
