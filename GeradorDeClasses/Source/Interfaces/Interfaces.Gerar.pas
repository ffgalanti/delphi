unit Interfaces.Gerar;

interface

uses
  System.Classes,
  Interfaces.ConexaoFireDac,
  Data.DB;


type
  IModelGerar = interface;

  IModelGerarParams = interface
    ['{3CE9E15A-3635-4B39-BD61-E2C2E93E082D}']
    function NomeAplicativo(Value: string) : IModelGerarParams;
    function Conexao(Value: iModelConexaoFireDac) : IModelGerarParams;
    function NomeTabela(Value: string) : IModelGerarParams;
    function SQLTabelaSelecionada(Value: string): IModelGerarParams;
    function &End : IModelGerar;
  end;

  IModelGerar = interface
    ['{6042B9FE-9D27-4084-BCE2-89344D9D0117}']
    function Params: IModelGerarParams;

    function GetQueryCampos(var DataSource: TDataSource; SQL : string) : IModelGerar;
    function GetQueryChaves(var DataSource: TDataSource; SQL : string) : IModelGerar;

    function Execute(Path, NomeArquivo: string): TStringList;
  end;

implementation

end.
