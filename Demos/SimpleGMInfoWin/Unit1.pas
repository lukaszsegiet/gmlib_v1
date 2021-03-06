unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GMMap, GMLinkedComponents, GMInfoWindow,
  GMClasses, GMMapVCL, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    bDo: TButton;
    WebBrowser1: TWebBrowser;
    GMMap1: TGMMap;
    GMInfoWindow1: TGMInfoWindow;
    procedure bDoClick(Sender: TObject);
    procedure GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.bDoClick(Sender: TObject);
begin
  // At design-time
  //   - bDo.Enabled := False
  //   - GMInfoWindow1.Map := GMMap1
  //   - GMMap1.WebBrowser := WebBrowser1
  //   - GMMap1.Active := True
  //   - GMMap1.RequiredProp.Center.Lat := 41,39963248
  //   - GMMap1.RequiredProp.Center.Lng := 2,16794777
  // At run-time
  //   - Event GMMap1.AfterPageLoaded
  GMInfoWindow1.Add(GMMap1.RequiredProp.Center.Lat, GMMap1.RequiredProp.Center.Lng, 'A InfoWindows Test');
  GMInfoWindow1.Items[0].OpenClose;
end;

procedure TForm1.GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
begin
  if First then
  begin
    GMMap1.DoMap;
    bDo.Enabled := True;
  end;
end;

end.
