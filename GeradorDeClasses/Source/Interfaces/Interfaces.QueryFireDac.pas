unit Interfaces.QueryFireDac;

interface

uses
  FireDAC.Comp.Client;

type
  iModelQueryFireDac = interface
    ['{E73480EF-A38C-4368-A30B-06E400FAABF6}']
    function GetQuery: TFDQuery;
  end;

implementation

end.
