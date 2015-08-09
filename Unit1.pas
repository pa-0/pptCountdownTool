unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Menus, Gauges, CoolTrayIcon,IniFiles,
  TextTrayIcon,MMSYSTEM, FileCtrl;
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
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    SpeedButton2: TSpeedButton;
    PopupMenu1: TPopupMenu;
    exit1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    TextTrayIcon1: TTextTrayIcon;
    Timer_ppt: TTimer;
    About1: TMenuItem;
    N4: TMenuItem;
    set1: TMenuItem;
    reset1: TMenuItem;
    Panel1: TPanel;
    FileListBox1: TFileListBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure exit1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Timer_pptTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure set1Click(Sender: TObject);
    procedure reset1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    isrun :integer;     //判断ppt是否在运行 0 非 1 是
    istime:integer;     //判断本软件是否在计时ppt 0 非 1 是  2已超时
    maxtime:integer;     //
    hinttime:integer;   //提示时间
    curtime:integer;     //当前时间
   // procedure OnMessage(var Msg: TMsg; var Handled: Boolean);

   inifilename:String;
   ALPHA_i:integer;

   hintfilename:String;
   endfilename:String;
   FontName   :String;
   FontColor   :integer;
   fontsizebak:integer;

   PrevPPT :String;//记录前一个演示ppt的文档
   curPPT  :String;//记录当前演示ppt的文档名称

  // Procedure MoveForm(var M:TWMNCHITTEST);Message WM_NCHITTEST;
  public
    { Public declarations }
    Fontsize   :integer;
  end;
function SetLayeredWindowAttributes(hwnd:HWND; crKey:Longint; bAlpha:byte; dwFlags:longint ):longint; stdcall; external user32;//函数声明

var
  Form1: TForm1;

implementation

uses Unit_set;

{$R *.dfm}

{
Procedure TForm1.MoveForm (var M:TWMNCHITTEST);
var
  s:String;
begin
  s:=IntToStr(M.Result);
inHerited;                             //继承，窗体可以继续处理以后的事件
   Panel1.Caption:=IntToStr(M.Result)+':'+s;

if (M.Result=HTCLIENT)    //如果发生在客户
//  and ((GetKeyState(vk_CONTROL) < 0))          //检测“Ctrl”键是否按下
then M.Result:=HTCAPTION;                    //更改“.Result”域的值



end;
}
procedure TForm1.SpeedButton1Click(Sender: TObject);
var
WinText:array[0..255] of char;
h: HWND;
begin
   h := FindWindow('screenClass',nil);
  if h=0 then
  begin
     //Memo1.Lines.Add('no');
     isrun:=0;
  end
  else
  begin
     //Memo1.Lines.Add('ok');
     if GetWindowText(h,@WinText,255)>0 then
        begin
            curPPT:=  WinText;
        end;
     isrun:=1;
  end;

  if isrun=0 then
  begin
   // istime
   Timer_ppt.Enabled:=false;
   //Label1.Caption:='00:00';
   Panel1.Caption:=Format('%.2d',[ maxtime div 60 ])+':'+Format('%.2d',[maxtime mod 60]);
   Panel1.Font.Size:=Fontsize;
   //Gauge1.Progress:=100;
   istime:=0;
   Panel1.Font.Color:=clYellow; //
  end
  else
  begin

   if istime=0 then
      begin
       Timer_ppt.Enabled:=true;
       //Label1.Caption:='05:00';
       //Gauge1.Progress:=100;
       istime:=1;
       //  PrevPPT
       if not (PrevPPT=curPPT) then
           begin
            curtime:=maxtime;
            PrevPPT:=curPPT;//未测试
           end
       else
          begin

          end;

       setwindowpos(self.handle,HWND(-1),0,0,0,0,SWP_NOMOVE  or  SWP_NOSIZE);//窗口置顶
      end;
    if istime=2 then  //超时提示
      begin
       Panel1.Caption:='Timeout';
       Panel1.Font.Size:=Fontsize-8;
          
      end;
  end
  


end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 
SpeedButton1.Click;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var l:longint;

begin
 l:=getWindowLong(Handle, GWL_EXSTYLE);
  l := l Or WS_EX_LAYERED;
  SetWindowLong (handle, GWL_EXSTYLE, l);
  SetLayeredWindowAttributes (handle, 0, ALPHA_i, LWA_ALPHA);
//第二个参数是指定透明颜色
//第二个参数为0则使用第四个参数设置alpha值，从0到255，其他的我不太清楚，因为没有api帮助

end;

procedure TForm1.FormCreate(Sender: TObject);
var l:longint;
mm:integer;
MyIniFile: TIniFile;
begin

     mm:=strtoint(formatdatetime('yyyy',now()));
     if mm >2014 then
       begin
          Randomize;
          if Random(10)>3 then
            About1.Click;
       end;                   
