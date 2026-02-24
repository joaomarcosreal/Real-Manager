unit uuSelecaoSaboresPizza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, 
  AdvTouchKeyboard, ComCtrls, JvExStdCtrls, JvButton, JvCtrls,
  JvExComCtrls, JvComCtrls, Vcl.ActnList, System.Actions, IBX.IBScript;

type
  TfrmSelecaoSaboresPizza = class(Tfrm_modelo_vazio)
    BitBtn3: TBitBtn;
    pnTeclado: TPanel;
    btFecharTeclado: TSpeedButton;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    pgProdutos: TJvPageControl;
    Panel2: TPanel;
    btOb1: TJvImgBtn;
    btOb2: TJvImgBtn;
    btOb3: TJvImgBtn;
    btOb4: TJvImgBtn;
    Label3: TLabel;
    rdTipoMassa: TRadioGroup;
    SpeedButton38: TSpeedButton;
    SpeedButton37: TSpeedButton;
    BitBtn1: TBitBtn;
    memo_obs: TMemo;
    TabSheet1: TTabSheet;
    JvImgBtn1: TJvImgBtn;
    JvImgBtn6: TJvImgBtn;
    JvImgBtn11: TJvImgBtn;
    JvImgBtn16: TJvImgBtn;
    JvImgBtn21: TJvImgBtn;
    JvImgBtn26: TJvImgBtn;
    JvImgBtn31: TJvImgBtn;
    JvImgBtn36: TJvImgBtn;
    JvImgBtn59: TJvImgBtn;
    JvImgBtn2: TJvImgBtn;
    JvImgBtn7: TJvImgBtn;
    JvImgBtn12: TJvImgBtn;
    JvImgBtn17: TJvImgBtn;
    JvImgBtn22: TJvImgBtn;
    JvImgBtn27: TJvImgBtn;
    JvImgBtn32: TJvImgBtn;
    JvImgBtn55: TJvImgBtn;
    JvImgBtn60: TJvImgBtn;
    JvImgBtn3: TJvImgBtn;
    JvImgBtn8: TJvImgBtn;
    JvImgBtn13: TJvImgBtn;
    JvImgBtn18: TJvImgBtn;
    JvImgBtn23: TJvImgBtn;
    JvImgBtn28: TJvImgBtn;
    JvImgBtn33: TJvImgBtn;
    JvImgBtn56: TJvImgBtn;
    JvImgBtn61: TJvImgBtn;
    JvImgBtn4: TJvImgBtn;
    JvImgBtn9: TJvImgBtn;
    JvImgBtn14: TJvImgBtn;
    JvImgBtn19: TJvImgBtn;
    JvImgBtn24: TJvImgBtn;
    JvImgBtn29: TJvImgBtn;
    JvImgBtn34: TJvImgBtn;
    JvImgBtn57: TJvImgBtn;
    JvImgBtn62: TJvImgBtn;
    JvImgBtn5: TJvImgBtn;
    JvImgBtn10: TJvImgBtn;
    JvImgBtn15: TJvImgBtn;
    JvImgBtn20: TJvImgBtn;
    JvImgBtn25: TJvImgBtn;
    JvImgBtn30: TJvImgBtn;
    JvImgBtn35: TJvImgBtn;
    JvImgBtn58: TJvImgBtn;
    JvImgBtn63: TJvImgBtn;
    TabSheet2: TTabSheet;
    JvImgBtn37: TJvImgBtn;
    JvImgBtn38: TJvImgBtn;
    JvImgBtn39: TJvImgBtn;
    JvImgBtn40: TJvImgBtn;
    JvImgBtn41: TJvImgBtn;
    JvImgBtn42: TJvImgBtn;
    JvImgBtn43: TJvImgBtn;
    JvImgBtn44: TJvImgBtn;
    JvImgBtn45: TJvImgBtn;
    JvImgBtn46: TJvImgBtn;
    JvImgBtn47: TJvImgBtn;
    JvImgBtn48: TJvImgBtn;
    JvImgBtn49: TJvImgBtn;
    JvImgBtn50: TJvImgBtn;
    JvImgBtn51: TJvImgBtn;
    JvImgBtn52: TJvImgBtn;
    JvImgBtn53: TJvImgBtn;
    JvImgBtn54: TJvImgBtn;
    JvImgBtn64: TJvImgBtn;
    JvImgBtn65: TJvImgBtn;
    JvImgBtn66: TJvImgBtn;
    JvImgBtn67: TJvImgBtn;
    JvImgBtn68: TJvImgBtn;
    JvImgBtn69: TJvImgBtn;
    JvImgBtn70: TJvImgBtn;
    JvImgBtn71: TJvImgBtn;
    JvImgBtn72: TJvImgBtn;
    JvImgBtn73: TJvImgBtn;
    JvImgBtn74: TJvImgBtn;
    JvImgBtn75: TJvImgBtn;
    JvImgBtn76: TJvImgBtn;
    JvImgBtn77: TJvImgBtn;
    JvImgBtn78: TJvImgBtn;
    JvImgBtn79: TJvImgBtn;
    JvImgBtn80: TJvImgBtn;
    JvImgBtn81: TJvImgBtn;
    JvImgBtn82: TJvImgBtn;
    JvImgBtn83: TJvImgBtn;
    JvImgBtn84: TJvImgBtn;
    JvImgBtn85: TJvImgBtn;
    JvImgBtn86: TJvImgBtn;
    JvImgBtn87: TJvImgBtn;
    JvImgBtn88: TJvImgBtn;
    JvImgBtn89: TJvImgBtn;
    JvImgBtn90: TJvImgBtn;
    TabSheet3: TTabSheet;
    JvImgBtn91: TJvImgBtn;
    JvImgBtn92: TJvImgBtn;
    JvImgBtn93: TJvImgBtn;
    JvImgBtn94: TJvImgBtn;
    JvImgBtn95: TJvImgBtn;
    JvImgBtn96: TJvImgBtn;
    JvImgBtn97: TJvImgBtn;
    JvImgBtn98: TJvImgBtn;
    JvImgBtn99: TJvImgBtn;
    JvImgBtn100: TJvImgBtn;
    JvImgBtn101: TJvImgBtn;
    JvImgBtn102: TJvImgBtn;
    JvImgBtn103: TJvImgBtn;
    JvImgBtn104: TJvImgBtn;
    JvImgBtn105: TJvImgBtn;
    JvImgBtn106: TJvImgBtn;
    JvImgBtn107: TJvImgBtn;
    JvImgBtn108: TJvImgBtn;
    JvImgBtn109: TJvImgBtn;
    JvImgBtn110: TJvImgBtn;
    JvImgBtn111: TJvImgBtn;
    JvImgBtn112: TJvImgBtn;
    JvImgBtn113: TJvImgBtn;
    JvImgBtn114: TJvImgBtn;
    JvImgBtn115: TJvImgBtn;
    JvImgBtn116: TJvImgBtn;
    JvImgBtn117: TJvImgBtn;
    JvImgBtn118: TJvImgBtn;
    JvImgBtn119: TJvImgBtn;
    JvImgBtn120: TJvImgBtn;
    JvImgBtn121: TJvImgBtn;
    JvImgBtn122: TJvImgBtn;
    JvImgBtn123: TJvImgBtn;
    JvImgBtn124: TJvImgBtn;
    JvImgBtn125: TJvImgBtn;
    JvImgBtn126: TJvImgBtn;
    JvImgBtn127: TJvImgBtn;
    JvImgBtn128: TJvImgBtn;
    JvImgBtn129: TJvImgBtn;
    JvImgBtn130: TJvImgBtn;
    JvImgBtn131: TJvImgBtn;
    JvImgBtn132: TJvImgBtn;
    JvImgBtn133: TJvImgBtn;
    JvImgBtn134: TJvImgBtn;
    JvImgBtn135: TJvImgBtn;
    BitBtn2: TBitBtn;
