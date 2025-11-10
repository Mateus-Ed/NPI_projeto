object Form_consulta_depe: TForm_consulta_depe
  Left = 234
  Top = 306
  Width = 403
  Height = 311
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de dependentes'
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
    Top = 8
    Width = 201
    Height = 21
    Caption = 'Digite o nome do dependente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
  end
  object edt_nome: TEdit
    Left = 8
    Top = 32
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object but_consulta: TButton
    Left = 216
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Consultar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Franklin Gothic Medium'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = but_consultaClick
  end
  object but_limpar: TButton
    Left = 304
    Top = 32
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
  object DBGrid_depen: TDBGrid
    Left = 8
    Top = 72
    Width = 369
    Height = 145
    DataSource = DS_depen
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
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Idade'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_socio'
        Title.Caption = 'Id_socio'
        Visible = True
      end>
  end
  object but_selecionar: TButton
    Left = 112
    Top = 232
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
    Top = 232
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
  object DS_depen: TDataSource
    DataSet = ADOQuery_aux
    Left = 32
    Top = 232
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 72
    Top = 232
  end
end
