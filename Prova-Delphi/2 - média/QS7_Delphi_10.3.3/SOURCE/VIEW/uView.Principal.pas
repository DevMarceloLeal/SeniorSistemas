unit uView.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uController.Interfaces,
  uController.Factory,
  uAuxiliar.Helpers,
  uAuxiliar.Dialogos,
  uAuxiliar.Variaveis.Globais;

type
  TForm1 = class(TForm)
    btnEncerrar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    edtTotalPagar: TLabeledEdit;
    edtTotalPago: TLabeledEdit;
    edtTroco: TLabeledEdit;
    bhPrincipal: TBalloonHint;
    edtListaTroco: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnEncerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtTotalPagoExit(Sender: TObject);
    procedure edtTotalPagarExit(Sender: TObject);
  private
    FControle: IController;
    function calculaTroco(conta, pago: real): String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FControle    := TController.New;
  gLargura     := Width;
  gComprimento := Height;
  gTopo        := Top;
  gEsquerda    := Left;
  gPosicao     := Position;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    Char(VK_ESCAPE):
      begin
        Key := #0;
        Close;
      end;

    Char(VK_RETURN):
      begin
        Key := #0;
        keybd_event(VK_TAB, 0, 0, 0);
      end;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Msg('Deseja Realmente Sair do Sistema ?', 4);
  if CanClose then
     begin
       ModalResult := mrCancel;
     end;

  edtTotalPagar.SetFocus;
end;

procedure TForm1.btnEncerrarClick(Sender: TObject);
begin
  keybd_event(VK_ESCAPE, 0, 0, 0);
end;

procedure TForm1.edtTotalPagarExit(Sender: TObject);
begin
  TEdit(Sender).ToMoeda;
end;

procedure TForm1.edtTotalPagoExit(Sender: TObject);
var
  pagar, pago: real;

begin
  TEdit(Sender).ToMoeda;

  edtListaTroco.Clear;
  try
    pagar := TEdit(edtTotalPagar).ToCurrency;
    pago  := TEdit(edtTotalPago).ToCurrency;

    calculaTroco(pagar, pago);
  except
    begin
      ShowMessage('Erro: dados informados inv?lidos !!!');
      edtTotalPago.SetFocus;
    end;
  end;
end;

function TForm1.calculaTroco(conta, pago: real): String;
var
  troco: real;
  itens: Integer;
  lista: TStringList;

begin
  Result := '';
  if (pago < conta) then
     calculaTroco := 'Pagamento insuficiente, faltam R$ ' + FloatToStr(conta - pago)
  else
     begin
       troco := pago - conta;
       TEdit(edtTroco).Text := FloatToStr(troco);
       TEdit(edtTroco).ToMoeda;

       if troco > 0.00 then
          lista := FControle.Caixa.MontarTroco(troco);

       for itens := 0 to lista.Count - 1 do
         begin
           edtListaTroco.Lines.Add(lista[itens]);
         end;
     end;
end;

end.
