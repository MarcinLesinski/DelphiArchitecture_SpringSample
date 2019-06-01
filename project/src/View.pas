unit View;

interface

uses
    Logic,
    UdpClient,

    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls;

type
    TForm1 = class(TForm)
        ExecuteLogicButton: TButton;
        procedure ExecuteLogicButtonClick(Sender: TObject);
    private
        _logic: TLogic;
        _udpClient: TUdpClient;
    public
        procedure Inject(logic: TLogic); overload;
        procedure Inject(udpClient: TUdpClient); overload;       
    end;

var
    Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Inject(logic: TLogic);
begin
    _logic := logic;
end;

procedure TForm1.Inject(udpClient: TUdpClient);
begin
    _udpClient := udpClient;
end;

procedure TForm1.ExecuteLogicButtonClick(Sender: TObject);
begin
    _logic.Unlock;
    _logic.Execute;
end;

end.
