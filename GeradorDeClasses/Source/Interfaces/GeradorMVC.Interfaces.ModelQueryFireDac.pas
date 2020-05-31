unit GeradorMVC.Interfaces.ModelQueryFireDac;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  iModelQueryFireDac = interface
    ['{E73480EF-A38C-4368-A30B-06E400FAABF6}']
    function GetQuery: TFDQuery;
  end;

implementation

end.
