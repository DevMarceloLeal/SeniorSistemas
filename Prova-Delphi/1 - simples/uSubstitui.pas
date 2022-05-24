///####################################################################################################################
/// uSubstitui
/// Alterado e Implementado por Marcelo Leal
///####################################################################################################################
unit uSubstitui;

interface

uses
  uISubstitui;

type
  TSubstitui = class(TInterfacedObject, ISubstitui)
  private
    function Posicao(pTexto, pExpressao: String): Integer;
    function PegarTexto(pTexto: String; pInicio, pTamanho: Integer): String;
  public
    function Substituir(pTexto, pAntigo, pNovo: String): String;
  end;

implementation

function TSubstitui.Posicao(pTexto, pExpressao: String): Integer;
var
  nPosicao, nResultado: Integer;

begin
  nPosicao   := 1;
  nResultado := -1;

  while (nPosicao <= Length(pTexto)) do
     begin
       if PegarTexto(pTexto, nPosicao, Length(pExpressao)) = pExpressao then
          begin
            nResultado := nPosicao;
            Break;
          end;
       inc(nPosicao);
     end;

  Result := nResultado;
end;

function TSubstitui.PegarTexto(pTexto: String; pInicio, pTamanho: Integer): String;
var
  nPosicao, nResultado: Integer;
  FString: String;

begin
  nPosicao   := 1;
  FString    := '';

  while (nPosicao <= Length(pTexto))do
    begin
      if (nPosicao = pInicio) then
         begin
           for nResultado := pInicio to (nPosicao + pTamanho) - 1 do
             FString := FString + pTexto[nResultado];
         end;
      inc(nPosicao);
    end;

  Result := FString;
end;

function TSubstitui.Substituir(pTexto, pAntigo, pNovo: String): String;
var
  nInicio, nPosicao: Integer;
  FString: String;

begin
  nInicio  := Low(string);
  nPosicao := Posicao(pTexto, pAntigo);
  FString  := pTexto;

  while nInicio <= High(pTexto) do
    begin
      if (nPosicao > - 1) then
         begin
           FString := PegarTexto(FString, 1, nPosicao - 1) +
                      pNovo +
                      PegarTexto(FString, nPosicao + Length(pAntigo), Length(pTexto));

           nPosicao := Posicao(FString, pAntigo);
         end
      else
         Break;
    end;

  Result := FString;
end;

end.

