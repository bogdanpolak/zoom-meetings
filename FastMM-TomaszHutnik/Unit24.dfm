object Form24: TForm24
  Left = 0
  Top = 0
  Caption = 'Form24'
  ClientHeight = 203
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 212
    Top = 13
    Width = 31
    Height = 13
    Caption = 'Wyniki'
  end
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 165
    Height = 25
    Caption = 'MemoryLeaks'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 39
    Width = 165
    Height = 25
    Caption = 'DLLka interface`m'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 187
    Top = 39
    Width = 170
    Height = 25
    Caption = 'Dost'#281'p do Dataset'
    TabOrder = 2
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 187
    Top = 70
    Width = 170
    Height = 120
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button4: TButton
    Left = 16
    Top = 165
    Width = 101
    Height = 25
    Caption = 'Mapka pami'#281'ci'
    TabOrder = 4
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    Left = 264
    Top = 128
  end
end
