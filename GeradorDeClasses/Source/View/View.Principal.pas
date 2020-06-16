unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ActnList,
  Interfaces.ConexaoFireDac, Interfaces.QueryFireDac, Data.DB, System.JSON,
  Vcl.DBGrids, Interfaces.Gerar, System.Actions, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Types;

type
  TFPrincipal = class(TForm)
    pnlTitle: TPanel;
    lblTitle: TLabel;
    pnlClose: TPanel;
    sbClose: TSpeedButton;
    pnlConfigurationDataBase: TPanel;
    pnlDataBaseTitle: TPanel;
    Label1: TLabel;
    imgIcons24: TImageList;
    actList: TActionList;
    actClose: TAction;
    imgIcons16: TImageList;
    Bevel1: TBevel;
    pnlConfigurationPath: TPanel;
    Panel2: TPanel;
    Label14: TLabel;
    pnlConfiguration: TPanel;
    OpenDialog1: TOpenDialog;
    actSelecionarArquivo: TAction;
    pnlDados: TPanel;
    pnlDadosTabela: TPanel;
    pnlDadosTablesTitle: TPanel;
    Label16: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Panel1: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Bevel8: TBevel;
    pgNav: TPageControl;
    tabInterface: TTabSheet;
    memoInterface: TMemo;
    tabController: TTabSheet;
    memoController: TMemo;
    tabModel: TTabSheet;
    memoModel: TMemo;
    tabDao: TTabSheet;
    memodao: TMemo;
    pnlConfigurarConexao: TPanel;
    Label9: TLabel;
    edtNomeApp: TEdit;
    cbbDriver: TComboBox;
    Label6: TLabel;
    Label2: TLabel;
    edtServer: TEdit;
    Label11: TLabel;
    edtPorta: TEdit;
    Label3: TLabel;
    edtDB: TButtonedEdit;
    Label10: TLabel;
    edtUsuario: TEdit;
    Label12: TLabel;
    edtSenha: TEdit;
    pnlConfigurarPaths: TPanel;
    Label8: TLabel;
    edtConfig: TButtonedEdit;
    ckInterface: TCheckBox;
    edtInterface: TButtonedEdit;
    ckModel: TCheckBox;
    edtModel: TButtonedEdit;
    ckController: TCheckBox;
    edtController: TButtonedEdit;
    ckDao: TCheckBox;
    edtDao: TButtonedEdit;
    pnlDadosTablesDados: TPanel;
    pnlTables: TPanel;
    dbgTables: TDBGrid;
    Panel5: TPanel;
    Label5: TLabel;
    pnlFields: TPanel;
    dbgFields: TDBGrid;
    Panel6: TPanel;
    lblFields: TLabel;
    pnlKeys: TPanel;
    dbgKeys: TDBGrid;
    Panel7: TPanel;
    Label7: TLabel;
    pnlToolBar: TPanel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    pnlPreview: TPanel;
    btnPreview: TSpeedButton;
    pnlGerarArquivo: TPanel;
    btnGerar: TSpeedButton;
    pnlBtnConectar: TPanel;
    pnlTemplate: TPanel;
    cbxInterface: TComboBox;
    cbxModel: TComboBox;
    cbxController: TComboBox;
    cbxDao: TComboBox;
    btnConectar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure cbbDriverChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSelecionarArquivoExecute(Sender: TObject);
    procedure edtDBRightButtonClick(Sender: TObject);
    procedure edtConfigRightButtonClick(Sender: TObject);
    procedure edtInterfaceRightButtonClick(Sender: TObject);
    procedure edtModelRightButtonClick(Sender: TObject);
    procedure edtControllerRightButtonClick(Sender: TObject);
    procedure edtDaoRightButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);

    procedure DSOnChange(Sender: TObject; Field: TField);
    procedure btnPreviewClick(Sender: TObject);
  private
    { Private declarations }
    FConexaoJson: TJSONObject;
    FSQLTabela, FSQLCampos, FSQLChaves, FSQLTabelaSelecionada: string;
    FModelGerar: IModelGerar;

    procedure LerConfiguracao;
    procedure GravarConfiguracao;

    function SelectDir(Value: String) : String;
    procedure AddFiles(APath: string; AExtensao: string; ACombo: TComboBox);
    procedure CarregarTemplates;

    procedure CriarConexaoJson; deprecated;
    procedure CriarConexao;
    procedure ConectarDB;
    procedure CriarDataSource;
    procedure ConfigurarGrids;
    procedure AtivarDesativarCtrl;

    procedure GetCamposChaves;

    procedure PreencherSQL(aDriver: TTypeDriver);
    procedure ConfigurarFirebird;
    procedure ConfigurarPostgreSQL;

    procedure WMGetMinmaxInfo(var Msg: TWMGetMinmaxInfo); message WM_GETMINMAXINFO;
  public
    { Public declarations }
    AppPath: String;

    FConexao     : iModelConexaoFireDac;
    FQueryTabelas: iModelQueryFireDac;

    FDsTabela: TDataSource;
    FDsCampos: TDataSource;
    FDsChaves: TDataSource;
  end;

