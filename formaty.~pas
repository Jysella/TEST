unit formaty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormatyForm = class(TForm)
    wybor: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    wstaw: TButton;
    anuluj: TButton;
    procedure wstawClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormatyForm: TFormatyForm;

implementation

uses Dodaj;

{$R *.dfm}

procedure TFormatyForm.wstawClick(Sender: TObject);
begin
if radiobutton2.Checked then
  begin
  dodajform.wx.text:='420';
  dodajform.wy.text:='297';
  dodajform.reilosc.Enabled:=true;
  end;
if radiobutton3.Checked then
  begin
  dodajform.wx.text:='297';
  dodajform.wy.text:='210';
  dodajform.reilosc.Enabled:=true;
  end;
if radiobutton4.Checked then
  begin
  dodajform.wx.text:='210';
  dodajform.wy.text:='148';
  dodajform.reilosc.Enabled:=true;
  end;
if radiobutton5.Checked then
  begin
  dodajform.wx.text:='148';
  dodajform.wy.text:='105';
  dodajform.reilosc.Enabled:=true;
  end;
if radiobutton6.Checked then
  begin
  dodajform.wx.text:='210';
  dodajform.wy.text:='99';
  dodajform.reilosc.Enabled:=true;
  end;

end;

end.
