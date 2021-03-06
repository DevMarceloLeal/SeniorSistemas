///####################################################################################################################
/// uModel.Maquina
/// Implementado por Marcelo Leal
///####################################################################################################################
unit uModel.Maquina;

interface

uses
  System.Classes,
  System.SysUtils,
  uModel.Troco,
  uController.Interfaces,
  uAuxiliar.Variaveis.Globais;

type

  TModelMaquina = class(TInterfacedObject, IMaquina)
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IMaquina;
    function MontarTroco(pTroco: Double): TStringList;
  end;

implementation

{ TModelMaquina }

constructor TModelMaquina.Create;
begin
end;

destructor TModelMaquina.Destroy;
begin
  inherited;
end;

class function TModelMaquina.New: IMaquina;
begin
  Result := Self.Create;
end;

function TModelMaquina.MontarTroco(pTroco: Double): TStringList;
const
  Cedulas: array[1..7] of integer = (100, 50, 20, 10, 5, 2, 1);
  Moedas:  array[1..5] of integer = (50, 25, 10, 5, 1);

var
  i, FValor, FCedulas, FMoedas: Integer;
  FLista: TStringList;
  FPlural, FTipo: String;
  FMoeda: Real;
  FLinha: Boolean;

begin
  FLista := TStringList.Create;
  FLinha := True;
  if (pTroco > 0.00) then
     begin
       // Definindo as notas do troco (parte inteira)
       FValor := trunc(pTroco);

       i := 1;
       while (FValor <> 0) do
         begin
           // Qtde de notas
           FCedulas := FValor div Cedulas[i];
           if (FCedulas <> 0) then
              begin
                FTipo   := 'Nota';
                FPlural := '';
                if FCedulas > 1 then
                   FPlural := 's';

                if IntToStr(Cedulas[i]) = '1' then
                   begin
                     FLista.Add('');
                     FLinha := False;
                     FTipo   := 'Moeda';
                   end;

                FLista.Add(Format('%d %s%s de %s',[FCedulas, FTipo, FPlural, IntToStr(Cedulas[i])]));
                FValor := FValor mod Cedulas[i];
              end;

           // Pr?xima C?dula
           i := i + 1;
         end;

       // Definindo as moedas do troco (parte fracion?ria)
       FValor := round(frac(pTroco) * 100);

       if FLinha then
          FLista.Add('');

       i := 1;
       while (FValor <> 0) do
         begin
           // Qtd de moedas
           FMoedas := FValor div Moedas[i];
           if (FMoedas <> 0) then
              begin
                FMoeda  := Moedas[i] / 100;
                FPlural := '';
                if FMoedas > 1 then
                   FPlural := 's';

                FLista.Add(Format('%d Moeda%s de %s',[FMoedas, FPlural, FormatFloat('###0.00', FMoeda)]));
                FValor := FValor mod Moedas[i];
              end;

           // Pr?xima Moeda
           i := i + 1;
         end;
     end;

  Result := FLista;
end;

end.

