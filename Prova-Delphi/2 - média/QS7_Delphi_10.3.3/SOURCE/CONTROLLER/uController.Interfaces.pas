///####################################################################################################################
/// uController.Interfaces
/// Desenvolvido por Marcelo Leal
///####################################################################################################################
unit uController.Interfaces;

interface

uses
  System.Classes;

type
  IMaquina = interface
    ['{FC94C9ED-0AB8-441D-8BAB-9272E59ED403}']
    function MontarTroco(pTroco: Double): TStringList;
  end;

  IController = interface
    ['{E6432F18-2930-4B61-9C8A-7E5527D084EE}']
    function Caixa: IMaquina;
  end;

implementation

end.
