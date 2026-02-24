UNIT uu_extrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, acbrecf, acbrecfclass,
  Dialogs, Mask,   StdCtrls, Buttons,  ExtCtrls,uu_modelo_vazio,
  Grids, DBGrids, DB,RxCurrEdit, RxMemDS, RxToolEdit;
type
  Tfrm_extrato = class(Tfrm_modelo_vazio)
    pnTotais: TPanel;
    Label10: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    ed_valor_bruto: TCurrencyEdit;
    ed_total_tx_serv: TCurrencyEdit;
    ed_total_conta: TCurrencyEdit;
    ed_total_desconto: TCurrencyEdit;
    Label11: TLabel;
    ed_total_pagamentos: TCurrencyEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Shape1: TShape;
    Label4: TLabel;
    Panel3: TPanel;
    bt_imprimir: TBitBtn;
    BitBtn1: TBitBtn;
    pn_fiscal: TPanel;
    gptxServ: TGroupBox;
    Label8: TLabel;
    cbk_taxa: TCheckBox;
    ed_valor_tx_serv: TEdit;
    GroupBox3: TGroupBox;
    ed_n_pessoas: Tedit;
    Panel4: TPanel;
    Label1: TLabel;
    lb_mesa: TLabel;
    pnDiversas: TPanel;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edNumeroMesa: TEdit;
    tbMesas: TRxMemoryData;
    tbMesasmesa: TStringField;
    dsMesas: TDataSource;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pnl_desconto: TPanel;
    ed_valor_desconto: TEdit;
    ckb_desconto: TCheckBox;
    procedure busca_movimento_da_mesa;
    procedure calcula_valores;
    procedure ed_valor_tx_servExit(Sender: TObject);
    procedure ed_valor_tx_servKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


    procedure IAeverButton2Click(Sender: TObject);
    procedure ed_valor_tx_servEnter(Sender: TObject);
    procedure ckb_couvertClick(Sender: TObject);
    procedure cbk_taxaClick(Sender: TObject);
    procedure ed_n_pessoasExit(Sender: TObject);
    function  imprimir_Extrato(marca : integer ; modelo : integer) : string;
    procedure bt_imprimirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure buscaDadosMesa();
    procedure AcaoImprimir();
    procedure ativaATela();
    procedure Edit1Exit(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure adicionarMesa();
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frm_extrato: Tfrm_extrato;
  valor_desconto: double;
  valor_tx_serv : double;
  total_couvert : double;
  total_descontos : double;

implementation



uses uu_data_module, uu_frm_principal,UU_DM_RELATORIOS, uuDesconto;

{$R *.dfm}

procedure Tfrm_extrato.busca_movimento_da_mesa;
var
 valor_bruto : double;
 valor_tx_serv : double;
begin
  valor_bruto:=0;
  valor_tx_serv:=0;
  total_couvert:=0;
  total_descontos:=0;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;


 /// Verificação de cobrança de taxa de serviço.
 if (verificaSeCobraServico = false ) then
  begin
    percentualTaxaServico:=0;
  end
 else
  begin
    // Verifica se o atual caixa aberto cobra taxa de serviço.
    if (verificaSeCaixaCobraServico(ultimoCaixaAberto) = false) then  // Se não cobrar, zera o valor do percentual
     begin
      percentualTaxaServico:=0
     end
    else
      begin
      // Se cobrar, verifica se a mesa em questão cobra taxa de servico

        If verificaSeCartaoCobraServico(lb_mesa.Caption) then
         begin
            percentualTaxaServico:= StrToFloat(dm.LeIni(2,'TAXA_SERVICO','percentual'));
         end
        else
         begin
           percentualTaxaServico:= 0;

         end;
      end;
  end;

  // Fim da verificação de cobrança de taxa de serviço.
////////////////////////////////////////////////////////




  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from rodapeextrato2('+Quotedstr(lb_mesa.caption)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
  dm.qryauxiliar.Active:=true;
  ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
  valor_tx_serv:= dm.qryauxiliar.fieldbyname('VALORTXSERV').Value;




  ed_valor_tx_serv.Text:=formatfloat('#0.00',valor_tx_serv);
  ed_total_tx_serv.Value:=valor_tx_serv;
  ed_total_pagamentos.Value:=dm.getTotalPagamentosParciais(lb_mesa.caption);
  ed_total_conta.Value:=valor_bruto+valor_tx_serv+total_couvert-ed_total_pagamentos.value;
end;




procedure Tfrm_extrato.buscaDadosMesa();
begin
  if( (dm.verificaSeAMesaFoiAberta(lb_mesa.Caption) = false) )  then
  begin
    dm.efetuaAberturaDaMesa(lb_mesa.Caption);
  end;

  ed_n_pessoas.Text := Inttostr(getQtdePessoasMesa(lb_mesa.Caption));
//  dm.logarOperacao('300','',lb_mesa.Caption);
  busca_movimento_da_mesa;

  calcula_valores;

end;


procedure Tfrm_extrato.calcula_valores;
begin
   valor_desconto:=0;
   valor_tx_serv:=0;

   valor_desconto:=StrToFloat(ed_valor_desconto.Text) ;


  if cbk_taxa.Checked= false then
   begin
     valor_tx_serv:=0;
     ed_total_tx_serv.value:=0;
   end
  else
   begin
    valor_tx_serv:=strtofloat(ed_valor_tx_serv.text);
    ed_total_tx_serv.Value:=valor_tx_serv;
   end;

           if (dm.getCodMesaBalcao() = trim(lb_mesa.Caption) )then
          begin
            ed_total_tx_serv.value:=0;
          end;


   if ckb_desconto.Checked= true then
         ed_total_desconto.Value:= (valor_desconto * (ed_valor_bruto.Value)    ) / 100
   else
         ed_total_desconto.value:=valor_desconto;

//   ed_total_desconto.value := 0;


   ed_total_conta.Value:=(ed_valor_bruto.value+ed_total_tx_serv.Value-ed_total_desconto.Value-ed_total_pagamentos.Value);
end;


procedure Tfrm_extrato.ed_valor_tx_servExit(Sender: TObject);
begin
     calcula_valores;

   if  sender is Tedit and ((sender as Tedit).Name='ed_valor_tx_serv') then
   begin
     try
       ed_valor_tx_serv.Text:=Formatfloat('#0.00',StrToFloat(ed_valor_tx_serv.Text));
     except
       begin
         ShowMessage('Valor de taxa de serviço inválido!');
         ed_valor_tx_serv.Text:='0,00';
         ed_valor_tx_serv.SetFocus;
         exit;
       end;
     end;
     calcula_valores;
   end;



end;

procedure Tfrm_extrato.ed_valor_tx_servKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key=vk_return
   then
     begin
       if  not ((sender is TMemo) ) then
       Perform(WM_NEXTDLGCTL,0,0)
     end;
   if key=vk_escape then
   begin
     Close;
   end;

   if (key = vk_f3) then
    begin
      bt_imprimir.Click;
    end;

end;






procedure Tfrm_extrato.AcaoImprimir();
var
result : string;
cooExtrato : string;
cerExtrato : string;
ecfExtrato : string;
RG : TACBrECFRelatorioGerencial;
tipoDesconto : smallint;
begin


  try
   ed_n_pessoas.text := inttostr(StrToInt(ed_n_pessoas.Text));
  except
   begin
     showmessage('Número de pessoas inválido!');
     ed_n_pessoas.Text := Inttostr(getQtdePessoasMesa(lb_mesa.Caption));
     ed_n_pessoas.SetFocus;
     exit;
   end;
  end;


  AtualizaQtdePessoasMesa(lb_mesa.Caption,ed_n_pessoas.text);

  cerExtrato :='';
  calcula_valores;
  imprimir_Extrato(marca_impressora_nao_fiscal_01,modelo_impressora_nao_fiscal_01);

  {
  if ( (usarAcbr = 1) and (localDeEmissaoDeExtrato=1) )then
   begin
     frm_principal.ECF.CarregaRelatoriosGerenciais;
     RG:= frm_principal.ecf.AchaRGIndice(FormatFloat('00',indiceRelatorioGerencialExtrato));
     cooExtrato := FormatFloat ('000000',StrToInt( frm_principal.ECF.NumCOO));
     cerExtrato := FormatFloat ('0000',RG.Contador  );
     ecfExtrato := FormatFloat('000',StrToFloat(frm_principal.ecf.NumECF));

   end;
   }

 dm.apagaExtratosEmitidos(lb_mesa.Caption);
 dm.insereExtratosEmitidos(lb_mesa.Caption, 1, ed_total_desconto.value, 0,ed_total_tx_serv.Value,cooExtrato,cerExtrato,ecfExtrato);


 close;
end;

procedure Tfrm_extrato.IAeverButton2Click(Sender: TObject);
begin
  close;
end;


procedure Tfrm_extrato.ed_valor_tx_servEnter(Sender: TObject);
begin
   if sender is TCheckBox then
   begin
     (sender as TCheckBox).Color:=cor_foco_edit;
   end;
end;

procedure Tfrm_extrato.ckb_couvertClick(Sender: TObject);
begin
  calcula_valores;
end;

procedure Tfrm_extrato.cbk_taxaClick(Sender: TObject);
begin
  calcula_valores;
end;

procedure Tfrm_extrato.ed_n_pessoasExit(Sender: TObject);
begin
  calcula_valores;
end;



function Tfrm_extrato.imprimir_Extrato(marca : integer; modelo : integer) : string;
var
 cooExtrato : string;
 codCliente : string;
 nomeCliente : string;
begin
     dm.ImprimePreContaMesa(lb_mesa.Caption,StrToInt(ed_n_pessoas.Text));
end;








procedure Tfrm_extrato.bt_imprimirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then close;

   if (key = vk_f3) then
    begin
      bt_imprimir.Click;
    end;
end;




procedure Tfrm_extrato.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure Tfrm_extrato.ativaATela();
begin
  if pn_fiscal.Visible  then
   begin
     buscaDadosMesa();
     pnDiversas.visible := false;
     pn_fiscal.Visible := true;
     pnTotais.Visible :=true;
     pnTotais.Top := 232;
     frm_extrato.Height := 405;
     pn_fiscal.Top := 26;
     pn_fiscal.left := 0;
     ed_n_pessoas.SetFocus;
     ed_n_pessoas.SelectAll;

   end
  else
   begin
     pnDiversas.visible :=true;
//     ed_valor_desconto.Text :='0,00';
     pn_fiscal.Visible := false;
     pnTotais.Visible :=false;
     pnDiversas.Top := 26;
     pnDiversas.left := 0;
     frm_extrato.Height := 260;
     edNumeroMesa.SetFocus;
   end;




end;

procedure Tfrm_extrato.Edit1Exit(Sender: TObject);
begin

  inherited;
   if  sender is Tedit and ((sender as Tedit).Name='edNumeroMesa') then
    begin
      if ( trim(edNumeroMesa.text) = '') then
       begin
         bt_imprimir.SetFocus;
         exit;
       end
      else
        begin
          try
           edNumeroMesa.Text := formatfloat('0000',StrToInt(edNumeroMesa.text));
          except
           begin
             showmessage('Número de mesa inválido!');
             edNumeroMesa.Clear;
             edNumeroMesa.SetFocus;
             exit;
           end;
          end;
          adicionarMesa();
        end;

   end;
end;

procedure Tfrm_extrato.adicionarMesa();
begin
      try
       edNumeroMesa.Text := formatfloat('0000',StrToInt(edNumeroMesa.text));
      except
       begin
         showmessage('Número de mesa inválido!');
         edNumeroMesa.Clear;
         edNumeroMesa.SetFocus;
         exit;
       end;
      end;

      if ( (dm.verificaSeMesaTemMovimento(edNumeroMesa.Text) = true) ) then
       begin
         tbMesas.Active :=true;
         tbMesas.Append;
         tbMesasmesa.Value := edNumeroMesa.Text;
         tbMesas.Post;
         edNumeroMesa.Clear;
         edNumeroMesa.SetFocus;
       end
      else
       begin
         showmessage('A mesa '+edNumeroMesa.Text+' não tem movimento');
         edNumeroMesa.Clear;
         edNumeroMesa.SetFocus;
         exit;
       end;


end;

procedure Tfrm_extrato.bt_imprimirClick(Sender: TObject);
begin

  bt_imprimir.Enabled := false;
  if pn_fiscal.Visible then
   begin
     AcaoImprimir();
   end
  else
   begin
//    if ( (ed_valor_desconto.Text = 'V0,00') or (ed_valor_desconto.Text = 'V') or (ed_valor_desconto.Text = 'v' ) or (ed_valor_desconto.Text = 'v0,00')) then
  //   ed_valor_desconto.Text := '0,00';

     tbMesas.First;
     while not tbMesas.Eof do
      begin
        lb_mesa.Caption := tbMesasmesa.Value;
        buscaDadosMesa();
        AcaoImprimir();
        tbMesas.Next;
      end;
   end;


end;

procedure Tfrm_extrato.FormActivate(Sender: TObject);
begin
  inherited;
  ativaATela();
end;

procedure Tfrm_extrato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( (Key = 86) or (Key = vk_f2) ) then
   begin
     ed_valor_desconto.Text :='0,00';
     ed_total_desconto.value:= 0;

     if pn_fiscal.Visible then
      begin
//       ed_valor_desconto.Text :='0,00';
       pn_fiscal.Visible :=false;
       ativaATela();
      end;
   end;


if (Shift = [ssCtrl]) and (Key = 68) then
  begin
   if (dm.verificaPermissaoAcao('B20002016') = true) then
     begin
      Application.CreateForm(TfrmDesconto,frmDesconto);
      frmDesconto.setOrigem(1);
      frmDesconto.ShowModal;
      frmDesconto.Free;
      calcula_valores();
     end
  END;


end;

procedure Tfrm_extrato.RadioButton2Click(Sender: TObject);
begin
  inherited;
  if RadioButton2.Checked then
   begin
     tbMesas.Active :=true;
     tbMesas.EmptyTable;
     tbMesas.Active :=false;
     tbMesas.Active :=true;
     dm_relatorios.qryConsumoAtualMesas.Active :=false;
     dm_relatorios.qryConsumoAtualMesas.Active :=true;
     dm_relatorios.qryConsumoAtualMesas.First;
     while not dm_relatorios.qryConsumoAtualMesas.eof do
      begin
        tbMesas.Append;
        tbMesasmesa.Value := dm_relatorios.qryConsumoAtualMesas.fieldbyname('mesa').value;
        tbMesas.Post;
        dm_relatorios.qryConsumoAtualMesas.Next;
      end;
     tbMesas.First;
   end;
   dm_relatorios.qryConsumoAtualMesas.Active :=false;
end;

procedure Tfrm_extrato.RadioButton1Click(Sender: TObject);
begin
  inherited;
  if RadioButton1.Checked then
   begin
     tbMesas.Active :=true;
     tbMesas.EmptyTable;
     tbMesas.Active :=false;
     tbMesas.Active :=true;
   end;

end;

procedure Tfrm_extrato.SpeedButton2Click(Sender: TObject);
var
x : integer;
valor : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is Tedit  ) and     ( (Components[x]as Tedit).Name='ed_n_pessoas' ) then
          begin

              try
               begin
                 valor := strToInt((Components[x] as Tedit).Text  );
                 valor:= valor +1;
               end;
              except
               valor := 1;
              end;

             (Components[x] as Tedit).Text :=  IntToStr(valor);
          end;
        x:= x+1;
      end;

end;

procedure Tfrm_extrato.SpeedButton3Click(Sender: TObject);
var
x : integer;
valor : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is Tedit  ) and     ( (Components[x]as Tedit).Name='ed_n_pessoas' ) then
          begin

              try
               begin
                 valor := strToInt((Components[x] as Tedit).Text  );
                 valor:= valor -1;

                 if (valor <= 0) then
                  valor:=1;



               end;
              except
               valor := 1;
              end;

             (Components[x] as Tedit).Text :=  IntToStr(valor);
          end;
        x:= x+1;
      end;

end;

end.
