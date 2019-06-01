unit Sender_Imp;

interface

uses
    Sender,

    UdpClient;

type
    TSender = class(TInterfacedObject, ISender)
    private
        _udpClient: IUdpClient;
    public
        constructor Create(udpClient: IUdpClient);
        procedure Send(msgBody: String);
    end;

implementation

{ TSender }

constructor TSender.Create(udpClient: IUdpClient);
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
