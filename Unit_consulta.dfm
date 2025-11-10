object Form_consulta: TForm_consulta
  Left = 393
  Top = 272
  Width = 396
  Height = 304
  BorderIcons = [biSystemMenu]
  Caption = 'Consultar'
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
    Width = 153
    Height = 21
    Caption = 'Digite o nome do s'#243'cio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
  end
  object but_consulta: TButton
    Left = 208
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Consultar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = but_consultaClick
  end
  object edt_nome: TEdit
    Left = 8
    Top = 40
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object but_limpar: TButton
    Left = 296
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Limpar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = but_limparClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 361
    Height = 129
    DataSource = DS_consulta
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end>
  end
  object but_selecionar: TButton
    Left = 112
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = but_selecionarClick
  end
  object but_cancelar: TButton
    Left = 208
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = but_cancelarClick
  end
  object DS_consulta: TDataSource
    DataSet = ADOQuery_aux
    Left = 56
    Top = 224
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 16
    Top = 224
  end
end
