unit Interfaces.Gerar.Classe;

interface

uses
  System.Classes,
  Data.DB;

type
  IGerarClasse = interface;

  IGerarClasseParams = interface
    ['{44E21AE9-67B9-42C3-811B-99B01F53C66E}']
    function NomeAplicativo(Value: string): IGerarClasseParams;
    function NomeTabela(Value: string): IGerarClasseParams;
    function DataSource(Value: TDataSource): IGerarClasseParams;
    function GerarClasse(Value: TStringList): IGerarClasseParams;
    function GerarFncGetter(Value: TStringList): IGerarClasseParams;
    function GerarPrcSetter(Value: TStringList): IGerarClasseParams;
    function &End: IGerarClasse;
  end;

  IGerarClasse = interface
    ['{A06CD8CE-391F-47E0-BC84-8D104DD8C3D6}']
    function Params: IGerarClasseParams;
    function Execute: TStringList;
  end;

implementation

end.
