unit Unit_socio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls;

type
  TForm_socio = class(TForm)
    edt_nome: TEdit;
    edt_renda: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    but_cadastrar: TButton;
    but_alterar: TButton;
    but_excluir: TButton;
    but_socio: TButton;
    but_salvar: TButton;
    but_cancelar: TButton;
    ADOQuery_aux: TADOQuery;
    RB_ativo: TRadioButton;
    RB_inativo: TRadioButton;
    procedure but_socioClick(Sender: TObject);
    procedure but_cadastrarClick(Sender: TObject);
    procedure but_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure but_alterarClick(Sender: TObject);
    procedure but_cancelarClick(Sender: TObject);
    procedure but_excluirClick(Sender: TObject);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_rendaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    operacao, pk : String;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
  end;

var
  Form_socio: TForm_socio;

implementation

uses Unit_consulta, Unit_menu;

{$R *.dfm}

procedure TForm_socio.bloqueia_campos;
var
  i : Integer;
begin
  For i := 1 to Form_socio.ComponentCount -1 do
    begin
      if (Form_socio.Components[i] is TEdit) then
        begin
          (Form_socio.Components[i] as TEdit).Enabled := False;
          (Form_socio.Components[i] as TEdit).Color := clInfoBk;
        end;
    end;
end;

procedure TForm_socio.but_socioClick(Sender: TObject);
begin
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

  Form_consulta.sql_pesquisa := ' SELECT Nome FROM Cad_socio ';
  Form_consulta.Showmodal;
  if Form_consulta.chave <> '' then
  begin
    pk := Form_consulta.chave;
    ADOQuery_aux.SQL.Text := ' SELECT * FROM Cad_socio '+
                             ' WHERE Nome = '+ QuotedStr(pk);
    ADOQuery_aux.Open;
    edt_nome.Text := ADOQuery_aux.Fieldbyname('Nome').AsString;
    edt_renda.Text := ADOQuery_aux.Fieldbyname('Renda').AsString;

    if (ADOQuery_aux.Fieldbyname('Ativo').AsBoolean = True) then
    begin
      RB_ativo.Checked := True;
      RB_Inativo.Checked := False;
    end
    else
    begin
      RB_Inativo.Checked := True;
      RB_ativo.Checked := False;
    end;
  end;
end;

procedure TForm_socio.desabilita_salvar(Sender: TObject);
begin
  but_cadastrar.Enabled := True;
  but_salvar.Enabled := False;
  but_alterar.Enabled := True;
  but_cancelar.Enabled := False;
  but_excluir.Enabled := True;
  RB_ativo.Enabled := False;
  RB_inativo.Enabled := False;
end;

procedure TForm_socio.habilita_salvar(Sender: TObject);
begin
  but_cadastrar.Enabled := False;
  but_salvar.Enabled := True;
  but_alterar.Enabled := False;
  but_cancelar.Enabled := True;
  but_excluir.Enabled := False;
  RB_ativo.Enabled := True;
  RB_inativo.Enabled := True;

  if Sender = but_cadastrar then
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

procedure TForm_socio.libera_campos;
var
  i : Integer;
begin
  for i := 1 to Form_socio.ComponentCount -1 do
    begin
      if Form_socio.Components[i] is TEdit then
        begin
          (Form_socio.Components[i] as TEdit).Enabled := True;
          (Form_socio.Components[i] as TEdit).Color := clWindow;
        end;
    end;
end;

procedure TForm_socio.limpa_campos;
var
  i : Integer;
begin
  For i := 1 To Form_socio.ComponentCount -1 do
    begin
      if Form_socio.Components[i] is TEdit then
        begin
          (Form_socio.Components[i] as TEdit).Clear;
        end;
    end;
end;

procedure TForm_socio.but_cadastrarClick(Sender: TObject);
begin
  libera_campos;
  limpa_campos;
  pk := '';
  habilita_salvar(Sender);
  RB_ativo.Enabled := True;
  RB_inativo.Enabled := True;
end;

procedure TForm_socio.but_salvarClick(Sender: TObject);
var
  deuerro : boolean;
begin
  if (edt_nome.Text = '') or (edt_renda.Text='') then
    begin
      Showmessage('Preencha todos os campos')
    end
      else
    begin
      if operacao = 'Cadastrar' then
        ADOQuery_aux.SQL.Text := ' INSERT INTO Cad_socio(Nome, Renda, Ativo) VALUES ' +
                                 '( ' + QuotedStr(edt_nome.Text) +
                                 ', ' + edt_renda.Text +
                                 ', ' + BoolToStr(RB_ativo.Checked)  + ' )'

      else if operacao = 'Alterar' then
        ADOQuery_aux.SQL.Text := ' UPDATE Cad_socio SET '+
                                 ' Nome = ' + QuotedStr(edt_nome.Text) +
                                 ', Renda = ' + edt_renda.Text +
                                 ', Ativo = ' + BoolToStr(RB_ativo.Checked) +
                                 ' WHERE Nome = ' + QuotedStr(edt_nome.Text);

        Form_menu.ConexaoBD.BeginTrans;
        try
          ADOQuery_aux.ExecSQL;
          deuerro := False;
        except
          On E : Exception do
          begin
            deuerro := True;
            if Form_menu.ErroBD(E.Message,'PK_Id') = 'Sim' then
              Showmessage('Socio já cadastrado')
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

procedure TForm_socio.FormShow(Sender: TObject);
begin
  pk := '';
  operacao := '';
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);
  RB_ativo.Checked := False;
  RB_inativo.Checked := False;
  RB_ativo.Enabled := False;
  RB_inativo.Enabled := False;
end;

procedure TForm_socio.but_alterarClick(Sender: TObject);
begin
  if pk = '' then
    Showmessage('Impossivel alterar')
  else
    begin
      libera_campos;
      habilita_salvar(Sender);
    end;
end;

procedure TForm_socio.but_cancelarClick(Sender: TObject);
begin
  if operacao = '' then
    limpa_campos;

  desabilita_salvar(Sender);
  bloqueia_campos;
end;

procedure TForm_socio.but_excluirClick(Sender: TObject);
var
  deuerro : boolean;
begin
  if pk = '' then
    Showmessage('Impossivel excluir')
  else
    begin
      ADOQuery_aux.SQL.Text := ' DELETE FROM Cad_socio ' +
                               ' WHERE Nome = ' + QuotedStr(pk);
      Form_menu.ConexaoBD.BeginTrans;

      try
        ADOQuery_aux.ExecSQL;
        deuerro := False;
      except
        On E : Exception do
        begin
          deuerro := True;
          if Form_menu.ErroBD(E.Message, 'FK_Cad_socio_Cad_dependente') = 'Sim' then
            Showmessage('Existem dependentes cadastrados para este usuario')
          else
            Showmessage('Ocorreu o seguinte erro :' + E.Message);
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

procedure TForm_socio.edt_nomeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['a'..'z', 'A'..'Z', #32, #8]) then
    Key := #0;
end;

procedure TForm_socio.edt_rendaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9', #8, #46]) then
    Key := #0;
end;

end.
