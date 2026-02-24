unit uuControleCartoes;

interface

uses
  Windows, RealFramework, System.Generics.Collections, Messages,
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, ibx.ibquery,
  Menus, Data.DB, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, AdvOfficeImage, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxDataStorage,
  cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, StrUtils, cxDropDownEdit, cxCustomData, cxFilter,
  cxData, dxDateRanges, dxScrollbarAnnotations;

type
  TfrmControleCartoes = class(Tfrm_modelo_vazio)
    PopupMenu1: TPopupMenu;
    Bloquearcarto1: TMenuItem;
    Liberarcarto1: TMenuItem;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    edDe: TEdit;
    edAte: TEdit;
    btExibir: TBitBtn;
    Panel17: TPanel;
    lbNomeEmpresa: TLabel;
    AdvOfficeImage10: TAdvOfficeImage;
    AdvOfficeImage11: TAdvOfficeImage;
    Panel1: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle1: TcxStyle;
    BitBtn2: TBitBtn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    procedure ExibirCartoes;
    procedure btExibirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edDeExit(Sender: TObject);
    procedure edAteExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Bloquearcarto1Click(Sender: TObject);
    procedure Liberarcarto1Click(Sender: TObject);
  private
    procedure BloquearCartao(ACartao: string);
    procedure LiberarCartao(ACartao: string);
    procedure SalvarAlteracoes;
    procedure BloquearTodos;
    procedure LiberarTodos;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleCartoes: TfrmControleCartoes;

implementation

uses
  uu_data_module, uuAuditoriaCartoes;

{$R *.dfm}

procedure TfrmControleCartoes.ExibirCartoes();
var
  LSQL: TStringlist;
begin
  LSQL := TStringList.Create;
  try
    LSQL.add('  select c.cod_cartao, coalesce(c.descricao,' + QuotedStr('') + ') as descricao,');
    LSQL.add('   case c.status     ');
    LSQL.add('   when 2 then ' + Quotedstr('Bloqueado'));
    LSQL.add('   when 3 then ' + Quotedstr('Livre'));
    LSQL.add('   when 0 then' + Quotedstr('Encerrado'));
    LSQL.add('  end descricao_status,');
    LSQL.add('  coalesce(c.nome_cliente,' + QuotedStr('') + ') as nome_cliente');
    LSQL.add('  from cartoes c ');
    LSQL.add('  where cod_cartao between ' + quotedstr(edDe.Text) + ' and ' + QuotedStr(edAte.Text));
    LSQL.add('   order by c.cod_cartao ');
    dm.getMemTable(dm.tbCartoes, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmControleCartoes.BloquearCartao(ACartao: string);
var
  q: Tibquery;
begin
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.SQL.Add('update cartoes set status=2,nome_cliente=null,cod_cli=null where cod_cartao=' + Quotedstr(ACartao));
  q.ExecSQL;
  dm.transacao.Commit;
  FreeAndNil(q);

end;

procedure TfrmControleCartoes.Bloquearcarto1Click(Sender: TObject);
begin
  inherited;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Tem certeza que deseja bloquear todos(as)?', 20) = teSim) then
  begin
    BloquearTodos;
  end;
end;

procedure TfrmControleCartoes.BloquearTodos();
begin
  inherited;
  dm.tbCartoes.DisableControls;

  try
    dm.tbcartoes.first;
    while not dm.tbCartoes.eof do
    begin
      dm.tbcartoes.Edit;
      dm.tbCartoes.FieldByName('descricao_status').Value := 'Bloqueado';
      dm.tbCartoes.FieldByName('nome_cliente').Value := '';
      dm.tbcartoes.post;
      dm.tbCartoes.Next;
    end;

  finally
    dm.tbCartoes.first;
    dm.tbCartoes.EnableControls;

  end;

end;

procedure TfrmControleCartoes.LiberarTodos();
begin
  inherited;
  dm.tbCartoes.DisableControls;

  try
    dm.tbcartoes.first;
    while not dm.tbCartoes.eof do
    begin
      dm.tbcartoes.Edit;
      dm.tbCartoes.FieldByName('descricao_status').Value := 'Livre';
      dm.tbCartoes.FieldByName('nome_cliente').Value := '';
      dm.tbcartoes.post;
      dm.tbCartoes.Next;
    end;

  finally
    dm.tbCartoes.first;
    dm.tbCartoes.EnableControls;
  end;

end;

procedure TfrmControleCartoes.LiberarCartao(ACartao: string);
var
  q: Tibquery;
begin
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.SQL.Add('update cartoes set status=3,cod_cli=null where cod_cartao=' + Quotedstr(ACartao));
  q.ExecSQL;
  dm.transacao.Commit;
  FreeAndNil(q);
  btExibir.Click;

end;

procedure TfrmControleCartoes.Liberarcarto1Click(Sender: TObject);
begin
  inherited;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Tem certeza que deseja liberar todos(as)?', 20) = teSim) then
  begin
    LiberarTodos;
  end
end;

procedure TfrmControleCartoes.btExibirClick(Sender: TObject);
begin
  inherited;
  ExibirCartoes();
end;

procedure TfrmControleCartoes.FormActivate(Sender: TObject);
begin
  inherited;
  ExibirCartoes();
end;

procedure TfrmControleCartoes.edDeExit(Sender: TObject);
begin
  inherited;
  try
    edDe.Text := FormatFloat('0000', StrToFloat(edDe.Text));
  except
    begin
      showmessage('Valor inválido!');
      edDe.SetFocus;
      edDe.Clear;
    end;
  end;
end;

procedure TfrmControleCartoes.edAteExit(Sender: TObject);
begin
  inherited;
  try
    edAte.Text := FormatFloat('0000', StrToFloat(edAte.Text));
  except
    begin
      showmessage('Valor inválido!');
      edAte.SetFocus;
      edAte.Clear;
    end;
  end;

end;

procedure TfrmControleCartoes.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmAuditoriaCartoes, frmAuditoriaCartoes);
  frmAuditoriaCartoes.ShowModal;
  frmAuditoriaCartoes.Free;
