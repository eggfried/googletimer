unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    pnlTimer: TPanel;
    chkAllWayTop: TCheckBox;
    btn1Hour: TButton;
    Image1: TImage;
    Timer1: TTimer;
    L_couterTime: TLabel;
    L_couterTime2: TLabel;
    btn50M: TButton;
    btn30M: TButton;
    btn25M: TButton;
    btn10M: TButton;
    btn5M: TButton;
    procedure chkAllWayTopClick(Sender: TObject);

    procedure btn1HourClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btn50MClick(Sender: TObject);
    procedure btn30MClick(Sender: TObject);
    procedure btn10MClick(Sender: TObject);
    procedure btn25MClick(Sender: TObject);
    procedure btn5MClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
  BarSize: Double = 600;
  globaltime: Integer;
  TimeThrow: Integer;
  defaultTime: Integer;
{$R *.dfm}





procedure TForm1.btn10MClick(Sender: TObject);
begin
  L_couterTime.Caption := '00 : 10 : 00';
  L_couterTime2.Caption := '00 : 10 : 00';
  pnlTimer.Width := 100;
  BarSize := 100;
  globaltime := 600;
  defaultTime := 600;
  TimeThrow := 0;
  Timer1.Enabled := True;
end;

procedure TForm1.btn1HourClick(Sender: TObject);
begin
  L_couterTime.Caption := '01 : 00 : 00';
  L_couterTime2.Caption := '01 : 00 : 00';
  pnlTimer.Width := 600;
  BarSize := 600;
  globaltime := 3600;
  defaultTime := 3600;
  TimeThrow := 0;
  Timer1.Enabled := True;
end;

procedure TForm1.btn25MClick(Sender: TObject);
begin
  L_couterTime.Caption := '00 : 25 : 00';
  L_couterTime2.Caption := '00 : 25 : 00';
  pnlTimer.Width := 250;
  BarSize := 250;
  globaltime := 1500;
  defaultTime := 1500;
  TimeThrow := 0;
  Timer1.Enabled := True;
end;

procedure TForm1.btn30MClick(Sender: TObject);
begin
  L_couterTime.Caption := '00 : 30 : 00';
  L_couterTime2.Caption := '00 : 30 : 00';
  pnlTimer.Width := 300;
  BarSize := 300;
  globaltime := 1800;
  defaultTime := 1800;
  TimeThrow := 0;
  Timer1.Enabled := True;
end;

procedure TForm1.btn50MClick(Sender: TObject);
begin
  L_couterTime.Caption := '00 : 50 : 00';
  L_couterTime2.Caption := '00 : 50 : 00';
  pnlTimer.Width := 500;
  BarSize := 500;
  globaltime := 3000;
  defaultTime := 3000;
  TimeThrow := 0;
  Timer1.Enabled := True;
end;

procedure TForm1.btn5MClick(Sender: TObject);
begin
  L_couterTime.Caption := '00 : 05 : 00';
  L_couterTime2.Caption := '00 : 05 : 00';
  pnlTimer.Width := 50;
  BarSize := 50;
  globaltime := 300;
  defaultTime := 300;
  TimeThrow := 0;
  Timer1.Enabled := True;
end;

procedure TForm1.chkAllWayTopClick(Sender: TObject);
begin
  if chkAllWayTop.Checked then
    FormStyle := fsStayOnTop
  else
    formstyle := fsNormal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);

begin
  timethrow := TimeThrow + 1;
  BarSize := ((defaultTime - timethrow) / 3600 * 100) * 6;
  pnlTimer.Width := Trunc(BarSize);

  globaltime := globaltime -1;

  L_couterTime.Caption := FormatFloat('00',globaltime div 3600)
    + ' : ' + FormatFloat('00',globaltime div 60 mod 60) + ' : ' + FormatFloat('00',globaltime mod 60);
  L_couterTime2.Caption := FormatFloat('00',globaltime div 3600)
    + ' : ' + FormatFloat('00',globaltime div 60 mod 60) + ' : ' + FormatFloat('00',globaltime mod 60);


  if globaltime <= 0 then
    begin
      Timer1.Enabled := false;
    end;

end;

end.
