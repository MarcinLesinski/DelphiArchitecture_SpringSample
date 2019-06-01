program Project;

uses
  System.StartUpCopy,
  FMX.Forms,
  View in 'src\View.pas' {Form1},
  UdpClient in 'src\UdpClient.pas',
  Sender in 'src\Sender.pas',
  Logic in 'src\Logic.pas';

{$R *.res}

var
    _logic: TLogic;
    _sender: TSender;
    _udpClient: TUdpClient;

begin
  ReportMemoryLeaksOnShutdown := true;

  Application.Initialize;
  Application.RealCreateForms;
  Application.CreateForm(TForm1, Form1);
  Application.MainForm := Form1;

  _udpClient := TUdpClient.Create;
  _sender := TSender.Create(_udpClient);
  _logic := TLogic.Create(_sender);

  Form1.Inject(_logic);
  Form1.Inject(_udpClient);
  Form1.Show;

  Application.Run;

  _udpClient.DisposeOf;
  _sender.DisposeOf;
  _logic.DisposeOf;
end.
