unit uuBaixaTitulosContasApagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, ibx.ibquery,
  ComCtrls, RxCurrEdit, RxToolEdit, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, AdvGlassButton, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, Vcl.Menus, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Mask;

type
  TfrmBaixaTituloContasApagar = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    edDataPagamento: TDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    Label10: TLabel;
    Panel1: TPanel;
    Panel4: TPanel;
    edNumeroTitulo: TEdit;
    edParcela: TEdit;
    edDescricaoConta: TEdit;
    edValor: TCurrencyEdit;
    edVencimento: TDateEdit;
    pnl3: TPanel;
    lbl4: TLabel;
    edNomeFornecedor: TEdit;
    Label7: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    rdOrigem: TRadioGroup;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmBaixaTituloContasApagar: TfrmBaixaTituloContasApagar;

implementation

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmBaixaTituloContasApagar.AdvGlassButton1Click(Sender: TObject);
var
  cod_forma: string;
begin
  inherited;
  cod_forma := '01';

  if (MessageBox(0, 'Confirma a baixa do título  ?', 'Confirmação de baixa', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
  begin
    dm.transacao.Active := false;
    dm.transacao.Active := true;
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('update contas_a_pagar set cod_forma_pagto=' + QuotedStr(cod_forma) + ',status=1,data_pagamento=' + quotedstr(FormatDateTime('DD.MM.YYY', edDataPagamento.date)) + ' where codigo=' + quotedstr(edNumeroTitulo.Text));
    try
      begin
        dm.qryauxiliar.ExecSQL;
        dm.transacao.Commit;
        showmessage('Título baixado com sucesso!');
        close;
      end;
    except
      begin
        showmessage('erro ao baixar conta');
        frm_principal.memo_avisos.Lines := dm.qryauxiliar.SQL;
        close;
      end;
    end;
  end;
end;

procedure TfrmBaixaTituloContasApagar.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmBaixaTituloContasApagar.FormActivate(Sender: TObject);
var
  q: TIBquery;
begin
  inherited;
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;
  try
    edDataPagamento.Date := Date;
    q.active := false;
    q.sql.clear;
    q.active := false;
    q.SQL.Clear;
    q.sql.add('select coalesce(f.razao_social,' + Quotedstr('') + ') as razao_social, r.* from r_contas_a_pagar r');
    q.sql.add(' inner join fornecedor f on (f.cod_fornecedor = r.cod_fornecedor) ');
    q.sql.add('  where r.codigo=' + Quotedstr(edNumeroTitulo.Text));
    dm.adicionaLog(q.sql.text);
    q.Active := true;
    edNomeFornecedor.Text := q.fieldbyname('razao_social').value;
    edParcela.Text := q.fieldbyname('parcela').value;
    edDescricaoConta.Text := q.fieldbyname('descricaoconta').value;
    edVencimento.Date := q.fieldbyname('data_vencimento').value;
    edValor.Value := q.fieldbyname('valoratualizado').value;
  finally
    q.Active := false;
    freeandnil(q);
  end;
end;

end.

