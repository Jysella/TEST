object Form1: TForm1
  Left = 302
  Top = 209
  Width = 1540
  Height = 901
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 392
    Top = 16
    Width = 633
    Height = 29
    Caption = 'SYSTEM OBS'#321'UGI ZLECE'#323' - DRUKARNIA PAPERPLANE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object grid: TStringGrid
    Left = 24
    Top = 120
    Width = 1369
    Height = 681
    ColCount = 20
    DefaultRowHeight = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing, goRowSelect]
    ParentFont = False
    TabOrder = 0
    OnDblClick = gridDblClick
  end
  object Button1: TButton
    Left = 1426
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Import'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Dodaj: TButton
    Left = 1426
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 2
    OnClick = DodajClick
  end
  object online: TCheckBox
    Left = 1336
    Top = 32
    Width = 97
    Height = 17
    Caption = 'OnLine'
    TabOrder = 3
  end
  object update: TButton
    Left = 1424
    Top = 768
    Width = 75
    Height = 25
    Caption = 'Zapisz'
    TabOrder = 4
    OnClick = updateClick
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '83.17.71.122'
    Password = 'PaperPlane1'
    Username = 'Marcin'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 1448
    Top = 800
  end
end
