unit Sender;

interface

type
    ISender = interface
        ['{D40DBC62-9D42-49EF-AC90-6DC5856DFC03}']
        procedure Send(msgBody: String);
    end;

implementation

end.
