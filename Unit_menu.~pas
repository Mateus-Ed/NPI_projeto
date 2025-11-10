unit Unit_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm_menu = class(TForm)
    but_socio: TButton;
    but_dependente: TButton;
    Label1: TLabel;
    ConexaoBD: TADOConnection;
    procedure but_socioClick(Sender: TObject);
    procedure but_dependenteClick(Sender: TObject);
    function ErroBD(msg: String; texto: String): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_menu: TForm_menu;

implementation

uses Unit_socio, Unit_dependente;

{$R *.dfm}

procedure TForm_menu.but_socioClick(Sender: TObject);
begin
  Form_socio.Showmodal;
end;

procedure TForm_menu.but_dependenteClick(Sender: TObject);
begin
  Form_dependente.Showmodal;
end;

function TForm_menu.ErroBD(msg, texto: String): String;
var
  i, tam_msg, tam_texto : Integer;
  pedaco : String;
begin
  tam_msg := length(msg);
  tam_texto := length(texto);
  for i := 1 to tam_msg do
  begin
    pedaco := copy(msg,i,tam_texto);
    if pedaco = texto then
      begin
        result := 'Sim';
        break;
      end
      else
        result := 'Não';
  end;
end;

end.
