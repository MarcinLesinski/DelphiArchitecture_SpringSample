unit View;

interface

uses
    Logic,
    Sender,
    UdpClient,

    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls;

type
    TForm1 = class(TForm)
        ExecuteLogicButton: TButton;
        procedure ExecuteLogicButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
    private
        _logic: TLogic;
        _sender: TSender;
        _udpClient: TUdpClient;
    end;

var
    Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
    _udpClient := TUdpClient.Create;
    _sender := TSender.Create(_udpClient);
    _logic := TLogic.Create(_sender);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    _udpClient.DisposeOf;
    _sender.DisposeOf;
    _logic.DisposeOf;
end;

procedure TForm1.ExecuteLogicButtonClick(Sender: TObject);
begin
    _logic.Unlock;
    _logic.Execute;
end;

end.
