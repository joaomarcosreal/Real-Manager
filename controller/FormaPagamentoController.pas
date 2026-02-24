unit FormaPagamentoController;



interface
 uses
  FormaPagamento, FormaPagamentoDAO, System.SysUtils;
  type
   TFormaPagamentoController = class
     private
       procedure validar(AFormaPagamento: TFormaPagamento);

     published
      procedure getDados(AFormaPagamento: TFormaPagamento);

   end;

implementation

{ TFormaPagamentoController }

procedure TFormaPagamentoController.getDados(AFormaPagamento: TFormaPagamento);
var
  LFormaPagamentoDAO : TFormaPagamentoDAO;
begin
  LFormaPagamentoDAO := TFormaPagamentoDAO.Create;
  try
   try
      validar(AFormaPagamento);
      LFormaPagamentoDAO.getDados(AFormaPagamento);
   except
    on E: Exception do
     begin
       raise Exception.Create(e.Message);
     end;
   end;


  finally
    FreeAndNil(LFormaPagamentoDAO);
  end;
end;



procedure TFormaPagamentoController.validar(AFormaPagamento: TFormaPagamento);
begin
   try
     AFormaPagamento.CodForma := FormatFloat('000', StrToFloat(AFormaPagamento.CodForma));
   except
      raise Exception.Create('Código de forma de pagamento inválida!');
   end;

end;

end.
