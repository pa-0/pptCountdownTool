object Form1: TForm1
  Left = 1072
  Top = 114
  Cursor = crSizeAll
  Hint = #25302#25341#36827#34892#31227#21160','#26700#38754#21491#19979#35282#31995#32479#30418#22270#26631#21491#38190#36827#34892#35774#32622
  Anchors = []
  BorderStyle = bsNone
  Caption = 'PPT Countdown'
  ClientHeight = 63
  ClientWidth = 160
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 88
    Width = 25
    Height = 33
    Visible = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 40
    Top = 88
    Width = 23
    Height = 22
    Visible = False
    OnClick = SpeedButton2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 160
    Height = 63
    Cursor = crSizeAll
    Hint = #25302#25341#36827#34892#31227#21160','#26700#38754#21491#19979#35282#31995#32479#30418#22270#26631#21491#38190#36827#34892#35774#32622
    Align = alClient
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Caption = '00:00'
    Color = clNavy
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnMouseDown = FormMouseDown
  end
  object FileListBox1: TFileListBox
    Left = 119
    Top = 54
    Width = 145
    Height = 49
    ItemHeight = 20
    Mask = '*.wav'
    TabOrder = 1
    Visible = False
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 112
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 128
    Top = 16
    object N2: TMenuItem
      Caption = #35774#32622
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
    object reset1: TMenuItem
      Caption = 'Reset'
      OnClick = reset1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object exit1: TMenuItem
      Caption = 'Exit'
      OnClick = exit1Click
    end
    object set1: TMenuItem
      Caption = 'set'
      Visible = False
      OnClick = set1Click
    end
  end
  object TextTrayIcon1: TTextTrayIcon
    CycleInterval = 0
    Icon.Data = {
      0000010001001010040000000000280100001600000028000000100000002000
      0000010004000000000080000000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF0FFFFFFFF0FF
      FFFF0000FFF0F0FFFFFF0FFF0F0FF0FFFFFF0FFF0F0FF0FFFFFF0FFF0F0FF000
      00FF0FFF0F0FF0FFFF0F0000FF00F0FFFF0FFFFFFF0FF0FFFF0FFFFFFF0FF000
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    IconIndex = 0
    PopupMenu = PopupMenu1
    Text = 'Ppt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Border = False
    Options.OffsetX = 0
    Options.OffsetY = 0
    Options.LineDistance = 0
    Left = 88
    Top = 8
  end
  object Timer_ppt: TTimer
    Enabled = False
    OnTimer = Timer_pptTimer
    Left = 128
    Top = 32
  end
end
