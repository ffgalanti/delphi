unit Gerar;

interface

uses
  Data.DB,
  System.Classes,
  Interfaces.Gerar,
  Interfaces.ConexaoFireDac,
  Interfaces.QueryFireDac,
  Interfaces.Gerar.Classe;

type
  TModelGerar = class(TInterfacedObject, IModelGerarParams, IModelGerar)
  private
    FNomeAplicativo        : String;
    FNomeTabela            : String;
    FSQLTabelaSelecionada  : string;
    FConexao               : IModelConexaoFireDac;
    FQueryCampos           : IModelQueryFireDac;
    FQueryChaves           : IModelQueryFireDac;
    FQueryTabelaSelecionada: IModelQueryFireDac;

    FClasseModel           : IGerarClasse;
    FDataSource            : TDataSource;

    procedure AbrirTabelaSelecionada;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelGerar;

    function NomeAplicativo(Value: string) : IModelGerarParams;
    function Conexao(Value: IModelConexaoFireDac) : IModelGerarParams;
    function NomeTabela(Value: string) : IModelGerarParams;
    function SQLTabelaSelecionada(Value: string): IModelGerarParams;
    function &End : IModelGerar;

    function Params: IModelGerarParams;
    function GetQueryCampos(var DataSource: TDataSource; SQL : string) : IModelGerar;
    function GetQueryChaves(var DataSource: TDataSource; SQL : string) : IModelGerar;

    function Execute(Path, NomeArquivo: string): TStringList;
  end;

implementation

uses
  System.SysUtils,
  QueryFireDac,
  Gerar.Classe;

{ TModelGerar }

function TModelGerar.&End: IModelGerar;
begin
  Result := Self;
end;

function TModelGerar.Execute(Path, NomeArquivo: string): TStringList;
var
  vModeloClasse, vModeloFncGetter, vModeloPrcSetter: TStringList;

begin
  try
    AbrirTabelaSelecionada;

    vModeloClasse := TStringList.Create;
    vModeloClasse.LoadFromFile(Path+NomeArquivo);

    vModeloFncGetter := TStringList.Create;
    vModeloFncGetter.LoadFromFile(Path+'Getter.procedure');

    vModeloPrcSetter := TStringList.Create;
    vModeloPrcSetter.LoadFromFile(Path+'Setter.function');

    Result := FClasseModel.Params
                .NomeAplicativo(FNomeAplicativo)
                .NomeTabela(FNomeTabela)
                .DataSource(FDataSource)
                .GerarClasse(vModeloClasse)
                .GerarFncGetter(vModeloFncGetter)
                .GerarPrcSetter(vModeloPrcSetter)
              .&End
              .Execute;
  finally
    FreeAndNil(vModeloClasse);
    FreeAndNil(vModeloFncGetter);
    FreeAndNil(vModeloPrcSetter);
  end;
end;

function TModelGerar.GetQueryCampos(var DataSource: TDataSource; SQL : string) : IModelGerar;
begin
  Result := Self;
  FQueryCampos := TModelQueryFireDac.New(FConexao, SQL);
  DataSource.DataSet := FQueryCampos.GetQuery;
  DataSource.DataSet.Active := True;
end;

function TModelGerar.GetQueryChaves(var DataSource: TDataSource; SQL : string) : IModelGerar;
begin
  Result := Self;
  FQueryChaves := TModelQueryFireDac.New(FConexao, SQL);
  DataSource.DataSet := FQueryChaves.GetQuery;
  DataSource.DataSet.Active := True;
end;

procedure TModelGerar.AbrirTabelaSelecionada;
begin
  FQueryTabelaSelecionada := TModelQueryFireDac.New(FConexao, Format(FSQLTabelaSelecionada,[FNomeTabela]));
  FDataSource.DataSet := FQueryTabelaSelecionada.GetQuery;
  FDataSource.DataSet.Active := True;
end;

function TModelGerar.Conexao(Value: IModelConexaoFireDac) : IModelGerarParams;
begin
  Result := Self;
  FConexao := Value;
end;

constructor TModelGerar.Create;
begin
  Self.FClasseModel := TModelClasseModel.New;
  FDataSource := TDataSource.Create(nil);
end;

destructor TModelGerar.Destroy;
begin
  FreeAndNil(FDataSource);
  inherited;
end;

class function TModelGerar.New: IModelGerar;
begin
  Result := Self.Create;
end;

function TModelGerar.NomeAplicativo(Value: string): IModelGerarParams;
begin
  Result := Self;
  FNomeAplicativo := Value;
end;

function TModelGerar.NomeTabela(Value: string): IModelGerarParams;
begin
  Result := Self;
  FNomeTabela := Value;
end;

function TModelGerar.Params: IModelGerarParams;
begin
  Result := Self;
end;

function TModelGerar.SQLTabelaSelecionada(Value: string): IModelGerarParams;
begin
  Result := Self;
  FSQLTabelaSelecionada := Value;
end;

end.
