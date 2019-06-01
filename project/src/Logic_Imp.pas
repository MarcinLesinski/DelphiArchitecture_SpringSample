unit Logic_Imp;

interface

uses
    Logic,

    Sender;

type
    TLogic = class(TInterfacedObject, ILogic)
    private
        _sender: ISender;
        _canSend: Boolean;
    public
        constructor Create(sender: ISender);
        procedure Lock;
        procedure Unlock;
        procedure Execute;
    end;

implementation

{ TLogic }

constructor TLogic.Create(sender: ISender);
begin
    _sender := sender;
    _canSend := false;
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
