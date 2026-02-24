unit GrupoDeAdicionaisController;

interface
 uses GrupoDeAdicionais, System.SysUtils;

 type TGrupoDeAdicionaisController = class

  private
    procedure Validar(AGrupoDeAdicionais: TGrupoDeAdicionais);


  published
    procedure Salvar(AGrupoDeAdicionais: TGrupoDeAdicionais);
    procedure Excluir(AGrupoDeAdicionais: TGrupoDeAdicionais);

 end;


implementation


procedure TGrupoDeAdicionaisController.Validar(AGrupoDeAdicionais : TGrupoDeAdicionais);
begin
 if ( Trim(AGrupoDeAdicionais.Nome) = '' ) then
   raise Exception.Create('Nome do grupo de adicionais inválido!');

 if ( Trim(AGrupoDeAdicionais.Nome) = '' ) then
   raise Exception.Create('Descrição do grupo de adicionais inválida!');

 if (AGrupoDeAdicionais.QtdeMinima < 0) then
   raise Exception.Create('Quantidade mínima do grupo de adicionais inválida!');


 if (AGrupoDeAdicionais.QtdeMaxima < 0) then
   raise Exception.Create('Quantidade máxim do grupo de adicionais inválida!');

 if (AGrupoDeAdicionais.QtdeMaxima < AGrupoDeAdicionais.QtdeMinima ) then
   raise Exception.Create('Quantidade máxima do grupo deve ser maior que a quantidade mínima!');



end;

procedure TGrupoDeAdicionaisController.Salvar(AGrupoDeAdicionais : TGrupoDeAdicionais);
begin
  try
    Validar(AGrupoDeAdicionais);
  except
  on E: Exception do
   begin
     raise Exception.Create(E.Message);
   end;
  end;

end;

procedure TGrupoDeAdicionaisController.Excluir(AGrupoDeAdicionais : TGrupoDeAdicionais);
begin
  try
    Validar(AGrupoDeAdicionais);
  except
  on E: Exception do
   begin
     raise Exception.Create(E.Message);
   end;
  end;

end;

end.