//    procedure criarSabores;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure memo_obsDblClick(Sender: TObject);
    procedure btFecharTecladoClick(Sender: TObject);
    procedure btTecladoVirtualClick(Sender: TObject);
    procedure criaSabores();
    procedure selecionarSabor(Sender: TObject);
    procedure btOb1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
    paginaAtual : integer;
    podeFechar : boolean;
  public
    { Public declarations }
  end;

var
  frmSelecaoSaboresPizza: TfrmSelecaoSaboresPizza;
  tecladoAberto : boolean;

implementation

uses uu_data_module, uu_obs_lancamento_caixa,
  uu_frm_principal, uuSelecaoTamanhoPizza;

{$R *.dfm}


{procedure TfrmSelecaoSaboresPizza.criarSabores();
var
 q : TIBquery;
 ckb : TCheckBox;
 top_c, left_c : integer;
 qtBt : integer;
 cor : TColor;
 letraAnterior : string;
 Label2: TLabel;

begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.Active:=false;
 q.sql.clear;
 q.sql.add('select codigo,descricao from  sabores_pizza  order by descricao');
 q.Active:=true;
 top_c:=1;
 left_c:=2;
 qtBt:=0;
 ScrollBox1.Repaint;
 cor := clBlack;

 letraAnterior :=Copy(q.fieldbyname('descricao').value,0,1);

 while not q.Eof do
 begin

    if (Copy(q.fieldbyname('descricao').value,0,1) <> letraAnterior) then
     begin
       letraAnterior :=Copy(q.fieldbyname('descricao').value,0,1);
       top_c:= top_c +20;
       ScrollBox1.Repaint;
       Self.Repaint;

     end;


    ckb := TCheckBox.Create(Self);
    CKB.Parent := ScrollBox1;
    ckb.Name:=  'ckb'+q.fieldbyname('codigo').value;
    CKB.Left := left_c;
    CKB.Top := top_c;
    ckb.OnEnter:= Edit1.OnEnter;
    ckb.OnExit:= Edit1.OnExit;

    ckb.OnClick := ckb0.OnClick;
    Font.Charset := DEFAULT_CHARSET;

    Font.Height := -25;
    Font.Name := 'MS Sans Serif';
    Font.Style := [];
    ParentFont := False;
    ParentColor := False;


    CKB.Width := 230;
    CKB.Height := 18;
    ckb.Caption:= q.fieldbyname('descricao').value;


     Self.Repaint;

    if (top_c >= 200) then
     begin
      top_c:=1;
      left_c:=left_c+ 230;
     end
    else
     begin
      top_c:=top_c+25;
     end;
    qtBt:=qtBt+1;
    q.Next;
 end;
 q.Active:=false;


 q.Active:=false;
 q.SQL.clear;
 q.SQL.Add('select * from tipos_massa_pizza order by codigo');
 q.Active:=true;

 rdTipoMassa.Items.Clear;

 while not q.eof do
  begin
    rdTipoMassa.Items.Add(q.fieldbyname('descricao').value);
    q.Next;
  end;
  rdTipoMassa.ItemIndex:=0;


 q.Active:=false;


 FreeAndNil(q);
end;

}


