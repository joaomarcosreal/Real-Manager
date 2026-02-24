unit uu_listagem_fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, StdCtrls, ExtCtrls, Buttons;

type
  TfrmListagemFornecedores = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    gpTipoListagem: TRadioGroup;
    gpOrdem: TRadioGroup;
    pn_grupos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bt_pesq_cod_grupo_fornecedor: TSpeedButton;
    ed_cod_grupo_fornecedor: TMaskEdit;
    Panel3: TPanel;
    ed_desc_grupo_fornecedor: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListagemFornecedores: TfrmListagemFornecedores;

implementation

uses uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmListagemFornecedores.BitBtn1Click(Sender: TObject);
var
 arquivo : string;
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryFornecedores.Active:=false;
  dRelatorios.qryFornecedores.sql.Clear;
  dRelatorios.qryParametros.Active:=true;
  dRelatorios.dtParametros.Open;




  case gpTipoListagem.ItemIndex  of
   0: begin
        dRelatorios.qryFornecedores.SQL.clear;
        dRelatorios.qryFornecedores.sql.add('select  f.cod_fornecedor,f.nome_fantasia,f.fax,f.telefone,f.data_cadastro,f.email,f.codigo_grupo_fornec,f.contato, gp.descricao as descGrupo from fornecedor f');
        dRelatorios.qryFornecedores.sql.add('  inner join grupo_fornecedor  gp on (gp.codigo = f.codigo_grupo_fornec)');
        dRelatorios.qryFornecedores.SQL.add(' where f.codigo_grupo_fornec like '+Quotedstr(ed_cod_grupo_fornecedor.text+'%'));
        dRelatorios.qryFornecedores.sql.add('  order by f.codigo_grupo_fornec');
        dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemFornecedoresAgrupado.fr3');
      end;
   1: begin
        dRelatorios.qryFornecedores.SQL.clear;
        dRelatorios.qryFornecedores.sql.add('  select f.*,gp.descricao as descGrupo from fornecedor f ');
        dRelatorios.qryFornecedores.sql.add('  inner join grupo_fornecedor  gp on (gp.codigo = f.codigo_grupo_fornec)');
        dRelatorios.qryFornecedores.SQL.add(' where f.codigo_grupo_fornec like '+Quotedstr(ed_cod_grupo_fornecedor.text+'%'));
        dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemFornecedores.fr3');
      end;

  end;


  case gpOrdem.ItemIndex of
   0 : begin
        if gpTipoListagem.ItemIndex = 1 then
        dRelatorios.qryFornecedores.SQL.Add('order by f.cod_fornecedor')
        else
        dRelatorios.qryFornecedores.SQL.Add(',f.cod_fornecedor');

       end;
   1 : begin
        if gpTipoListagem.ItemIndex = 1 then
        dRelatorios.qryFornecedores.SQL.Add('order by nome_fantasia')
        else
        dRelatorios.qryFornecedores.SQL.Add(',f.nome_fantasia');
       end;
   2 : begin
        if gpTipoListagem.ItemIndex = 1 then
        dRelatorios.qryFornecedores.SQL.Add('order by data_cadastro')
        else
        dRelatorios.qryFornecedores.SQL.Add(',f.data_cadastro');
       end;
  end;

  dRelatorios.qryFornecedores.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryFornecedores.Active:=false;

end;

procedure TfrmListagemFornecedores.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
