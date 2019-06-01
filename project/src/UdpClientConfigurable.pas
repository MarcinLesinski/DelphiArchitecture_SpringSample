unit UdpClientConfigurable;

interface

type
    IUdpClientConfigurable = interface
        ['{2EB96D8A-DF19-4B71-A900-E212FF29DCB4}']
        {$REGION 'g/setter'}
        function get_port: Word;
        procedure set_port(const Value: Word);
        function get_host: String;
        procedure set_host(const Value: String);
        function get_header: String;
        procedure set_header(const Value: String);
        {$ENDREGION}
        property port: Word read get_port write set_port;
        property host: String read get_host write set_host;
        property header: String read get_header write set_header;
    end;

implementation

end.
