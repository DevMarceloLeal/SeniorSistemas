///####################################################################################################################
/// uController.Interfaces
/// Desenvolvido por Marcelo Leal
///####################################################################################################################
unit uController.Interfaces;

interface

type
  ITexto = interface
    ['{DCD021A5-FB1D-47EF-92F4-C8D831B28909}']
    function Substituir(pTexto, pAntigo, pNovo: String): String;
  end;

  IController = interface
    ['{98D8E2C8-00E9-46CA-A9E5-687CB7392B1E}']
    function Texto: ITexto;
  end;

implementation

end.
