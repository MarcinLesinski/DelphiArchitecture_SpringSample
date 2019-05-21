unit Sender;

interface

uses
    UdpClient;

type
    TSender = class
    private
        _udpClient: TUdpClient;
    public
        constructor Create(udpClient: TUdpClient);
        procedure Send(msgBody: String);
    end;

implementation

{ TSender }

constructor TSender.Create(udpClient: TUdpClient);
begin
    _udpClient := udpClient;
end;

procedure TSender.Send(msgBody: String);
var
    decoratedMsgBody: String;
begin
    decoratedMsgBody :=  '***' + msgBody + '***';
    _udpClient.Send(decoratedMsgBody);
end;

end.
