object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 31
    Width = 85
    Height = 15
    Caption = 'C'#243'digo Produto'
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object GridProdutos: TDBGrid
    Left = 8
    Top = 240
    Width = 612
    Height = 194
    DataSource = DataSourceGridProdutos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodProduto'
        Title.Caption = 'C'#243'digo Produto'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 100
        Visible = True
      end>
  end
  object edtCodPRoduto: TEdit
    Left = 24
    Top = 52
    Width = 361
    Height = 23
    TabOrder = 1
  end
  object edtDescricao: TEdit
    Left = 24
    Top = 96
    Width = 361
    Height = 23
    CanUndoSelText = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 209
    Width = 105
    Height = 25
    Caption = 'Incluir'
    DisabledImageName = 'btnIncluir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 209
    Width = 105
    Height = 25
    Caption = 'Deletar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 256
    Top = 209
    Width = 113
    Height = 25
    Caption = 'Visualizar'
    TabOrder = 5
    OnClick = Button3Click
  end
  object DataSourceGridProdutos: TDataSource
    DataSet = DSGridProdutos
    Left = 488
    Top = 304
  end
  object DSGridProdutos: TClientDataSet
    PersistDataPacket.Data = {
      620000009619E0BD010000001800000003000000000003000000620002494404
      000100000000000A436F6450726F6475746F0200490000000100055749445448
      02000200FF000944657363726963616F02004900000001000557494454480200
      0200FF000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'CodProduto'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Descricao'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 376
    object DSGridProdutosID: TIntegerField
      FieldName = 'ID'
    end
    object DSGridProdutosCodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 255
    end
    object DSGridProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
  end
end
