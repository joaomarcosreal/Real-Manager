unit uuCadSaboresPizza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo,   StdCtrls, ExtCtrls, Buttons, Mask,
  DBCtrls;

type
  TfrmCadSaboresPizza = class(Tfrm_modelo_cadastro)
    pnCampos: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    RadioGroup2: TRadioGroup;
    Label12: TLabel;
    edDescSaborPizza: TDBEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btPesqCodPizzaBbro: TSpeedButton;
    btPesqCodPizzaBpeq: TSpeedButton;
    btPesqCodPizzaBmed: TSpeedButton;
    btPesqCodPizzaBgde: TSpeedButton;
    btPesqCodPizzaBfam: TSpeedButton;
    Label17: TLabel;
    Panel1: TPanel;
    edDescPizzaBbro: TDBEdit;
    edDescPizzaBpeq: TDBEdit;
    edDescPizzaBmed: TDBEdit;
    edDescPizzaBgde: TDBEdit;
    edDescPizzaBfam: TDBEdit;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    btPesqCodPizzaDbro: TSpeedButton;
    btPesqCodPizzaDpeq: TSpeedButton;
    btPesqCodPizzaDmed: TSpeedButton;
    btPesqCodPizzaDgde: TSpeedButton;
    btPesqCodPizzaDfam: TSpeedButton;
    Label18: TLabel;
    Label16: TLabel;
    Panel4: TPanel;
    edDescPizzaDbro: TDBEdit;
    edDescPizzaDpeq: TDBEdit;
    edDescPizzaDmed: TDBEdit;
    edDescPizzaDgde: TDBEdit;
    edDescPizzaDfam: TDBEdit;
    edCodPizzaBbro: TDBEdit;
    edPrecoPizzaBbro: TDBEdit;
    edCodPizzaBpeq: TDBEdit;
    edPrecoPizzaBpeq: TDBEdit;
    edCodPizzaBmed: TDBEdit;
    edPrecoPizzaBmed: TDBEdit;
    edCodPizzaBgde: TDBEdit;
    edPrecoPizzaBgde: TDBEdit;
    edCodPizzaBfam: TDBEdit;
    edPrecoPizzaBfam: TDBEdit;
    edCodPizzaDbro: TDBEdit;
    edPrecoPizzaDbro: TDBEdit;
    edCodPizzaDpeq: TDBEdit;
    edPrecoPizzaDpeq: TDBEdit;
    edCodPizzaDmed: TDBEdit;
    edPrecoPizzaDmed: TDBEdit;
    edCodPizzaDgde: TDBEdit;
    edPrecoPizzaDgde: TDBEdit;
    edCodPizzaDfam: TDBEdit;
    edPrecoPizzaDfam: TDBEdit;
    ckbReajustaPreco: TCheckBox;
    Panel5: TPanel;
    Label19: TLabel;
    procedure Edit1Exit(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure gravarInformacoes();
    procedure retornaInformacoes(codigo : string);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure botao_pesquisaClick(Sender: TObject);
    procedure copiaValoresTemporariamente();
    procedure retornaValoresTemporarios();
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbReajustaPrecoClick(Sender: TObject);
  private
    { Private declarations }

    xcodigoSabor : string;
    xDescricaoSabor : string;
    xReajustar : boolean;
    xedCodPizzaBbro,xedCodPizzaBpeq,xedCodPizzaBmed,xedCodPizzaBgde : string;
    xedCodPizzaBfam,xedCodPizzaDbro,xedCodPizzaDpeq,xedCodPizzaDmed : string;
    xedCodPizzaDgde,xedCodPizzaDfam : string;
    xedDescPizzaBbro,xedDescPizzaBpeq,xedDescPizzaBmed : string;
    xedDescPizzaBgde,xedDescPizzaBfam : string;
    xedDescPizzaDbro, xedDescPizzaDpeq,xedDescPizzaDmed : string;
    xedDescPizzaDgde, xedDescPizzaDfam : string;
    XedPrecoPizzaBbro,XedPrecoPizzaBpeq,XedPrecoPizzaBmed,XedPrecoPizzaBgde : double;
    XedPrecoPizzaBfam,XedPrecoPizzaDbro,XedPrecoPizzaDpeq,XedPrecoPizzaDmed : double;
    XedPrecoPizzaDgde,XedPrecoPizzaDfam : double;
  public
    { Public declarations }
  end;

var
  frmCadSaboresPizza: TfrmCadSaboresPizza;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal, uu_produtos;

{$R *.dfm}

procedure TfrmCadSaboresPizza.Edit1Exit(Sender: TObject);
begin
  inherited;
   if evento = 1 then
     begin
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoBroto') then
         begin
          dm.qrySaboresPizzaBBALCAO.Value := FormatFloat('00000',StrTOFloat(dm.qrySaboresPizzaBBALCAO.Value));
          dm.qrySaboresPizzaBDELIVERY.Value :=dm.qrySaboresPizzaBBALCAO.Value;
         end;

        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoPequena') then
         begin
          dm.qrySaboresPizzaPBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaPBALCAO.Value));
          dm.qrySaboresPizzaPDELIVERY.Value :=dm.qrySaboresPizzaPBALCAO.Value;
         end;


        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoMedia') then
         begin
          dm.qrySaboresPizzaMBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaMBALCAO.Value));
          dm.qrySaboresPizzaMDELIVERY.Value :=dm.qrySaboresPizzaMBALCAO.Value;
         end;

        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoGrande') then
         begin
          dm.qrySaboresPizzaGBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaGBALCAO.Value));
          dm.qrySaboresPizzaGDELIVERY.Value :=dm.qrySaboresPizzaGBALCAO.Value;
         end;

        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoFamilia') then
         begin
          dm.qrySaboresPizzaFBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaFBALCAO.Value));
          dm.qrySaboresPizzaFDELIVERY.Value :=dm.qrySaboresPizzaFBALCAO.Value;
         end;
     end
   else
     begin
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoBroto') then
          dm.qrySaboresPizzaBBALCAO.Value := FormatFloat('00000',StrTOFloat(dm.qrySaboresPizzaBBALCAO.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoPequena') then
          dm.qrySaboresPizzaPBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaPBALCAO.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoMedia') then
          dm.qrySaboresPizzaMBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaMBALCAO.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoGrande') then
          dm.qrySaboresPizzaGBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaGBALCAO.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edBalcaoFamilia') then
          dm.qrySaboresPizzaFBALCAO.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaFBALCAO.Value));

        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edDeliveryBroto') then
          dm.qrySaboresPizzaBDELIVERY.Value := FormatFloat('00000',StrTOFloat(dm.qrySaboresPizzaBDELIVERY.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edDeliveryPequena') then
          dm.qrySaboresPizzaPDELIVERY.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaPDELIVERY.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edDeliveryMedia') then
          dm.qrySaboresPizzaMDELIVERY.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaMDELIVERY.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edDeliveryGrande') then
          dm.qrySaboresPizzaGDELIVERY.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaGDELIVERY.Value));
        if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edDeliveryFamilia') then
          dm.qrySaboresPizzaFDELIVERY.Value := FormatFloat('00000',StrToFloat(dm.qrySaboresPizzaFDELIVERY.Value));



     end;


