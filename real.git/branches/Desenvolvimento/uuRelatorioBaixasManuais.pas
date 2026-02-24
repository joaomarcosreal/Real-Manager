unit uuRelatorioBaixasManuais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls, RxToolEdit;

type
  TfrmRelatorioBaixasManuais = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    edDe: TDateEdit;
    edAte: TDateEdit;
    rdTipoRelatorio: TRadioGroup;
    Panel2: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    btPesqTipoBaixa: TSpeedButton;
    edCodTipoBaixaEstoque: TMaskEdit;
    Panel6: TPanel;
    edDescricaoTipoBaixaEstoque: TMaskEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    ed_cod_grupo: TMaskEdit;
    Panel7: TPanel;
    ed_desc_grupo: TMaskEdit;
    Panel8: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    ed_cod_item: TMaskEdit;
    Panel9: TPanel;
    ed_desc_item: TMaskEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rdpTipoBaixa: TRadioGroup;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure imprimirRelatorio();
    function  verificaValidade() : boolean;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioBaixasManuais: TfrmRelatorioBaixasManuais;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelatorioBaixasManuais.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioBaixasManuais.FormActivate(Sender: TObject);
begin
  inherited;
  edDe.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edAte.Date:=Date;
  edDe.SetFocus;

end;


procedure TfrmRelatorioBaixasManuais.imprimirRelatorio();
var
 filtro : string;
 idBaixa : string;
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  if (rdTipoRelatorio.ItemIndex = 1) then
   begin
    dRelatorios.qryBaixasManuais.Active:=false;
    dRelatorios.qryBaixasManuais.sql.Clear;
    dRelatorios.qryBaixasManuais.sql.add('select * from v_baixas_estoque where data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));



    if rdpTipoBaixa.ItemIndex = 0 then
     begin
       filtro:=filtro + 'AJUSTES/';
       dRelatorios.qryBaixasManuais.SQL.add(' and id_baixa=1');
     end;

    if rdpTipoBaixa.ItemIndex = 1 then
     begin
       filtro:=filtro+ 'TRANSFORMAÇÕES/';
       dRelatorios.qryBaixasManuais.SQL.add(' and id_baixa=2');
     end;

    if rdpTipoBaixa.ItemIndex = 2 then
     begin
       filtro:=filtro+ 'AUTOMATICAS/';
       dRelatorios.qryBaixasManuais.SQL.add(' and id_baixa=3');
     end;

    if rdpTipoBaixa.ItemIndex = 3 then
     begin
       filtro:=filtro+ 'TODAS AS BAIXAS';
       dRelatorios.qryBaixasManuais.SQL.add(' and id_baixa <> -1 ');
     end;


    if (trim (edCodTipoBaixaEstoque.Text) <> '') then
     begin
       filtro:=filtro + 'Tipo = '+edDescricaoTipoBaixaEstoque.Text;
       dRelatorios.qryBaixasManuais.SQL.add(' and cod_tipo='+Quotedstr(edCodTipoBaixaEstoque.Text));
     end
    else
     begin
       filtro:=filtro+ ' Tipo = Todos';
     end;

    if (trim (ed_cod_grupo.Text) <> '') then
     begin
       dRelatorios.qryBaixasManuais.SQL.add(' and cod_grupo like '+Quotedstr(ed_cod_grupo.Text+'%'));
       filtro:=filtro+' ,Grupo = '+ed_desc_grupo.Text;
     end
    else
     begin
       filtro:=filtro+', Grupo = Todos';
     end;

    if (trim (ed_cod_item.Text) <> '') then
     begin
       dRelatorios.qryBaixasManuais.SQL.add(' and cod_item='+Quotedstr(ed_cod_item.Text));
       filtro:=filtro+', Ítem = '+ed_desc_item.Text;
     end
    else
     begin
       filtro:= filtro+', Ítem = Todos';
     end;


    dRelatorios.qryBaixasManuais.SQL.add(' order by cod_grupo,cod_item,data desc');



    dRelatorios.qryBaixasManuais.Active:=true;
    dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioBaixasManuaisAnalitico.fr3',true);

    if  not  dRelatorios.qryBaixasManuais.IsEmpty then
     begin
       dRelatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);
       dRelatorios.setFiltroRelatorio(filtro);
       dRelatorios.rpt.ShowReport(true);
       dRelatorios.qryBaixasManuais.Active:=false;
     end
    else
     ShowMessage('Não existem lançamentos de baixa para o período e/ou filtros informados');
   end
  else
    begin

      if rdpTipoBaixa.ItemIndex = 0 then
       begin
         filtro:=filtro + 'AJUSTES  --';
         idBaixa:='1';
       end;

      if rdpTipoBaixa.ItemIndex = 1 then
       begin
         filtro:=filtro+ 'TRANSFORMAÇÕES  --';
         idBaixa:='2';
       end;

      if rdpTipoBaixa.ItemIndex = 2 then
       begin
         filtro:=filtro+ 'AUTOMATICAS  --';
         idBaixa:='3';
       end;

      if rdpTipoBaixa.ItemIndex = 3 then
       begin
         filtro:=filtro+ 'TODAS AS BAIXAS  --';
         idBaixa:='';
       end;


      dRelatorios.qryBaixasManuaisSintetico.Active:=false;
      dRelatorios.qryBaixasManuaisSintetico.sql.Clear;
      dRelatorios.qryBaixasManuaisSintetico.sql.add('select b.*,vi.cod_g_raiz,vi.desc_g_raiz,vi.cod_g_pai,vi.desc_g_pai,vi.cod_grupo,vi.desc_grupo');
      dRelatorios.qryBaixasManuaisSintetico.sql.add('      from r_baixas_manuais_sintetico('+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+','+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date))+','+Quotedstr(idBaixa)+','+Quotedstr(triM(edCodTipoBaixaEstoque.Text))+') b ');
      dRelatorios.qryBaixasManuaisSintetico.sql.add(' inner join v_itens_estoque vi on (vi.cod_item = b.cod_item) ');

      if (trim (edCodTipoBaixaEstoque.Text) <> '') then
       begin
         filtro:=filtro + 'Tipo = '+edDescricaoTipoBaixaEstoque.Text;
       end
      else
       begin
         filtro:=filtro + 'Tipo = Todos';
       end;

      if (trim (ed_cod_grupo.Text) <> '') then
       begin
         filtro:=filtro+' ,Grupo = '+ed_desc_grupo.Text;
         dRelatorios.qryBaixasManuaisSintetico.SQL.add(' and vi.cod_grupo like '+Quotedstr(ed_cod_grupo.Text+'%'));
       end
      else
       begin
         filtro:=filtro+', Grupo = Todos';
       end;

      if (trim (ed_cod_item.Text) <> '') then
       begin
         dRelatorios.qryBaixasManuaisSintetico.SQL.add(' and b.cod_item='+Quotedstr(ed_cod_item.Text));
         filtro:=filtro+', Ítem = '+ed_desc_item.Text;
       end
      else
       begin
         filtro:= filtro+', Ítem = Todos';
       end;


      dRelatorios.qryBaixasManuaisSintetico.SQL.add(' order by vi.cod_grupo,b.cod_item');
      dRelatorios.qryBaixasManuaisSintetico.Active:=true;


      dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioBaixasManuaisSintetico.fr3',true);

      if  not  dRelatorios.qryBaixasManuaisSintetico.IsEmpty then
       begin
         dRelatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);
         dRelatorios.setFiltroRelatorio(filtro);
         dRelatorios.rpt.ShowReport(true);
         dRelatorios.qryBaixasManuaisSintetico.Active:=false;
       end
      else
       ShowMessage('Não existem lançamentos de baixa para o período e/ou filtros informados');

    end;


