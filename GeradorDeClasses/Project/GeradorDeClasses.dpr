program GeradorDeClasses;

uses
  Vcl.Forms,
  View.Principal in '..\Source\View\View.Principal.pas' {FPrincipal},
  Interfaces.ConexaoFireDac in '..\Source\Interfaces\Interfaces.ConexaoFireDac.pas',
  Interfaces.QueryFireDac in '..\Source\Interfaces\Interfaces.QueryFireDac.pas',
  ConexaoFireDac in '..\Source\Model\ConexaoFireDac.pas',
  QueryFireDac in '..\Source\Model\QueryFireDac.pas',
  Interfaces.Gerar in '..\Source\Interfaces\Interfaces.Gerar.pas',
  Gerar in '..\Source\Model\Gerar.pas',
  Types in '..\Source\Types\Types.pas',
  Gerar.Classe in '..\Source\Model\Gerar.Classe.pas',
  Interfaces.Gerar.Classe in '..\Source\Interfaces\Interfaces.Gerar.Classe.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
