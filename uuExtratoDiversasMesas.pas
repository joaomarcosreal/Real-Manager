unit uuExtratoDiversasMesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  RealFramework, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uu_modelo_Vazio, AdvGlassButton, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxListBox, uu_data_module, cxCheckBox, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, Vcl.Buttons, cxCustomListBox, Vcl.Menus;

type
  TfrmExtratoDiversasMesas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    btImprimir: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    Label1: TLabel;
    Panel4: TPanel;
    ltMesas: TcxListBox;
    Label3: TLabel;
    edNumeroMesa: TEdit;
    ckbTodasAsMesas: TcxCheckBox;
    procedure edNumeroMesaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExtratoDiversasMesas: TfrmExtratoDiversasMesas;

implementation

{$R *.dfm}

procedure TfrmExtratoDiversasMesas.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close();
end;

procedure TfrmExtratoDiversasMesas.btImprimirClick(Sender: TObject);
var
  I: Integer;
  LMesa: string;
begin
  inherited;

  if ckbTodasAsMesas.Checked = false then
  begin
    for I := 0 to ltMesas.Items.Count - 1 do
    begin
      LMesa := ltMesas.Items[I];
      dm.ImprimeComprovanteMesa(TcPreConta, LMesa, '',false);
      dm.insereExtratosEmitidos(ltMesas.Items[I]);
    end;
    close();
  end
  else
  begin

    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Tem certeza que deseja a pré-conta de todas as mesas  ?') = teSim) then
      dm.imprimePreContaTodasAsMesas();

    close();
  end;

end;

procedure TfrmExtratoDiversasMesas.edNumeroMesaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Mesa: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if (trim(edNumeroMesa.Text) <> '') then
    begin
      try
        StrToFloat(edNumeroMesa.Text);
        Mesa := FormatFloat('0000', StrToFloat(edNumeroMesa.Text));

        if dm.verificaSeMesaTemMovimento(Mesa) then
        begin
          ltMesas.Items.Add(Mesa);
        end
        else
        begin
          exibe_painel_erro('Mesa sem movimento!', 'Ok');
        end;

      except
        begin
          exibe_painel_erro('Número de mesa inválido', 'Ok');
        end;
      end;
      edNumeroMesa.Clear;
      edNumeroMesa.SetFocus;
    end
    else
    begin
      btImprimir.SetFocus;
    end;
  end;
end;

procedure TfrmExtratoDiversasMesas.FormActivate(Sender: TObject);
begin
  inherited;
  edNumeroMesa.SetFocus;
end;

procedure TfrmExtratoDiversasMesas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_escape then
    close;
end;

end.

