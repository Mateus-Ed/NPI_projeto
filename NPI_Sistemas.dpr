program NPI_Sistemas;

uses
  Forms,
  Unit_menu in 'Unit_menu.pas' {Form_menu},
  Unit_socio in 'Unit_socio.pas' {Form_socio},
  Unit_dependente in 'Unit_dependente.pas' {Form_dependente},
  Unit_consulta in 'Unit_consulta.pas' {Form_consulta},
  Unit_consulta_depe in 'Unit_consulta_depe.pas' {Form_consulta_depe};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_menu, Form_menu);
  Application.CreateForm(TForm_socio, Form_socio);
  Application.CreateForm(TForm_dependente, Form_dependente);
  Application.CreateForm(TForm_consulta, Form_consulta);
  Application.CreateForm(TForm_consulta_depe, Form_consulta_depe);
  Application.Run;
end.
