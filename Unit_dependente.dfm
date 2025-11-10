object Form_dependente: TForm_dependente
  Left = 219
  Top = 305
  Width = 482
  Height = 275
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de dependente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 40
    Height = 21
    Caption = 'Nome'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 39
    Height = 21
    Caption = 'Idade'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 36
    Height = 21
    Caption = 'S'#243'cio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
  end
  object edt_nome: TEdit
    Left = 8
    Top = 40
    Width = 273
    Height = 21
    Color = clInfoBk
    Enabled = False
    MaxLength = 50
    TabOrder = 0
    OnKeyPress = edt_nomeKeyPress
  end
  object edt_idade: TEdit
    Left = 8
    Top = 104
    Width = 65
    Height = 21
    Color = clInfoBk
    Enabled = False
    MaxLength = 3
    TabOrder = 1
    OnKeyPress = edt_idadeKeyPress
  end
  object but_salvar: TButton
    Left = 96
    Top = 200
    Width = 81
    Height = 25
    Caption = 'Salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = but_salvarClick
  end
  object but_alterar: TButton
    Left = 192
    Top = 200
    Width = 81
    Height = 25
    Caption = 'Alterar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = but_alterarClick
  end
  object but_excluir: TButton
    Left = 376
    Top = 200
    Width = 81
    Height = 25
    Caption = 'Excluir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = but_excluirClick
  end
  object but_consulta: TButton
    Left = 296
    Top = 40
    Width = 121
    Height = 41
    Caption = 'Consultar dependentes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = but_consultaClick
  end
  object but_cadastro: TButton
    Left = 8
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = but_cadastroClick
  end
  object but_cancelar: TButton
    Left = 288
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 7
    OnClick = but_cancelarClick
  end
  object edt_socio: TEdit
    Left = 8
    Top = 160
    Width = 121
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 8
  end
  object but_socio: TButton
    Left = 144
    Top = 160
    Width = 49
    Height = 25
    Caption = 'S'#243'cio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = but_socioClick
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 288
    Top = 160
  end
end
