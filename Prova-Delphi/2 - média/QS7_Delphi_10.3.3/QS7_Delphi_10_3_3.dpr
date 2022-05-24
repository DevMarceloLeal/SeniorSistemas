program QS7_Delphi_10_3_3;

uses
  Vcl.Forms,
  uView.Principal in 'SOURCE\VIEW\uView.Principal.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  uAuxiliar.Dialogos in 'SOURCE\AUXILIAR\uAuxiliar.Dialogos.pas',
  uAuxiliar.Fundo.Esmaecido in 'SOURCE\AUXILIAR\uAuxiliar.Fundo.Esmaecido.pas',
  uAuxiliar.Variaveis.Globais in 'SOURCE\AUXILIAR\uAuxiliar.Variaveis.Globais.pas',
  uView.BackTransparent in 'SOURCE\VIEW\uView.BackTransparent.pas' {frmBlack},
  uAuxiliar.Helpers in 'SOURCE\AUXILIAR\uAuxiliar.Helpers.pas',
  uController.Interfaces in 'SOURCE\CONTROLLER\uController.Interfaces.pas',
  uController.Factory in 'SOURCE\CONTROLLER\uController.Factory.pas',
  uModel.Maquina in 'SOURCE\MODEL\uModel.Maquina.pas',
  uModel.Troco in 'SOURCE\MODEL\uModel.Troco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmBlack, frmBlack);
  Application.Run;
end.
