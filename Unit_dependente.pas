unit Unit_dependente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm_dependente = class(TForm)
    edt_nome: TEdit;
    edt_idade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    but_salvar: TButton;
    but_alterar: TButton;
    but_excluir: TButton;
    but_consulta: TButton;
    but_cadastro: TButton;
    but_cancelar: TButton;
    edt_socio: TEdit;
    Label3: TLabel;
    but_socio: TButton;
    ADOQuery_aux: TADOQuery;
    procedure but_consultaClick(Sender: TObject);
    procedure but_socioClick(Sender: TObject);
    procedure but_cadastroClick(Sender: TObject);
    procedure but_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure but_alterarClick(Sender: TObject);
    procedure but_cancelarClick(Sender: TObject);
    procedure but_excluirClick(Sender: TObject);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_idadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    operacao, pk, id, chave, sql_pesquisa : String;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
  end;

var
  Form_dependente: TForm_dependente;

implementation

uses Unit_consulta, Unit_menu, Unit_consulta_depe;

{$R *.dfm}

procedure TForm_dependente.bloqueia_campos;
var
  i : Integer;
begin
  for i := 1 to Form_dependente.ComponentCount -1 do
    begin
      if Form_dependente.Components[i] is TEdit then
        begin
          (Form_dependente.Components[i] as TEdit).Enabled := False;
          (Form_dependente.Components[i] as TEdit).Color := clInfoBk;
        end;
    end;
end;

procedure TForm_dependente.but_consultaClick(Sender: TObject);
begin
   limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

  Form_consulta_depe.sql_pesquisa := ' SELECT Nome, Idade, id_socio FROM Cad_dependente ';
  Form_consulta_depe.Showmodal;
  if Form_consulta_depe.chave <> '' then
    begin
      pk := Form_consulta_depe.chave;
      ADOQuery_aux.SQL.Text := ' SELECT A.Nome , A.Idade, B.Nome as nome_socio '+
                               ' FROM Cad_dependente A '+
                               '  INNER JOIN Cad_socio B ON A.id_socio = B.id '+
                               '  WHERE A.Nome LIKE ' + QuotedSTR('%'+pk+'%');
      ADOQuery_aux.Open;
      edt_nome.Text := ADOQuery_aux.fieldbyname('Nome').AsString;
      edt_idade.Text := ADOQuery_aux.fieldbyname('Idade').AsString;
      edt_socio.Text := ADOQuery_aux.fieldbyname('nome_socio').AsString;
    end;
end;

procedure TForm_dependente.but_socioClick(Sender: TObject);
begin
  edt_socio.Clear;
  Form_consulta.sql_pesquisa := ' SELECT * FROM Cad_socio ';
  Form_consulta.ShowModal;
  if Form_consulta.chave <> '' then
    begin
      ADOQuery_aux.Close;
      id := Form_consulta.chave;
      ADOQuery_aux.SQL.Text := ' SELECT Nome FROM Cad_socio '+
                               ' WHERE id = ' + id;
      ADOQuery_aux.Open;
      edt_socio.Text := ADOQuery_aux.Fieldbyname('Nome').AsString;
    end;
end;

procedure TForm_dependente.desabilita_salvar(Sender: TObject);
begin
  but_cadastro.Enabled := True;
  but_salvar.Enabled := False;
  but_alterar.Enabled := True;
  but_cancelar.Enabled := False;
  but_excluir.Enabled := True;
  but_socio.Enabled := False;

  if Sender = but_cadastro then
    operacao := 'Cadastrar'
  else if Sender = but_salvar then
    operacao := 'Salvar'
  else if Sender = but_alterar then
    operacao := 'Alterar'
  else if Sender = but_excluir then
    operacao := 'Excluir';
end;

procedure TForm_dependente.habilita_salvar(Sender: TObject);
begin
  but_cadastro.Enabled := False;
  but_salvar.Enabled := True;
  but_alterar.Enabled := False;
  but_cancelar.Enabled := True;
  but_excluir.Enabled := False;
  but_socio.Enabled := True;

  if Sender = but_cadastro then
    operacao := 'Cadastrar'
  else if Sender = but_salvar then
    operacao := 'Salvar'
  else if Sender = but_alterar then
    operacao := 'Alterar'
  else if Sender = but_cancelar then
    operacao := 'Cancelar'
  else if Sender = but_excluir then
    operacao := 'Excluir';
end;

