unit U_FrmVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFrmVendedores = class(TForm)
    DBGrid1: TDBGrid;
    DBcodvendedor: TDBEdit;
    Vdescrvendedor: TDBEdit;
    Btinserir: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    radiogroup2: TRadioGroup;
    Bitselecionar: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure BtinserirClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitselecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendedores: TFrmVendedores;

implementation

{$R *.dfm}

uses DM_F;

procedure TFrmVendedores.BitselecionarClick(Sender: TObject); //RADIOGROUP VENDEDOR
begin
   DM.SDSVendedores.DATASET.COMMANDTEXT:=' SELECT * FROM VENDEDOR ';
   if radiogroup2.ItemIndex = 1 then
  DM.SDSVendedores.DATASET.COMMANDTEXT:=
  DM.SDSVendedores.DATASET.COMMANDTEXT +
  ' ORDER BY DCVENDEDOR ';
  if radiogroup2.ItemIndex = 2 then
  DM.SDSVendedores.DATASET.COMMANDTEXT:=
  DM.SDSVendedores.DATASET.COMMANDTEXT +
  ' ORDER BY DCVENDEDOR DESC ';
  DM.SDSVendedores.Open;
end;

procedure TFrmVendedores.BtinserirClick(Sender: TObject);
begin
  Dm.SDSVendedores.append;
  Vdescrvendedor.SetFocus; // Coloca o foco no DBcodvendedor
end;

procedure TFrmVendedores.Button10Click(Sender: TObject);
begin
  dm.SDSVendedores.Last;
end;

procedure TFrmVendedores.Button2Click(Sender: TObject);
begin
  Dm.SDSVendedores.Post;
end;

procedure TFrmVendedores.Button3Click(Sender: TObject);
begin
  Dm.SDSVendedores.Edit;
end;

procedure TFrmVendedores.Button4Click(Sender: TObject);
begin
  Dm.SDSVendedores.Cancel;
end;

procedure TFrmVendedores.Button5Click(Sender: TObject);
begin
  if MessageBox(0,'Deseja realmente excluir?' , 'Excluindo �',mb_YesNo)=idYes
  then
  Dm.SDSVendedores.delete;
end;

procedure TFrmVendedores.Button6Click(Sender: TObject);
begin
  close;
end;

procedure TFrmVendedores.Button7Click(Sender: TObject);
begin
  Dm.SDSVendedores.First
end;

procedure TFrmVendedores.Button8Click(Sender: TObject);
begin
  dm.SDSVendedores.Prior;
end;

procedure TFrmVendedores.Button9Click(Sender: TObject);
begin
  dm.SDSVendedores.Next;
end;

end.
