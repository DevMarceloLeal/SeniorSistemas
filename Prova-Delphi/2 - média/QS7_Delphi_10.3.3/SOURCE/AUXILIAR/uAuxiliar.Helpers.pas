unit uAuxiliar.Helpers;

interface

uses
  System.SysUtils,
  System.Variants,
  Vcl.StdCtrls;

type
  TEditHelper = class Helper for TEdit
    function IsEmpty: Boolean;
    function ToMoeda: String;
    function ToCurrency: Currency;
  private
    function Str(const pValue: Variant): String;
  end;

implementation

uses
  Vcl.Dialogs;

{ TEditHelper }

function TEditHelper.IsEmpty: Boolean;
begin
  Result := Trim(Self.Text) = EmptyStr;
end;

function TEditHelper.ToMoeda: String;
begin
  if Str(Self.Text) <> EmptyStr then
     Self.Text := FormatCurr('###,##0.00', ToCurrency)
  else
     Self.Text := '0,00';
end;

function TEditHelper.ToCurrency: Currency;
begin
  if Str(Self.Text) <> '0.00' then
     begin
       if Length(Self.Text) >= 7 then
          Result := StrToFloat(Str(Self.Text).Replace('.',''))
       else
          Result := StrToFloat(Str(Self.Text));
     end
  else
     Result := 0.00;
end;

//#######################################################################\\
function TEditHelper.Str(const pValue: Variant): String;
begin
  case TVarData(pValue).VType of
    varSmallInt, varInteger :
       Result := IntToStr(pValue);
    varSingle, varDouble :
       Result := FloatToStr(pValue).Replace('.','');
    varCurrency :
       Result := CurrToStr(pValue).Replace('.','');
    varDate :
       Result := FormatDateTime('dd/mm/yyyy', pValue);
    varBoolean :
       if pValue then
          Result := 'T'
       else
          Result := 'F';
  else
     Result := VarToStr(pValue);
  end;
end;

end.