const
  ArquivoIni: string = 'config.ini';

var
  FPrincipal: TFPrincipal;

implementation

uses
  System.StrUtils,
  Vcl.FileCtrl, System.IniFiles,
  Gerar, ConexaoFireDac,
  QueryFireDac;

{$R *.dfm}

{ TFPrincipal }

procedure TFPrincipal.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPrincipal.actSelecionarArquivoExecute(Sender: TObject);
begin
  OpenDialog1.Execute();
  edtDB.Text := OpenDialog1.FileName;
//  GravarConfiguracao;
end;

procedure TFPrincipal.AddFiles(APath, AExtensao: string; ACombo: TComboBox);
var
  SR: TSearchRec;
  I: integer;
begin
  ACombo.Items.Clear;
  I := FindFirst(APath+AExtensao, faAnyFile, SR);
  while I = 0 do
  begin
    ACombo.Items.Add(SR.Name);
    I := FindNext(SR);
  end;
  if ACombo.Items.Count > 0 then
    ACombo.ItemIndex := 0;
end;

procedure TFPrincipal.AtivarDesativarCtrl;
begin
  pnlConfigurarConexao.Enabled := not FConexao.GetConn.Connected;
  pnlConfigurarPaths.Enabled   := not FConexao.GetConn.Connected;

  btnPreview.Enabled := FConexao.GetConn.Connected;
  btnGerar.Enabled := FConexao.GetConn.Connected;

  pnlClose.Enabled := not FConexao.GetConn.Connected;

  MemoInterface.Lines.Clear;
  MemoController.Lines.Clear;
  memoModel.Lines.Clear;
  memoController.Lines.Clear;

  ConfigurarGrids;
end;

procedure TFPrincipal.btnConectarClick(Sender: TObject);
begin
  case FConexao.GetConn.Connected of
    True :
    begin
      FConexao.GetConn.Connected := False;
      btnConectar.Caption := 'Conectar';
      pnlBtnConectar.Color := clGreen;
      sbClose.Cursor := crHandPoint;
    end;
    False:
    begin
      GravarConfiguracao;
      ConectarDB;
      btnConectar.Caption := 'DisConectar';
      pnlBtnConectar.Color := clRed;
      sbClose.Cursor := crDefault;
    end;
  end;

  AtivarDesativarCtrl;
end;

procedure TFPrincipal.btnPreviewClick(Sender: TObject);
begin
  memoInterface.Lines  :=  FModelGerar.Execute(edtConfig.Text, cbxInterface.Text);
  memoController.Lines :=  FModelGerar.Execute(edtConfig.Text, cbxController.Text);
  memoModel.Lines      :=  FModelGerar.Execute(edtConfig.Text, cbxModel.Text);
  memoDao.Lines        :=  FModelGerar.Execute(edtConfig.Text, cbxDao.Text);
end;

procedure TFPrincipal.CarregarTemplates;
begin
  AddFiles(edtConfig.Text, '*.interfaces', cbxInterface);
  AddFiles(edtConfig.Text, '*.model', cbxModel);
  AddFiles(edtConfig.Text, '*.controller', cbxController);
  AddFiles(edtConfig.Text, '*.dao', cbxdao);
end;

procedure TFPrincipal.cbbDriverChange(Sender: TObject);
begin
  case cbbDriver.ItemIndex of
    0: PreencherSQL(drFirebird);
    1: PreencherSQL(drPostgreSQL);
  end;
