program Atom;

uses
  Vcl.Forms,
  A_menu_F in 'A_menu_F.pas' {Form1},
  DM_F in 'DATAMODULOS\DM_F.pas' {DM: TDataModule},
  U_FrmFornecedores in 'FORMULARIOS\CADASTROS\U_FrmFornecedores.pas' {FrmFornecedores},
  U_FrmClientes in 'FORMULARIOS\CADASTROS\U_FrmClientes.pas' {frmClientes},
  U_FrmVendedores in 'FORMULARIOS\CADASTROS\U_FrmVendedores.pas' {FrmVendedores},
  U_FrmProdutos in 'FORMULARIOS\CADASTROS\U_FrmProdutos.pas' {FrmProdutos},
  DM_Pesq in 'DATAMODULOS\DM_Pesq.pas' {DMPesq: TDataModule},
  U_FrmVendas in 'FORMULARIOS\MOVIMENTACAO\U_FrmVendas.pas' {FrmVendas},
  U_FrmItens in 'FORMULARIOS\MOVIMENTACAO\U_FrmItens.pas' {FrmItens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmFornecedores, FrmFornecedores);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TFrmVendedores, FrmVendedores);
  Application.CreateForm(TFrmProdutos, FrmProdutos);
  Application.CreateForm(TDMPesq, DMPesq);
  Application.CreateForm(TFrmVendas, FrmVendas);
  Application.CreateForm(TFrmItens, FrmItens);
  Application.Run;
end.