procedure TForm_dependente.libera_campos;
var
  i : Integer;
  nome_obj : String;
begin
  for i := 1 to Form_dependente.ComponentCount -1 do
    begin
      if Form_dependente.Components[i] is TEdit then
        begin
          nome_obj := (Form_dependente.Components[i] as TEdit).Name;
          if (nome_obj <> 'edt_socio') then
          begin
            (Form_dependente.Components[i] as TEdit).Enabled := True;
            (Form_dependente.Components[i] as TEdit).Color := clWindow;
          end;
        end;
    end;
end;

procedure TForm_dependente.limpa_campos;
var
  i : Integer;
begin
  for i := 1 to Form_dependente.ComponentCount -1 do
    begin
      if Form_dependente.Components[i] is TEdit then
        begin
          (Form_dependente.Components[i] as TEdit).Clear;
        end;
    end;
end;

procedure TForm_dependente.but_cadastroClick(Sender: TObject);
begin
  libera_campos;
  limpa_campos;
  pk := '';
  habilita_salvar(Sender);
end;

procedure TForm_dependente.but_salvarClick(Sender: TObject);
var
  deuerro : boolean;
begin
  if (edt_nome.Text = '') or (edt_idade.Text = '') or (edt_socio.Text = '') then
    begin
      Showmessage('Preencha todos os campos');
    end
      else
        begin
          if operacao = 'Cadastrar' then
            ADOQuery_aux.SQL.Text := ' INSERT INTO Cad_dependente '+
                                     '(Nome, Idade, id_socio) VALUES '+
                                     ' (' + QuotedStr(edt_nome.Text) +
                                     ', ' + edt_idade.Text +
                                     ', ' + id + ')'
          else if operacao = 'Alterar' then
            ADOQuery_aux.SQL.Text := 'UPDATE Cad_dependente SET '+
                                     ' Nome = ' + QuotedStr(edt_nome.Text) +
                                     ', Idade = ' + edt_idade.Text +
                                     ' WHERE id_socio = ' + id;
          Form_menu.ConexaoBD.BeginTrans;
          try
            ADOQuery_aux.ExecSQL;
            deuerro := False;
          except
            on E : Exception do
            begin
              deuerro := True;
              if Form_menu.ErroBD(E.Message,'PK_Cad_dependente') = 'Sim' then
                Showmessage('Dependente já cadastrado')
              else
                Showmessage('Ocorreu o seguinte erro: ' + E.Message);
            end;
          end;

          if deuerro = True then
            begin
              Form_menu.ConexaoBD.RollbackTrans;
            end
              else
                begin
                  Form_menu.ConexaoBD.CommitTrans;
                  pk := edt_nome.Text;
                  desabilita_salvar(Sender);
                  bloqueia_campos;
                end;
            end;
end;

procedure TForm_dependente.FormShow(Sender: TObject);
begin
  pk := '';
  id := '';
  operacao := '';
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);
end;

procedure TForm_dependente.but_alterarClick(Sender: TObject);
begin
  if pk = '' then
    Showmessage('Impossivel alterar')
  else
    begin
      libera_campos;
      habilita_salvar(Sender);
    end;
end;

procedure TForm_dependente.but_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    limpa_campos;

    desabilita_salvar(Sender);
    bloqueia_campos;
end;

procedure TForm_dependente.but_excluirClick(Sender: TObject);
var
  deuerro : boolean;
begin
  if pk = '' then
    Showmessage('Impossivel excluir')
  else
    begin
      ADOQuery_aux.SQL.Text := ' DELETE FROM Cad_dependente '+
                               ' WHERE Nome = ' + QuotedStr(pk);
      Form_menu.ConexaoBD.BeginTrans;

      try
        ADOQuery_aux.ExecSQL;
        deuerro := False;
      except
        on E : Exception do
        begin
        deuerro := True;
        end;
      end;

      if deuerro = True then
        begin
          Form_menu.ConexaoBD.RollbackTrans;
        end
          else
            begin
              Form_menu.ConexaoBD.CommitTrans;
              pk := '';
              desabilita_salvar(Sender);
              limpa_campos;
              bloqueia_campos;
            end;
        end;
end;

procedure TForm_dependente.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['a'..'z', 'A'..'Z', #32, #8]) then
    Key := #0;
end;

procedure TForm_dependente.edt_idadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['0'..'9', #8]) then
    Key := #0;
end;

end.
