object Form_set: TForm_set
  Left = 422
  Top = 165
  BorderStyle = bsDialog
  Caption = 'PPT Countdown(PPT'#20498#35745#26102#22120')'
  ClientHeight = 379
  ClientWidth = 481
  Color = clBtnFace
  TransparentColor = True
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 16
    Top = 204
    Width = 84
    Height = 13
    Caption = #25552#31034#31383#36879#26126#24230
  end
  object Label6: TLabel
    Left = 355
    Top = 229
    Width = 84
    Height = 13
    Caption = #23436#20840#19981#36879#26126#9499
  end
  object Label7: TLabel
    Left = 104
    Top = 230
    Width = 70
    Height = 13
    Caption = #9494#23436#20840#36879#26126
  end
  object Label8: TLabel
    Left = 238
    Top = 229
    Width = 42
    Height = 13
    Caption = #21322#36879#26126
  end
  object Label9: TLabel
    Left = 40
    Top = 140
    Width = 28
    Height = 13
    Caption = #23383#20307
  end
  object Label10: TLabel
    Left = 40
    Top = 172
    Width = 56
    Height = 13
    Caption = #23383#20307#22823#23567
  end
  object Label11: TLabel
    Left = 40
    Top = 260
    Width = 56
    Height = 13
    Caption = #31383#20307#23485#24230
  end
  object Label12: TLabel
    Left = 40
    Top = 292
    Width = 56
    Height = 13
    Caption = #31383#20307#39640#24230
  end
  object GroupBox1: TGroupBox
    Left = 56
    Top = 7
    Width = 329
    Height = 55
    Caption = #28436#35762'  (2-99'#20998#38047')'
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 24
      Width = 72
      Height = 13
      Caption = #24635#26102#38388'('#20998')'
    end
    object Label3: TLabel
      Left = 160
      Top = 24
      Width = 28
      Height = 13
      Caption = #22768#38899
    end
    object SpinEdit1: TSpinEdit
      Left = 86
      Top = 19
      Width = 41
      Height = 22
      MaxValue = 99
      MinValue = 2
      TabOrder = 0
      Value = 5
      OnChange = SpinEdit2Change
    end
    object ComboBox_p1: TComboBox
      Left = 200
      Top = 21
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 56
    Top = 76
    Width = 329
    Height = 54
    Caption = #39044#38083' '#65288#24517#39035#27604#28436#35762#26102#38388#23569#65289
    TabOrder = 1
    object Label2: TLabel
      Left = 3
      Top = 27
      Width = 86
      Height = 13
      Caption = #25552#31034#26102#38388'('#20998')'
    end
    object Label4: TLabel
      Left = 160
      Top = 26
      Width = 28
      Height = 13
      Caption = #22768#38899
    end
    object SpinEdit2: TSpinEdit
      Left = 88
      Top = 22
      Width = 42
      Height = 22
      MaxValue = 98
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnChange = SpinEdit2Change
    end
    object ComboBox_p2: TComboBox
      Left = 202
      Top = 21
      Width = 114
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object Button4: TButton
      Left = 348
      Top = 26
      Width = 24
      Height = 23
      Caption = '...'
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 152
    Top = 335
    Width = 75
    Height = 25
    Caption = #30830#35748'(Y)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 272
    Top = 335
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(C)'
    ModalResult = 2
    TabOrder = 3
  end
  object TrackBar1: TTrackBar
    Left = 102
    Top = 203
    Width = 337
    Height = 23
    Max = 255
    Position = 45
    TabOrder = 4
    OnChange = TrackBar1Change
  end
  object ComboBox1: TComboBox
    Left = 104
    Top = 135
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBox1Change
  end
  object TrackBarw: TTrackBar
    Left = 102
    Top = 259
    Width = 337
    Height = 23
    Max = 500
    Position = 45
    TabOrder = 6
    OnChange = TrackBarwChange
  end
  object TrackBarh: TTrackBar
    Left = 102
    Top = 291
    Width = 337
    Height = 23
    Max = 400
    Position = 45
    TabOrder = 7
    OnChange = TrackBarhChange
  end
  object TrackBar_fs: TTrackBar
    Left = 102
    Top = 171
    Width = 337
    Height = 23
    Max = 200
    Min = 1
    ParentShowHint = False
    Position = 45
    ShowHint = True
    TabOrder = 8
    TickStyle = tsManual
    OnChange = TrackBar_fsChange
  end
  object CheckBox1: TCheckBox
    Left = 112
    Top = 312
    Width = 225
    Height = 17
    Caption = 'PPT'#20020#26102#36864#20986#26816#27979
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 9
  end
end
