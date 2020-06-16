unit Gerar.Classe;

interface

uses
  Interfaces.Gerar.Classe,
  Data.DB,
  Types,
  System.Classes,
  System.SysUtils;

type
  TModelClasseModel = class(TInterfacedObject, IGerarClasseParams, IGerarClasse)
  private
    FNomeAplicativo: string;
    FNomeTabela: string;
    FDataSource: TDataSource;
    FModeloClasse: TStringList;
    FModeloFncGetter: TStringList;
    FModeloPrcSetter: TStringList;

    FModelClasse: TStringList;

    function CamelCase(Value: string) : string;
    function SetFieldNameFieldType(vField: TField; FTypeGerar: TTypeGerar): string;
    procedure CreateModel(aLinha: String; aTypesection: TTypeSection);
    procedure AddModelSection(aLinha, aTypeSection: String; aField: TField);
    procedure GerarModel;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: IGerarClasse;

    function NomeAplicativo(Value: string): IGerarClasseParams;
    function NomeTabela(Value: string): IGerarClasseParams;
    function DataSource(Value: TDataSource): IGerarClasseParams;
    function GerarClasse(Value: TStringList): IGerarClasseParams;
    function GerarFncGetter(Value: TStringList): IGerarClasseParams;
    function GerarPrcSetter(Value: TStringList): IGerarClasseParams;
    function &End: IGerarClasse;

    function Params: IGerarClasseParams;
    function Execute : TStringList;
  end;

implementation

uses
  System.StrUtils;

{ TModelClasseModel }

function TModelClasseModel.&End: IGerarClasse;
begin
  Result := Self;
end;

procedure TModelClasseModel.AddModelSection(aLinha, aTypeSection: String;
  aField: TField);
begin
  aLinha := StringReplace(aLinha, aTypeSection     ,''                                     , [rfReplaceAll]);
  aLinha := StringReplace(aLinha, '[classe]'       ,FNomeTabela                            , [rfReplaceAll]);
  aLinha := StringReplace(aLinha, '[upperclasse]'  ,CamelCase(FNomeTabela)                 , [rfReplaceAll]);
  aLinha := StringReplace(aLinha, '[campo]'        ,aField.FieldName                       , [rfReplaceAll]);
  aLinha := StringReplace(aLinha, '[uppercampo]'   ,CamelCase(aField.FieldName)            , [rfReplaceAll]);
  aLinha := StringReplace(aLinha, '[tipo]'         ,SetFieldNameFieldType(aField, tgType)  , [rfReplaceAll]);
  aLinha := StringReplace(aLinha, '[astipo]'       ,SetFieldNameFieldType(aField, tgAsType), [rfReplaceAll]);

  Self.FModelClasse.Add(aLinha);
end;

function TModelClasseModel.CamelCase(Value: string): string;
begin
  Result := UpperCase(Copy(Value,1,1)) + Copy(Value,2,Length(Value));
end;

constructor TModelClasseModel.Create;
begin
  FModelClasse := TStringList.Create;
end;

procedure TModelClasseModel.CreateModel(aLinha: String;
  aTypesection: TTypeSection);
var
  vField: TField;
begin
  for vField in FDataSource.DataSet.Fields do
  begin
    case aTypesection of
      secFields    : AddModelSection(aLinha, '[secFields]'    , vField);
      secPrivGetter: AddModelSection(aLinha, '[secPrivGetter]', vField);
      secPrivSetter: AddModelSection(aLinha, '[secPrivSetter]', vField);
      secProperty  : AddModelSection(aLinha, '[secProperty]'  , vField);
      secFncGetter : AddModelSection(aLinha, '[secFncGetter]' , vField);
      secPrcSetter : AddModelSection(aLinha, '[secPrcSetter]' , vField);
    end;
  end;
end;

function TModelClasseModel.DataSource(Value: TDataSource): IGerarClasseParams;
begin
  Result := Self;
  FDataSource := Value;
end;

destructor TModelClasseModel.Destroy;
begin
  FreeAndNil(FModelClasse);
  inherited;
end;

procedure TModelClasseModel.GerarModel;
var
  vLinha: String;
  vModeloTmp: TStringList;

begin
  try
    FModelClasse.Clear;

    vModeloTmp := TStringList.Create;

    vModeloTmp.Text := StringReplace(FModeloClasse.Text, '[classe]'      , FNomeTabela               , [rfReplaceAll]);
    vModeloTmp.Text := StringReplace(vModeloTmp.Text   , '[upperclasse]' , CamelCase(FNomeTabela)    , [rfReplaceAll]);
    vModeloTmp.Text := StringReplace(vModeloTmp.Text   , '[appnome]'     , FNomeAplicativo           , [rfReplaceAll]);
    vModeloTmp.Text := StringReplace(vModeloTmp.Text   , '[upperappnome]', CamelCase(FNomeAplicativo), [rfReplaceAll]);

    for vLinha in vModeloTmp do
    begin
      if pos('[secFields]', vLinha) <> 0 then
        CreateModel(vLinha, secFields)

      else if pos('[secPrivGetter]', vLinha) <> 0 then
        CreateModel(vLinha, secPrivGetter)

      else if pos('[secPrivSetter]', vLinha) <> 0 then
        CreateModel(vLinha, secPrivSetter)

      else if pos('[secProperty]', vLinha) <> 0 then
        CreateModel(vLinha, secProperty)

      else if pos('[secFncGetter]', vLinha) <> 0 then
        CreateModel(FModeloFncGetter.Text, secFncGetter)

      else if pos('[secPrcSetter]', vLinha) <> 0 then
        CreateModel(FModeloPrcSetter.Text, secPrcSetter)

      else
        FModelClasse.Add(vLinha);
    end;

  finally
    FreeAndNil(vModeloTmp);
  end;
