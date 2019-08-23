unit DM_F;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Datasnap.DBClient,
  SimpleDS, Data.SqlExpr,IniFiles;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    DSFornecedores: TDataSource;
    SDSFornecedores: TSimpleDataSet;
    SDSClientes: TSimpleDataSet;
    DSClientes: TDataSource;
    DSVendedores: TDataSource;
    SDSVendedores: TSimpleDataSet;
    SDSProdutos: TSimpleDataSet;
    DSProdutos: TDataSource;
    SDSProdutosCDPRODUTO: TIntegerField;
    SDSProdutosDCPRODUTO: TStringField;
    SDSProdutosVLPRODUTO: TFMTBCDField;
    SDSProdutosQTESTOQUE: TFMTBCDField;
    SDSProdutosQTMINIMA: TFMTBCDField;
    SDSProdutosFORNECEDORES_CDFORNECEDOR: TIntegerField;
    SDSVendedoresCDVENDEDOR: TIntegerField;
    SDSVendedoresDCVENDEDOR: TStringField;
    SDSProdutosdescricaofornecedor: TStringField;
    SDSClientesCDCLIENTE: TIntegerField;
    SDSClientesDCCLIENTE: TStringField;
    SDSClientesENDERECO: TStringField;
    SDSClientesBAIRRO: TStringField;
    SDSClientesCIDADE: TStringField;
    SDSClientesCEP: TStringField;
    SDSProdutossugestaocompra: TFloatField;
    SDSProdutosPRODUTOVALOR: TFloatField;
    SDSFornecedoresCDFORNECEDOR: TIntegerField;
    SDSFornecedoresDCFORNECEDOR: TStringField;
    SDSFornecedoresENDERECO: TStringField;
    SDSFornecedoresBAIRRO: TStringField;
    SDSFornecedoresCIDADE: TStringField;
    SDSFornecedoresTELEFONE: TStringField;
    SDSFornecedoresCEP: TStringField;
    SDSVendas: TSimpleDataSet;
    SDSItens: TSimpleDataSet;
    DSVendas: TDataSource;
    DSItens: TDataSource;
    SDSVendasNRVENDA: TIntegerField;
    SDSVendasDTVENDA: TDateField;
    SDSVendasVENDEDORES_CDVENDEDOR: TIntegerField;
    SDSVendasCLIENTES_CDCLIENTE: TIntegerField;
    SDSItensNRITEM: TIntegerField;
    SDSItensQTVENDA: TFMTBCDField;
    SDSItensVLPRODUTO: TFMTBCDField;
    SDSItensPRODUTOS_CDPRODUTO: TIntegerField;
    SDSItensVENDAS_NRVENDA: TIntegerField;
    procedure SDSFornecedoresNewRecord(DataSet: TDataSet);
    procedure SDSFornecedoresAfterPost(DataSet: TDataSet);
    procedure SDSFornecedoresAfterDelete(DataSet: TDataSet);
    procedure SDSClientesAfterDelete(DataSet: TDataSet);
    procedure SDSClientesAfterPost(DataSet: TDataSet);
    procedure SDSVendedoresAfterDelete(DataSet: TDataSet);
    procedure SDSVendedoresAfterPost(DataSet: TDataSet);
    procedure SDSProdutosAfterDelete(DataSet: TDataSet);
    procedure SDSProdutosAfterPost(DataSet: TDataSet);
    procedure SDSClientesNewRecord(DataSet: TDataSet);
    procedure SDSVendedoresNewRecord(DataSet: TDataSet);
    procedure SDSProdutosNewRecord(DataSet: TDataSet);
    procedure SDSProdutosCalcFields(DataSet: TDataSet);
    procedure SDSVendasAfterDelete(DataSet: TDataSet);
    procedure SDSVendasAfterPost(DataSet: TDataSet);
    procedure SDSItensAfterPost(DataSet: TDataSet);
    procedure SDSItensAfterDelete(DataSet: TDataSet);
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetID(NameGenerators: String): Integer;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDM.SDSClientesAfterDelete(DataSet: TDataSet);
begin
   Dm.SDSClientes.ApplyUpdates(0);
