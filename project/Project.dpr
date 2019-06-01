program Project;

uses
  Spring.Container,
  System.StartUpCopy,
  FMX.Forms,
  View in 'src\View.pas' {Form1},
  UdpClient in 'src\UdpClient.pas',
  Sender in 'src\Sender.pas',
  Logic in 'src\Logic.pas',
  Logic_Imp in 'src\Logic_Imp.pas',
  Sender_Imp in 'src\Sender_Imp.pas',
  UdpClient_Imp in 'src\UdpClient_Imp.pas',
  UdpClientConfigurable in 'src\UdpClientConfigurable.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;

  Application.Initialize;

  GlobalContainer.RegisterType<TUdpClient>.AsSingleton;
  GlobalContainer.RegisterType<TSender>.AsSingleton;
  GlobalContainer.RegisterType<TLogic>.AsSingleton;
  GlobalContainer.RegisterType<TForm1, TForm1>.AsSingleton;

  GlobalContainer.Build;
  Form1 := GlobalContainer.Resolve<TForm1>;

  Form1.Show;
  Application.Run;
end.
