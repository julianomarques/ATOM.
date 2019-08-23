object DM: TDM
  OldCreateOrder = False
  Height = 451
  Width = 619
  object Conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=16.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'Database=C:\ATOM\BANCO\VENDA.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    BeforeConnect = ConexaoBeforeConnect
    Connected = True
    Left = 24
    Top = 8
  end
  object DSFornecedores: TDataSource
    DataSet = SDSFornecedores
    Left = 120
    Top = 64
  end
  object SDSFornecedores: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'SELECT * FROM FORNECEDORES'
    DataSet.DataSource = DSFornecedores
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterPost = SDSFornecedoresAfterPost
    AfterDelete = SDSFornecedoresAfterDelete
    OnNewRecord = SDSFornecedoresNewRecord
    Left = 32
    Top = 64
    object SDSFornecedoresCDFORNECEDOR: TIntegerField
      FieldName = 'CDFORNECEDOR'
      Required = True
    end
    object SDSFornecedoresDCFORNECEDOR: TStringField
      FieldName = 'DCFORNECEDOR'
      Size = 30
    end
    object SDSFornecedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object SDSFornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object SDSFornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object SDSFornecedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)00000-0000;0;_'
      Size = 12
    end
    object SDSFornecedoresCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-9999;1;_'
      Size = 8
    end
  end
  object SDSClientes: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'SELECT * FROM CLIENTES'
    DataSet.DataSource = DSClientes
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterPost = SDSClientesAfterPost
    AfterDelete = SDSClientesAfterDelete
    OnNewRecord = SDSClientesNewRecord
    Left = 32
    Top = 120
    object SDSClientesCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object SDSClientesDCCLIENTE: TStringField
      FieldName = 'DCCLIENTE'
      Size = 30
    end
    object SDSClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object SDSClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object SDSClientesCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object SDSClientesCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-9999;1;_'
      Size = 8
    end
  end
  object DSClientes: TDataSource
    DataSet = SDSClientes
    Left = 120
    Top = 120
  end
  object DSVendedores: TDataSource
    DataSet = SDSVendedores
    Left = 120
    Top = 176
  end
  object SDSVendedores: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'SELECT * FROM VENDEDORES'
    DataSet.DataSource = DSVendedores
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterPost = SDSVendedoresAfterPost
    AfterDelete = SDSVendedoresAfterDelete
    OnNewRecord = SDSVendedoresNewRecord
    Left = 32
    Top = 176
    object SDSVendedoresCDVENDEDOR: TIntegerField
      FieldName = 'CDVENDEDOR'
      Required = True
    end
    object SDSVendedoresDCVENDEDOR: TStringField
      FieldName = 'DCVENDEDOR'
      Size = 30
    end
  end
  object SDSProdutos: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'select * from PRODUTOS'
    DataSet.DataSource = DSProdutos
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterPost = SDSProdutosAfterPost
    AfterDelete = SDSProdutosAfterDelete
    OnCalcFields = SDSProdutosCalcFields
    OnNewRecord = SDSProdutosNewRecord
    Left = 32
    Top = 248
    object SDSProdutosCDPRODUTO: TIntegerField
      FieldName = 'CDPRODUTO'
      Required = True
    end
    object SDSProdutosDCPRODUTO: TStringField
      FieldName = 'DCPRODUTO'
      Size = 30
    end
    object SDSProdutosVLPRODUTO: TFMTBCDField
      FieldName = 'VLPRODUTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object SDSProdutosQTESTOQUE: TFMTBCDField
      FieldName = 'QTESTOQUE'
      Precision = 18
      Size = 2
    end
    object SDSProdutosQTMINIMA: TFMTBCDField
      FieldName = 'QTMINIMA'
      Precision = 18
      Size = 2
    end
    object SDSProdutossugestaocompra: TFloatField
      FieldKind = fkCalculated
      FieldName = 'sugestaocompra'
      Calculated = True
    end
    object SDSProdutosFORNECEDORES_CDFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDORES_CDFORNECEDOR'
      Required = True
    end
    object SDSProdutosdescricaofornecedor: TStringField
      DisplayLabel = 'DESC. FORNECEDOR'
      FieldKind = fkLookup
      FieldName = 'descricaofornecedor'
      LookupDataSet = SDSFornecedores
      LookupKeyFields = 'CDFORNECEDOR'
      LookupResultField = 'DCFORNECEDOR'
      KeyFields = 'FORNECEDORES_CDFORNECEDOR'
      Size = 30
      Lookup = True
    end
    object SDSProdutosPRODUTOVALOR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRODUTOVALOR'
      Calculated = True
    end
  end
  object DSProdutos: TDataSource
    DataSet = SDSProdutos
    Left = 120
    Top = 240
  end
  object SDSVendas: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'select * from VENDAS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterPost = SDSVendasAfterPost
    AfterDelete = SDSVendasAfterDelete
    Left = 32
    Top = 304
    object SDSVendasNRVENDA: TIntegerField
      FieldName = 'NRVENDA'
      Required = True
    end
    object SDSVendasDTVENDA: TDateField
      FieldName = 'DTVENDA'
    end
    object SDSVendasVENDEDORES_CDVENDEDOR: TIntegerField
      FieldName = 'VENDEDORES_CDVENDEDOR'
      Required = True
    end
    object SDSVendasCLIENTES_CDCLIENTE: TIntegerField
      FieldName = 'CLIENTES_CDCLIENTE'
      Required = True
    end
  end
  object SDSItens: TSimpleDataSet
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'select *  from ITENS WHERE VENDAS_NRVENDA= :NRVENDA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'NRVENDA'
        ParamType = ptInput
      end>
    MasterSource = DSVendas
    PacketRecords = 0
    Params = <>
    AfterPost = SDSItensAfterPost
    AfterDelete = SDSItensAfterDelete
    Left = 32
    Top = 368
    object SDSItensNRITEM: TIntegerField
      FieldName = 'NRITEM'
      Required = True
    end
    object SDSItensQTVENDA: TFMTBCDField
      FieldName = 'QTVENDA'
      Precision = 18
      Size = 2
    end
    object SDSItensVLPRODUTO: TFMTBCDField
      FieldName = 'VLPRODUTO'
      Precision = 18
      Size = 2
    end
    object SDSItensPRODUTOS_CDPRODUTO: TIntegerField
      FieldName = 'PRODUTOS_CDPRODUTO'
      Required = True
    end
    object SDSItensVENDAS_NRVENDA: TIntegerField
      FieldName = 'VENDAS_NRVENDA'
      Required = True
    end
  end
  object DSVendas: TDataSource
    DataSet = SDSVendas
    Left = 120
    Top = 304
  end
  object DSItens: TDataSource
    AutoEdit = False
    DataSet = SDSItens
    Left = 120
    Top = 368
  end
end
