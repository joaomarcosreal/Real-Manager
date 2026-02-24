unit uuCadTiposBaixaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmCadTiposBaixaEstoque = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label2: TLabel;
    edDescricaoTipoBaixaEstoque: TDBEdit;
    Label1: TLabel;
    procedure GravarAlteracoes();
    procedure retornaInformacoes(codigo: string);
    procedure FormActivate(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTiposBaixaEstoque: TfrmCadTiposBaixaEstoque;

implementation

uses
  uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmCadTiposBaixaEstoque.GravarAlteracoes();
begin
  if (evento = 1) then
  begin
    dm.qryTiposBaixaEstoqueCOD_TIPO.Value := dm.geraCodigo('G_TIPOS_BAIXA_ESTOQUE', 3);
  end;

  if ((evento = 1) or (evento = 2)) then
  begin
    dm.qryTiposBaixaEstoque.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryTiposBaixaEstoque]);
  end
  else
  begin
    if (evento = 3) then
    begin
      if strToInt(dm.qryTiposBaixaEstoqueCOD_TIPO.Value) < 900 then
      begin

        if MessageDlg('Confirma exclusão do tipo de baixa informado ?', mtConfirmation, [mbYes, mbNo], 0) = Mryes then
        begin
          dm.qryTiposBaixaEstoque.Delete;
          dm.dbrestaurante.ApplyUpdates([dm.qryTiposBaixaEstoque]);
          dm.transacao.Commit;
          dm.transacao.Active := false;
          dm.transacao.Active := true;
        end;
      end
      else
      begin

      end;
    end;
  end;
end;

procedure TfrmCadTiposBaixaEstoque.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryTiposBaixaEstoque.Active := false;
  dm.qryTiposBaixaEstoque.SQL.clear;
  dm.qryTiposBaixaEstoque.sql.add('select * from tipos_baixa');

end;

procedure TfrmCadTiposBaixaEstoque.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryTiposBaixaEstoque.Active := true;
  dm.qryTiposBaixaEstoque.Append;
  edDescricaoTipoBaixaEstoque.SetFocus;

end;

procedure TfrmCadTiposBaixaEstoque.bt_gravarClick(Sender: TObject);
begin
  GravarAlteracoes;
  inherited;

end;

procedure TfrmCadTiposBaixaEstoque.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qryTiposBaixaEstoque.Cancel;
  dm.transacao.Active := false;
  dm.transacao.Active := true;

end;

procedure TfrmCadTiposBaixaEstoque.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (Sender is TMaskEdit and ((Sender as TMaskEdit).Name = 'ed_codigo')) then
  begin
    if trim(ed_codigo.Text) = '' then
      exit
    else
    try
      ed_codigo.Text := FormatFloat('000', StrToFloat(ed_codigo.text));
    except
      begin
        Showmessage('Código  Inválido!');
        ed_codigo.SetFocus;
        ed_codigo.Clear;
        exit;
      end;
    end;

    if evento <> 1 then
    begin
      if verificaExistenciaTipoDeBaixa(ed_codigo.Text) = false then
      begin
        showMessage('Tipo de baixa  não cadastrado!');
        limpa_edits;
        dm.qryTiposBaixaEstoque.Active := false;
        ed_codigo.SetFocus;
        exit;
      end
      else
      begin
        retornaInformacoes(ed_codigo.text);
        case evento of
          2:
            begin
              dm.qryTiposBaixaEstoque.Edit;
              bt_gravar.Enabled := true;
            end;
          3:
            begin
              bt_gravar.Enabled := true;
            end;
        end;
      end;

    end;
  end;

end;

procedure TfrmCadTiposBaixaEstoque.retornaInformacoes(codigo: string);
begin
  dm.qryTiposBaixaEstoque.Active := false;
  dm.qryTiposBaixaEstoque.sql.clear;
  dm.qryTiposBaixaEstoque.sql.add('select * from tipos_baixa where cod_tipo=' + Quotedstr(codigo));
  dm.qryTiposBaixaEstoque.Active := true;
end;

procedure TfrmCadTiposBaixaEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dm.qryTiposBaixaEstoque.Close;
end;

procedure TfrmCadTiposBaixaEstoque.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaTipoBaixaEstoque;
  inherited;

end;

end.

