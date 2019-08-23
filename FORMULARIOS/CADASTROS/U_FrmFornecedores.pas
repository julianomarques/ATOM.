unit U_FrmFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TFrmFornecedores = class(TForm)
    DBGrid1: TDBGrid;
    Btinserir: TButton;
    Btalterar: TButton;
    Btexcluir: TButton;
    Btgravar: TButton;
    Btcancelar: TButton;
    Fcodigo: TDBEdit;
    Fdescricaofornecedor: TDBEdit;
    Fendereco: TDBEdit;
    Fbairro: TDBEdit;
    Fcidade: TDBEdit;
    Ftelefone: TDBEdit;
    Fcep: TDBEdit;
    Btsair: TButton;
    Btprimeiro: TButton;
    Btanterior: TButton;
    Btproximo: TButton;
    Btultimo: TButton;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Edit1: TEdit;
    Image1: TImage;
    Lcodigofornecedor: TLabel;
    Ldescricaofornecedor: TLabel;
    Lendereco: TLabel;
    Lbairro: TLabel;
    Lcidade: TLabel;
    Lcep: TLabel;
    Ltelefone: TLabel;
    procedure BtinserirClick(Sender: TObject);
    procedure BtalterarClick(Sender: TObject);
    procedure BtgravarClick(Sender: TObject);
    procedure BtcancelarClick(Sender: TObject);
    procedure BtexcluirClick(Sender: TObject);
    procedure BtsairClick(Sender: TObject);
    procedure BtprimeiroClick(Sender: TObject);
    procedure BtanteriorClick(Sender: TObject);
    procedure BtproximoClick(Sender: TObject);
    procedure BtultimoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedores: TFrmFornecedores;

implementation

{$R *.dfm}

uses DM_F, A_menu_F;
   // botao pesquisar do radio group
procedure TFrmFornecedores.BitBtn1Click(Sender: TObject);
begin
  Dm.SDSFornecedores.close;
  DM.SDSFORNECEDORES.DATASET.COMMANDTEXT := 'SELECT * FROM FORNECEDORES';
  case radiogroup1.ItemIndex of
    0:
    begin
      if edit1.Text <> '' then
      begin
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT :=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' WHERE CDFORNECEDOR = :Pcdfornecedor';
        Dm.SDSFornecedores.DataSet.Params.ParamByName('Pcdfornecedor').Value:=
        StrToInt(Edit1.Text);
      end;
        if radiogroup2.ItemIndex = 1 then
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' ORDER BY CDFORNECEDOR';
        if radiogroup2.ItemIndex = 2 then
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' ORDER BY CDFORNECEDOR DESC';
    end;
    1:
    begin
      if edit1.Text <> '' then
      begin
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' WHERE DCFORNECEDOR CONTAINING :Pdcfornecedor';
        Dm.SDSFornecedores.DataSet.Params.ParamByName('Pdcfornecedor').Value:=
        Edit1.Text;
      end;
      if radiogroup2.ItemIndex = 1 then
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
      ' ORDER BY DCFORNECEDOR';
      if radiogroup2.ItemIndex = 2 then
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
      ' ORDER BY DCFORNECEDOR DESC';
    end;
  end;
  Dm.SDSFornecedores.open;       // fim do codigo Radio group
end;

procedure TFrmFornecedores.BtalterarClick(Sender: TObject);
begin
  Dm.SDSFornecedores.edit;
end;

procedure TFrmFornecedores.BtanteriorClick(Sender: TObject);
begin
  Dm.SDSFornecedores.prior;
end;

procedure TFrmFornecedores.BtcancelarClick(Sender: TObject);
begin
  Dm.SDSFornecedores.cancel;
end;

procedure TFrmFornecedores.BtexcluirClick(Sender: TObject);
begin
  if MessageBox(0,'Deseja realmente excluir?','Excluindo �',mb_YesNo)=idYes
  then
    Dm.SDSFornecedores.delete;
end;

procedure TFrmFornecedores.BtgravarClick(Sender: TObject);
begin
  if Dm.SDSFornecedores.state in [dsedit,dsinsert] then
  Dm.SDSFornecedores.post;
end;

procedure TFrmFornecedores.BtinserirClick(Sender: TObject);
begin
  Dm.SDSFornecedores.append;
  Fdescricaofornecedor.SetFocus // Coloca o foco no Dbedit1 que no caso � o Cod.
end;

procedure TFrmFornecedores.BtprimeiroClick(Sender: TObject);
begin
  Dm.SDSFornecedores.first;
end;

procedure TFrmFornecedores.BtproximoClick(Sender: TObject);
begin
  Dm.SDSFornecedores.next;
end;

procedure TFrmFornecedores.BtsairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmFornecedores.BtultimoClick(Sender: TObject);
begin
  dm.SDSFornecedores.Last;
end;

procedure TFrmFornecedores.FormCreate(Sender: TObject);
begin
  Dm.SDSFornecedores.close;
  DM.SDSFORNECEDORES.DATASET.COMMANDTEXT := 'SELECT * FROM FORNECEDORES';
  case radiogroup1.ItemIndex of
    0:
    begin
      if edit1.Text <> '' then
      begin
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT :=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' WHERE CDFORNECEDOR = :Pcdfornecedor';
        Dm.SDSFornecedores.DataSet.Params.ParamByName('Pcdfornecedor').Value:=
        StrToInt(Edit1.Text);
      end;
        if radiogroup2.ItemIndex = 1 then
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' ORDER BY CDFORNECEDOR';
        if radiogroup2.ItemIndex = 2 then
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' ORDER BY CDFORNECEDOR DESC';
    end;
    1:
    begin
      if edit1.Text <> '' then
      begin
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
        DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
        ' WHERE DCFORNECEDOR CONTAINING :Pdcfornecedor';
        Dm.SDSFornecedores.DataSet.Params.ParamByName('Pdcfornecedor').Value:=
        Edit1.Text;
      end;
      if radiogroup2.ItemIndex = 1 then
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
      ' ORDER BY DCFORNECEDOR';
      if radiogroup2.ItemIndex = 2 then
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT:=
      DM.SDSFORNECEDORES.DATASET.COMMANDTEXT +
      ' ORDER BY DCFORNECEDOR DESC';
    end;
  end;
  Dm.SDSFornecedores.open;
end;

procedure TFrmFornecedoresBtultimoClick(Sender: TObject);
begin
  Dm.SDSFornecedores.last;
end;

end.