procedure TfrmSelecaoSaboresPizza.FormActivate(Sender: TObject);
begin
  inherited;
  podeFechar := false;
  btFecharTeclado.Caption :='Fechar '+#10+'o'+#10+'Teclado'+#10+' virtual';
  frm_principal.obsSaborPizza :='';
  frm_principal.obsSaborPizza:='';
  frm_principal.obsLancamento:='';
  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;
  dm.tbSaboresPizzaTemp.Active:=true;
  dm.qryCsSaboresPizza.Active := false;
  dm.qryCsSaboresPizza.SQL.Clear;
  dm.qryCsSaboresPizza.SQL.add('select codigo,descricao from sabores_pizza order by descricao');
  dm.qryCsSaboresPizza.Active:=true;

  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add('select * from tipos_massa_pizza order by codigo');
  dm.qryauxiliar.Active:=true;

 rdTipoMassa.Items.Clear;

 while not  dm.qryauxiliar.eof do
  begin
    rdTipoMassa.Items.Add( dm.qryauxiliar.fieldbyname('descricao').value);
     dm.qryauxiliar.Next;
  end;
  rdTipoMassa.ItemIndex:=0;
  dm.qryauxiliar.Active:=false;
  

 criaSabores();



end;

procedure TfrmSelecaoSaboresPizza.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Cancelar lançamento?',mtInformation,[mbYes,mbNo],0) = mrYes then
   begin
     podeFechar := true;
     frm_principal.tipoMassaPizza := 'CANCELAR';
     close;
   end;
end;

procedure TfrmSelecaoSaboresPizza.BitBtn3Click(Sender: TObject);
var
 ct : integer;
 somaProporcoes : double;
