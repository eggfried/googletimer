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
    procedure chkAllWayTopClick(Sender: TObject);
    procedure btnDefaultSizeClick(Sender: TObject);
    procedure btn1HourClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

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
{$R *.dfm}



procedure TForm1.btnDefaultSizeClick(Sender: TObject);
begin
  width := 631;
  height := 191;
end;

procedure TForm1.btn1HourClick(Sender: TObject);
begin
  pnlTimer.Width := 600;
  BarSize := 600;
  Timer1.Enabled := True;
  globaltime := 3600;
  TimeThrow := 0;
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
  BarSize := ((3600 - timethrow) / 3600 * 100) * 6;
  pnlTimer.Width := Trunc(BarSize);

  globaltime := globaltime -1;

  L_couterTime.Caption := FormatFloat('00',globaltime div 3600)
    + ' : ' + FormatFloat('00',globaltime div 60 mod 60) + ' : ' + FormatFloat('00',globaltime mod 60);

  if globaltime <= 0 then
    begin
      Timer1.Enabled := false;
    end;

end;

end.
