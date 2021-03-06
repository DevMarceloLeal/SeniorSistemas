///####################################################################################################################
/// uAuxiliar.Dialogos
/// Desenvolvido por Marcelo Leal
///####################################################################################################################
unit uAuxiliar.Dialogos;

interface

uses
  Winapi.Windows,
  System.UITypes,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Controls,
  Vcl.Forms,
  uAuxiliar.Fundo.Esmaecido;

  function Msg(pStrMsg: String; pTipo: Integer = 1): Boolean;

implementation

/// ####################################################################################################################
/// Fun??o   : Msg()
/// Objetivo : Respons?vel pela janela de mensagens nativas da linguagem
///####################################################################################################################
function Msg(pStrMsg: String; pTipo: Integer = 1): Boolean;
var
  F: TForm;
  I: Integer;
  StrTitulo: String;
  DlgType: TMsgDlgType;
  bhMsgSys: TBalloonHint;
  FFundo: TFundoEsmaecido;

begin
  FFundo             := TFundoEsmaecido.New;
  bhMsgSys           := TBalloonHint.Create(nil);
  bhMsgSys.Style     := bhsBalloon;

  if StrTitulo = '' then
     StrTitulo := 'Senior Sistemas';

  DlgType := mtInformation;
  if pTipo = 4 then
     begin
       DlgType := mtConfirmation;
       F := CreateMessageDialog(pStrMsg, DlgType, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo]);
     end
  else
     begin
       if pTipo = 2 then
          DlgType := mtWarning
       else if pTipo = 3 then
          DlgType := mtError;
       F := CreateMessageDialog(pStrMsg, DlgType, [TMsgDlgBtn.mbOK]);
     end;

  FFundo.Escurecer;
  with F do
    try
      for I := 0 to ComponentCount - 1 do
          if Components[I] IS TButton then
             begin
               with TButton(Components[I]) do
                 case ModalResult of
                   mrOK:
                     begin
                       Caption := '&OK';
                       Cursor  := crHandPoint;
                       Hint    := 'Tecle Para Encerrar a Janela';
                     end;

                   mrYes:
                     begin
                       Caption    := '&Sim';
                       Cursor     := crHandPoint;
                       TabStop    := False;
                       Hint       := 'Para Confirmar';
                     end;

                   mrNo:
                     begin
                       Caption    := '&N?o';
                       Cursor     := crHandPoint;
                       TabStop    := False;
                       Hint       := 'Para Negar';
                     end;
                 end;
             end;

      MessageBeep(MB_ICONINFORMATION);

      Caption    := StrTitulo;
      CustomHint := bhMsgSys;
      ShowHint   := True;
      ShowModal;
    finally
      bhMsgSys.Free;
      Free
    end;

  FFundo.Clarear;
  if (F.ModalResult = mrYes) or (F.ModalResult = mrOk) then
     Result := True
  else
     Result := False;
end;

end.
