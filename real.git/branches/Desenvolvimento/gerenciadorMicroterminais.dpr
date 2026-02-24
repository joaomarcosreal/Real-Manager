program gerenciadorMicroterminais;

uses
  Forms,
  uu_gerenciador_microterminais in 'uu_gerenciador_microterminais.pas' {frmPrincipalTerminais},
  UnitDeclaracoes in 'UnitDeclaracoes.pas',
  uu_data_module in 'uu_data_module.pas' {dm: TDataModule},
  uu_modelo_vazio in 'uu_modelo_Vazio.pas' {frm_modelo_vazio},
  uudmTerminais in 'uudmTerminais.pas' {dmTerminais: TDataModule};

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
       Application.CreateForm(TdmTerminais, dmTerminais);
       Application.CreateForm(TfrmPrincipalTerminais, frmPrincipalTerminais);
       Application.Run;
     end;
  end;
end.
