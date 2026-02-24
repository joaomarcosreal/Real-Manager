unit uu_faturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids,
  DBGrids, FocusEdit;

type
  Tfrm_faturamento = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Panel2: TPanel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label1: TLabel;
    bt_pesq_cliente: TSpeedButton;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    ed_cod_cliente: TDBEdit;
    ed_desc_cliente: TDBEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    bt_pesquisa_forma: TSpeedButton;
    Label11: TLabel;
    ed_codigo_forma: TFocusEdit;
    ed_valor_forma: TFocusEdit;
    ed_descricao_forma: TFocusEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
  private
    { Private declarations }
    procedure retornaInformacoes(cod_fatura : string);
    procedure GravarAlteracoes();
  public
    { Public declarations }
  end;

var
  frm_faturamento: Tfrm_faturamento;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}




procedure Tfrm_faturamento.retornaInformacoes(cod_fatura : string);
begin
  dm.qry_faturas.active:=false;
  dm.qry_faturas.sql.clear;
  dm.qry_faturas.SQL.add('select');
  dm.qry_faturas.SQL.add('   f.*,');
  dm.qry_faturas.SQL.add('   c.razao_social,u1.login as usuario_inclusao,');
  dm.qry_faturas.SQL.add('   u2.login as usuario_baixa');
  dm.qry_faturas.SQL.add('        from faturas f');
  dm.qry_faturas.SQL.add('   inner join clientes c on (c.cod_cli = f.cod_cli)');
  dm.qry_faturas.SQL.add('   inner join usuarios u1 on (u1.cod_usuario = f.cod_usuario_inclusao)');
  dm.qry_faturas.SQL.add('   left join usuarios u2 on (u2.cod_usuario = f.cod_usuario_baixa)');
  dm.qry_faturas.sql.add(' where f.cod_fatura='+QuotedstR(cod_fatura));
  dm.qry_faturas.active:=true;


end;


procedure Tfrm_faturamento.ed_codigoExit(Sender: TObject);
begin
  inherited;

  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin

        if trim(ed_codigo.Text) = '' then exit;

      try
       ed_codigo.Text:= FormatFloat('000000',StrToFloat(ed_codigo.text));
      except
       begin
         Showmessage('Código de fatura inválido!');
         limpa_edits;
         ed_codigo.SetFocus;
         Exit;
       end
      end;

      if ( verificaExistenciaFatura(ed_codigo.Text) = false) then
       begin
         Showmessage('Código de fatura informado não existe!');
         ed_codigo.SetFocus;
         exit;
       end;

      case evento of
       1: begin
            if ( verificaFaturaBaixada(ed_codigo.text) = true ) then
             begin
               Showmessage(' Fatura já foi baixada!');
               ed_codigo.SetFocus;
               limpa_edits;
               exit;
             end;
          end;
      end;
       retornaInformacoes(ed_codigo.text);
       dm.qry_faturas.Edit;
    end
end;



procedure Tfrm_faturamento.GravarAlteracoes();
begin

   if (evento = 1) then
   begin
     dm.qry_faturasSTATUS.value:=1;
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qry_faturas.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_faturas]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão da fatura  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_faturas.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_faturas]);
         end;
    end;

end;





procedure Tfrm_faturamento.bt_gravarClick(Sender: TObject);
begin
  GravarAlteracoes();
  inherited;

end;

end.
