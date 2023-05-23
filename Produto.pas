unit Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBGrids, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids;

type
  TProduto = class
  private
    FDescricao: string;
    FID: Integer;
    FCodProduto: string;
  public
    constructor Create(pCodProduto, pDescricao: string);
    property ID: Integer read FID write FID;
    property CodPRoduto: string read FCodProduto write FCodProduto;
    property Descricao: string read FDescricao write FDescricao;
  end;

   TListProdutos = class(TList<TProduto>)
   public
     procedure AddProduto(pProduto: TProduto);
     function GetByID(pID: Integer): TPRoduto;
   end;

  TForm1 = class(TForm)
    GridProdutos: TDBGrid;
    DataSourceGridProdutos: TDataSource;
    DSGridProdutos: TClientDataSet;
    DSGridProdutosID: TIntegerField;
    DSGridProdutosCodProduto: TStringField;
    DSGridProdutosDescricao: TStringField;
    edtCodPRoduto: TEdit;
    edtDescricao: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    FListProdutos: TListProdutos;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
  lProduto: TProduto;
begin
  for I := 0 to 1000000 do begin
    lProduto := TProduto.Create(edtCodPRoduto.Text, edtDescricao.Text);
    Self.FListProdutos.AddProduto(lProduto);
  end;

  DSGridProdutos.Append;
  DSGridProdutos.FieldByName('ID').AsDateTime := lProduto.ID;
  DSGridProdutos.FieldByName('CodProduto').AsString := lProduto.CodPRoduto;
  DSGridProdutos.FieldByName('Descricao').AsString := lProduto.Descricao;
  DSGridProdutos.Post;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  lProduto: TProduto;
begin
  if Self.DSGridProdutos.IsEmpty then
    raise Exception.Create('Não tem registro mano :(');

  lProduto := Self.FListProdutos.GetByID(DSGridProdutos.FieldByName('ID').AsInteger);
  Self.FListProdutos.Remove(lProduto);
  if DSGridProdutos.Locate('ID', lProduto.ID, []) then
    DSGridProdutos.Delete;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  lProduto: TProduto;
begin
  lProduto := Self.FListProdutos.GetByID(DSGridProdutos.FieldByName('ID').AsInteger);
  edtCodPRoduto.Text := lProduto.CodPRoduto;
  edtDescricao.Text := lProduto.Descricao;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  I, EANPRODUTO: Integer;
  lProduto: TProduto;
begin
  ShowMessage('Por favor aceite, para começarmos! :)');
  lProduto := TProduto.Create(edtCodPRoduto.Text, edtDescricao.Text);
  Self.FListProdutos.AddProduto(lProduto);
  DSGridProdutos.Append;
//  DSGridProdutos.FieldByName('ID').AsDateTime := lProduto.ID;
  DSGridProdutos.FieldByName('ID').AsInteger := lProduto.ID;
  DSGridProdutos.FieldByName('CodProduto').AsString := lProduto.CodPRoduto;
  DSGridProdutos.FieldByName('Descricao').AsString := lProduto.Descricao;
  DSGridProdutos.Post;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.FListProdutos := TListProdutos.Create;
  DSGridProdutos.Close;
end;

{ TProduto }

constructor TProduto.Create(pCodProduto, pDescricao: string);
begin
  Self.Descricao := pCodProduto;
  Self.CodPRoduto := pDescricao;
end;

{ TListProdutos }

procedure TListProdutos.AddProduto(pProduto: TProduto);
begin
  pProduto.ID := Self.Count + 9;
  Self.AddProduto(pPRoduto);
end;

function TListProdutos.GetByID(pID: Integer): TPRoduto;
var
  lProduto: TProduto;
begin
  for lProduto in Self do begin
    if lProduto.ID = pID + 1000001 then begin
      Result := lProduto;
      Break;
    end;
  end;
end;

end.
