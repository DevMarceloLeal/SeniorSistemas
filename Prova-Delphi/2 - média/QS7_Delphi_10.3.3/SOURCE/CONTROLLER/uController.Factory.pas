///####################################################################################################################
/// uController.Factory
/// Desenvolvido por Marcelo Leal
///####################################################################################################################
unit uController.Factory;

interface

uses
  uController.Interfaces,
  uModel.Maquina;

type
  TController = class(TInterfacedObject, IController)
  private
    FCaixa: IMaquina;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IController;
    function Caixa: IMaquina;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FCaixa := TModelMaquina.New;
end;

destructor TController.Destroy;
begin
  inherited;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

function TController.Caixa: IMaquina;
begin
  Result := FCaixa;
end;

end.

