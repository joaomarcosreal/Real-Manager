unit InformacaoMesaDAO;

interface

uses InformacaoMesa, uu_data_module;


   type TInformacaoMesaDAO = class
     public
       procedure atualizar(AInformacaoMesa : TInformacaoMesa);
       procedure getInformacoes(AInformacoesMesa : TInformacaoMesa);
   end;



implementation

uses  IBX.IBQuery, IBX.IBDatabase,System.SysUtils;

{ TInformacaoMesaDAO }





procedure TInformacaoMesaDAO.atualizar(AInformacaoMesa: TInformacaoMesa);
var
  LqryCadastrar: TIBquery;
  Ltransacao: TIBTransaction;
  LnomeGenerator: string;
begin
  LnomeGenerator := 'G_OBS_CLIENTES_DELIVERY';
  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := false;
  Ltransacao.Active := true;
  LqryCadastrar := TIBquery.Create(nil);
  LqryCadastrar.Database := dm.dbrestaurante;
  LqryCadastrar.Transaction := Ltransacao;

   try
    LqryCadastrar.SQL.Add(' UPDATE OR INSERT INTO INFORMACOES_MESA (MESA, HORA, COD_USUARIO, QTD_PESSOAS, TIPO_DESCONTO, VALOR_DESCONTO) values ( ');
    LqryCadastrar.sql.add(''+Quotedstr(AInformacaoMesa.Mesa)+',current_time,');
    LqryCadastrar.sql.add(''+Quotedstr(AInformacaoMesa.codUsuario)+',');
    LqryCadastrar.SQL.Add(IntToStr(AInformacaoMesa.qtdPessoas)+',');
    LqryCadastrar.SQL.Add(IntToStr(AInformacaoMesa.tipoDesconto)+',');
    LqryCadastrar.SQL.add(Quotedstr(dm.TrocaVirgPPto(FloatToStr(AInformacaoMesa.valorDesconto)))+')');
    LqryCadastrar.SQL.Add(' matching (mesa)');
    LqryCadastrar.ExecSQL;


   finally
    FreeAndNil(Ltransacao);
    FreeAndNil(LqryCadastrar);
   end;
end;





procedure TInformacaoMesaDAO.getInformacoes(AinformacoesMesa: TInformacaoMesa);
var
  LQryConsulta: TIBquery;
  Ltransacao: TIBTransaction;
  LnomeGenerator: string;
begin

  LnomeGenerator := 'G_OBS_CLIENTES_DELIVERY';
  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := false;
  Ltransacao.Active := true;
  LQryConsulta := TIBquery.Create(nil);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := Ltransacao;



  try
    LQryConsulta.Active := false;
    LQryConsulta.SQL.Add('select * from informacoes_mesa ms where ms.mesa='+Quotedstr(AInformacoesMesa.Mesa));
    LQryConsulta.Active := true;
    LQryConsulta.FetchAll;
    LQryConsulta.First;

    if ( LQryConsulta.IsEmpty  = false) then
     begin
      AinformacoesMesa.hora           := Time;
      AinformacoesMesa.codUsuario     := '001';
      AinformacoesMesa.qtdPessoas     := LQryConsulta.FieldByName('qtd_pessoas').Value;
      AinformacoesMesa.tipoDesconto   := LQryConsulta.FieldByName('tipo_desconto').Value;
      AinformacoesMesa.valorDesconto  := LQryConsulta.FieldByName('valor_desconto').Value;
     end
    else
     begin
       atualizar(AInformacoesMesa);
      AinformacoesMesa.hora           := Time;
      AinformacoesMesa.codUsuario     := '001';
      AinformacoesMesa.qtdPessoas     := 1;
      AinformacoesMesa.tipoDesconto   := 0;
      AinformacoesMesa.valorDesconto  := 0;

     end;



  finally
   LQryConsulta.Active := false;
   FreeAndNil(LQryConsulta);
   Ltransacao.Active := false;
   FreeAndNil(Ltransacao);
  end;


end;

end.
