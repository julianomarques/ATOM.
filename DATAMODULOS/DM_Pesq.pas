unit DM_Pesq;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Data.DB,
  Data.SqlExpr, Datasnap.Provider;

type
  TDMPesq = class(TDataModule)
    dspGeral: TDataSetProvider;
    cdsPesqCliente: TClientDataSet;
    sdsGeral: TSQLDataSet;
    cdsPesqClienteCDCLIENTE: TIntegerField;
    cdsPesqClienteDCCLIENTE: TStringField;
    cdsPesqClienteENDERECO: TStringField;
    cdsPesqClienteBAIRRO: TStringField;
    cdsPesqClienteCIDADE: TStringField;
    cdsPesqClienteCEP: TStringField;
    cdsPesqProduto: TClientDataSet;
    cdsPesqProdutoCDPRODUTO: TIntegerField;
    cdsPesqProdutoDCPRODUTO: TStringField;
    cdsPesqProdutoVLPRODUTO: TFMTBCDField;
    cdsPesqProdutoQTESTOQUE: TFMTBCDField;
    cdsPesqProdutoQTMINIMA: TFMTBCDField;
    cdsPesqProdutoFORNECEDORES_CDFORNECEDOR: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPesq: TDMPesq;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses DM_F;

{$R *.dfm}

end.
