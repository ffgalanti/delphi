object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Aplicativo para Gerar Classes'
  ClientHeight = 491
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 755
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
      Width = 723
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
      Left = 728
      Top = 3
      Width = 24
      Height = 24
      Align = alRight
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 567
      object sbClose: TSpeedButton
        Left = 0
        Top = 0
        Width = 24
        Height = 24
        Align = alClient
        Caption = 'X'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = sbCloseClick
        ExplicitLeft = 8
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
end