end;

procedure TfrmControleCartoes.SalvarAlteracoes();
var
  LSQL: TStringList;
  LListaSQL: TList<string>;
  LStatus: string;
  LStatusInt: smallint;
  LCartao, LNomeCliente: string;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;

  try
    try

      dm.tbCartoes.DisableControls;
      dm.tbCartoes.First;
      while not dm.tbCartoes.eof do
      begin
        LStatus := dm.tbCartoes.FieldByName('descricao_status').Value;
        LNomeCliente := dm.tbCartoes.FieldByName('nome_cliente').Value;
        case AnsiIndexStr(UpperCase(LStatus), ['ENCERRADO', 'BLOQUEADO', 'LIVRE']) of
          0:
            LStatusInt := 0;
          1:
            begin
              LStatusInt := 2;
//              LNomeCliente := '';
            end;
          2:
            LStatusInt := 3;
        end;

        LCartao := dm.tbCartoes.FieldByName('cod_cartao').Value;
        LSQL.clear;

        LSQL.Add('update cartoes c set c.descricao=' + QuotedStr(dm.tbCartoes.fieldbyname('descricao').value) + ',');
        LSQL.add(' c.nome_cliente=' + QuotedStr(LNomeCliente) + ',');
        LSQL.add(' c.status=' + Inttostr(LStatusInt));
        LSQL.Add(' where c.cod_cartao=' + QuotedStr(LCartao));
        LListaSQL.Add(LSQL.Text + ';');
        dm.tbCartoes.Next;
      end;
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);
    except
      on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
    dm.tbCartoes.EnableControls;
    btExibir.Click;

  end;

end;

procedure TfrmControleCartoes.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmControleCartoes.BitBtn3Click(Sender: TObject);
begin
  inherited;
  try

    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma as alterações ?', 20) = teSim) then
    begin
      SalvarAlteracoes;
      showRealDialog(self, tmSucesso, 'Sucesso', 'Alterações salvas com sucesso!', 16, false);

    end;

  except
    on E: Exception do
    begin
      showRealDialog(self, tmErro, 'Erro', 'Erro ao salvar!' + sLineBreak + sLineBreak + e.Message, 16, false);
    end;

  end;
end;

end.

