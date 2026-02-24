unit uListagemProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, StdCtrls, ExtCtrls, Buttons,
  jpeg, cxButtons, ComObj, ComCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions;

type
  TfrmListagemProdutos = class(Tfrm_modelo_vazio)
    Panel4: TPanel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gTipoListagem: TRadioGroup;
    gpOrdem: TRadioGroup;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_cod_grupo: TMaskEdit;
    bt_pesq_grupo: TSpeedButton;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    SaveDialog: TSaveDialog;
    SpeedButton1: TcxButton;
    procedure ed_cod_grupoChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  frmListagemProdutos: TfrmListagemProdutos;

implementation

uses uu_data_module, uu_frm_principal, uuDmRelatorios;

{$R *.dfm}

procedure TfrmListagemProdutos.ed_cod_grupoChange(Sender: TObject);
begin
  inherited;
  if ed_cod_grupo.Text ='' then  ed_desc_grupo.clear;
end;

procedure TfrmListagemProdutos.BitBtn1Click(Sender: TObject);
var
 arquivo : string;
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryProdutos.Active:=false;
  dRelatorios.qryProdutos.sql.Clear;


  case gTipoListagem.ItemIndex  of
   0: begin
        dRelatorios.qryProdutos.SQL.clear;
        dRelatorios.qryProdutos.sql.add(' select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.descricao as miniprinter,ri.valor_custo,ri.perc_lucro,ri.lucro_real');
        dRelatorios.qryProdutos.sql.add(' from v_produtos vp');
        dRelatorios.qryProdutos.sql.add(' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)');
        dRelatorios.qryProdutos.sql.add(' inner join r_informacoes_produto ri on (ri.cod_produto = vp.cod_produto)');
        dRelatorios.qryProdutos.sql.add(' inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini_printer)');
        dRelatorios.qryProdutos.SQL.add(' where vp.cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
        dRelatorios.qryProdutos.sql.add('  order by vp.cod_g_raiz,vp.cod_g_pai,vp.cod_grupo');
        arquivo:=patchAplicacao+'relatorios\ListagemProdutosGeralAgrupado.fr3';

      end;
   1: begin
        dRelatorios.qryProdutos.SQL.clear;
        dRelatorios.qryProdutos.sql.add(' select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.descricao as miniprinter,ri.valor_custo,ri.perc_lucro,ri.lucro_real');
        dRelatorios.qryProdutos.sql.add(' from v_produtos vp');
        dRelatorios.qryProdutos.sql.add(' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)');
        dRelatorios.qryProdutos.sql.add(' inner join r_informacoes_produto ri on (ri.cod_produto = vp.cod_produto)');
        dRelatorios.qryProdutos.sql.add(' inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini_printer)');
        dRelatorios.qryProdutos.SQL.add(' where vp.cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
//        dRelatorios.qryProdutos.sql.add('  order by vp.cod_g_raiz,vp.cod_g_pai,vp.cod_grupo');
        arquivo:=patchAplicacao+'relatorios\ListagemProdutosGeral.fr3';
      end;

   2: begin
        dRelatorios.qryProdutos.sql.add(' select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.descricao as miniprinter,ri.valor_custo,ri.perc_lucro,ri.lucro_real');
        dRelatorios.qryProdutos.sql.add(' from v_produtos vp');
        dRelatorios.qryProdutos.sql.add(' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)');
        dRelatorios.qryProdutos.sql.add(' inner join r_informacoes_produto ri on (ri.cod_produto = vp.cod_produto)');
        dRelatorios.qryProdutos.sql.add(' inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini_printer)');
        dRelatorios.qryProdutos.SQL.add(' where vp.cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
        dRelatorios.qryProdutos.sql.add('  order by vp.aliquota');
        arquivo:=patchAplicacao+'relatorios\ListagemProdutosAliquota.fr3';
      end;

   3: begin
        dRelatorios.qryProdutos.sql.add(' select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.descricao as miniprinter,ri.valor_custo,ri.perc_lucro,ri.lucro_real');
        dRelatorios.qryProdutos.sql.add(' from v_produtos vp');
        dRelatorios.qryProdutos.sql.add(' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)');
        dRelatorios.qryProdutos.sql.add(' inner join r_informacoes_produto ri on (ri.cod_produto = vp.cod_produto)');
        dRelatorios.qryProdutos.sql.add(' inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini_printer)');
        dRelatorios.qryProdutos.SQL.add(' where vp.cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
        dRelatorios.qryProdutos.sql.add(' order by cod_miniprinter ');
        arquivo:=patchAplicacao+'relatorios\ListagemProdutoLocalImpressao.fr3';
      end;

   4: begin
        dRelatorios.qryProdutos.sql.add(' select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.descricao as miniprinter,ri.valor_custo,ri.perc_lucro,ri.lucro_real');
        dRelatorios.qryProdutos.sql.add(' from v_produtos vp');
        dRelatorios.qryProdutos.sql.add(' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)');
        dRelatorios.qryProdutos.sql.add(' inner join r_informacoes_produto ri on (ri.cod_produto = vp.cod_produto)');
        dRelatorios.qryProdutos.sql.add(' inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini_printer)');
        dRelatorios.qryProdutos.SQL.add(' where vp.cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
        dRelatorios.qryProdutos.sql.add(' order by vp.COD_GRUPO ');
        arquivo:=patchAplicacao+'relatorios\ListagemProdutosCardapio.fr3';
      end;

  end;


  case gpOrdem.ItemIndex of
   0 : begin
        if gTipoListagem.ItemIndex = 1 then
        dRelatorios.qryProdutos.SQL.Add('order by cod_barras')
        else
        dRelatorios.qryProdutos.SQL.Add(',cod_barras');

       end;
   1 : begin
        if gTipoListagem.ItemIndex = 1 then
        dRelatorios.qryProdutos.SQL.Add('order by descricao')
        else
        dRelatorios.qryProdutos.SQL.Add(',descricao');
       end;
   2 : begin
        if gTipoListagem.ItemIndex = 1 then
        dRelatorios.qryProdutos.SQL.Add('order by valor_unitario')
        else
        dRelatorios.qryProdutos.SQL.Add(',valor_unitario');
       end;
  end;

  ////dm.adicionalog(dRelatorios.qryProdutos.SQL.Text);
  dRelatorios.qryProdutos.Active:=true;
  dRelatorios.rpt.LoadFromFile(arquivo,true);
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryProdutos.Active:=false;



end;

procedure TfrmListagemProdutos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;



end.