end;

procedure TDM.SDSClientesAfterPost(DataSet: TDataSet);
begin
  Dm.SDSClientes.ApplyUpdates(0);
end;


procedure TDM.SDSClientesNewRecord(DataSet: TDataSet);
begin
  SDSClientesCDCLIENTE.AsInteger := GetID('GEN_CLIENTES_ID');
end;

procedure TDM.SDSFornecedoresAfterDelete(DataSet: TDataSet);
begin
  Dm.SDSFornecedores.ApplyUpdates(0);
end;

procedure TDM.SDSFornecedoresAfterPost(DataSet: TDataSet);
begin
  Dm.SDSFornecedores.ApplyUpdates(0);
end;

procedure TDM.SDSFornecedoresNewRecord(DataSet: TDataSet);
begin
  SDSFornecedoresCDFORNECEDOR.AsInteger := GetID('GEN_FORNECEDORES_ID');

end;

procedure TDM.SDSItensAfterDelete(DataSet: TDataSet);
begin
  Dm.SDSVendas.ApplyUpdates(0);
end;

procedure TDM.SDSItensAfterPost(DataSet: TDataSet);
begin
  Dm.SDSVendas.ApplyUpdates(0);
end;

procedure TDM.SDSProdutosAfterDelete(DataSet: TDataSet);
begin
  Dm.SDSProdutos.ApplyUpdates(0);
end;

procedure TDM.SDSProdutosAfterPost(DataSet: TDataSet);
begin
  Dm.SDSProdutos.ApplyUpdates(0);
end;

procedure TDM.SDSProdutosCalcFields(DataSet: TDataSet);
begin
  //SUGESARA
  If DM.SDSProdutos.FieldByName('QTESTOQUE').asfloat <
    DM.SDSProdutos.FieldByName  ('QTMINIMA').asfloat then
  begin
    DM.SDSProdutos.FieldByName('sugestaocompra').asfloat:=
    DM.SDSProdutos.FieldByName('QTMINIMA').asfloat -
    DM.SDSProdutos.FieldByName('QTESTOQUE').asfloat;
  end;
  //SALDFO
  DM.SDSProdutos.FieldByName('PRODUTOVALOR').asfloat:=
  DM.SDSProdutos.FieldByName('VLPRODUTO').asfloat *
  DM.SDSProdutos.FieldByName('QTESTOQUE').asfloat;

end;

procedure TDM.SDSProdutosNewRecord(DataSet: TDataSet);
begin
  SDSProdutosCDPRODUTO.AsInteger := GetID('GEN_PRODUTOS_ID');
end;

procedure TDM.SDSVendasAfterDelete(DataSet: TDataSet);
begin
  Dm.SDSVendas.ApplyUpdates(0);
end;

procedure TDM.SDSVendasAfterPost(DataSet: TDataSet);
begin
  Dm.SDSVendas.ApplyUpdates(0);
end;

procedure TDM.SDSVendedoresAfterDelete(DataSet: TDataSet);
begin
  Dm.SDSVendedores.ApplyUpdates(0);
end;

procedure TDM.SDSVendedoresAfterPost(DataSet: TDataSet);
begin
  Dm.SDSVendedores.ApplyUpdates(0);
end;

procedure TDM.SDSVendedoresNewRecord(DataSet: TDataSet);
begin
  SDSVendedoresCDVENDEDOR.AsInteger := GetID('GEN_VENDEDORES_ID');
end;




function TDM.GetID(NameGenerators: String): Integer;
var
sqlAutoInc: TSQLQuery;
begin
sqlAutoInc := TSQLQuery.Create(NIL);
sqlAutoInc.SQLConnection := Conexao;
sqlAutoInc.SQL.Add('SELECT GEN_ID ('+NameGenerators+', 1) FROM RDB$DATABASE');
sqlAutoInc.Open;
Result := sqlAutoInc.Fields[0].AsInteger;
end;


end.