end;

function TModelClasseModel.Execute: TStringList;
begin
  GerarModel;
  Result := FModelClasse;
end;

function TModelClasseModel.GerarClasse(
  Value: TStringList): IGerarClasseParams;
begin
  Result := Self;
  FModeloClasse := Value;
end;

function TModelClasseModel.GerarFncGetter(
  Value: TStringList): IGerarClasseParams;
begin
  Result := Self;
  FModeloFncGetter := Value;
end;

function TModelClasseModel.GerarPrcSetter(
  Value: TStringList): IGerarClasseParams;
begin
  Result := Self;
  FModeloPrcSetter := Value;
end;

class function TModelClasseModel.New: IGerarClasse;
begin
  Result := Self.Create;
end;

function TModelClasseModel.NomeAplicativo(
  Value: string): IGerarClasseParams;
begin
  Result := Self;
  FNomeAplicativo := Value;
end;

function TModelClasseModel.NomeTabela(Value: string): IGerarClasseParams;
begin
  Result := Self;
  FNomeTabela := Value;
end;

function TModelClasseModel.Params: IGerarClasseParams;
begin
  Result := Self;
end;

function TModelClasseModel.SetFieldNameFieldType(vField: TField; FTypeGerar: TTypeGerar): string;
begin
  case vField.DataType of
    ftUnknown        : Result := IfThen(FTypeGerar = tgAsType,'AsUnknown','Unknown');
    ftString         : Result := IfThen(FTypeGerar = tgAsType,'AsString','String');
    ftSmallint       : Result := IfThen(FTypeGerar = tgAsType,'AsInteger','Integer');
    ftInteger        : Result := IfThen(FTypeGerar = tgAsType,'AsInteger','Integer');
    ftWord           : Result := IfThen(FTypeGerar = tgAsType,'AsString','ftWord');
    ftBoolean        : Result := IfThen(FTypeGerar = tgAsType,'AsBoolean','Boolean');
    ftFloat          : Result := IfThen(FTypeGerar = tgAsType,'AsFloat','Currency');
    ftCurrency       : Result := IfThen(FTypeGerar = tgAsType,'AsInteger','Currency');
    ftBCD            : Result := IfThen(FTypeGerar = tgAsType,'AsFloat','Currency');
    ftDate           : Result := IfThen(FTypeGerar = tgAsType,'AsDate','TDate');
    ftTime           : Result := IfThen(FTypeGerar = tgAsType,'AsTime','TTime');
    ftDateTime       : Result := IfThen(FTypeGerar = tgAsType,'AsDateTime','TDateTime');
    ftBytes          : Result := IfThen(FTypeGerar = tgAsType,'AsBypes','ftBytes');
    ftVarBytes       : Result := IfThen(FTypeGerar = tgAsType,'AsVarBytes','ftVarBytes');
    ftAutoInc        : Result := IfThen(FTypeGerar = tgAsType,'AsInteger','ftAutoInc');
    ftBlob           : Result := IfThen(FTypeGerar = tgAsType,'AsString','ftBlob');
    ftMemo           : Result := IfThen(FTypeGerar = tgAsType,'AsString','ftMemo');
    ftGraphic        : Result := IfThen(FTypeGerar = tgAsType,'AsGraphic','ftGraphic');
    ftFmtMemo        : Result := IfThen(FTypeGerar = tgAsType,'AsString','ftFmtMemo');
    ftParadoxOle     : Result := IfThen(FTypeGerar = tgAsType,'AsParadoxOle','ftParadoxOle');
    ftDBaseOle       : Result := IfThen(FTypeGerar = tgAsType,'AsBaseOle','ftDBaseOle');
    ftTypedBinary    : Result := IfThen(FTypeGerar = tgAsType,'AsTypedBinary','ftTypedBinary');
    ftCursor         : Result := IfThen(FTypeGerar = tgAsType,'AsCursor','ftCursor');
    ftFixedChar      : Result := IfThen(FTypeGerar = tgAsType,'AsFixedChar','ftFixedChar');
    ftWideString     : Result := IfThen(FTypeGerar = tgAsType,'AsString','String');
    ftLargeint       : Result := IfThen(FTypeGerar = tgAsType,'AsInteger','ftLargeint');
    ftADT            : ;
    ftArray          : ;
    ftReference      : ;
    ftDataSet        : ;
    ftOraBlob        : ;
    ftOraClob        : ;
    ftVariant        : ;
    ftInterface      : ;
    ftIDispatch      : ;
    ftGuid           : ;
    ftTimeStamp      : ;
    ftFMTBcd         : ;
    ftFixedWideChar  : ;
    ftWideMemo       : ;
    ftOraTimeStamp   : ;
    ftOraInterval    : ;
    ftLongWord       : ;
    ftShortint       : ;
    ftByte           : ;
    ftExtended       : ;
    ftConnection     : ;
    ftParams         : ;
    ftStream         : ;
    ftTimeStampOffset: ;
    ftObject         : ;
    ftSingle         : ;
  end;
end;

end.
