unit uu_listagem_itens_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, StdCtrls, ExtCtrls, Buttons;

type
  TfrmListagemItensEstoque = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    gTipoListagem: TRadioGroup;
    gpOrdem: TRadioGroup;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Panel3: TPanel;
    ed_desc_grupo: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemItensEstoque: TfrmListagemItensEstoque;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmListagemItensEstoque.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmListagemItensEstoque.BitBtn1Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryItensEstoque.Active:=false;
  dRelatorios.qryItensEstoque.sql.Clear;

  case gTipoListagem.ItemIndex  of
   0: begin
        dRelatorios.qryItensEstoque.SQL.clear;
        dRelatorios.qryItensEstoque.sql.add('select v.* from v_itens_estoque v ');
        dRelatorios.qryItensEstoque.SQL.add(' where cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
        dRelatorios.qryItensEstoque.SQL.add('  order by v.cod_g_raiz,v.cod_g_pai,v.cod_grupo');
        dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemItensEstoqueAgrupado.fr3',true);
      end;
   1: begin
        dRelatorios.qryItensEstoque.SQL.clear;
        dRelatorios.qryItensEstoque.sql.add('select v.* from v_itens_estoque v ');
        dRelatorios.qryItensEstoque.SQL.add(' where cod_grupo like '+Quotedstr(ed_cod_grupo.text+'%'));
        dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemItensEstoque.fr3',true);
      end;
  end;


  case gpOrdem.ItemIndex of
   0 : begin
        if gTipoListagem.ItemIndex = 1 then
        dRelatorios.qryItensEstoque.SQL.Add('order by cod_item')
        else
        dRelatorios.qryItensEstoque.SQL.Add(',cod_item');

       end;
   1 : begin
        if gTipoListagem.ItemIndex = 1 then
        dRelatorios.qryItensEstoque.SQL.Add('order by descricao_item')
        else
        dRelatorios.qryItensEstoque.SQL.Add(',descricao_item');
       end;
   2 : begin
        if gTipoListagem.ItemIndex = 1 then
        dRelatorios.qryItensEstoque.SQL.Add('order by custo_unitario')
        else
        dRelatorios.qryItensEstoque.SQL.Add(',custo_unitario');
       end;
  end;

  dRelatorios.qryItensEstoque.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryItensEstoque.Active:=false;

end;

end.