end;



function TfrmRelatorioBaixasManuais.verificaValidade() : boolean;
begin

  if edAte.Date < edDe.Date then
   begin
    showmessage('Período Inválido');
    edDe.SetFocus;
   end;

   if ( trim(edCodTipoBaixaEstoque.Text) <> '') then
    begin
      if (verificaExistenciaTipoBaixaEstoque(edCodTipoBaixaEstoque.Text) = false) then
        begin
          ShowMessage('Código de tipo de baixa inválido!');
          edCodTipoBaixaEstoque.SetFocus;
          edCodTipoBaixaEstoque.Clear;
          result:=false;
          exit;
        end;
    end;


   if ( trim(ed_cod_grupo.Text) <> '') then
    begin
      if (verificaExistenciaGrupo(ed_cod_grupo.Text) = false) then
        begin
          ShowMessage('Código de grupo inválido!');
          ed_cod_grupo.SetFocus;
          ed_cod_grupo.Clear;
          result:=false;
          exit;
        end;
    end;


   if ( trim(ed_cod_item.Text) <> '') then
    begin
      if (verificaExistenciaItemEstoque(ed_cod_item.Text,1) = false) then
        begin
          ShowMessage('Código de ítem inválido!');
          ed_cod_item.SetFocus;
          ed_cod_item.Clear;
          result:=false;
          exit;
        end;
    end;





  result:=true;
end;




procedure TfrmRelatorioBaixasManuais.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    imprimirRelatorio;
end;

end.
