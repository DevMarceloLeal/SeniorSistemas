///####################################################################################################################
/// uISubstitui
/// Alterado por Marcelo Leal
///####################################################################################################################
unit uISubstitui;

interface

type
  ISubstitui = interface
    ['{E1038F5D-19F7-44FF-B7E4-3E6D65F56AF2}']
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;

implementation

end.

