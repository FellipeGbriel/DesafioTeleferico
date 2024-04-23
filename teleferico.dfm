object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Telef'#233'rico'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 88
    Top = 48
    Width = 417
    Height = 28
    Caption = 'Teste de desafio, estudantes usando o telef'#233'rico.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 163
    Width = 120
    Height = 15
    Caption = 'N'#250'mero de estudantes'
  end
  object Label3: TLabel
    Left = 88
    Top = 291
    Width = 123
    Height = 15
    Caption = 'N'#250'mero de professores'
  end
  object Label4: TLabel
    Left = 408
    Top = 291
    Width = 108
    Height = 15
    Caption = 'Viagens Necess'#225'rias:'
  end
  object Edit1: TEdit
    Left = 88
    Top = 184
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 88
    Top = 312
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Button1: TButton
    Left = 472
    Top = 184
    Width = 91
    Height = 45
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 287
    Top = 201
    Width = 90
    Height = 105
    Caption = 'Opera'#231#227'o'
    Items.Strings = (
      'Subida'
      'Descida')
    TabOrder = 3
  end
end
