///####################################################################################################################
/// uView.Principal
/// Desenvolvido por Marcelo Leal
///####################################################################################################################
unit uView.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uController.Interfaces,
  uController.Factory,
  uAuxiliar.Dialogos,
  uAuxiliar.Variaveis.Globais;

type
  TfrmPrincipal = class(TForm)
    btnEncerrar: TButton;
    btnSubstituir: TButton;
    bhPrincipal: TBalloonHint;
    GroupBox1: TGroupBox;
    edtTextoPrincipal: TLabeledEdit;
    edtExpressaoAntiga: TLabeledEdit;
    edtExpressaoNova: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSubstituirClick(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
  private
    FControle: IController;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FControle    := TController.New;
  gLargura     := Width;
  gComprimento := Height;
  gTopo        := Top;
  gEsquerda    := Left;
  gPosicao     := Position;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Msg('Deseja Realmente Sair do Sistema ?', 4);
  if CanClose then
     begin
       ModalResult := mrCancel;
     end;
end;

procedure TfrmPrincipal.btnSubstituirClick(Sender: TObject);
begin
  Msg( FControle.Texto.Substituir(edtTextoPrincipal.Text,
                                  edtExpressaoAntiga.Text,
                                  edtExpressaoNova.Text));
  edtTextoPrincipal.SetFocus;
end;

procedure TfrmPrincipal.btnEncerrarClick(Sender: TObject);
begin
  keybd_event(VK_ESCAPE, 0, 0, 0);
end;

end.
