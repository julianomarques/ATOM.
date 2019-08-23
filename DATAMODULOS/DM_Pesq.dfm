object DMPesq: TDMPesq
  OldCreateOrder = False
  Height = 321
  Width = 475
  object dspGeral: TDataSetProvider
    DataSet = sdsGeral
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 24
  end
  object cdsPesqCliente: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select * from clientes'
    Params = <>
    ProviderName = 'dspGeral'
    Left = 160
    Top = 24
    object cdsPesqClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesqClienteDCCLIENTE: TStringField
      FieldName = 'DCCLIENTE'
      Size = 30
    end
    object cdsPesqClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object cdsPesqClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object cdsPesqClienteCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object cdsPesqClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
  end
  object sdsGeral: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'Select * from produtos'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.SQLConnection1
    Left = 48
    Top = 24
  end
  object cdsPesqProduto: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select * from produtos'
    Params = <>
    ProviderName = 'dspGeral'
    Left = 168
    Top = 88
    object cdsPesqProdutoCDPRODUTO: TIntegerField
      FieldName = 'CDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesqProdutoDCPRODUTO: TStringField
      FieldName = 'DCPRODUTO'
      Size = 30
    end
    object cdsPesqProdutoVLPRODUTO: TFMTBCDField
      FieldName = 'VLPRODUTO'
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutoQTESTOQUE: TFMTBCDField
      FieldName = 'QTESTOQUE'
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutoQTMINIMA: TFMTBCDField
      FieldName = 'QTMINIMA'
      Precision = 18
      Size = 2
    end
    object cdsPesqProdutoFORNECEDORES_CDFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDORES_CDFORNECEDOR'
      Required = True
    end
  end
end
