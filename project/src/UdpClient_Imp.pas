unit UdpClient_Imp;

interface

uses
    UdpClient;

type
    TUdpClient = class(TInterfacedObject, IUdpClient)
    private
        _port: Word;
        _host: String;
        _header: String;

        {$REGION 'g/setter'}
        function get_port: Word;
        procedure set_port(const Value: Word);
        function get_host: String;
        procedure set_host(const Value: String);
        function get_header: String;
        procedure set_header(const Value: String);
        {$ENDREGION}
    public
        constructor Create();

        procedure Send(msgBody: String);
        property port: Word read get_port write set_port;
        property host: String read get_host write set_host;
        property header: String read get_header write set_header;
    end;

implementation

uses
    FMX.Dialogs,
    System.SysUtils;

{ TSender }

constructor TUdpClient.Create;
begin
    _port := 12345;
    _host := '127.0.0.1';
    _header := 'header';
end;

procedure TUdpClient.Send(msgBody: String);
var
    msg: String;
begin
    msg := Format('%s:%d %s - %s', [_host, _port, _header, msgBody]);
    ShowMessage(msg);
end;

{$REGION 'properties'}

function TUdpClient.get_header: String;
begin
    result := _header;
end;

function TUdpClient.get_host: String;
begin
    result := _host;
end;

function TUdpClient.get_port: Word;
begin
    result := port;
end;

procedure TUdpClient.set_header(const Value: String);
begin
    _header := Value;
end;

procedure TUdpClient.set_host(const Value: String);
begin
    _host := Value;
end;

procedure TUdpClient.set_port(const Value: Word);
begin
    _port := Value;
end;
{$ENDREGION}

end.
