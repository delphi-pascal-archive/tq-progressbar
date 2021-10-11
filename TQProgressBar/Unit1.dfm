object Form1: TForm1
  Left = 215
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TQProgressBar'
  ClientHeight = 682
  ClientWidth = 1130
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 449
    Height = 281
    Brush.Color = clSkyBlue
    Pen.Color = clGray
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 472
    Width = 449
    Height = 113
    Caption = ' StyleGradient '
    TabOrder = 0
    object Label17: TLabel
      Left = 21
      Top = 72
      Width = 103
      Height = 17
      Caption = 'Segment cercle :'
    end
    object RadioButton1: TRadioButton
      Left = 21
      Top = 33
      Width = 68
      Height = 22
      Caption = 'Bar'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 141
      Top = 33
      Width = 68
      Height = 22
      Caption = 'Rond'
      TabOrder = 1
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 242
      Top = 33
      Width = 74
      Height = 22
      Caption = 'Point'
      TabOrder = 2
      OnClick = RadioButton3Click
    end
    object RadioButton7: TRadioButton
      Left = 352
      Top = 33
      Width = 74
      Height = 22
      Caption = 'Pie'
      TabOrder = 3
      OnClick = RadioButton7Click
    end
    object SpinEdit1: TSpinEdit
      Left = 141
      Top = 68
      Width = 292
      Height = 27
      MaxValue = 100
      MinValue = 0
      TabOrder = 4
      Value = 12
      OnChange = SpinEdit1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 800
    Top = 0
    Width = 321
    Height = 225
    Caption = ' Style texte '
    TabOrder = 1
    object Label3: TLabel
      Left = 17
      Top = 72
      Width = 49
      Height = 18
      Caption = 'Texte :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 17
      Top = 144
      Width = 41
      Height = 17
      Caption = 'Taille : '
    end
    object Label25: TLabel
      Left = 17
      Top = 178
      Width = 56
      Height = 17
      Caption = 'Couleur :'
    end
    object Edit1: TEdit
      Left = 71
      Top = 68
      Width = 238
      Height = 21
      TabOrder = 0
      Text = 'TQProgressBar'
      OnChange = Edit1Change
    end
    object RadioButton4: TRadioButton
      Left = 17
      Top = 107
      Width = 78
      Height = 22
      Caption = 'Valeur'
      TabOrder = 1
      OnClick = RadioButton4Click
    end
    object RadioButton5: TRadioButton
      Left = 103
      Top = 107
      Width = 148
      Height = 22
      Caption = 'Pourcentage'
      TabOrder = 2
      OnClick = RadioButton5Click
    end
    object RadioButton6: TRadioButton
      Left = 230
      Top = 107
      Width = 75
      Height = 22
      Caption = 'Texte'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = RadioButton6Click
    end
    object CheckBox1: TCheckBox
      Left = 17
      Top = 33
      Width = 75
      Height = 22
      Caption = 'Afficher'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object SpinEdit2: TSpinEdit
      Left = 73
      Top = 140
      Width = 236
      Height = 27
      MaxValue = 0
      MinValue = 0
      TabOrder = 5
      Value = 10
      OnChange = SpinEdit2Change
    end
    object ColorBox3: TColorBox
      Left = 82
      Top = 174
      Width = 227
      Height = 22
      ItemHeight = 16
      TabOrder = 6
      OnChange = ColorBox3Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 472
    Top = 0
    Width = 321
    Height = 225
    Caption = ' Color '
    TabOrder = 2
    object Label4: TLabel
      Left = 9
      Top = 42
      Width = 66
      Height = 17
      Caption = 'ColorFirst :'
    end
    object Label5: TLabel
      Left = 9
      Top = 78
      Width = 65
      Height = 17
      Caption = 'ColorEnd :'
    end
    object Label7: TLabel
      Left = 9
      Top = 115
      Width = 75
      Height = 17
      Caption = 'ColorTrans :'
    end
    object Label12: TLabel
      Left = 9
      Top = 149
      Width = 94
      Height = 17
      Caption = 'Style Gradient :'
    end
    object Label19: TLabel
      Left = 9
      Top = 184
      Width = 62
      Height = 17
      Caption = 'Sens Bar :'
    end
    object ColorBox1: TColorBox
      Left = 86
      Top = 38
      Width = 219
      Height = 22
      Selected = clRed
      ItemHeight = 16
      TabOrder = 0
      OnChange = ColorBox1Change
    end
    object ColorBox2: TColorBox
      Left = 86
      Top = 75
      Width = 219
      Height = 22
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox2Change
    end
    object ColorBox4: TColorBox
      Left = 86
      Top = 111
      Width = 219
      Height = 22
      Selected = clBackground
      ItemHeight = 16
      TabOrder = 2
      OnChange = ColorBox4Change
    end
    object ComboBox1: TComboBox
      Left = 115
      Top = 146
      Width = 190
      Height = 25
      ItemHeight = 17
      TabOrder = 3
      Text = 'sgHorizontal'
      OnChange = ComboBox1Change
      Items.Strings = (
        'sgHorizontal'
        'sgVertical'
        'sgTopLeft'
        'sgTopRight'
        'sgBottomLeft'
        'sgBottomRight'
        'sgRadial'
        'sgDoubleHorz'
        'sgDoubleVert')
    end
    object ComboBox6: TComboBox
      Left = 86
      Top = 180
      Width = 219
      Height = 25
      ItemHeight = 17
      TabOrder = 4
      Text = 'sbLeftRight'
      OnChange = ComboBox6Change
      Items.Strings = (
        'sbLeftRight'
        'sbRightLeft'
        'sbRightLeftInv'
        'sbBottomTop'
        'sbTopBottom'
        'sbBottomTopInv')
    end
  end
  object GroupBox4: TGroupBox
    Left = 471
    Top = 232
    Width = 322
    Height = 441
    Caption = ' Timer '
    TabOrder = 3
    object Label8: TLabel
      Left = 12
      Top = 128
      Width = 99
      Height = 18
      Caption = 'Vitesse Timer :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 14
      Top = 58
      Width = 84
      Height = 17
      Caption = 'Type boucle :'
    end
    object Label18: TLabel
      Left = 12
      Top = 89
      Width = 82
      Height = 17
      Caption = 'Sens boucle :'
    end
    object Label20: TLabel
      Left = 12
      Top = 299
      Width = 105
      Height = 17
      Caption = 'ColorFonduFirst :'
    end
    object Label21: TLabel
      Left = 12
      Top = 332
      Width = 104
      Height = 17
      Caption = 'ColorFonduEnd :'
    end
    object Label22: TLabel
      Left = 12
      Top = 378
      Width = 148
      Height = 18
      Caption = 'Vitesse Fondu / Effet :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 9
      Top = 208
      Width = 86
      Height = 18
      Caption = 'Vitesse defil :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object CheckBox2: TCheckBox
      Left = 12
      Top = 27
      Width = 73
      Height = 23
      Caption = 'Boucle'
      TabOrder = 0
      OnClick = CheckBox2Click
    end
    object TrackBar3: TTrackBar
      Left = 10
      Top = 156
      Width = 295
      Height = 44
      Max = 50
      Min = 1
      Position = 15
      TabOrder = 1
      OnChange = TrackBar3Change
    end
    object TrackBar4: TTrackBar
      Left = 10
      Top = 237
      Width = 295
      Height = 44
      Max = 50
      Min = 5
      Position = 10
      TabOrder = 2
      OnChange = TrackBar4Change
    end
    object ComboBox4: TComboBox
      Left = 112
      Top = 54
      Width = 182
      Height = 25
      ItemHeight = 17
      TabOrder = 3
      Text = 'tbDefil'
      OnChange = ComboBox4Change
      Items.Strings = (
        'tbDefil'
        'tbFondu')
    end
    object ComboBox5: TComboBox
      Left = 112
      Top = 85
      Width = 182
      Height = 25
      ItemHeight = 17
      TabOrder = 4
      Text = 'sbcLeftRight'
      OnChange = ComboBox5Change
      Items.Strings = (
        'sbcLeftRight'
        'sbcRightLeft'
        'sbcTopBottom'
        'sbcBottomTop')
    end
    object ColorBox8: TColorBox
      Left = 128
      Top = 296
      Width = 179
      Height = 22
      ItemHeight = 16
      TabOrder = 5
      OnChange = ColorBox8Change
    end
    object ColorBox9: TColorBox
      Left = 128
      Top = 328
      Width = 179
      Height = 22
      Selected = clRed
      ItemHeight = 16
      TabOrder = 6
      OnChange = ColorBox9Change
    end
    object TrackBar5: TTrackBar
      Left = 10
      Top = 403
      Width = 284
      Height = 30
      Max = 100
      Position = 10
      TabOrder = 7
      OnChange = TrackBar5Change
    end
  end
  object GroupBox5: TGroupBox
    Left = 800
    Top = 232
    Width = 321
    Height = 441
    Caption = ' Slider et Tick '
    TabOrder = 4
    object Label10: TLabel
      Left = 10
      Top = 68
      Width = 66
      Height = 17
      Caption = 'ColorFirst :'
    end
    object Label11: TLabel
      Left = 10
      Top = 102
      Width = 65
      Height = 17
      Caption = 'ColorEnd :'
    end
    object Label13: TLabel
      Left = 10
      Top = 252
      Width = 65
      Height = 17
      Caption = 'TickColor :'
    end
    object Label14: TLabel
      Left = 10
      Top = 143
      Width = 94
      Height = 17
      Caption = 'Style Gradient :'
    end
    object Label15: TLabel
      Left = 10
      Top = 289
      Width = 68
      Height = 17
      Caption = 'TickMarks :'
    end
    object Label23: TLabel
      Left = 10
      Top = 326
      Width = 80
      Height = 17
      Caption = 'TickPosition :'
    end
    object Label26: TLabel
      Left = 10
      Top = 361
      Width = 56
      Height = 17
      Caption = 'TickSize :'
    end
    object Label27: TLabel
      Left = 10
      Top = 399
      Width = 98
      Height = 17
      Caption = 'TickFrequency :'
    end
    object Label28: TLabel
      Left = 10
      Top = 177
      Width = 82
      Height = 17
      Caption = 'Width Slider :'
    end
    object CheckBox3: TCheckBox
      Left = 10
      Top = 29
      Width = 127
      Height = 22
      Caption = 'Slider visible'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox3Click
    end
    object ColorBox5: TColorBox
      Left = 88
      Top = 64
      Width = 221
      Height = 22
      Selected = clLime
      ItemHeight = 16
      TabOrder = 1
      OnChange = ColorBox5Change
    end
    object ColorBox6: TColorBox
      Left = 88
      Top = 101
      Width = 221
      Height = 22
      ItemHeight = 16
      TabOrder = 2
      OnChange = ColorBox6Change
    end
    object CheckBox4: TCheckBox
      Left = 9
      Top = 213
      Width = 127
      Height = 22
      Caption = 'Tick visible'
      TabOrder = 3
      OnClick = CheckBox4Click
    end
    object ColorBox7: TColorBox
      Left = 88
      Top = 248
      Width = 221
      Height = 22
      Selected = clYellow
      ItemHeight = 16
      TabOrder = 4
      OnChange = ColorBox7Change
    end
    object ComboBox2: TComboBox
      Left = 119
      Top = 137
      Width = 190
      Height = 25
      ItemHeight = 17
      TabOrder = 5
      Text = 'sgRadial'
      OnChange = ComboBox2Change
      Items.Strings = (
        'sgHorizontal'
        'sgVertical'
        'sgTopLeft'
        'sgTopRight'
        'sgBottomLeft'
        'sgBottomRight'
        'sgRadial'
        'sgDoubleHorz'
        'sgDoubleVert')
    end
    object ComboBox3: TComboBox
      Left = 88
      Top = 285
      Width = 221
      Height = 25
      ItemHeight = 17
      TabOrder = 6
      Text = 'tmTriangle'
      OnChange = ComboBox3Change
      Items.Strings = (
        'tmTriangle'
        'tmRoundRect'
        'tmLine')
    end
    object ComboBox7: TComboBox
      Left = 99
      Top = 322
      Width = 210
      Height = 25
      ItemHeight = 17
      TabOrder = 7
      Text = 'tpBottomLeft'
      OnChange = ComboBox7Change
      Items.Strings = (
        'tpBottomLeft'
        'tpTopRight'
        'tpAll')
    end
    object SpinEdit3: TSpinEdit
      Left = 76
      Top = 357
      Width = 233
      Height = 27
      MaxValue = 0
      MinValue = 0
      TabOrder = 8
      Value = 4
      OnChange = SpinEdit3Change
    end
    object SpinEdit4: TSpinEdit
      Left = 126
      Top = 395
      Width = 183
      Height = 27
      MaxValue = 0
      MinValue = 0
      TabOrder = 9
      Value = 10
      OnChange = SpinEdit4Change
    end
    object SpinEdit5: TSpinEdit
      Left = 102
      Top = 173
      Width = 207
      Height = 27
      MaxValue = 0
      MinValue = 0
      TabOrder = 10
      Value = 15
      OnChange = SpinEdit5Change
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 296
    Width = 449
    Height = 169
    Caption = ' Tailles '
    TabOrder = 5
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 58
      Height = 18
      Caption = 'Position :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 105
      Top = 22
      Width = 16
      Height = 18
      Caption = '80'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 97
      Width = 78
      Height = 18
      Caption = 'Taille point :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object TrackBar1: TTrackBar
      Left = 10
      Top = 47
      Width = 431
      Height = 52
      Max = 100
      Position = 80
      TabOrder = 0
      OnChange = TrackBar1Change
    end
    object TrackBar2: TTrackBar
      Left = 10
      Top = 122
      Width = 431
      Height = 43
      Max = 100
      Min = 5
      Position = 50
      TabOrder = 1
      OnChange = TrackBar2Change
    end
  end
end
