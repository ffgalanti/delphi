unit QueryFireDac;

interface

uses
  Interfaces.QueryFireDac, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Interfaces.ConexaoFireDac, System.SysUtils;

type
  TModelQueryFireDac = class(TInterfacedObject, iModelQueryFireDac)
  private
    FQuery: TFDQuery;

    procedure SetCnxSql(aConn: iModelConexaoFireDac; aSQL: String);
  public
    constructor Create(aConn: iModelConexaoFireDac; aSQL: String);
    destructor Destroy; override;

    class function New(aConn: iModelConexaoFireDac; aSQL: String): iModelQueryFireDac;

    function GetQuery: TFDQuery;
  end;

implementation

{ TModelQueryFireDac }

constructor TModelQueryFireDac.Create(aConn: iModelConexaoFireDac; aSQL: String);
begin
  Self.FQuery := TFDQuery.Create(nil);
  Self.SetCnxSql(aConn, aSQL);
end;

destructor TModelQueryFireDac.Destroy;
begin
  FreeAndNil(Self.FQuery);
  inherited;
end;

function TModelQueryFireDac.GetQuery: TFDQuery;
begin
  Result := Self.FQuery;
end;

class function TModelQueryFireDac.New(aConn: iModelConexaoFireDac; aSQL: String)
  : iModelQueryFireDac;
begin
  Result := Self.Create(aConn, aSQL);
end;

procedure TModelQueryFireDac.SetCnxSql(aConn: iModelConexaoFireDac; aSQL: String);
begin
  Self.FQuery.Connection := aConn.GetConn;
  Self.FQuery.SQL.Clear;
  Self.FQuery.SQL.Add(aSQL);
end;

end.
