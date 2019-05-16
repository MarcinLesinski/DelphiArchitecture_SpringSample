unit Sender;

interface

uses
    UdpClient;

type
    TSender = class
    private
        _udpClient: TUdpClient;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Send(msgBody: String);
    end;

implementation

{ TSender }

constructor TSender.Create;
begin
    _udpClient := TUdpClient.Create;
end;

destructor TSender.Destroy;
begin
    _udpClient.DisposeOf;
    inherited;
end;

procedure TSender.Send(msgBody: String);
var
    decoratedMsgBody: String;
begin
    decoratedMsgBody :=  '***' + msgBody + '***';
    _udpClient.Send(decoratedMsgBody);
end;

end.
