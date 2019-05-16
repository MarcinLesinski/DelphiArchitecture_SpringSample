program Project;

uses
  System.StartUpCopy,
  FMX.Forms,
  View in 'src\View.pas' {Form1},
  UdpClient in 'src\UdpClient.pas',
  Sender in 'src\Sender.pas',
  Logic in 'src\Logic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
