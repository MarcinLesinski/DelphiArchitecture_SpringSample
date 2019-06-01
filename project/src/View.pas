unit View;

interface

uses
    Logic,
    UdpClientConfigurable,

    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls;

type
    TForm1 = class(TForm)
        ExecuteLogicButton: TButton;
        procedure ExecuteLogicButtonClick(Sender: TObject);
    private
        _logic: ILogic;
        _udpClient: IUdpClientConfigurable;
    public
        constructor Create(logic: ILogic; udpClient: IUdpClientConfigurable); reintroduce;
    end;

var
    Form1: TForm1;

implementation

{$R *.fmx}

constructor TForm1.Create(logic: ILogic; udpClient: IUdpClientConfigurable);
begin
    inherited Create(Application);

    Application.MainForm := Self;
    _logic := logic;
    _udpClient := udpClient;
end;

procedure TForm1.ExecuteLogicButtonClick(Sender: TObject);
begin
    _logic.Unlock;
    _logic.Execute;
end;

end.