begin
  inherited;

  if (dm.verificaSomaProporcoesPizza() = false ) then
   begin
      dm.exibe_painel_erro('SOMA DAS PROPOÇÕES DE SABORES É INVÁLIDA. A SOMA DEVE SER IGUAL A 1. EX: (1/4 SABOR X + 1/4 SABOR Y + 1/2 Y = 1','Fechar esta Janela');
   end
  else
   begin
    frm_principal.obsSaborPizza := '';
    frm_principal.tipoMassaPizza := rdTipoMassa.Items[rdTipoMassa.ItemIndex];

    for ct:= 0 to memo_obs.Lines.Count  do
     begin
       frm_principal.obsSaborPizza := upperCase(frm_principal.obsSaborPizza+memo_obs.lines[ct]);
     end;
     podeFechar := True;
    Close;
   end;

end;

procedure TfrmSelecaoSaboresPizza.BitBtn1Click(Sender: TObject);
begin
  inherited;
  memo_obs.Clear;
  frm_principal.obsSaborPizza:='';
  Application.CreateForm(Tfrm_obs_lancamento_caixa,frm_obs_lancamento_caixa);
  frm_obs_lancamento_caixa.showmodal;
  frm_obs_lancamento_caixa.free;

  memo_obs.Lines.Add(' '+frm_principal.obsSaborPizza);

end;

procedure TfrmSelecaoSaboresPizza.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

if odd(dm.qryCsSaboresPizza.RecNo) then
//DBGrid2.Canvas.Brush.Color:= clMoneyGreen
else
//0101
//01DBGrid2.Canvas.Brush.Color:= clwhite;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte


if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clred; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure TfrmSelecaoSaboresPizza.SpeedButton1Click(Sender: TObject);
var
str : string;
begin
  inherited;
  if  sender is TSpeedButton  then
   begin
      str:= ((sender as TSpeedButton ).Caption);
   end;
  dm.qryCsSaboresPizza.Active := false;
  dm.qryCsSaboresPizza.SQL.Clear;
  dm.qryCsSaboresPizza.SQL.add('select codigo,descricao from sabores_pizza where descricao like '+Quotedstr(str+'%'));
  dm.qryCsSaboresPizza.SQL.add(' order by descricao');
  dm.qryCsSaboresPizza.Active:=true;

  

end;

procedure TfrmSelecaoSaboresPizza.selecionarSabor(Sender: TObject);
var
 x: Integer;
 nome : string;
 achou : Boolean;
 proporcao : string;
begin
  inherited;

  {
  Application.CreateForm(TfrmSelecaoTamanhoPizza,frmSelecaoTamanhoPizza);
  frmSelecaoTamanhoPizza.showmodal;
  frmSelecaoTamanhoPizza.free;
   }

  x := 0;
  achou := false;

  if not dm.tbSaboresPizzaTemp.Locate('codigo',copy(((sender as TJvImgBtn).name),5,3) ,[]) then
   begin
        dm.tbSaboresPizzaTemp.Append;
        dm.tbSaboresPizzaTempcodigo.Value:= copy(((sender as TJvImgBtn).name),6,3);
        nome := (sender as TJvImgBtn).name;
        dm.tbSaboresPizzaTempdescricao.Value:=  (sender as TJvImgBtn).Caption;

        Application.CreateForm(TfrmSelecaoTamanhoPizza, frmSelecaoTamanhoPizza);
        frmSelecaoTamanhoPizza.ShowModal;
        frmSelecaoTamanhoPizza.Free;
        proporcao :=  dm.tbSaboresPizzaTemptamanho.Value;

        dm.tbSaboresPizzaTemp.Post;

         while ( (x < ComponentCount-1) and (achou= False)  ) do
         begin
          if  Components[x].ClassName='TJvImgBtn' then
           begin
             if  (Trim(copy( (components[x] as TJvImgBtn).Name ,0,4))  = 'btOb') then
              begin
               if ( (components[x] as TJvImgBtn).Visible  = False) then
                begin
                 (components[x] as TJvImgBtn).Caption := proporcao +' '+ ((sender as TJvImgBtn).Caption);
                 (components[x] as TJvImgBtn).Visible := True;
                 achou := true;
                end;
              end;
           end;
          x:= x + 1;
         end;
   end;


end;

procedure TfrmSelecaoSaboresPizza.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Apagar sabor ?',mtInformation,[mbYes,mbNo],0) = mrYes then
    dm.tbSaboresPizzaTemp.Delete;

end;