end;

procedure TFPrincipal.ConectarDB;
begin
  if edtNomeApp.Text = EmptyStr then
    edtNomeApp.Text := 'AppNome';

  GravarConfiguracao;
  LerConfiguracao;

  CriarConexaoJson;

  FConexao               := TModelConexaoFireDac.New(FConexaoJson).Conectar;
  FQueryTabelas          := TModelQueryFireDac.New(FConexao, FSQLTabela);
  FDsTabela.DataSet      := FQueryTabelas.GetQuery;
  FQueryTabelas.GetQuery.Active := true;
end;

procedure TFPrincipal.CriarConexaoJson;
begin
  try
    if Assigned(FConexaoJson) then
      FConexaoJson.Free;

    FConexaoJson := TJSONObject.Create;

    FConexaoJson.AddPair(TJSONPair.Create('user'           , TJSONString.Create(edtUsuario.Text)));
    FConexaoJson.AddPair(TJSONPair.Create('password'       , TJSONString.Create(edtSenha.Text)));
    FConexaoJson.AddPair(TJSONPair.Create('hostname'       , TJSONString.Create(edtServer.Text)));
    FConexaoJson.AddPair(TJSONPair.Create('port'           , TJSONNumber.Create(edtPorta.Text)));
    FConexaoJson.AddPair(TJSONPair.Create('database'       , TJSONString.Create(edtDB.Text)));
    FConexaoJson.AddPair(TJSONPair.Create('protocol', TJSONString.Create('PG')));
  except
    on E: Exception do
      raise Exception.Create(e.message);
  end;
end;

procedure TFPrincipal.CriarConexao;
begin
  CriarConexaoJson;
  FConexao := TModelConexaoFireDac.New(FConexaoJson);
  CriarDataSource;
end;

procedure TFPrincipal.CriarDataSource;
begin
  FDsTabela := TDataSource.Create(Self);
  dbgTables.DataSource := FDsTabela;
  FDsTabela.OnDataChange := DSOnChange;

  FDsCampos := TDataSource.Create(Self);
  dbgFields.DataSource := FDsCampos;

  FDsChaves := TDataSource.Create(Self);
  dbgKeys.DataSource := FDsChaves;
end;

procedure TFPrincipal.DSOnChange(Sender: TObject; Field: TField);
begin
  GetCamposChaves;
end;

procedure TFPrincipal.ConfigurarFirebird;
begin
  FSQLTabela := 'select rdb$relation_name as Tabela from rdb$relations where rdb$system_flag = 0;';
  FSQLCampos := '';
  FSQLChaves := '';
  FSQLTabelaSelecionada := 'SELECT first 1 * FROM %s';

  edtPorta.Text := IfThen(edtPorta.Text = '', '3050', edtPorta.Text);
  edtUsuario.Text := IfThen(edtUsuario.Text = '', 'sysdba', edtUsuario.Text);
  edtSenha.Text := IfThen(edtSenha.Text = '', 'masterkey', edtSenha.Text);
  edtDB.RightButton.Visible := True;
end;

procedure TFPrincipal.ConfigurarGrids;
var
  vHeight: Integer;
begin
  if Assigned(dbgTables.DataSource.DataSet) and (dbgTables.DataSource.DataSet.Active) then
    dbgTables.Columns.Items[0].Width := pnlTables.Width - 25;

  if Assigned(dbgFields.DataSource.DataSet) and (dbgFields.DataSource.DataSet.Active) then
  begin
    dbgFields.Columns.Items[0].Width := 120;
    dbgFields.Columns.Items[1].Width := 80;
    dbgFields.Columns.Items[2].Width := 30;
  end;

  if Assigned(dbgKeys.DataSource.DataSet) and (dbgKeys.DataSource.DataSet.Active) then
    dbgKeys.Columns.Items[0].Width := pnlKeys.Width - 25;

  vHeight := Round((pnlDadosTablesDados.Height - 25) / 10);

  pnlTables.Height := vHeight * 3;
  pnlKeys.Height := vHeight * 2;
  pnlFields.Align := alClient;

  dbgTables.Align := alClient;
  dbgFields.Align := alClient;
  dbgKeys.Align := alClient;

  Application.ProcessMessages;
end;

