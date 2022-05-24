unit uMaquina;

interface

uses
  uIMaquina,
  Classes;

type
  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

uses
  System.SysUtils;

function TMaquina.MontarTroco(aTroco: Double): TList;
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
  if (aTroco > 0.00) then
     begin
       // Definindo as notas do troco (parte inteira)
       FValor := trunc(aTroco);

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

           // Próxima Cédula
           i := i + 1;
         end;

       // Definindo as moedas do troco (parte fracionária)
       FValor := round(frac(aTroco) * 100);

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

           // Próxima Moeda
           i := i + 1;
         end;
     end;

  Result := FLista;
end;

end.

