object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  CustomHint = bhPrincipal
  BorderIcons = [biSystemMenu]
  Caption = 'Desafio Delphi - Teste Senior Sistemas'
  ClientHeight = 196
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000001111100000000000000000000000000011111000000000000000
    00000000000011111000000000000000000000000353B8700000000000000000
    000000000353B8700000000000000700000000000353B8700000000000007B30
    000077000353B87070000000000007B3000330460353B876007000000000007B
    3000B6660353B8766607000000000007B306BB860353B8766660700000000000
    7B76BBB80353B876666607000000000077BBBBBB0353B8766666600000000000
    07BBBBBB0353B8766666660000000000066BBB8B0353B8766666660000000000
    6666BB860353B876666666070000007066666B660353B8766666666000000070
    666666660353B8766B86666000000006666666660353B8766BB6666000000006
    666666660353B87B6BB8666000000070666666660353B87BBBBB866000000070
    666666660353B87BBBBBB86000000000666666660353B878BBB8BB0700000000
    666666010353B8778BB68B3700000007066660011333B711188666B300000000
    06666660011373310686603B30000000706666666001110666660073B7000000
    0706666666600666666000073B70000000706666666666666600000003B70000
    0007006666666666600000000000000000000700466666000700000000070000
    000000070000007700000000000000000000000000000000000000000000FFC0
    07FFFFC007FFFFC007FFFFF01FFFFFF01FFF3FF01FFF1E0007FF8E0001FFC600
    00FFE000007FF000003FF000003FF000001FE000001FE000000FC000000FC000
    000FC000000FC000000FC000000FC000000FE000000FE000000FE000000FF000
    0007F0000003F8000061FC0000F8FE0001FCFF8003FEFFE00FFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 153
    Width = 105
    Height = 13
    CustomHint = bhPrincipal
    AutoSize = False
    Caption = 'Desenvolvido Por'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object Label2: TLabel
    Left = 9
    Top = 166
    Width = 105
    Height = 13
    CustomHint = bhPrincipal
    AutoSize = False
    Caption = 'Marcelo Leal'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object Label3: TLabel
    Left = 9
    Top = 178
    Width = 105
    Height = 13
    CustomHint = bhPrincipal
    AutoSize = False
    Caption = '(21) 96484-9644'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object btnEncerrar: TButton
    Left = 279
    Top = 157
    Width = 98
    Height = 32
    Cursor = crHandPoint
    Hint = 'Encerra a Janela e Retorna ao Windows'
    CustomHint = bhPrincipal
    Caption = '&Encerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    TabOrder = 2
    OnClick = btnEncerrarClick
  end
  object btnSubstituir: TButton
    Left = 175
    Top = 157
    Width = 98
    Height = 32
    Cursor = crHandPoint
    Hint = 
      'Efetua a Substitui'#231#227'o da Express'#227'o Antiga pela Express'#227'o Nova no' +
      ' Texto Principal'
    CustomHint = bhPrincipal
    Caption = '&Substituir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    TabOrder = 1
    OnClick = btnSubstituirClick
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 8
    Width = 368
    Height = 140
    CustomHint = bhPrincipal
    TabOrder = 0
    object edtTextoPrincipal: TLabeledEdit
      Left = 14
      Top = 37
      Width = 337
      Height = 28
      CustomHint = bhPrincipal
      CharCase = ecUpperCase
      EditLabel.Width = 97
      EditLabel.Height = 20
      EditLabel.CustomHint = bhPrincipal
      EditLabel.Caption = 'Texto Principal'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.Font.Quality = fqClearTypeNatural
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      LabelSpacing = 5
      ParentFont = False
      TabOrder = 0
    end
    object edtExpressaoAntiga: TLabeledEdit
      Left = 14
      Top = 98
      Width = 153
      Height = 28
      CustomHint = bhPrincipal
      CharCase = ecUpperCase
      EditLabel.Width = 114
      EditLabel.Height = 20
      EditLabel.CustomHint = bhPrincipal
      EditLabel.Caption = 'Express'#227'o Antiga'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.Font.Quality = fqClearTypeNatural
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      LabelSpacing = 5
      ParentFont = False
      TabOrder = 1
    end
    object edtExpressaoNova: TLabeledEdit
      Left = 198
      Top = 98
      Width = 153
      Height = 28
      CustomHint = bhPrincipal
      CharCase = ecUpperCase
      EditLabel.Width = 105
      EditLabel.Height = 20
      EditLabel.CustomHint = bhPrincipal
      EditLabel.Caption = 'Express'#227'o Nova'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.Font.Quality = fqClearTypeNatural
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      LabelSpacing = 5
      ParentFont = False
      TabOrder = 2
    end
  end
  object bhPrincipal: TBalloonHint
    Left = 357
    Top = 4
  end
end
