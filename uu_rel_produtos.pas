unit uu_rel_produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_rel_grupos, Mask, StdCtrls, Buttons, ExtCtrls, ibx.ibquery,
  ComCtrls, ImgList;

type
  Tfrm_rel_produtos = class(Tfrm_modelo_rel_grupos)
    CheckBox1: TCheckBox;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    edDescAliquota: TMaskEdit;
    edCodAliquota: TMaskEdit;
    procedure bt_selecionarClick(Sender: TObject);
    procedure ckb_tipoClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_produtos: Tfrm_rel_produtos;

implementation

uses UU_DM_RELATORIOS, uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_rel_produtos.bt_selecionarClick(Sender: TObject);
var
  qryProdutos: TIBQuery;

begin
  inherited;


  qryProdutos := TIBQuery.Create(Self);
  with qryProdutos do
  begin
    Name := 'qryProdutos';
    Database := dm.dbrestaurante;
    Transaction := dm.transacao;
    BufferChunks := 1000;
    CachedUpdates := False;
    SQL.Clear;
  end;
  qryProdutos.Active:=false;
  dm_relatorios.dtProdutos.DataSet := qryProdutos;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemProdutos.fr3',true);
  qryProdutos.sql.add('select * from r_informacoes_produto');
  qryProdutos.Active:=true;
  dm_relatorios.dtProdutos.DataSet := qryProdutos;

  dm_relatorios.rpt.ShowReport(true);
  FreeAndNil(qryProdutos)

                  {







   dm_relatorios.qry_list_produtos.Active:=false;
   dm_relatorios.qry_list_produtos.SQL.clear;
   if ckb_tipo.Checked then
     begin
       dm_relatorios.qry_list_produtos.SQL.add('select * from v_produtos where cod_grupo like '+Quotedstr(ed_cod_grupo.Text+'%')+' order by cod_grupo,cod_barras');
     end
   else
     begin
       dm_relatorios.qry_list_produtos.SQL.add('select * from v_produtos order by cod_grupo,cod_barras');
     end;

   dm_relatorios.qry_list_produtos.Active:=true;
   dm_relatorios.pp_produtos.Print; }

end;



procedure Tfrm_rel_produtos.ckb_tipoClick(Sender: TObject);
begin
  inherited;
  if ckb_tipo.Checked = false then
  begin
    ed_desc_grupo.Clear;
    ed_cod_grupo.clear;
  end;
end;

END.

