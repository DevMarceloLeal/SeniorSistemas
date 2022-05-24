///####################################################################################################################
/// uFormPrincipal
/// Criado por Marcelo Leal
///####################################################################################################################
unit uFormPrincipal;

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
  uSubstitui;

type
  TfrmPrincipal = class(TForm)
    btnEncerrar: TButton;
    btnSubstituir: TButton;
    GroupBox1: TGroupBox;
    edtTextoPrincipal: TLabeledEdit;
    edtExpressaoAntiga: TLabeledEdit;
    edtExpressaoNova: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSubstituirClick(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
  private
    FTexto: TSubstitui;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

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
  CanClose := True;
  if CanClose then
     begin
       ModalResult := mrCancel;
     end;
end;

procedure TfrmPrincipal.btnSubstituirClick(Sender: TObject);
begin
  ShowMessage(FTexto.Substituir(edtTextoPrincipal.Text, edtExpressaoAntiga.Text, edtExpressaoNova.Text));
  edtTextoPrincipal.SetFocus;
end;

procedure TfrmPrincipal.btnEncerrarClick(Sender: TObject);
begin
  keybd_event(VK_ESCAPE, 0, 0, 0);
end;

end.
