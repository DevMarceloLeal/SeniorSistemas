unit Componente.GetEdit;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Graphics;

type
  TGetEdit = class(TEdit)
  private
    FCorNormal: TColor;
    FCorFoco: TColor;
    FOnValidate: TNotifyEvent;
    FReadOnly: Boolean;
    FCurrency: Boolean;
    procedure SetCorFoco(const Value: TColor);
    procedure SetCorNormal(const Value: TColor);
    procedure SetOnValidate(const Value: TNotifyEvent);
    procedure SetReadOnly(const Value: Boolean);
    procedure SetCurrency(const Value: Boolean);
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    function IsEmpty: Boolean;
    property CorFoco: TColor read FCorFoco write SetCorFoco;
    property CorNormal: TColor read FCorNormal write SetCorNormal;
    property Currency: Boolean read FCurrency write SetCurrency default False;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
    property OnValidate: TNotifyEvent read FOnValidate write SetOnValidate;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Senior®', [TGetEdit]);
end;

{ TGetEdit }

constructor TGetEdit.Create(AOwner: TComponent);
begin
  inherited;
  FCorFoco   := $00C5F3FC;
  FCorNormal := clWindow;
  Text       := EmptyStr;
end;

procedure TGetEdit.DoEnter;
begin
  inherited;
  Color := CorFoco;
end;

procedure TGetEdit.DoExit;
begin
  inherited;
  Color := CorNormal;

  if Assigned(FOnValidate) then
     FOnValidate(Self);

  if FCurrency then
     begin
       Text := FloatToStrF(StrToFloat(Self.Text), ffCurrency, 15, 2).Replace('R$','');
     end;
end;

function TGetEdit.IsEmpty: Boolean;
begin
  Result := Trim(Self.Text) = EmptyStr;
end;

procedure TGetEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);

  if Key = VK_UP then
     begin
       Key := 0;
       Keybd_Event(VK_LSHIFT, 0, 0, 0);
       Keybd_Event(VK_TAB, 0, 0, 0);
       Keybd_Event(VK_LSHIFT, 0, KEYEVENTF_KEYUP, 0);
     end;

  if Key = VK_DOWN then
     begin
       Key := 0;
       keybd_event(VK_TAB,0,0,0);
     end;
end;

procedure TGetEdit.KeyPress(var Key: char);
begin
  inherited KeyPress(Key);

  if (FCurrency) and (not CharInSet(Key, ['0' .. '9', ',', '.', #8, #13, #38, #40, #27])) then
     begin
       Key := #0;
       raise Exception.Create('Caracter não suportado!');
     end;

  if Key = #13 then
     begin
       Key := #0;
       Perform(Wm_NextDlgCtl,0,0);
     end;
end;

procedure TGetEdit.SetCorFoco(const Value: TColor);
begin
  FCorFoco := Value;
end;

procedure TGetEdit.SetCorNormal(const Value: TColor);
begin
  FCorNormal := Value;
end;

procedure TGetEdit.SetOnValidate(const Value: TNotifyEvent);
begin
  FOnValidate := Value;
end;

procedure TGetEdit.SetCurrency(const Value: Boolean);
begin
  FCurrency := Value;

  if FCurrency then
     begin
       Alignment := taRightJustify;
       Text      := '0,00';
     end
  else
     begin
       Alignment := taLeftJustify;
       Clear;
     end;
end;

procedure TGetEdit.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;

  if FReadOnly then
     begin
       TabStop := False;
       Font.Color := clRed;
     end
  else
     begin
       TabStop := True;
       Font.Color := clWindowText;
     end;
end;

end.
