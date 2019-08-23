unit U_FrmItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmItens = class(TForm)
    DBGrid1: TDBGrid;
    Image1: TImage;
    Llistaitens: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItens: TFrmItens;

implementation

{$R *.dfm}

end.
