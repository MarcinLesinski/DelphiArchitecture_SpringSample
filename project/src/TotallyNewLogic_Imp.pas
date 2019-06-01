unit TotallyNewLogic_Imp;

interface

uses
    Logic,
    Sender;

type
    TTotallyNewLogic = class(TInterfacedObject, ILogic)
    private
        _sender: ISender;
        _lock: Integer;
    public
        constructor Create(sender: ISender);
        procedure Lock;
        procedure Unlock;
        procedure Execute;
    end;

implementation

{ TTotallyNewLogic }

constructor TTotallyNewLogic.Create(sender: ISender);
begin
    _sender := sender;
    _lock := 2;
end;

procedure TTotallyNewLogic.Execute;
begin
    if _lock = 0 then
        _sender.Send('new buisness message');
end;

procedure TTotallyNewLogic.Lock;
begin
    _lock := _lock + 1;
end;

procedure TTotallyNewLogic.Unlock;
begin
    _lock := _lock - 1;
end;

end.