inifilename:= 'pptCountdown.ini';        //ExtractFilePath(Application.ExeName)+
MyIniFile := TIniFile.Create(inifilename);
left:=MyIniFile.ReadInteger('window','left',screen.Width-200);

top:=MyIniFile.ReadInteger('window','top',10);
Width:=MyIniFile.ReadInteger('window','Width',110);
Height:=MyIniFile.ReadInteger('window','Height',40);

maxtime:=MyIniFile.ReadInteger('run','maxtime',300);
hinttime:=MyIniFile.ReadInteger('run','hinttime',60);
ALPHA_i :=MyIniFile.ReadInteger('window','ALPHA',180);
hintfilename :=ExtractFileName(MyIniFile.ReadString('play','hint','quikly.wav'));
endfilename :=ExtractFileName(MyIniFile.ReadString('play','end','end.wav'));

//showMessage(Label1.Font.Name);

FontName  :=MyIniFile.ReadString('text','FontName','微软雅黑');
//FontColor :=MyIniFile.ReadInteger('text','FontColor',clYellow);
Fontsize  :=MyIniFile.ReadInteger('text','Fontsize',28);
Panel1.Font.Name:=FontName;
  //taCenter;
  //TAlignment;


MyIniFile.Free;

Panel1.Caption:=Format('%.2d',[ maxtime div 60 ])+':'+Format('%.2d',[maxtime mod 60]);

l:=getWindowLong(Handle, GWL_EXSTYLE);
l := l Or WS_EX_LAYERED;
SetWindowLong (handle, GWL_EXSTYLE, l);
SetLayeredWindowAttributes (handle, 0, ALPHA_i, LWA_ALPHA);
  
isrun:=0;
istime :=0;

if ParamCount >0 then
begin
   if ParamStr(1)= 'setshow' then
      set1.Visible:=true;
end;


 //SpeedButton2.Click;
end;
procedure TForm1.exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N2Click(Sender: TObject);
var
curw,curh,i:integer;
begin
// SetLayeredWindowAttributes (handle, 0, 255, LWA_ALPHA);
Form_set := TForm_set.Create(Application);

    Form_set.SpinEdit1.Value:=  maxtime div 60;
    Form_set.SpinEdit2.Value:=  hinttime div 60;
    Form_set.TrackBar1.Position:= ALPHA_i;
    //Form_set.Edit1.Text:=endfilename;
    //Form_set.Edit2.Text:=hintfilename;


    FileListBox1.Directory:= ExtractFilePath(Application.ExeName);
    for i:=0 to FileListBox1.Items.Count-1 do
      begin
         Form_set.ComboBox_p1.Items.Add(FileListBox1.Items.Strings[i]);
         Form_set.ComboBox_p2.Items.Add(FileListBox1.Items.Strings[i]);
      end;

    Form_set.ComboBox_p1.Text:= endfilename;
    Form_set.ComboBox_p2.Text:= hintfilename;


    //FontName  :=MyIniFile.ReadString('text','FontName','微软雅黑');
    //Label1.Font.Name:=FontName;
    {
    Form_set.Edit_fontname.Font.Name:= FontName;
    Form_set.Edit_fontname.Font.Size:= Fontsize;
    Form_set.Edit_fontname.Font.Color:= FontColor;

    Form_set.FontDialog1.Font.Name:= FontName;
    Form_set.FontDialog1.Font.Size:= Fontsize;
    Form_set.FontDialog1.Font.Color:= FontColor;
    }
    Form_set.ComboBox1.Text:= FontName;
    Form_set.TrackBar_fs.Position:= Fontsize;

    Form_set.TrackBarw.Position:=Width;
    Form_set.TrackBarh.Position:=Height;

    curw:=Width;
    curh:=Height;
    fontsizebak:=fontsize;
    if Form_set.ShowModal=mrOK then
    begin
      maxtime:= Form_set.SpinEdit1.Value*60;
      hinttime:= Form_set.SpinEdit2.Value*60;
      ALPHA_i:= Form_set.TrackBar1.Position;
      hintfilename:=Form_set.ComboBox_p2.Text ;
      endfilename :=Form_set.ComboBox_p1.Text ;
      Fontsize:=Form_set.TrackBar_fs.Position;

      FontName := Form_set.ComboBox1.Text;
      Panel1.Font.Name:= FontName;
    end
    else
    begin
      Width  :=curw;  //窗体还原
      Height :=curh;
      Panel1.Font.Size:=Fontsize;
      Panel1.Font.Name:=FontName;
      fontsize:=fontsizebak;
    end;
    SpeedButton2.Click;
    Form_set.Free;
 
end;

