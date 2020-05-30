object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Aplicativo para Gerar Classes'
  ClientHeight = 491
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 30
    Width = 1074
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 461
  end
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 1074
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    Color = 5066061
    Padding.Left = 5
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      Left = 5
      Top = 3
      Width = 1042
      Height = 24
      Align = alClient
      Caption = 'Gerador de Classes'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 124
      ExplicitHeight = 16
    end
    object pnlClose: TPanel
      Left = 1047
      Top = 3
      Width = 24
      Height = 24
      Align = alRight
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 0
      object sbClose: TSpeedButton
        Left = 0
        Top = 0
        Width = 24
        Height = 24
        Action = actClose
        Align = alClient
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Margin = 0
        ParentFont = False
        ExplicitLeft = 8
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 35
    Width = 1074
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object Bevel3: TBevel
      Left = 5
      Top = 180
      Width = 1064
      Height = 5
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 0
      ExplicitTop = 30
      ExplicitWidth = 461
    end
    object Bevel8: TBevel
      Left = 319
      Top = 185
      Width = 5
      Height = 266
      Align = alLeft
      Shape = bsSpacer
      ExplicitLeft = 0
      ExplicitTop = 179
      ExplicitHeight = 747
    end
    object pnlConfiguration: TPanel
      Left = 5
      Top = 0
      Width = 1064
      Height = 180
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel1: TBevel
        Left = 600
        Top = 0
        Width = 5
        Height = 180
        Align = alLeft
        Shape = bsSpacer
        ExplicitLeft = 0
        ExplicitTop = 179
        ExplicitHeight = 747
      end
      object pnlConfigurationDataBase: TPanel
        Left = 0
        Top = 0
        Width = 600
        Height = 180
        Align = alLeft
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label6: TLabel
          Left = 58
          Top = 64
          Width = 29
          Height = 13
          Caption = 'Driver'
        end
        object Label2: TLabel
          Left = 217
          Top = 64
          Width = 40
          Height = 13
          Caption = 'Servidor'
        end
        object Label11: TLabel
          Left = 361
          Top = 64
          Width = 26
          Height = 13
          Caption = 'Porta'
        end
        object Label3: TLabel
          Left = 10
          Top = 93
          Width = 77
          Height = 13
          Caption = 'Banco de Dados'
        end
        object Label10: TLabel
          Left = 51
          Top = 123
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label12: TLabel
          Left = 207
          Top = 123
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object Label9: TLabel
          Left = 11
          Top = 33
          Width = 76
          Height = 13
          Caption = 'Nome Aplicativo'
        end
        object Bevel4: TBevel
          Left = 0
          Top = 173
          Width = 598
          Height = 5
          Align = alBottom
          Shape = bsSpacer
          ExplicitTop = 184
          ExplicitWidth = 455
        end
        object pnlDataBaseTitle: TPanel
          Left = 0
          Top = 0
          Width = 598
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Color = 5066061
          Padding.Left = 5
          ParentBackground = False
          TabOrder = 1
          object Label1: TLabel
            Left = 5
            Top = 0
            Width = 593
            Height = 25
            Align = alClient
            Caption = 'Configura'#231#227'o do banco de dados'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clSilver
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 211
            ExplicitHeight = 16
          end
        end
        object cbbDriver: TComboBox
          Left = 90
          Top = 60
          Width = 104
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = cbbDriverChange
          Items.Strings = (
            'Firebird'
            'PostgreSQL')
        end
        object edtServer: TEdit
          Left = 267
          Top = 61
          Width = 80
          Height = 19
          TabOrder = 2
          Text = '127.0.0.1'
        end
        object edtPorta: TEdit
          Left = 397
          Top = 61
          Width = 50
          Height = 19
          TabOrder = 6
        end
        object edtDB: TButtonedEdit
          Left = 90
          Top = 90
          Width = 351
          Height = 19
          Images = imgIcons16
          RightButton.DisabledImageIndex = 0
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 3
          OnRightButtonClick = edtDBRightButtonClick
        end
        object edtUsuario: TEdit
          Left = 90
          Top = 120
          Width = 100
          Height = 19
          TabOrder = 4
        end
        object edtSenha: TEdit
          Left = 247
          Top = 120
          Width = 100
          Height = 19
          TabOrder = 5
        end
        object edtNomeApp: TEdit
          Left = 90
          Top = 30
          Width = 131
          Height = 19
          TabOrder = 7
        end
        object pnlToolBar: TPanel
          Left = 448
          Top = 25
          Width = 150
          Height = 148
          Align = alRight
          BevelOuter = bvNone
          Padding.Left = 5
          Padding.Right = 5
          ParentBackground = False
          TabOrder = 8
          object Bevel6: TBevel
            Left = 5
            Top = 80
            Width = 140
            Height = 5
            Align = alTop
            Shape = bsSpacer
            ExplicitTop = 96
          end
          object Bevel5: TBevel
            Left = 5
            Top = 0
            Width = 140
            Height = 5
            Align = alTop
            Shape = bsSpacer
            ExplicitLeft = 10
          end
          object Bevel7: TBevel
            Left = 5
            Top = 45
            Width = 140
            Height = 5
            Align = alTop
            Shape = bsSpacer
            ExplicitLeft = 140
            ExplicitTop = 0
            ExplicitWidth = 120
          end
          object pnlConectDisconect: TPanel
            Left = 5
            Top = 5
            Width = 140
            Height = 40
            Align = alTop
            BevelOuter = bvNone
            Color = clGreen
            ParentBackground = False
            TabOrder = 0
            object btnConectar: TSpeedButton
              Left = 0
              Top = 0
              Width = 140
              Height = 40
              Align = alClient
              Caption = 'Conectar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 48
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object pnlPreview: TPanel
            Left = 5
            Top = 50
            Width = 140
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            Color = clOlive
            ParentBackground = False
            TabOrder = 1
            object btnPreview: TSpeedButton
              Left = 0
              Top = 0
              Width = 140
              Height = 30
              Align = alClient
              Caption = 'Preview'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 40
              ExplicitTop = 40
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
          object pnlGerarArquivo: TPanel
            Left = 5
            Top = 85
            Width = 140
            Height = 63
            Align = alClient
            BevelOuter = bvNone
            Color = clNavy
            ParentBackground = False
            TabOrder = 2
            object btnGerar: TSpeedButton
              Left = 0
              Top = 0
              Width = 140
              Height = 63
              Align = alClient
              Caption = 'Gerar Arquivos'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitTop = 128
              ExplicitWidth = 150
              ExplicitHeight = 30
            end
          end
        end
      end
      object pnlConfigurationPath: TPanel
        Left = 605
        Top = 0
        Width = 459
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Label8: TLabel
          Left = 10
          Top = 33
          Width = 94
          Height = 13
          Caption = 'Pasta Configura'#231#227'o'
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 457
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Color = 5066061
          Padding.Left = 5
          ParentBackground = False
          TabOrder = 13
          object Label14: TLabel
            Left = 5
            Top = 0
            Width = 452
            Height = 25
            Align = alClient
            Caption = 'Configura'#231#227'o dos Arquivos'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clSilver
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 174
            ExplicitHeight = 16
          end
        end
        object edtModel: TButtonedEdit
          Left = 130
          Top = 90
          Width = 350
          Height = 19
          Images = imgIcons16
          RightButton.DisabledImageIndex = 0
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 5
          OnRightButtonClick = edtModelRightButtonClick
        end
        object ckInterface: TCheckBox
          Left = 10
          Top = 61
          Width = 120
          Height = 17
          Caption = 'Gerar Interfaces em'
          TabOrder = 1
        end
        object ckModel: TCheckBox
          Left = 10
          Top = 91
          Width = 120
          Height = 17
          Caption = 'Gerar Model em'
          TabOrder = 4
        end
        object edtInterface: TButtonedEdit
          Left = 130
          Top = 60
          Width = 350
          Height = 19
          Images = imgIcons16
          RightButton.DisabledImageIndex = 0
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 2
          OnRightButtonClick = edtInterfaceRightButtonClick
        end
        object edtController: TButtonedEdit
          Left = 130
          Top = 120
          Width = 350
          Height = 19
          Images = imgIcons16
          RightButton.DisabledImageIndex = 0
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 8
          OnRightButtonClick = edtControllerRightButtonClick
        end
        object edtDao: TButtonedEdit
          Left = 130
          Top = 150
          Width = 350
          Height = 19
          Images = imgIcons16
          RightButton.DisabledImageIndex = 0
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 11
          OnRightButtonClick = edtDaoRightButtonClick
        end
        object ckController: TCheckBox
          Left = 10
          Top = 121
          Width = 120
          Height = 17
          Caption = 'Gerar Controller em'
          TabOrder = 7
        end
        object ckDao: TCheckBox
          Left = 10
          Top = 151
          Width = 120
          Height = 17
          Caption = 'Gerar Dao em'
          TabOrder = 10
        end
        object edtConfig: TButtonedEdit
          Left = 130
          Top = 30
          Width = 350
          Height = 19
          Images = imgIcons16
          RightButton.DisabledImageIndex = 0
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = edtConfigRightButtonClick
        end
        object cbxInterface: TComboBox
          Left = 486
          Top = 60
          Width = 220
          Height = 21
          Style = csDropDownList
          TabOrder = 3
          Items.Strings = (
            'Classe'
            'Classe + Property'
            'Classe + Property + Setters'
            'Classe + Property + Setters + Getters')
        end
        object cbxModel: TComboBox
          Left = 486
          Top = 90
          Width = 220
          Height = 21
          Style = csDropDownList
          TabOrder = 6
          Items.Strings = (
            'Classe'
            'Classe + Property'
            'Classe + Property + Setters'
            'Classe + Property + Setters + Getters')
        end
        object cbxController: TComboBox
          Left = 486
          Top = 120
          Width = 220
          Height = 21
          Style = csDropDownList
          TabOrder = 9
          Items.Strings = (
            'Classe'
            'Classe + Property'
            'Classe + Property + Setters'
            'Classe + Property + Setters + Getters')
        end
        object cbxDao: TComboBox
          Left = 486
          Top = 150
          Width = 220
          Height = 21
          Style = csDropDownList
          TabOrder = 12
          Items.Strings = (
            'Classe'
            'Classe + Property'
            'Classe + Property + Setters'
            'Classe + Property + Setters + Getters')
        end
      end
    end
    object pnlDadosTabela: TPanel
      Left = 5
      Top = 185
      Width = 314
      Height = 266
      Align = alLeft
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 312
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 5066061
        Padding.Left = 5
        ParentBackground = False
        TabOrder = 0
        object Label16: TLabel
          Left = 5
          Top = 0
          Width = 307
          Height = 25
          Align = alClient
          Caption = 'Informa'#231#245'es do Banco de Dados'
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 208
          ExplicitHeight = 16
        end
      end
    end
    object Panel1: TPanel
      Left = 324
      Top = 185
      Width = 745
      Height = 266
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 743
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 5066061
        Padding.Left = 5
        ParentBackground = False
        TabOrder = 0
        object Label4: TLabel
          Left = 5
          Top = 0
          Width = 738
          Height = 25
          Align = alClient
          Caption = 'Preview dos arquivos'
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 139
          ExplicitHeight = 16
        end
      end
      object pgNav: TPageControl
        Left = 0
        Top = 25
        Width = 743
        Height = 239
        ActivePage = tabController
        Align = alClient
        TabOrder = 1
        object tabInterface: TTabSheet
          Caption = 'Interface'
          object memoInterface: TMemo
            Left = 0
            Top = 0
            Width = 735
            Height = 211
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tabController: TTabSheet
          Caption = 'Controller'
          ImageIndex = 1
          object memoController: TMemo
            Left = 0
            Top = 0
            Width = 735
            Height = 211
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tabModel: TTabSheet
          Caption = 'Model'
          ImageIndex = 2
          object memoModel: TMemo
            Left = 0
            Top = 0
            Width = 735
            Height = 211
            Align = alClient
            Lines.Strings = (
              '{'
              '  "user": "SYSDBA",'
              '  "password": "masterkey",'
              '  "protocol": "firebird",'
              '  "hostname": "127.0.0.1",'
              '  "port": "3050",'
              '  "database": "C:\FDBs\Unigui\unigui.fdb",'
              '  "librarylocation": "C:\windows\system32\fbclient.dll"'
              '}')
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tabDao: TTabSheet
          Caption = 'Dao'
          ImageIndex = 3
          object memodao: TMemo
            Left = 0
            Top = 0
            Width = 735
            Height = 211
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object imgIcons24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 424
    Top = 280
    Bitmap = {
      494C010101000800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001616
      164CCDCDCDE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCB
      CBE41515154A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBCB
      CBE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFC8C8C8E20000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C1616164C1616164C1616164C1616
      164C1616164C1616164C1616164C1616164C1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C1616164C1616164C1616164C1616
      164C1616164C1616164C1616164C1616164C1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C29292967A6A6A6CE2020205B1616164C1616
      164C1616164C1616164C2020205BA6A6A6CE282828661616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164CADADADD2FFFFFFFFCACACAE32121215D1616
      164C1616164C2222225ECACACAE3FFFFFFFFABABABD11616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C2323235FCBCBCBE4FFFFFFFFC3C3C3DF1F1F
      1F5A2020205BC3C3C3DFFFFFFFFFCBCBCBE42323235F1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C2020205BC3C3C3DFFFFFFFFFC8C8
      C8E2C8C8C8E2FFFFFFFFC1C1C1DE2020205B1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C1616164C1F1F1F5ABFBFBFDDFFFF
      FFFFFFFFFFFFBFBFBFDD1E1E1E591616164C1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C1616164C2020205BC3C3C3DFFFFF
      FFFFFFFFFFFFC3C3C3DF2020205B1616164C1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C2222225ECACACAE3FFFFFFFFC8C8
      C8E2C8C8C8E2FFFFFFFFCACACAE32121215D1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C2020205BC3C3C3DFFFFFFFFFCBCBCBE42323
      235F2323235FCBCBCBE4FFFFFFFFC3C3C3DF1F1F1F5A1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164CADADADD2FFFFFFFFC1C1C1DE2020205B1616
      164C1616164C2020205BC3C3C3DFFFFFFFFFABABABD11616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C2A2A2A68A1A1A1CB1E1E1E591616164C1616
      164C1616164C1616164C1F1F1F5AA1A1A1CB2A2A2A681616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C1616164C1616164C1616164C1616
      164C1616164C1616164C1616164C1616164C1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF1616164C1616164C1616164C1616164C1616164C1616164C1616
      164C1616164C1616164C1616164C1616164C1616164C1616164C1616164CFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8C8
      C8E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFC4C4C4E00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001616
      164CC1C1C1DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBF
      BFDD1515154A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object actList: TActionList
    Images = imgIcons24
    Left = 464
    Top = 336
    object actClose: TAction
      Caption = ' '
      ImageIndex = 0
      OnExecute = actCloseExecute
    end
    object actSelecionarArquivo: TAction
      Caption = 'Selecionar arquivo'
      OnExecute = actSelecionarArquivoExecute
    end
  end
  object imgIcons16: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 504
    Top = 280
    Bitmap = {
      494C010101000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000D5F82B60D5F
      82B60D5F82B60D5F82B601080C38000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AEA490FFAEA490FFAEA490FFAEA490FFAEA490FFAEA490FF27CAFFFF27CA
      FFFF27CAFFFF27CAFFFF0F6A90C0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B292480000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF0F6A90C0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B292480000000000000000000000000000000000000000014B7FFFF14B7
      FFFF10739BC710739BC701080C38000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B2924800000000000000000000000000000000000000000002D48880024
      3A7A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B292480000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF073B5190000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B292480000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF0F6A90C0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B292480000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF0F6A90C0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B292480000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF073A508F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF27CAFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF27CAFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027CAFFFF27CA
      FFFF27CAFFFF27CAFFFF27CAFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000013B5FFFF14B7
      FFFF10759EC910739BC708405997000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Filter = 'FireBird|*.fdb'
    Left = 547
    Top = 340
  end
end
