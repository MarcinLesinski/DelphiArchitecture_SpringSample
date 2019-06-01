unit UdpClient;

interface

type
    IUdpClient = interface
        ['{740335C1-220A-4F57-8617-DE010642DD85}']
        {$REGION 'g/setter'}
        function get_port: Word;
        procedure set_port(const Value: Word);
        function get_host: String;
        procedure set_host(const Value: String);
        function get_header: String;
        procedure set_header(const Value: String);
        {$ENDREGION}
        procedure Send(msgBody: String);
        property port: Word read get_port write set_port;
        property host: String read get_host write set_host;
        property header: String read get_header write set_header;
    end;

implementation

end.
