unit U_FrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Data.DB, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Imaging.pngimage;

type
  TfrmClientes = class(TForm)
    DBGrid1: TDBGrid;
    Btinserir: TButton;
    Btalterar: TButton;
    Btgravar: TButton;
    Btexcluir: TButton;
    Btcancelar: TButton;
    Btsair: TButton;
    codcliente: TDBEdit;
    Cdesccliente: TDBEdit;
    Cednderecocliente: TDBEdit;
    Cbairro: TDBEdit;
    Ccidade: TDBEdit;
    DBEdit1: TDBEdit;
    Btprimeiro: TButton;
    Btanterior: TButton;
    Btproximo: TButton;
    Btultimo: TButton;
    cbcampo: TComboBox;
    Edtpesquisar: TEdit;
    Btpesquisa: TButton;
    RBinicio: TRadioButton;
    RBcontem: TRadioButton;
    DsPesq: TDataSource;
    Image1: TImage;
    Ccliente: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Endere�o: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LCEP: TLabel;
    procedure BtinserirClick(Sender: TObject);
    procedure BtalterarClick(Sender: TObject);
    procedure BtexcluirClick(Sender: TObject);
    procedure BtgravarClick(Sender: TObject);
    procedure BtcancelarClick(Sender: TObject);
    procedure BtsairClick(Sender: TObject);
    procedure BtprimeiroClick(Sender: TObject);
    procedure BtanteriorClick(Sender: TObject);
    procedure BtproximoClick(Sender: TObject);
    procedure BtultimoClick(Sender: TObject);
    procedure BtpesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PesquisaSQl (txt: string);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    _pesquisa : string;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses DM_F, A_menu_F, DM_Pesq;

procedure TfrmClientes.BtalterarClick(Sender: TObject);
begin
  Dm.SDSClientes.edit;
end;

procedure TfrmClientes.BtanteriorClick(Sender: TObject);
begin
  Dm.SDSClientes.prior;
end;

procedure TfrmClientes.BtcancelarClick(Sender: TObject);
begin
  Dm.SDSClientes.cancel;
end;

procedure TfrmClientes.BtexcluirClick(Sender: TObject);
begin
  if MessageBox(0,'Deseja realmente excluir?','Excluindo �',mb_YesNo)=idYes
  then
  Dm.SDSClientes.delete;
end;

procedure TfrmClientes.BtgravarClick(Sender: TObject);
begin
  if Dm.SDSClientes.state in [dsedit,dsinsert] then
  Dm.SDSClientes.post;
end;

procedure TfrmClientes.BtinserirClick(Sender: TObject);
begin
  Dm.SDSClientes.append;
  Cdesccliente.SetFocus; // Coloca o foco no codcliente
end;

procedure TfrmClientes.BtpesquisaClick(Sender: TObject);
begin
  if RBinicio.Checked then
  begin
     _pesquisa := cbcampo.Text + ' like ' + QuotedStr(Edtpesquisar.Text + '%') ;
  end
  else if RBcontem.Checked then
  begin
     _pesquisa := cbcampo.Text + ' like ' + QuotedStr('%' + Edtpesquisar.Text + '%');
  end;

    PesquisaSQl(' select * from clientes where ');
end;

procedure TfrmClientes.BtprimeiroClick(Sender: TObject);
begin
  Dm.SDSClientes.First;
end;

procedure TfrmClientes.BtproximoClick(Sender: TObject);
begin
  Dm.SDSClientes.next;
end;

procedure TfrmClientes.BtsairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmClientes.BtultimoClick(Sender: TObject);
begin
  Dm.SDSClientes.last;
end;

procedure TfrmClientes.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     if not Odd(DsPesq.DataSet.RecNo) then
  begin
    DBGrid1.Canvas.Brush.Color := $00FFFFB0;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect,Column.Field,state);
  end;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
 var I : Integer;
begin
  for I := 0 to DsPesq.DataSet.FieldCount -1 do
  begin
    if DsPesq.DataSet.Fields[I].DataType in [ftString, ftWideString, ftInteger, ftFixedChar] then
     cbcampo.Items.Add(DsPesq.dataset.Fields[I].FieldName);

  end;

end;

procedure TfrmClientes.PesquisaSQl(txt: string);
begin
  with DMPesq.cdsPesqCliente do
  begin
    Close;
    Commandtext := txt + _Pesquisa;
    Open;
  end;
end;

end.
