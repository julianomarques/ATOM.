unit A_menu_F;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    Fornecedores1: TMenuItem;
    Clientes1: TMenuItem;
    Vendedores1: TMenuItem;
    Produtos1: TMenuItem;
    Image1: TImage;
    MOVIMENTAO1: TMenuItem;
    Vendas1: TMenuItem;
    procedure Fornecedores1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses U_FrmFornecedores, U_FrmClientes, U_FrmVendedores, U_FrmProdutos,
  U_FrmVendas;

procedure TForm1.Clientes1Click(Sender: TObject);
begin
FrmClientes.Show;
end;

procedure TForm1.Fornecedores1Click(Sender: TObject);
begin
FrmFornecedores.Show;
end;

procedure TForm1.Produtos1Click(Sender: TObject);
begin
  FrmProdutos.Show;
end;

procedure TForm1.Vendas1Click(Sender: TObject);
begin
  FrmVendas.Show;
end;

procedure TForm1.Vendedores1Click(Sender: TObject);
begin
  FrmVendedores.Show;
end;

end.
