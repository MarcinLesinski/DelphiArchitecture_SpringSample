unit Logic;

interface

uses
    Sender;

type
    TLogic = class
    private
        _sender: TSender;
        _canSend: Boolean;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Lock;
        procedure Unlock;
        procedure Execute;
    end;

implementation

{ TLogic }

constructor TLogic.Create;
begin
    _sender := TSender.Create;
    _canSend := false;
end;

destructor TLogic.Destroy;
begin
    _sender.DisposeOf;
    inherited;
end;

procedure TLogic.Lock;
begin
    _canSend := false;
end;

procedure TLogic.Unlock;
begin
    _canSend := true;
end;

procedure TLogic.Execute;
begin
    if _canSend then
        _sender.Send('busines bla bla bla');
end;

end.