end;

procedure TfrmCadSaboresPizza.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_codigo.Enabled:=false;
  pnCampos.Enabled:=true;
  dm.qrySaboresPizza.Active:=true;
  dm.qrySaboresPizza.Append;
  ckbReajustaPreco.Checked := false;  
  edDescSaborPizza.SetFocus;
end;


procedure TfrmCadSaboresPizza.gravarInformacoes();
begin

   if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_SABORES_PIZZA',3);
     dm.qrySaboresPizza.FieldByName('codigo').Value := ed_codigo.Text;
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
     // ATUALIZA PREÇOS BALCAO
     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOBBALCAO.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaBBALCAO.Value));
     dm.qryauxiliar.ExecSQL;


     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOPBALCAO.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaPBALCAO.Value));
     dm.qryauxiliar.ExecSQL;


     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOMBALCAO.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaMBALCAO.Value));
     dm.qryauxiliar.ExecSQL;

     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOGBALCAO.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaGBALCAO.Value));
     dm.qryauxiliar.ExecSQL;

     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOFBALCAO.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaFBALCAO.Value));
     dm.qryauxiliar.ExecSQL;

     // ATUALIZA PREÇOS DELIVERY


     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOPDELIVERY.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaPDELIVERY.Value));
     dm.qryauxiliar.ExecSQL;


     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOMDELIVERY.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaMDELIVERY.Value));
     dm.qryauxiliar.ExecSQL;

     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOGDELIVERY.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaGDELIVERY.Value));
     dm.qryauxiliar.ExecSQL;

     dm.qryauxiliar.Active := false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.SQL.add('update produtos p set p.valor_unitario='+dm.TrocaVirgPPto(FloatToStr(dm.qrySaboresPizzaPRECOFDELIVERY.Value)));
     dm.qryauxiliar.SQL.Add(' where p.cod_produto='+Quotedstr(dm.qrySaboresPizzaFDELIVERY.Value));
     dm.qryauxiliar.ExecSQL;





     dm.qrySaboresPizza.Post;
     dm.dbrestaurante.ApplyUpdates([dm.qrySaboresPizza]);





   end

  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do sabor  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qrySaboresPizza.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qrySaboresPizza]);
         end;
    end;