procedure TFPrincipal.ConfigurarPostgreSQL;
begin
  FSQLTabela := 'SELECT table_name '+
                'FROM information_schema.tables '+
                'WHERE table_schema=''public'' '+
                'AND table_type=''BASE TABLE'' ORDER BY table_name';

  FSQLCampos := 'select column_name as Campo, data_type as Tipo, character_maximum_length as Tam ' +
                'from information_schema.columns ' +
                'where table_name = ''%s'' ' +
                'order by ordinal_position';

  FSQLChaves := 'select ' +
                'pg_attribute.attname as Campos ' +
                'from pg_index, pg_class, pg_attribute ' +
                'where ' +
                'pg_class.oid = ''%s''::regclass and ' +
                'indrelid = pg_class.oid and ' +
                'pg_attribute.attrelid = pg_class.oid and ' +
                'pg_attribute.attnum = any(pg_index.indkey) ' +
                'and indisprimary';

  FSQLTabelaSelecionada := 'SELECT * FROM %s LIMIT 1';

  edtPorta.Text := IfThen(edtPorta.Text = '', '5432', edtPorta.Text);
  edtUsuario.Text := IfThen(edtUsuario.Text = '', 'postgres', edtUsuario.Text);
  edtSenha.Text := IfThen(edtSenha.Text = '', 'masterkey', edtSenha.Text);
  edtDB.RightButton.Visible := False;
end;

procedure TFPrincipal.edtConfigRightButtonClick(Sender: TObject);
begin
  edtConfig.Text := SelectDir(edtInterface.Text);
  CarregarTemplates;
end;

procedure TFPrincipal.edtControllerRightButtonClick(Sender: TObject);
begin
  edtController.Text := SelectDir(edtInterface.Text);
end;

procedure TFPrincipal.edtDaoRightButtonClick(Sender: TObject);
begin
  edtDao.Text := SelectDir(edtInterface.Text);
end;

procedure TFPrincipal.edtDBRightButtonClick(Sender: TObject);
begin
  actSelecionarArquivo.Execute;
end;

procedure TFPrincipal.edtInterfaceRightButtonClick(Sender: TObject);
begin
  edtInterface.Text := SelectDir(edtInterface.Text);
end;

procedure TFPrincipal.edtModelRightButtonClick(Sender: TObject);
begin
  edtModel.Text := SelectDir(edtInterface.Text);
end;

procedure TFPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  GravarConfiguracao;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  SendMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  AppPath := ExtractFilePath(ParamStr(0));

  LerConfiguracao;
  CriarConexao;

  pgNav.ActivePage := tabInterface;

  AtivarDesativarCtrl;
end;

procedure TFPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDsTabela);
  FreeAndNil(FDsCampos);
  FreeAndNil(FDsChaves);
  FreeAndNil(FConexaoJson);
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  FModelGerar := TModelGerar.New;

  cbbDriverChange(Self);
  sbClose.Cursor := crDefault;
end;

procedure TFPrincipal.GetCamposChaves;
begin
  FModelGerar.Params
    .NomeAplicativo(edtNomeApp.Text)
    .Conexao(FConexao)
    .NomeTabela(dbgTables.Columns.Items[0].Field.Value)
    .SQLTabelaSelecionada(FSQLTabelaSelecionada)
  .&End
  .GetQueryCampos(FDsCampos, Format(FSQLCampos,[dbgTables.Columns.Items[0].Field.Value]))
  .GetQueryChaves(FDsChaves, Format(FSQLChaves,[dbgTables.Columns.Items[0].Field.Value]))
  ;

  ConfigurarGrids;
end;

