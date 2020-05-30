unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList;

type
  TFPrincipal = class(TForm)
    pnlTitle: TPanel;
    lblTitle: TLabel;
    pnlClose: TPanel;
    sbClose: TSpeedButton;
    pnlConfigurationDataBase: TPanel;
    pnlDataBaseTitle: TPanel;
    Label1: TLabel;
    cbbDriver: TComboBox;
    Label6: TLabel;
    Label2: TLabel;
    edtServer: TEdit;
    Label11: TLabel;
    edtPorta: TEdit;
    Label3: TLabel;
    edtDB: TButtonedEdit;
    imgIcons24: TImageList;
    actList: TActionList;
    actClose: TAction;
    imgIcons16: TImageList;
    Label10: TLabel;
    edtUsuario: TEdit;
    Label12: TLabel;
    edtSenha: TEdit;
    pnlConectDisconect: TPanel;
    Bevel1: TBevel;
    pnlConfigurationPath: TPanel;
    Panel2: TPanel;
    Label14: TLabel;
    edtModel: TButtonedEdit;
    ckInterface: TCheckBox;
    ckModel: TCheckBox;
    edtInterface: TButtonedEdit;
    edtController: TButtonedEdit;
    edtDao: TButtonedEdit;
    ckController: TCheckBox;
    ckDao: TCheckBox;
    edtConfig: TButtonedEdit;
    Label8: TLabel;
    pnlConfiguration: TPanel;
    OpenDialog1: TOpenDialog;
    actSelecionarArquivo: TAction;
    cbxInterface: TComboBox;
    cbxModel: TComboBox;
    cbxController: TComboBox;
    cbxDao: TComboBox;
    Label9: TLabel;
    edtNomeApp: TEdit;
    pnlDados: TPanel;
    pnlDadosTabela: TPanel;
    Panel3: TPanel;
    Label16: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnConectar: TSpeedButton;
    Bevel4: TBevel;
    pnlToolBar: TPanel;
    pnlPreview: TPanel;
    Bevel6: TBevel;
    pnlGerarArquivo: TPanel;
    btnGerar: TSpeedButton;
    btnPreview: TSpeedButton;
    Bevel5: TBevel;
    Bevel7: TBevel;
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
  private
    { Private declarations }
    procedure WMGetMinmaxInfo(var Msg: TWMGetMinmaxInfo); message WM_GETMINMAXINFO;

    function SelectDir(Value: String) : String;
    procedure AddFiles(APath: string; AExtensao: string; ACombo: TComboBox);
    procedure CarregarTemplates;

    procedure LerConfiguracao;
    procedure GravarConfiguracao;

    procedure AtivarDesativarCtrl;
  public
    { Public declarations }
    AppPath: String;
  end;

const
  ArquivoIni: string = 'Config.ini';

var
  FPrincipal: TFPrincipal;


implementation

uses
  Vcl.FileCtrl, System.IniFiles;

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
//  pnlDados.Enabled   := FConexao.GetConn.Connected;
//  pnlMain.Enabled    := FConexao.GetConn.Connected;
//  btnPreview.Enabled := FConexao.GetConn.Connected;
//  btnGerar.Enabled   := FConexao.GetConn.Connected;
//  cxPadrao.Enabled   := FConexao.GetConn.Connected;
//
//  edtServer.Enabled     := not FConexao.GetConn.Connected;
//  edtDB.Enabled         := not FConexao.GetConn.Connected;
//  sbFile.Enabled        := not FConexao.GetConn.Connected;
//
//  edtNomeApp.Enabled    := not FConexao.GetConn.Connected;
//  edtConfig.Enabled     := not FConexao.GetConn.Connected;
//  sbConfig.Enabled      := not FConexao.GetConn.Connected;
//  edtInterface.Enabled  := not FConexao.GetConn.Connected;
//  sbInterface.Enabled   := not FConexao.GetConn.Connected;
//  edtModel.Enabled      := not FConexao.GetConn.Connected;
//  sbModel.Enabled       := not FConexao.GetConn.Connected;
//  edtController.Enabled := not FConexao.GetConn.Connected;
//  sbController.Enabled  := not FConexao.GetConn.Connected;
//  edtDao.Enabled := not FConexao.GetConn.Connected;
//  sbDao.Enabled  := not FConexao.GetConn.Connected;
//
//  memoModel.Lines.Clear;
//  MemoInterface.Lines.Clear;
//  MemoController.Lines.Clear;
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
    0:
    begin
      edtPorta.Text := '3050';
      edtUsuario.Text := 'sysdba';
      edtSenha.Text := 'masterkey';
      edtDB.RightButton.Visible := True;
    end;
    1:
    begin
      edtPorta.Text := '5432';
      edtUsuario.Text := 'postgres';
      edtDB.RightButton.Visible := False;
    end;
  end;
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
  GravarConfiguracao;

//  ConfigurarConexao;
//
//  FDsTabela := TDataSource.Create(Self);
//  DBGrid1.DataSource := FDsTabela;
//  FDsTabela.OnDataChange := DSOnChange;
//
//  FDsCampos := TDataSource.Create(Self);
//  DBGrid2.DataSource := FDsCampos;
//
//  FDsChaves := TDataSource.Create(Self);
//  DBGrid3.DataSource := FDsChaves;
//
//  FConexao := TModelConexaoFireDac.New(FConfiguracaoJson);
//
//  FQuery := TModelQueryFireDac.New(FConexao, '');
//  FClasse := TModelClasse.New(edtNomeApp.Text, FConexao, '', modClass);
//
//  cxPadrao.ItemIndex := 0;
//  pgNav.ActivePage := tabInterface;
//
//  memoModel.Lines.Clear;
//  memoController.Lines.Clear;
//  memoInterface.Lines.Clear;

  AtivarDesativarCtrl;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  cbbDriver.ItemIndex := 0;
  cbbDriverChange(Self);
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