procedure TfrmSelecaoSaboresPizza.SpeedButton37Click(Sender: TObject);
begin
  inherited;
  if  pgProdutos.ActivePageIndex > 0 then
  pgProdutos.ActivePageIndex :=   pgProdutos.ActivePageIndex -1;

end;


procedure TfrmSelecaoSaboresPizza.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  if pgProdutos.ActivePageIndex <  paginaAtual  -1  then
     pgProdutos.ActivePageIndex :=   pgProdutos.ActivePageIndex + 1;

end;

procedure TfrmSelecaoSaboresPizza.memo_obsDblClick(Sender: TObject);
begin
  inherited;
  if not tecladoAberto then
   begin
    pnTeclado.Top := 157;
    pnTeclado.Left := 24;
    pnTeclado.Visible := true;
    tecladoAberto :=true;
   end
  else
   begin
    pnTeclado.Visible := false;
    tecladoAberto := false;
   end;
end;

procedure TfrmSelecaoSaboresPizza.btFecharTecladoClick(Sender: TObject);
begin
  inherited;
  pnTeclado.Visible :=false;
  tecladoAberto:=false;
end;

procedure TfrmSelecaoSaboresPizza.btTecladoVirtualClick(Sender: TObject);
begin
  inherited;
  memo_obs.SetFocus;
  if not tecladoAberto then
   begin
    pnTeclado.Top := 110;
    pnTeclado.Left := 24;
    pnTeclado.Visible := true;
    tecladoAberto :=true;
   end
  else
   begin
    pnTeclado.Visible := false;
    tecladoAberto := false;
   end;

end;








procedure TfrmSelecaoSaboresPizza.criaSabores();
var
 x : integer;
 ct : integer;
 pagina : TComponent;
 letraAnterior : string;
 letraAtual :string;
 cor,corFonte : Tcolor;

begin
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add(' select * from sabores_pizza order by descricao');
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.FetchAll;
  x:=0;
  ct:=0;
  paginaAtual := 1;
  cor :=$00919E41;
  corFonte := clBlack;

   while ( (x < ComponentCount-1) and (dm.qryauxiliar.Eof = false) ) do
   begin
    if  Components[x].ClassName='TJvImgBtn' then
     begin

       case  paginaAtual of
         1: pagina := TabSheet1;
         2: pagina := TabSheet2;
         3: pagina := TabSheet3;
       end;
       letraAtual := copy(dm.qryauxiliar.fieldbyname('descricao').Value,0,1);
       letraAnterior := letraAnterior;
       if  Components[x].ClassName='TJvImgBtn' then
        begin
          if (Components[x].GetParentComponent = pagina ) then
           begin

            (components[x] as TJvImgBtn).Name := 'sabor'+dm.qryauxiliar.fieldbyname('codigo').Value;
            (components[x] as TJvImgBtn).Caption := dm.qryauxiliar.fieldbyname('descricao').Value;
            (components[x] as TJvImgBtn).Visible := true;
            (components[x] as TJvImgBtn).Color := cor;
            (components[x] as TJvImgBtn).Font.Color := corFonte;
            letraAnterior := letraAtual;

            dm.qryauxiliar.Next;
            letraAtual := copy(dm.qryauxiliar.fieldbyname('descricao').Value,0,1);

            if (letraAtual <> letraAnterior) then
             begin
               if  ( (components[x] as TJvImgBtn).Color = $00919E41 ) then
                begin
                  cor :=      $00CF704B;
                  corFonte:= clWhite;
                end
               else
                begin
                  cor:= $00919E41;
                  corFonte := clBlack;
                end;
             end;


            ct:= ct + 1;

           end;
        end;

        if ct= 45 then
        begin
         paginaAtual  := paginaAtual  + 1;
         ct :=0;
        end;

     end;
     x := x + 1;
   end;

   pgProdutos.ActivePageIndex := 0;

end;








procedure TfrmSelecaoSaboresPizza.btOb1Click(Sender: TObject);
begin
  inherited;
  dm.tbSaboresPizzaTemp.Locate('descricao',((sender as TJvImgBtn).Caption) ,[]);
  dm.tbSaboresPizzaTemp.delete;
  (sender as TJvImgBtn).Visible := False;

end;
               
                 

procedure TfrmSelecaoSaboresPizza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if podeFechar = false then
    Action := caNone;

end;

end.

