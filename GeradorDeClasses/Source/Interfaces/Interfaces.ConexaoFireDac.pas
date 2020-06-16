unit Interfaces.ConexaoFireDac;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
  iModelConexaoFireDac = interface
    ['{DE860EBE-E73E-4C2F-A334-697EB9589AA7}']
    function Conectar: iModelConexaoFireDac;
    function GetConn : TFDConnection;
  end;

implementation

end.
