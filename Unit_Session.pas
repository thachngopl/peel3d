unit Unit_Session;
interface
uses Controls, Classes, dglOpenGL,
  Unit_Cursor, Unit_Deck, Unit_Ingot, Unit_Pieces, Unit_Defaults, Unit_Render;


type
  TSession = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    procedure New;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Shift: TShiftState; X, Y: Integer);
    procedure Render(aPass: TRenderPass);
  end;


implementation


{ TSession }
constructor TSession.Create;
begin
  inherited;

end;


destructor TSession.Destroy;
begin

  inherited;
end;


procedure TSession.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  fCursor.MouseDown(Button, Shift, X, Y);
end;


procedure TSession.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  fCursor.MouseMove(Shift, X, Y);
end;


procedure TSession.New;
begin
  fIngot := TIngot.Create;
  fIngot.LoadFromFile('');

  fPieces := TPiecesCollection.Create;
  fPieces.LoadFromFile('');

  fDeck := TDeck.Create;
end;


procedure TSession.Render(aPass: TRenderPass);
begin
  fRender.Switch(rm3D);
  fIngot.Render;

  fRender.Switch(rmDeck);
  fDeck.Render;

  if aPass <> rpSelection then
    fCursor.Render;
end;


end.
