unit Unit_consulta_depe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TForm_consulta_depe = class(TForm)
    edt_nome: TEdit;
    but_consulta: TButton;
    but_limpar: TButton;
    Label1: TLabel;
    DS_depen: TDataSource;
    ADOQuery_aux: TADOQuery;
    DBGrid_depen: TDBGrid;
    but_selecionar: TButton;
    but_cancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure but_consultaClick(Sender: TObject);
    procedure but_limparClick(Sender: TObject);
    procedure but_selecionarClick(Sender: TObject);
    procedure but_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    chave, sql_pesquisa : String;
  end;

var
  Form_consulta_depe: TForm_consulta_depe;

implementation

uses Unit_menu;

{$R *.dfm}

procedure TForm_consulta_depe.FormShow(Sender: TObject);
begin
  edt_nome.Clear;
end;

procedure TForm_consulta_depe.but_consultaClick(Sender: TObject);
begin
  if edt_nome.Text = '' then
    Showmessage('Digite um nome')
  else if sql_pesquisa = '' then
    Showmessage('Impossivel pesquisar')
  else
    begin
      ADOQuery_aux.Close;
      ADOQuery_aux.SQL.Text := sql_pesquisa + ' WHERE Nome LIKE ' +
                                              QuotedStr(edt_nome.Text + '%');
      ADOQuery_aux.Open;
    end;
end;

procedure TForm_consulta_depe.but_limparClick(Sender: TObject);
begin
  chave := '';
  edt_nome.Clear;
  ADOQuery_aux.Close;
end;

procedure TForm_consulta_depe.but_selecionarClick(Sender: TObject);
begin
  if ADOQuery_aux.Active = False then
    Showmessage('Impossivel selecionar')
  else
    begin
      chave := ADOQuery_aux.Fields.Fields[0].AsString;
      ADOQuery_aux.Close;
      Close;
    end;
end;

procedure TForm_consulta_depe.but_cancelarClick(Sender: TObject);
begin
  chave := '';
  ADOQuery_aux.Close;
  Close;
end;

end.
