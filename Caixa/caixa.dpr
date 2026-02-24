program caixa;

uses
  Vcl.Forms,
  REMOVER in 'REMOVER.pas' {Form13},
  uu_data_module in '..\uu_data_module.pas' {dm: TDataModule},
  RealFramework in '..\common\RealFramework.pas',
  FormaPagamentoController in '..\controller\FormaPagamentoController.pas',
  GrupoAdicionalController in '..\controller\GrupoAdicionalController.pas',
  GrupoDeAdicionaisController in '..\controller\GrupoDeAdicionaisController.pas',
  ProdutoAdicionalController in '..\controller\ProdutoAdicionalController.pas',
  UnidadeMedidaController in '..\controller\UnidadeMedidaController.pas',
  FormaPagamentoDAO in '..\DAO\FormaPagamentoDAO.pas',
  GrupoAdicionalDAO in '..\DAO\GrupoAdicionalDAO.pas',
  GrupoDAO in '..\DAO\GrupoDAO.pas',
  GrupoDeAdicionaisDAO in '..\DAO\GrupoDeAdicionaisDAO.pas',
  InformacaoMesaDAO in '..\DAO\InformacaoMesaDAO.pas',
  ObsClienteDeliveryDAO in '..\DAO\ObsClienteDeliveryDAO.pas',
  PaisDAO in '..\DAO\PaisDAO.pas',
  RealDaoExecute in '..\DAO\RealDaoExecute.pas',
  ReplicationContainer in '..\DAO\ReplicationContainer.pas',
  ReplicationItem in '..\DAO\ReplicationItem.pas',
  UnidadeMedidaDAO in '..\DAO\UnidadeMedidaDAO.pas',
  URealDatasets in '..\DAO\URealDatasets.pas',
  URequisicaoAPIHorse in '..\DAO\URequisicaoAPIHorse.pas',
  Aliquota in '..\model\Aliquota.pas',
  ConfiguracoesNFCE in '..\model\ConfiguracoesNFCE.pas',
  EstadoModel in '..\model\EstadoModel.pas',
  FormaPagamento in '..\model\FormaPagamento.pas',
  FornecedorModel in '..\model\FornecedorModel.pas',
  Grupo in '..\model\Grupo.pas',
  GrupoAdicional in '..\model\GrupoAdicional.pas',
  GrupoDeAdicionais in '..\model\GrupoDeAdicionais.pas',
  InformacaoMesa in '..\model\InformacaoMesa.pas',
  InventarioModel in '..\model\InventarioModel.pas',
  MovimentacaoEstoqueModel in '..\model\MovimentacaoEstoqueModel.pas',
  MunicipioModel in '..\model\MunicipioModel.pas',
  ObsClienteDeliveryModel in '..\model\ObsClienteDeliveryModel.pas',
  PaisModel in '..\model\PaisModel.pas',
  Parametros in '..\model\Parametros.pas',
  ParametrosEstacao in '..\model\ParametrosEstacao.pas',
  Produto in '..\model\Produto.pas',
  Recebimento in '..\model\Recebimento.pas',
  TransferenciaItem in '..\model\TransferenciaItem.pas',
  UnidadeMedida in '..\model\UnidadeMedida.pas',
  uuDmAtualizaBase in '..\DM\uuDmAtualizaBase.pas' {dmAtualizaBase: TDataModule},
  uuDMAuditoriaCaixa in '..\DM\uuDMAuditoriaCaixa.pas' {dmAuditoriaCaixa: TDataModule},
  uuDMExpedicaoDelivery in '..\DM\uuDMExpedicaoDelivery.pas' {dmExpedicaoDelivery: TDataModule},
  uuDMFrenteCaixa in '..\DM\uuDMFrenteCaixa.pas' {dmFrenteCaixa: TDataModule},
  uuDMGruposAdicionais in '..\DM\uuDMGruposAdicionais.pas' {dmGruposAdicionais: TDataModule},
  uuDMPedidoDelivery in '..\DM\uuDMPedidoDelivery.pas' {dmPedidoDelivery: TDataModule},
  uuRealDialog in '..\uuRealDialog.pas' {frmRealDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TdmAtualizaBase, dmAtualizaBase);
  Application.CreateForm(TdmAuditoriaCaixa, dmAuditoriaCaixa);
  Application.CreateForm(TdmExpedicaoDelivery, dmExpedicaoDelivery);
  Application.CreateForm(TdmFrenteCaixa, dmFrenteCaixa);
  Application.CreateForm(TdmGruposAdicionais, dmGruposAdicionais);
  Application.CreateForm(TdmPedidoDelivery, dmPedidoDelivery);
  Application.CreateForm(TfrmRealDialog, frmRealDialog);
  Application.Run;
end.
