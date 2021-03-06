///####################################################################################################################
/// uModel.Texto
/// Desenvolvido por Marcelo Leal
///####################################################################################################################
unit uModel.Texto;

interface

uses
  uController.Interfaces;

type
  TModelTexto = class(TInterfacedObject, ITexto)
  private
    function Posicao(pTexto, pExpressao: String): Integer;
    function PegarTexto(pTexto: String; pInicio, pTamanho: Integer): String;
  public
    class function New : ITexto;
    function Substituir(pTexto, pAntigo, pNovo: String): String;
  end;

implementation

//###################################################################
// Nome   : Posi??o()                                              //
// Fun??o : Retorna a Posi??o da Express?o no Texto                //
//###################################################################
function TModelTexto.Posicao(pTexto, pExpressao: String): Integer;
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

//###################################################################
// Nome   : PegarTexto()                                           //
// Fun??o : Retornar Textos Conforme Parametros (In?cio e Tamanho) //
//###################################################################
function TModelTexto.PegarTexto(pTexto: String; pInicio, pTamanho: Integer): String;
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

//#####################################################################
// Nome   : New()                                                    //
// Fun??o : Cria uma Nova Inst?ncia da Classe                        //
//#####################################################################
class function TModelTexto.New: ITexto;
begin
  Result := Self.Create;
end;

//#####################################################################
// Nome   : Substituir()                                             //
// Fun??o : Retorna o Texto Substituindo Express?es (Velha pela Nova //
//#####################################################################
function TModelTexto.Substituir(pTexto, pAntigo, pNovo: String): String;
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
