unit GeradorMVC.Model.ConexaoFireDac;

interface

uses
  GeradorMVC.Interfaces.ModelConexaoFireDac,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.Rtti,
  System.JSON,
  System.SysUtils,
  FireDAC.Phys.PGDef, FireDAC.Phys, FireDAC.Phys.PG;

type
  TModelConexaoFireDac = class(TInterfacedObject, iModelConexaoFireDac)
  private
    FConn: TFDConnection;

    FHostName: String;
    FPort: String;
    FDataBase: String;
    FUser: String;
    FPassword: String;
    FServer: String;
    FDriver: String;
    FProtocol: String;
    FLibraryLocation: String;

    procedure GetNameField(vField: TRttiField; var vNameField: string);

    procedure ConfigurarConexao(Value: TJSONObject);
    procedure SetConfiguracao;
  public
    constructor Create(Value: TJSONObject);
    destructor Destroy; override;

    class function New(Value: TJSONObject): iModelConexaoFireDac;

    function Conectar: iModelConexaoFireDac;
    function GetConn: TFDConnection;
  end;

implementation

{ TModelConexaoFireDac }

procedure TModelConexaoFireDac.ConfigurarConexao(Value: TJSONObject);
var
  vCtx: TRttiContext;
  vType: TRttiType;
  vField: TRttiField;
  vNameField: String;
begin
  vCtx := TRttiContext.Create;
  try
    vType := vCtx.GetType(Self.ClassType);

    for vField in vType.GetFields do
    begin
      GetNameField(vField, vNameField);

      if Value.Get(vNameField) <> Nil then
        vField.SetValue(Self, Value.Get(vNameField).JsonValue.Value);
    end;

  finally
    vCtx.Free
  end;
end;

constructor TModelConexaoFireDac.Create(Value: TJSONObject);
begin
  Self.FConn := TFDConnection.Create(nil);

  ConfigurarConexao(Value);
  SetConfiguracao;
end;

destructor TModelConexaoFireDac.Destroy;
begin
  FreeAndNil(Self.FConn);
  inherited;
end;

function TModelConexaoFireDac.GetConn: TFDConnection;
begin
  Result := Self.FConn;
end;

procedure TModelConexaoFireDac.SetConfiguracao;
begin
  FConn.Connected := false;
  FConn.LoginPrompt := false;
  FConn.Params.Clear;
  FConn.Params.Add('Server=' + FHostName);
  FConn.Params.Add('User_Name=' + Self.FUser);
  FConn.Params.Add('Password=' + Self.FPassword);
  FConn.Params.Add('Port=' + FPort);
  FConn.Params.Add('Database=' + Self.FDataBase);
  FConn.Params.Add('DriverID=' + FProtocol);
end;

procedure TModelConexaoFireDac.GetNameField(vField: TRttiField;
  var vNameField: string);
begin
  vNameField := Copy(lowercase(vField.Name), 2, Length(vField.Name));
end;

class function TModelConexaoFireDac.New(Value: TJSONObject): iModelConexaoFireDac;
begin
  Result := Self.Create(Value);
end;

function TModelConexaoFireDac.Conectar(): iModelConexaoFireDac;
begin
  Result := Self;

  try
    Self.FConn.Connected;
  except
  end;
end;

end.