procedure TForm1.Timer_pptTimer(Sender: TObject);
begin
//计时
//    setwindowpos(self.handle,HWND(-1),0,0,0,0,SWP_NOMOVE  or  SWP_NOSIZE);//窗口置顶
   if curtime<1 then
    begin
      Timer_ppt.Enabled:=false;
      istime:=2;
      exit;      
    end;
   curtime:=curtime-1;
   Panel1.Caption:=Format('%.2d',[ curtime div 60 ])+':'+Format('%.2d',[curtime mod 60]);
   //Gauge1.Progress:= integer(Trunc(curtime*1.0/maxtime*100));

   if curtime= hinttime then
    begin
       //Panel1.Font.Color:=clRed; //clYellow
       sndPlaySound(Pchar(hintfilename),SND_ASYNC);
       //TextTrayIcon1.ShowBalloonHint('提醒','你还剩' +inTtoStr(curtime)+ '秒的时间',
       //                     bitInfo, 10);
    end;
   if curtime < hinttime then
    begin
       if (curtime mod 2) =0 then
        Panel1.Font.Color:=clRed
       else
        Panel1.Font.Color:=clYellow;
    end;

   if curtime= 1 then
    begin
       sndPlaySound(Pchar(endfilename),SND_ASYNC);
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
MyIniFile: TIniFile;
begin
  MyIniFile := TIniFile.Create(inifilename);
  MyIniFile.WriteInteger('window','left',left);
  MyIniFile.WriteInteger('window','top',top);
  MyIniFile.WriteInteger('window','Width',Width);
  MyIniFile.WriteInteger('window','Height',Height);

  MyIniFile.WriteInteger('run','maxtime',maxtime);
  MyIniFile.WriteInteger('run','hinttime',hinttime);

  MyIniFile.WriteInteger('window','ALPHA',ALPHA_i);
  MyIniFile.WriteString('play','hint',hintfilename);
  MyIniFile.WriteString('play','end',endfilename);

  MyIniFile.WriteString('text','FontName',FontName);
//  MyIniFile.WriteInteger('text','FontColor',FontColor);
  MyIniFile.WriteInteger('text','Fontsize',Fontsize);



MyIniFile.Free;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
MessageBox(Handle,PChar('关于PPT Countdown(PPT倒计时器)'
                         +#13+'Author:王一冰'
                         +#13+'Free'

                         +#13+'东北大学机械可靠性与动力学研究中心'
                         +#13+'有问题联系:wangybcn@gmail.com'
                         +#13+'V1.0.6.0'
                         +#13+'2014.4'
                         
),'About PPT Countdown(PPT倒计时器)',MB_OK);

end;

procedure TForm1.FormShow(Sender: TObject);

begin

TextTrayIcon1.ShowBalloonHint('提示','PPT Countdown(PPT倒计时器)准备就绪'
                                + #13+'PPT文件演示后,自动计时'
                                + #13+'提示:'

                                + #13+'右键点击这里或窗体进行设置和退出'
                                + #13+'拖动窗体改变窗体位置'
                                 + #13+'━━━━━━━━━━━━━━━━'
                                + #13+'东北大学机械可靠性与动力学研究中心',
                            bitInfo, 10);

end;

procedure TForm1.set1Click(Sender: TObject);
var
WinText:array[0..255] of char;
h: HWND;
begin
 h := FindWindow('screenClass',nil);
  if h<>0 then
  begin
      if GetWindowText(h,@WinText,255)>0 then
      TextTrayIcon1.ShowBalloonHint('Hint',StrPas(@WinText),
                                  bitInfo, 10);
  end;
  Playsound('HINT',HInstance,SND_ASYNC or SND_RESOURCE);
 // sndPlaySound(Pchar(endfilename),SND_ASYNC); //or Snd_Memory
 //TextTrayIcon1.ShowBalloonHint('Hint',intToStr(ParamCount),
 //                                 bitInfo, 10);
 setwindowpos(self.handle,HWND(-1),0,0,0,0,SWP_NOMOVE  or  SWP_NOSIZE);//窗口置顶

//setwindowpos(self.handle,HWND_NOTOPMIOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE);//取消窗口置顶
//win7 下 当ppt演示完的最后一页时 遇到播完的情况 会出现程序跑到后面去的情况 xp下没有这个情况
//screen.
end;

procedure TForm1.reset1Click(Sender: TObject);
begin
if MessageDlg('还原程序配置?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

      left:=100;
      top:=10;
      Width:=110;
      Height:=40;
      ALPHA_i :=180;
      hintfilename :='quikly.wav';
      endfilename :='end.wav';
      FontName  :='微软雅黑';
      Fontsize  :=28;
      Panel1.Font.Name:=FontName;
  end;

end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
SendMessage(Self.Handle,WM_NCLBUTTONDOWN,HTCAPTION,0);
end;

end.
