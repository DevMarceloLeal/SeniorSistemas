///####################################################################################################################
/// uController.Factory
/// Desenvolvido por Marcelo Leal
///####################################################################################################################
unit uController.Factory;

interface

uses
  uController.Interfaces,
  uModel.Texto;

type
  TController = class(TInterfacedObject, IController)
  private
    FTexto: ITexto;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IController;
    function Texto: ITexto;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FTexto := TModelTexto.New;
end;

destructor TController.Destroy;
begin
  inherited;
end;

class function TController.New: IController;
begin
  Result := Self.Create;
end;

function TController.Texto: ITexto;
begin
  Result := FTexto;
end;

end.

