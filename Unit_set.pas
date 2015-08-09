unit Unit_set;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ExtDlgs, ComCtrls, ExtCtrls, FileCtrl;
const
  WS_EX_LAYERED = $80000;
  AC_SRC_OVER = $0;
  AC_SRC_ALPHA = $1;
  AC_SRC_NO_PREMULT_ALPHA = $1;
  AC_SRC_NO_ALPHA = $2;
  AC_DST_NO_PREMULT_ALPHA = $10;
  AC_DST_NO_ALPHA = $20;
  LWA_COLORKEY = $1;
  LWA_ALPHA = $2;
  ULW_COLORKEY = $1;
  ULW_ALPHA = $2;
  ULW_OPAQUE = $4;
type
  TForm_set = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    TrackBar1: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    TrackBarw: TTrackBar;
    Label11: TLabel;
    TrackBarh: TTrackBar;
    Label12: TLabel;
    TrackBar_fs: TTrackBar;
    ComboBox_p2: TComboBox;
    ComboBox_p1: TComboBox;
    Button4: TButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure TrackBarwChange(Sender: TObject);
    procedure TrackBarhChange(Sender: TObject);
    procedure TrackBar_fsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_set: TForm_set;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm_set.FormCreate(Sender: TObject);
begin
SetLayeredWindowAttributes (handle, 0, 255, LWA_ALPHA);
ComboBox1.Items.Assign(screen.Fonts);
end;

procedure TForm_set.TrackBar1Change(Sender: TObject);
var l:longint;
begin
l:=getWindowLong(Form1.Handle, GWL_EXSTYLE);
  l := l Or WS_EX_LAYERED;
  SetWindowLong (Form1.handle, GWL_EXSTYLE, l);
  SetLayeredWindowAttributes (Form1.handle, 0, TrackBar1.Position, LWA_ALPHA);

end;

procedure TForm_set.SpinEdit2Change(Sender: TObject);
begin
if SpinEdit2.Value> (SpinEdit1.Value-1) then
   SpinEdit2.Value:= (SpinEdit1.Value-1);

end;

procedure TForm_set.ComboBox1Change(Sender: TObject);
begin

      Form1.Panel1.Font.Name:=ComboBox1.Text;
end;

procedure TForm_set.TrackBarwChange(Sender: TObject);
begin
Form1.Width:= TrackBarw.Position;
end;

procedure TForm_set.TrackBarhChange(Sender: TObject);
begin
Form1.Height:= TrackBarh.Position;
end;

procedure TForm_set.TrackBar_fsChange(Sender: TObject);
begin
  Form1.fontsize:=TrackBar_fs.Position;
  Form1.Panel1.Font.Size:= TrackBar_fs.Position;
end;

end.
