program gerenciadorImpressao;

uses
  Forms,
  system,
  windows,
  dialogs,
  uu_data_module in 'uu_data_module.pas' {dm: TDataModule},
  uu_gerenciador_impressao in 'uu_gerenciador_impressao.pas' {frmPrincipalGerenciador},
  UnitDeclaracoes in 'UnitDeclaracoes.pas',
  uu_modelo_vazio in 'uu_modelo_Vazio.pas' {frm_modelo_vazio};

{$R *.res}


begin
  begin
    Application.Initialize;
    Application.CreateForm(Tdm, dm);
  if (dm.AppIsRunning(true) = true) then
     begin
       Application.terminate
     end
    else
     begin
       Application.CreateForm(TfrmPrincipalGerenciador, frmPrincipalGerenciador);
      Application.Run;
     end;
  end;
end.
