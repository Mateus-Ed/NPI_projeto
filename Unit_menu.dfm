object Form_menu: TForm_menu
  Left = 298
  Top = 232
  Width = 384
  Height = 295
  BorderIcons = [biSystemMenu]
  Caption = 'Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 278
    Height = 33
    Caption = 'Escolha um cadastro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS UI Gothic'
    Font.Style = []
    ParentFont = False
  end
  object but_socio: TButton
    Left = 104
    Top = 80
    Width = 169
    Height = 57
    Caption = 'Cadastro de S'#243'cio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = but_socioClick
  end
  object but_dependente: TButton
    Left = 104
    Top = 160
    Width = 169
    Height = 57
    Caption = 'Cadastro de dependente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = but_dependenteClick
  end
  object ConexaoBD: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=NPI_sistemas;Data Source=DESKTOP-4DR45IS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 136
  end
end
