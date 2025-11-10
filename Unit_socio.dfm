object Form_socio: TForm_socio
  Left = 250
  Top = 221
  Width = 489
  Height = 312
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro do s'#243'cio'
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
    Top = 96
    Width = 45
    Height = 21
    Caption = 'Renda'
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
  object edt_renda: TEdit
    Left = 8
    Top = 120
    Width = 129
    Height = 21
    Color = clInfoBk
    Enabled = False
    MaxLength = 10
    TabOrder = 1
    OnKeyPress = edt_rendaKeyPress
  end
  object but_cadastrar: TButton
    Left = 8
    Top = 240
    Width = 81
    Height = 25
    Caption = 'Cadastrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = but_cadastrarClick
  end
  object but_alterar: TButton
    Left = 192
    Top = 240
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
    Top = 240
    Width = 83
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
  object but_socio: TButton
    Left = 296
    Top = 40
    Width = 105
    Height = 41
    Caption = 'Consultar s'#243'cio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = but_socioClick
  end
  object but_salvar: TButton
    Left = 104
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = but_salvarClick
  end
  object but_cancelar: TButton
    Left = 288
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = but_cancelarClick
  end
  object RB_ativo: TRadioButton
    Left = 16
    Top = 168
    Width = 113
    Height = 17
    Caption = 'Ativo'
    TabOrder = 8
  end
  object RB_inativo: TRadioButton
    Left = 16
    Top = 192
    Width = 113
    Height = 17
    Caption = 'Inativo'
    TabOrder = 9
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 424
    Top = 192
  end
end