procedure TFPrincipal.GravarConfiguracao;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(AppPath+ArquivoIni);
  try
    Ini.WriteString('App', 'NomeApp'   , edtNomeApp.Text);

    Ini.WriteString('Path', 'Config'    , edtConfig.Text);
    Ini.WriteString('Path', 'Interface' , edtInterface.Text);
    Ini.WriteString('Path', 'Model'     , edtModel.Text);
    Ini.WriteString('Path', 'Controller', edtController.Text);
    Ini.WriteString('Path', 'Dao'       , edtDao.Text);

    Ini.WriteBool('Gerar', 'ckInterface' , ckInterface.Checked);
    Ini.WriteBool('Gerar', 'ckModel'     , ckModel.Checked);
    Ini.WriteBool('Gerar', 'ckController', ckController.Checked);
    Ini.WriteBool('Gerar', 'ckDao'       , ckDao.Checked);

    Ini.WriteInteger('DB', 'Driver'      , cbbDriver.ItemIndex);

    Ini.WriteString('DB', 'HostName'    , edtServer.Text);
    Ini.WriteString('DB', 'DataBase'    , edtDB.Text);

    Ini.WriteString('DB', 'Port', edtPorta.Text);
    Ini.WriteString('DB', 'User', edtUsuario.Text);
    Ini.WriteString('DB', 'Password', edtSenha.Text);
    Ini.WriteString('DB', 'LibraryLocation', 'libpq.dll');
    Ini.WriteString('DB', 'Protocol', 'firebird-3.0');
    Ini.WriteString('DB', 'PoolerName', 'TdmFuncoes.RESTDWPoolerDB');
  finally
    Ini.Free;
  end;
end;

procedure TFPrincipal.LerConfiguracao;
var
  Ini: TIniFile;
  vHostName: string;
  vPort: string;
  vUser: string;
  vPassword: string;
  vLibraryLocation: string;
  vProtocol: string;
  vDataBase: string;
  vPoolerName: string;
begin
  Ini :=  TIniFile.Create(AppPath+ArquivoIni);
  try
    edtNomeApp.Text    := Ini.ReadString('App', 'NomeApp', '');

    edtConfig.Text := Ini.ReadString('Path', 'Config', AppPath);
    if edtConfig.Text = EmptyStr then
      edtConfig.Text := AppPath;

    ckInterface.Checked := Ini.ReadBool('Gerar', 'ckInterface', true);
    edtInterface.Text   := Ini.ReadString('Path', 'Interface', AppPath);
    if edtInterface.Text = EmptyStr then
      edtInterface.Text := AppPath;

    ckModel.Checked := Ini.ReadBool('Gerar', 'ckModel', true);
    edtModel.Text   := Ini.ReadString('Path', 'Model', AppPath);
    if edtModel.Text = EmptyStr then
      edtModel.Text := AppPath;

    ckController.Checked := Ini.ReadBool('Gerar', 'ckController', true);
    edtController.Text   := Ini.ReadString('Path', 'Controller', AppPath);
    if edtController.Text = EmptyStr then
      edtController.Text := AppPath;

    ckDao.Checked := Ini.ReadBool('Gerar', 'ckDao', true);
    edtDao.Text   := Ini.ReadString('Path', 'Dao', AppPath);
    if edtDao.Text = EmptyStr then
      edtDao.Text := AppPath;

    cbbDriver.ItemIndex := Ini.ReadInteger('DB', 'Driver', 0);

    edtServer.Text     := Ini.ReadString('DB', 'HostName', 'localhost');
    edtDB.Text         := Ini.ReadString('DB', 'DataBase', '');
    edtUsuario.Text := Ini.ReadString('DB', 'User', '');
    edtSenha.Text := Ini.ReadString('DB', 'Password', '');
    edtPorta.Text := Ini.ReadString('DB', 'Port', '');
  finally
    CarregarTemplates;
    Ini.Free;
  end;
end;

procedure TFPrincipal.PreencherSQL(aDriver: TTypeDriver);
begin
  case aDriver of
    drFirebird: ConfigurarFirebird;
    drPostgreSQL: ConfigurarPostgreSQL;
  end;
end;

function TFPrincipal.SelectDir(Value: String): String;
var
  Dir: string;
const
  SELDIRHELP = 1000;
begin
  Dir := Value;
  SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP);
  if Copy(Dir,-1) <> '\' then
    Dir := Dir + '\';
  Result := Dir;
end;

procedure TFPrincipal.WMGetMinmaxInfo(var Msg: TWMGetMinmaxInfo);
var
  R: TRect;
begin
  inherited;

  // Obtem o retangulo com a area livre do desktop
  SystemParametersInfo(SPI_GETWORKAREA, SizeOf(R), @R, 0);

  Msg.MinMaxInfo^.ptMaxPosition := R.TopLeft;
  OffsetRect(R, -R.Left, -R.Top);
  Msg.MinMaxInfo^.ptMaxSize := R.BottomRight;
end;

end.