end;


procedure TfrmCadSaboresPizza.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qrySaboresPizza.Active:=false;
  pnCampos.Enabled:=false;
  pn_codigo.Enabled:=false;
  bt_novo.SetFocus;
  ckbReajustaPreco.Checked := false;

end;

procedure TfrmCadSaboresPizza.bt_gravarClick(Sender: TObject);
var
 sabor  : string;
begin
  sabor := edDescSaborPizza.Text;
  gravarInformacoes;

 if ckbReajustaPreco.Checked then
   begin
    if MessageDlg('Tem certeza que deseja reaustar os preços da pizza de '+sabor ,mtConfirmation,[MbYes,mbNo],0) = Mryes then
     begin
        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.SQL.Clear;
        dm.qryauxiliar.SQL.add('execute procedure r_altera_preco_sabores_pizza('+Quotedstr(ed_codigo.text)+')');
        dm.qryauxiliar.ExecSQL;
        if dm.transacao.Active = false then
          dm.transacao.Active := true;
        dm.transacao.Commit;
     end;
   end;
     
  inherited;
  ckbReajustaPreco.Checked := false;
end;

procedure TfrmCadSaboresPizza.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;

      try
        ed_codigo.Text:=FormatFloat('000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de sabor inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;


      if ( verificaExistenciaSaborPizza(trim(ed_codigo.Text)) = true)
        then
           retornaInformacoes(ed_codigo.Text)
        else
          begin
            ShowMessage('Codigo de sabor inexistente!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;


    end;
end;

procedure TfrmCadSaboresPizza.bt_alterarClick(Sender: TObject);
begin
  inherited;
  pn_codigo.Enabled := true;
  ed_codigo.SetFocus;
  ckbReajustaPreco.Checked := false;  
end;

procedure TfrmCadSaboresPizza.bt_excluirClick(Sender: TObject);
begin
  inherited;

  pn_codigo.Enabled := true;
  ed_codigo.SetFocus;

end;


procedure TfrmCadSaboresPizza.retornaInformacoes(codigo : string);
begin
 dm.qrySaboresPizza.Active:=false;
 dm.qrySaboresPizza.SQL.Clear;

 dm.qrySaboresPizza.SQL.Add('select s.*, ');
 dm.qrySaboresPizza.SQL.Add('       p1.descricao as DESCBBALCAO, p2.descricao  as DESCBDELIVERY,');
 dm.qrySaboresPizza.SQL.Add('       p3.descricao as DESCPBALCAO, p4.descricao  as DESCPDELIVERY,');
 dm.qrySaboresPizza.SQL.Add('       p5.descricao as DESCMBALCAO, p6.descricao  as DESCMDELIVERY,');
 dm.qrySaboresPizza.SQL.Add('       p7.descricao as DESCGBALCAO, p8.descricao  as DESCGDELIVERY,');
 dm.qrySaboresPizza.SQL.Add('       p9.descricao as DESCFBALCAO, p10.descricao as DESCFDELIVERY');
 dm.qrySaboresPizza.SQL.Add('        from sabores_pizza s');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p1 on (p1.cod_produto = s.Bbalcao)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p2 on (p2.cod_produto = s.Bdelivery)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p3 on (p3.cod_produto = s.Pbalcao)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p4 on (p4.cod_produto = s.Pdelivery)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p5 on (p5.cod_produto = s.Mbalcao)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p6 on (p6.cod_produto = s.Mdelivery)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p7 on (p7.cod_produto = s.Gbalcao)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p8 on (p8.cod_produto = s.Gdelivery)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p9 on (p9.cod_produto = s.Fbalcao)');
 dm.qrySaboresPizza.SQL.Add('       left join produtos p10 on (p10.cod_produto = s.Fdelivery)');
 dm.qrySaboresPizza.SQL.Add('    where s.codigo='+Quotedstr(codigo));
 dm.qrySaboresPizza.Active:=true;

 if (evento = 2)then
  begin
   pnCampos.Enabled:=true;
   dm.qrySaboresPizza.Edit;
   edDescSaborPizza .SetFocus;
  end;

 if ((evento=2) or (evento = 3)) then
  begin
    bt_gravar.Enabled:=true;
  end;
end;


procedure TfrmCadSaboresPizza.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaSaborPizza();
  ed_codigo.Text := string_auxiliar;
  if verificaExistenciaSaborPizza(ed_codigo.text) then
   begin
     retornaInformacoes(ed_codigo.Text);
   end;

end;

procedure TfrmCadSaboresPizza.botao_pesquisaClick(Sender: TObject);
var
i : integer;
 nome : string;
begin
  inherited;

  nome:= trim(copy((sender as TSpeedButton).Name,7,15));

    For  i:=0 to ComponentCount-1 do
    begin
      if  components[i] is TCustomEdit and ((components[i] as TCustomEdit).Name='ed'+nome ) then
       (components[i] as TCustomEdit).SetFocus;

    end;
end;


procedure TfrmCadSaboresPizza.copiaValoresTemporariamente();
begin


  if dm.QrySaboresPizza.fieldbyname('codigo').value <> null then
  xcodigoSabor   := dm.QrySaboresPizza.fieldbyname('codigo').value;
 if dm.QrySaboresPizza.fieldbyname('descricao').value <> null then
  xDescricaoSabor:= dm.QrySaboresPizza.fieldbyname('descricao').value;

  xReajustar     := ckbReajustaPreco.Checked;
if dm.QrySaboresPizza.fieldbyname('BBALCAO').value <> null then
  xedCodPizzaBbro:= dm.QrySaboresPizza.fieldbyname('BBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('PBALCAO').value <> null then
  xedCodPizzaBpeq:= dm.QrySaboresPizza.fieldbyname('PBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('MBALCAO').value <> null then
  xedCodPizzaBmed:= dm.QrySaboresPizza.fieldbyname('MBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('GBALCAO').value <> null then
  xedCodPizzaBgde:= dm.QrySaboresPizza.fieldbyname('GBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('FBALCAO').value <> null then
  xedCodPizzaBfam:= dm.QrySaboresPizza.fieldbyname('FBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('BDELIVERY').value <> null then
  xedCodPizzaDbro:= dm.QrySaboresPizza.fieldbyname('BDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('PDELIVERY').value <> null then
  xedCodPizzaDpeq:= dm.QrySaboresPizza.fieldbyname('PDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('MDELIVERY').value <> null then
  xedCodPizzaDmed:= dm.QrySaboresPizza.fieldbyname('MDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('GDELIVERY').value <> null then
  xedCodPizzaDgde:= dm.QrySaboresPizza.fieldbyname('GDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('FDELIVERY').value <> null then
  xedCodPizzaDfam:= dm.QrySaboresPizza.fieldbyname('FDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('PRECOBBALCAO').value <> null then
  XedPrecoPizzaBbro:= dm.QrySaboresPizza.fieldbyname('PRECOBBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('PRECOMBALCAO').value <> null then
  XedPrecoPizzaBpeq:= dm.QrySaboresPizza.fieldbyname('PRECOMBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('PRECOGBALCAO').value <> null then
  XedPrecoPizzaBmed:= dm.QrySaboresPizza.fieldbyname('PRECOGBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('PRECOFBALCAO').value <> null then
  XedPrecoPizzaBgde:= dm.QrySaboresPizza.fieldbyname('PRECOFBALCAO').value;
if dm.QrySaboresPizza.fieldbyname('PRECOBDELIVERY').value <> null then
  XedPrecoPizzaBfam:= dm.QrySaboresPizza.fieldbyname('PRECOBDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('PRECOBDELIVERY').value <> null then
  XedPrecoPizzaDbro:= dm.QrySaboresPizza.fieldbyname('PRECOBDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('PRECOPDELIVERY').value <> null then
  XedPrecoPizzaDpeq:= dm.QrySaboresPizza.fieldbyname('PRECOPDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('PRECOMDELIVERY').value <> null then
  XedPrecoPizzaDmed:= dm.QrySaboresPizza.fieldbyname('PRECOMDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('PRECOGDELIVERY').value <> null then
  XedPrecoPizzaDgde:= dm.QrySaboresPizza.fieldbyname('PRECOGDELIVERY').value;
if dm.QrySaboresPizza.fieldbyname('PRECOFDELIVERY').value <> null then
  XedPrecoPizzaDfam:= dm.QrySaboresPizza.fieldbyname('PRECOFDELIVERY').value;

  xedDescPizzaBbro := edDescPizzaBbro.text;
  xedDescPizzaBpeq := edDescPizzaBpeq.text;
  xedDescPizzaBmed := edDescPizzaBmed.text;
  xedDescPizzaBgde := edDescPizzaBgde.text;
  xedDescPizzaBfam := edDescPizzaBfam.text;

  xedDescPizzaDbro := edDescPizzaDbro.text;
  xedDescPizzaDpeq := edDescPizzaDpeq.text;
  xedDescPizzaDmed := edDescPizzaDmed.text;
  xedDescPizzaDgde := edDescPizzaDgde.text;
  xedDescPizzaDfam := edDescPizzaDfam.text;




end;


procedure TfrmCadSaboresPizza.retornaValoresTemporarios();
begin
 dm.QrySaboresPizza.fieldbyname('codigo').value     :=  xcodigoSabor;
 ed_codigo.Text := xcodigoSabor; 
 dm.QrySaboresPizza.fieldbyname('descricao').value  :=  xDescricaoSabor;
 ckbReajustaPreco.Checked := xReajustar;
 dm.QrySaboresPizza.fieldbyname('BBALCAO').value:=xedCodPizzaBbro;
 dm.QrySaboresPizza.fieldbyname('PBALCAO').value:=xedCodPizzaBpeq;
 dm.QrySaboresPizza.fieldbyname('MBALCAO').value:=xedCodPizzaBmed;
 dm.QrySaboresPizza.fieldbyname('GBALCAO').value:=xedCodPizzaBgde;
 dm.QrySaboresPizza.fieldbyname('FBALCAO').value:=xedCodPizzaBfam;
 dm.QrySaboresPizza.fieldbyname('BDELIVERY').value:=xedCodPizzaDbro;
 dm.QrySaboresPizza.fieldbyname('PDELIVERY').value:=xedCodPizzaDpeq;
 dm.QrySaboresPizza.fieldbyname('MDELIVERY').value:=xedCodPizzaDmed;
 dm.QrySaboresPizza.fieldbyname('GDELIVERY').value:=xedCodPizzaDgde;
 dm.QrySaboresPizza.fieldbyname('FDELIVERY').value:=xedCodPizzaDfam;
 dm.QrySaboresPizza.fieldbyname('PRECOBBALCAO').value:=XedPrecoPizzaBbro;
 dm.QrySaboresPizza.fieldbyname('PRECOMBALCAO').value:=XedPrecoPizzaBpeq;
 dm.QrySaboresPizza.fieldbyname('PRECOGBALCAO').value:=XedPrecoPizzaBmed;
 dm.QrySaboresPizza.fieldbyname('PRECOFBALCAO').value:=XedPrecoPizzaBgde;
 dm.QrySaboresPizza.fieldbyname('PRECOBDELIVERY').value:=XedPrecoPizzaBfam;
 dm.QrySaboresPizza.fieldbyname('PRECOBDELIVERY').value:=XedPrecoPizzaDbro;
 dm.QrySaboresPizza.fieldbyname('PRECOPDELIVERY').value:=XedPrecoPizzaDpeq;
 dm.QrySaboresPizza.fieldbyname('PRECOMDELIVERY').value:=XedPrecoPizzaDmed;
 dm.QrySaboresPizza.fieldbyname('PRECOGDELIVERY').value:=XedPrecoPizzaDgde;
 dm.QrySaboresPizza.fieldbyname('PRECOFDELIVERY').value:=XedPrecoPizzaDfam;
 edDescPizzaBbro.text := xedDescPizzaBbro;
 edDescPizzaBpeq.text := xedDescPizzaBpeq;
 edDescPizzaBmed.text := xedDescPizzaBmed;
 edDescPizzaBgde.text := xedDescPizzaBgde;
 edDescPizzaBfam.text := xedDescPizzaBfam;

 edDescPizzaDbro.text := xedDescPizzaDbro;
 edDescPizzaDpeq.text := xedDescPizzaDpeq;
 edDescPizzaDmed.text := xedDescPizzaDmed;
 edDescPizzaDgde.text := xedDescPizzaDgde;
 edDescPizzaDfam.text := xedDescPizzaDfam;


end;


procedure TfrmCadSaboresPizza.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  eventoTemp : integer;
  modulovenda, tamanhoPizza : string;
begin
  inherited;
  if key = VK_F11 then
   begin

    if  (sender is TCustomEdit ) and (    trim(copy((sender as TCustomEdit).Name,0,10)) = 'edCodPizza')     then
      begin
        moduloVenda := copy((sender as TCustomEdit).Name,11,1);
        tamanhoPizza := copy((sender as TCustomEdit).Name,12,3);

        eventoTemp := evento;
        copiaValoresTemporariamente;
        dm.qrySaboresPizza.Cancel;
        bt_cancelar.Click;
        dm.transacao.Active:=false;
        dm.transacao.Active:=true;
        Application.CreateForm(Tfrm_produtos, frm_produtos);
        frm_produtos.ShowModal;
        frm_produtos.free;
        dm.transacao.Active:=false;
        dm.transacao.Active:=true;

        if (eventoTemp = 1) then
         begin
           bt_novo.Click;
           retornaValoresTemporarios;
         end
        else
         begin
           bt_alterar.Click;
           retornaInformacoes(xcodigoSabor);
           retornaValoresTemporarios;
         end;
        (sender as TCustomEdit).Text := string_auxiliar;

         if ( trim(string_auxiliar) <> '' ) then
          begin
            exibeInformacoesProdutoPizza(string_auxiliar,tamanhoPizza,modulovenda); 
          end;

        (sender as TCustomEdit).SetFocus;
      end;

   end;

end;

procedure TfrmCadSaboresPizza.ckbReajustaPrecoClick(Sender: TObject);
begin
  inherited;
 if ckbReajustaPreco.Checked then
   begin
     if MessageDlg('Esta operação propagará alteração nos preços dos produtos referenciados nos campos abaixo.'+#13#10+' Deseja mesmo fazer isso ?',mtConfirmation,[MbYes,mbNo],0) = Mryes then
       begin
         ckbReajustaPreco.Color := clRed;
       end
     else
      begin
        ckbReajustaPreco.Checked := false;
        ckbReajustaPreco.Color := clBtnFace;
      end;
   end
 else
  begin
   ckbReajustaPreco.Color := clBtnFace;
  end;
end;

end.
