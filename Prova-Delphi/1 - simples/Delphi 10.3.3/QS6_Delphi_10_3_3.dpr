program QS6_Delphi_10_3_3;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uView.Principal in 'SOURCE\VIEW\uView.Principal.pas' {frmPrincipal},
  uAuxiliar.Dialogos in 'SOURCE\AUXILIAR\uAuxiliar.Dialogos.pas',
  uController.Interfaces in 'SOURCE\CONTROLLER\uController.Interfaces.pas',
  uController.Factory in 'SOURCE\CONTROLLER\uController.Factory.pas',
  uModel.Texto in 'SOURCE\MODEL\uModel.Texto.pas',
  uView.BackTransparent in 'SOURCE\VIEW\uView.BackTransparent.pas' {frmBlack},
  uAuxiliar.Fundo.Esmaecido in 'SOURCE\AUXILIAR\uAuxiliar.Fundo.Esmaecido.pas',
  uAuxiliar.Variaveis.Globais in 'SOURCE\AUXILIAR\uAuxiliar.Variaveis.Globais.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBlack, frmBlack);
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.Run;
end.
