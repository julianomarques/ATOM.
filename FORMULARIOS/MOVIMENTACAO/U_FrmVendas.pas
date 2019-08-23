unit U_FrmVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Mask, Data.DB;

type
  TFrmVendas = class(TForm)
    Image1: TImage;
    Lnrvenda: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBnrvenda: TDBEdit;
    DBdtvenda: TDBEdit;
    Btgravar: TButton;
    Btinserir: TButton;
    Btalterar: TButton;
    Btexcluir: TButton;
    Btcancelar: TButton;
    Btultimo: TButton;
    Btproximo: TButton;
    Btanterior: TButton;
    Btprimeiro: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Bitinserir: TButton;
    Bitexcluir: TButton;
    VENDAS: TLabel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBText2: TDBText;
    Btsair: TButton;
    procedure BtprimeiroClick(Sender: TObject);
    procedure BtsairClick(Sender: TObject);
    procedure BtcalcularClick(Sender: TObject);
    procedure BtanteriorClick(Sender: TObject);
    procedure BtproximoClick(Sender: TObject);
    procedure BtultimoClick(Sender: TObject);
    procedure BtinserirClick(Sender: TObject);
    procedure BtalterarClick(Sender: TObject);
    procedure BtcancelarClick(Sender: TObject);
    procedure BtgravarClick(Sender: TObject);
    procedure BtexcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendas: TFrmVendas;

implementation

{$R *.dfm}

uses DM_F;

procedure TFrmVendas.BtalterarClick(Sender: TObject);
begin
  DM.SDSVendas.Edit;
end;

procedure TFrmVendas.BtanteriorClick(Sender: TObject);
begin
  DM.SDSVendas.Prior;
end;

procedure TFrmVendas.BtcalcularClick(Sender: TObject);
begin
  DM.SDSVendas.Cancel;
end;

procedure TFrmVendas.BtcancelarClick(Sender: TObject);
begin
  DM.SDSVendas.Cancel;
end;

procedure TFrmVendas.BtexcluirClick(Sender: TObject);
begin
  if MessageBox(0,'Deseja realmente excluir?','Excluindo …',mb_YesNo)=idYes
then
  Dm.SDSVendas.Delete;
end;

procedure TFrmVendas.BtgravarClick(Sender: TObject);
begin
  DM.SDSVendas.Post;
end;

procedure TFrmVendas.BtinserirClick(Sender: TObject);
begin
  Dm.SDSVendas.Append;
  DBnrvenda.SetFocus;
end;

procedure TFrmVendas.BtprimeiroClick(Sender: TObject);
begin
  dm.SDSVendas.First;
end;

procedure TFrmVendas.BtproximoClick(Sender: TObject);
begin
  dm.SDSVendas.Next;
end;

procedure TFrmVendas.BtsairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendas.BtultimoClick(Sender: TObject);
begin
  dm.SDSVendas.Last;
end;

end.
