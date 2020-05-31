program GeradorDeClasses;

uses
  Vcl.Forms,
  View.Principal in '..\Source\View\View.Principal.pas' {FPrincipal},
  GeradorMVC.Interfaces.ModelConexaoFireDac in '..\Source\Interfaces\GeradorMVC.Interfaces.ModelConexaoFireDac.pas',
  GeradorMVC.Interfaces.ModelQueryFireDac in '..\Source\Interfaces\GeradorMVC.Interfaces.ModelQueryFireDac.pas',
  GeradorMVC.Model.ConexaoFireDac in '..\Source\Model\GeradorMVC.Model.ConexaoFireDac.pas',
  GeradorMVC.Model.QueryFireDac in '..\Source\Model\GeradorMVC.Model.QueryFireDac.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
