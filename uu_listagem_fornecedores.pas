unit uu_listagem_fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.Menus;

type
  TfrmListagemFornecedores = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    gpOrdem: TRadioGroup;
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

uses
  uu_data_module, uuDmRelatorios, uu_frm_principal;

{$R *.dfm}

procedure TfrmListagemFornecedores.BitBtn1Click(Sender: TObject);
var
  arquivo: string;
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryFornecedores.Active := false;
  dRelatorios.qryFornecedores.sql.Clear;
  dRelatorios.qryParametros.Active := true;
  dRelatorios.dtParametros.Open;

  dRelatorios.qryFornecedores.SQL.clear;
  dRelatorios.qryFornecedores.sql.add('  select * from fornecedor f ');

  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemFornecedores.fr3');

  case gpOrdem.ItemIndex of
    0:
      begin

          dRelatorios.qryFornecedores.SQL.Add(' order by f.cod_fornecedor');

      end;
    1:
      begin

          dRelatorios.qryFornecedores.SQL.Add('  order by f.nome_fantasia');
      end;
    2:
      begin

          dRelatorios.qryFornecedores.SQL.Add('  order by f.data_cadastro');
      end;
  end;

  dRelatorios.qryFornecedores.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryFornecedores.Active := false;

end;

procedure TfrmListagemFornecedores.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

