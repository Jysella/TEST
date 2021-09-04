unit Dodaj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TDodajForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    numer: TEdit;
    zapisz: TButton;
    anuluj: TButton;
    Label3: TLabel;
    nazwa: TEdit;
    Label4: TLabel;
    klient: TComboBox;
    Label5: TLabel;
    status: TComboBox;
    Label6: TLabel;
    dzlec: TDateTimePicker;
    Label7: TLabel;
    dodb: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cena: TEdit;
    ilosc: TEdit;
    wartosc: TEdit;
    Label11: TLabel;
    kolor: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    wx: TEdit;
    wy: TEdit;
    Label14: TLabel;
    naar: TEdit;
    reilosc: TButton;
    margines: TCheckBox;
    spady: TCheckBox;
    Label15: TLabel;
    papier: TComboBox;
    papcena: TEdit;
    Label16: TLabel;
    folia: TComboBox;
    Label17: TLabel;
    big: TComboBox;
    Label18: TLabel;
    skla: TComboBox;
    folcena: TEdit;
    bigcena: TEdit;
    sklacena: TEdit;
    kalk: TGroupBox;
    Label19: TLabel;
    koszt1: TEdit;
    Label20: TLabel;
    koszt2: TEdit;
    TrackBar1: TTrackBar;
    Label21: TLabel;
    Label22: TLabel;
    marza1: TEdit;
    marza2: TEdit;
    Label23: TLabel;
    ilosckar: TEdit;
    Button1: TButton;
    tcena1: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    tcena2: TEdit;
    zyska2: TEdit;
    zyska3: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    zyskb1: TEdit;
    zyskb2: TEdit;
    zyskb3: TEdit;
    cenawstaw: TButton;
    zyska1: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure numerChange(Sender: TObject);
    procedure cenaChange(Sender: TObject);
    procedure iloscChange(Sender: TObject);
    procedure wxChange(Sender: TObject);
    procedure wyChange(Sender: TObject);
    procedure zapiszClick(Sender: TObject);
    procedure cenaExit(Sender: TObject);
    procedure iloscExit(Sender: TObject);
    procedure wxExit(Sender: TObject);
    procedure wyExit(Sender: TObject);
    procedure reiloscClick(Sender: TObject);
    procedure naarChange(Sender: TObject);
    procedure marginesClick(Sender: TObject);
    procedure spadyClick(Sender: TObject);
    procedure papcenaChange(Sender: TObject);
    procedure papierChange(Sender: TObject);
    procedure papcenaExit(Sender: TObject);
    procedure wxDblClick(Sender: TObject);
    procedure foliaChange(Sender: TObject);
    procedure bigChange(Sender: TObject);
    procedure sklaChange(Sender: TObject);
    procedure folcenaChange(Sender: TObject);
    procedure bigcenaChange(Sender: TObject);
    procedure sklacenaChange(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ilosckarChange(Sender: TObject);
    procedure kolorChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure marza1Change(Sender: TObject);
    procedure koszt1Change(Sender: TObject);
    procedure cenawstawClick(Sender: TObject);
    procedure koszt2Change(Sender: TObject);
    procedure tcena1Enter(Sender: TObject);
    procedure tcena1Exit(Sender: TObject);
    procedure tcena1Change(Sender: TObject);
    procedure tcena2Change(Sender: TObject);
    procedure zyska1Change(Sender: TObject);
    procedure zyskb1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DodajForm: TDodajForm;
  n: integer;
  i: integer;
  y: integer;
  ok: boolean;
  m: currency;
  s: string;
  ax: integer;
  ay: integer;
  wxtemp: integer;
  wytemp: integer;
  srax: integer;
  sray: integer;
  druk: currency;
  druk2: currency;
  koszt: currency;
  kosztc: currency;

implementation

uses SOZ, formaty;

{$R *.dfm}

procedure wyliczkoszt;
begin
if (dodajform.ilosc.text<>'') and (dodajform.papcena.text<>'') then
  if (dodajform.naar.text<>'') and (dodajform.ilosckar.text<>'') then
    begin
    koszt:=(druk+strtocurr(dodajform.papcena.Text)) / strtoint(dodajform.naar.Text);
    koszt:=koszt+strtocurr(dodajform.folcena.Text)+strtocurr(dodajform.bigcena.Text)
            +strtocurr(dodajform.sklacena.Text);
    kosztc:= (druk2 / strtoint(dodajform.naar.Text)) + koszt  ;
    koszt:= koszt * strtoint(dodajform.ilosckar.Text);
    kosztc:= kosztc * strtoint(dodajform.ilosckar.Text);
    dodajform.koszt1.Text:=currtostr(koszt);
    dodajform.koszt2.Text:=currtostr(kosztc);
    end
    else dodajform.koszt1.Text:='uzupelnij'
    else dodajform.koszt1.Text:='uzupelnij';
if dodajform.koszt1.Text='uzupelnij' then dodajform.koszt2.text:='uzupelnij'
  else begin

       end;
end;

procedure wyliczilosc;
begin

  if dodajform.margines.Checked then
    begin
    srax:=445;
    sray:=315;
    end
  else
    begin
    srax:=450;
    sray:=320;
    end;

  if dodajform.spady.Checked then
    begin
    wxtemp:=strtoint(dodajform.wx.Text)+4;
    wytemp:=strtoint(dodajform.wy.Text)+4;
    end
  else
    begin
    wxtemp:=strtoint(dodajform.wx.Text);
    wytemp:=strtoint(dodajform.wy.text);
    end ;

ax:= (srax div wxtemp) * (sray div wytemp);
ay:= (srax div wytemp) * (sray div wxtemp);

if ax >= ay then dodajform.naar.Text:= inttostr(ax)
  else           dodajform.naar.Text:= inttostr(ay);

dodajform.reilosc.Enabled:=false;
end;

procedure TDodajForm.FormActivate(Sender: TObject);
begin

//line

n:= strtoint(form1.grid.cells[0,form1.grid.rowcount - 1]);

// numer
numer.Text:= inttostr(n+1);

//nazwa
nazwa.text:= 'zlec '+numer.Text;

//klient
klient.Text:='';
klient.Items.Clear;
for i:= 1 to l-1 do
begin
  ok:=true;
  for y:= 0 to i-1 do
  begin
  if form1.grid.Cells[2,i]=klient.Items.Strings[y] then ok:=false;
  end;
if ok then klient.Items.Add(form1.grid.Cells[2,i]);
end;

//status
status.Items.Clear;
status.Items.Add('zapytanie');
status.Items.Add('wycena');
status.Items.Add('potwierdzone');
status.Items.Add('zlecone');
status.Items.Add('realizacja');
status.Items.Add('wykonane');
status.Items.Add('odebrane');
status.Items.Add('zaplacone');
status.Items.Add('zakonczone');
status.Text:='zapytanie';

// daty

dzlec.Date := date;
dodb.Date := date+1;

// kolor
kolor.Items.Clear;
kolor.Items.Add('1+0');
kolor.Items.Add('1+1');
kolor.Items.Add('4+0');
kolor.Items.Add('4+1');
kolor.Items.Add('4+4');
kolor.ItemIndex:=4;
druk:=0.56;
druk2:=0.66;

//wartosc
wartosc.Enabled:=false;
//buton reilosc
reilosc.Enabled:=false;

//papiery
papier.Items.Clear;
papier.Items.Add('DCP 90');
papier.Items.Add('DCP 100');
papier.Items.Add('DCP 120');
papier.Items.Add('DCP 160');
papier.Items.Add('DCP 190');
papier.Items.Add('DCP 210');
papier.Items.Add('DCP 250');
papier.Items.Add('DCP 280');
papier.Items.Add('DCP 300');
papier.Items.Add('DCP 350');
papier.Items.Add('SI Mat 115');
papier.Items.Add('SI Mat 135');
papier.Items.Add('SI Mat 170');
papier.Items.Add('SI Mat 200');
papier.Items.Add('SI Mat 250');
papier.Items.Add('SI Mat 280');
papier.Items.Add('SI Mat 350');
papier.Items.Add('SI Gloss 115');
papier.Items.Add('SI Gloss 135');
papier.Items.Add('SI Gloss 170');
papier.Items.Add('SI Gloss 200');
papier.Items.Add('SI Gloss 250');
papier.Items.Add('SI Gloss 280');
papier.Items.Add('SI Gloss 350');
papier.Items.Add('MACTac Mat');
papcena.Enabled;

//folia
folia.Items.Clear;
folia.Items.Add('brak');
folia.Items.Add('1+0 Mat');
folia.Items.Add('1+1 Mat');
folia.Items.Add('1+0 Gloss');
folia.Items.Add('1+1 Gloss');
folia.Items.Add('1+1 M/G');
folia.ItemIndex:=0;
folcena.Text:='0';

//Bigowanie
big.Items.Clear;
big.Items.Add('0');
big.Items.Add('1');
big.Items.Add('2');
big.Items.Add('3');
big.Items.Add('4');
big.ItemIndex:=0;
bigcena.Text:='0';

//skladanie
skla.Items.Clear;
skla.Items.Add('0');
skla.Items.Add('1');
skla.Items.Add('2');
skla.Items.Add('3');
skla.Items.Add('4');
skla.ItemIndex:=0;
sklacena.Text:='0';

//nne
cena.Text:='';
ilosc.Text:='1';
wartosc.Text:='';
naar.Text:='';
ilosckar.Text:='1';
koszt1.Text:='';
koszt2.Text:='';
tcena1.Text:='';
tcena2.Text:='';
zyska1.Text:='';
zyska2.Text:='';
zyska3.Text:='';
zyskb1.Text:='';
zyskb2.Text:='';
zyskb3.Text:='';

end;

procedure TDodajForm.numerChange(Sender: TObject);
begin

try
if numer.Text<>'' then n:=strtoint (numer.Text);
except
showmessage('numer musi byc liczba');
end;

end;

procedure TDodajForm.cenaChange(Sender: TObject);
begin
try
if cena.Text<>'' then m:=strtocurr(cena.Text);
except
showmessage('cena musi byc liczba');
end;

if (trystrtocurr(cena.Text,m)) and (trystrtoint(ilosc.Text,n)) then
wartosc.Text:=currtostr(strtoint(ilosc.Text) * strtocurr(cena.Text))

end;

procedure TDodajForm.iloscChange(Sender: TObject);
begin
try
if ilosc.Text<>'' then n:=strtoint(ilosc.Text);
except
showmessage('ilosc musi byc liczba');
end;

if (trystrtocurr(cena.Text,m)) and (trystrtoint(ilosc.Text,n)) then
wartosc.Text:=currtostr(strtoint(ilosc.Text) * strtocurr(cena.Text));

if (trystrtocurr(tcena1.Text,m)) and (trystrtoint(ilosc.Text,n)) then
tcena2.Text:= currtostr((strtocurr(tcena1.Text))*(strtoint(ilosc.Text)));


end;

procedure TDodajForm.wxChange(Sender: TObject);
begin
try
if wx.Text<>'' then n:=strtoint(wx.Text);
except
showmessage('Wymiar X musi byc liczba');
end;

end;

procedure TDodajForm.wyChange(Sender: TObject);
begin
try
if wy.Text<>'' then n:=strtoint(wy.Text);
except
showmessage('Wymiar Y musi byc liczba');
end;

end;


procedure TDodajForm.zapiszClick(Sender: TObject);
begin
l:=l+1;
form1.grid.RowCount:=l;
form1.grid.Cells[0,l-1]:=numer.Text;
form1.grid.Cells[1,l-1]:=nazwa.Text;
form1.grid.Cells[2,l-1]:=klient.Text;
form1.grid.Cells[3,l-1]:=status.Text;
form1.grid.Cells[4,l-1]:=datetostr(dzlec.Date);
form1.grid.Cells[5,l-1]:=datetostr(dodb.Date);
form1.grid.Cells[6,l-1]:=cena.Text;
form1.grid.Cells[7,l-1]:=ilosc.Text;
form1.grid.Cells[8,l-1]:=wartosc.Text;
form1.grid.Cells[9,l-1]:=kolor.Text;
form1.grid.Cells[10,l-1]:=wx.Text;
form1.grid.Cells[11,l-1]:=wy.Text;
form1.grid.Cells[12,l-1]:=naar.Text;
form1.grid.Cells[13,l-1]:=ilosckar.Text;
form1.grid.Cells[14,l-1]:=papier.Text;
form1.grid.Cells[15,l-1]:=papcena.Text;
form1.grid.Cells[16,l-1]:=folia.Text;
form1.grid.Cells[17,l-1]:=big.Text;
form1.grid.Cells[18,l-1]:=skla.Text;
form1.grid.Cells[19,l-1]:=zyska2.Text;
end;


procedure TDodajForm.cenaExit(Sender: TObject);
begin
if (cena.Text<>'') and (ilosc.Text<>'') then
wartosc.Text:=currtostr(strtoint(ilosc.Text) * strtocurr(cena.Text))
else
wartosc.text:='';
if cena.Text[1] =',' then cena.Text:='0'+cena.Text;
end;

procedure TDodajForm.iloscExit(Sender: TObject);
begin
if (cena.Text<>'') and (ilosc.Text<>'') then
wartosc.Text:=currtostr(strtoint(ilosc.Text) * strtocurr(cena.Text))
else
wartosc.Text:='';
end;

procedure TDodajForm.wxExit(Sender: TObject);
begin
if (wx.Text<>'') and (wy.Text<>'') then
if(naar.Text='') then wyliczilosc
else reilosc.Enabled:=true;
end;

procedure TDodajForm.wyExit(Sender: TObject);
begin
if (wx.Text<>'') and (wy.Text<>'') then
if(naar.Text='') then wyliczilosc
else reilosc.Enabled:=true;
end;

procedure TDodajForm.reiloscClick(Sender: TObject);
begin
if (wx.Text<>'') and (wy.Text<>'') then
wyliczilosc;
reilosc.Enabled:=false;
wyliczkoszt;
end;

procedure TDodajForm.naarChange(Sender: TObject);
begin
reilosc.Enabled:=true;
if (folia.Text='') or (folia.Text='brak') then folcena.Text:='0'
     else folcena.Text:=currtostr(strtofloat('0,60') / strtocurr(naar.Text));
wyliczkoszt;
end;

procedure TDodajForm.marginesClick(Sender: TObject);
begin
reilosc.Enabled:=true;
end;

procedure TDodajForm.spadyClick(Sender: TObject);
begin
reilosc.Enabled:=true;
end;

procedure TDodajForm.papcenaChange(Sender: TObject);
begin
try
if papcena.Text<>'' then m:=strtocurr(papcena.Text);
except
showmessage('cena papieru musi byc liczba');
end;
wyliczkoszt;
end;

procedure TDodajForm.papierChange(Sender: TObject);
begin
papcena.Enabled:=false;
If papier.ItemIndex=0 then papcena.Text:='0,122';
If papier.ItemIndex=1 then papcena.Text:='0,136';
If papier.ItemIndex=2 then papcena.Text:='0,169';
If papier.ItemIndex=3 then papcena.Text:='0,226';
If papier.ItemIndex=4 then papcena.Text:='0,283';
If papier.ItemIndex=5 then papcena.Text:='0,333';
If papier.ItemIndex=6 then papcena.Text:='0,397';
If papier.ItemIndex=7 then papcena.Text:='0,481';
If papier.ItemIndex=8 then papcena.Text:='0,515';
If papier.ItemIndex=9 then papcena.Text:='0,600';
If papier.ItemIndex=10 then papcena.Text:='0,165';
If papier.ItemIndex=11 then papcena.Text:='0,194';
If papier.ItemIndex=12 then papcena.Text:='0,244';
If papier.ItemIndex=13 then papcena.Text:='0,287';
If papier.ItemIndex=14 then papcena.Text:='0,359';
If papier.ItemIndex=15 then papcena.Text:='0,402';
If papier.ItemIndex=16 then papcena.Text:='0,502';
If papier.ItemIndex=17 then papcena.Text:='0,165';
If papier.ItemIndex=18 then papcena.Text:='0,194';
If papier.ItemIndex=19 then papcena.Text:='0,244';
If papier.ItemIndex=20 then papcena.Text:='0,287';
If papier.ItemIndex=21 then papcena.Text:='0,359';
If papier.ItemIndex=22 then papcena.Text:='0,402';
If papier.ItemIndex=23 then papcena.Text:='0,502';
If papier.ItemIndex=24 then papcena.Text:='0,811';
If papier.ItemIndex=-1 then
  begin
  papcena.Text:='';
  papcena.Enabled:=true;
  end;

end;

procedure TDodajForm.papcenaExit(Sender: TObject);
begin
if papcena.Text[1] =',' then papcena.Text:='0'+papcena.Text;
end;

procedure TDodajForm.wxDblClick(Sender: TObject);
begin
formatyform.showmodal;

end;

procedure TDodajForm.foliaChange(Sender: TObject);
begin
if naar.text='' then
  begin
  If folia.ItemIndex=0 then folcena.Text:='0';
  If folia.ItemIndex=1 then folcena.Text:='0,60';
  If folia.ItemIndex=2 then folcena.Text:='0,60';
  If folia.ItemIndex=3 then folcena.Text:='0,60';
  If folia.ItemIndex=4 then folcena.Text:='0,60';
  If folia.ItemIndex=5 then folcena.Text:='0,60';
  end
  else
  begin
  if (folia.Text='') or (folia.Text='brak') then folcena.Text:='0'
     else folcena.Text:=currtostr(strtofloat('0,60') / strtocurr(naar.Text))
  end;
end;

procedure TDodajForm.bigChange(Sender: TObject);
begin
if trystrtoint(big.Text,n)=true then bigcena.Text:=floattostr(strtofloat('0,05') * strtofloat(big.Text));
end;

procedure TDodajForm.sklaChange(Sender: TObject);
begin
if trystrtoint(skla.Text,n)=true then sklacena.Text:=floattostr(strtofloat('0,05') * strtofloat(skla.Text));
end;

procedure TDodajForm.folcenaChange(Sender: TObject);
begin
try
if folcena.Text<>'' then m:=strtocurr(folcena.Text);
except
showmessage('cena foliowania musi byc liczba');
end;
wyliczkoszt;
end;

procedure TDodajForm.bigcenaChange(Sender: TObject);
begin
try
if bigcena.Text<>'' then m:=strtocurr(bigcena.Text);
except
showmessage('cena bigowania musi byc liczba');
end;
wyliczkoszt;
end;

procedure TDodajForm.sklacenaChange(Sender: TObject);
begin
try
if sklacena.Text<>'' then m:=strtocurr(sklacena.Text);
except
showmessage('cena skladania musi byc liczba');
end;
wyliczkoszt;
end;

procedure TDodajForm.TrackBar1Change(Sender: TObject);
begin
if trystrtocurr(marza1.Text,m) then

  if ((strtocurr(marza1.Text))<=500) or (trackbar1.position <500)
  then marza1.Text:= inttostr(trackbar1.position);

end;

procedure TDodajForm.ilosckarChange(Sender: TObject);
begin
try
if ilosckar.Text<>'' then n:=strtoint(ilosckar.Text);
except
showmessage('Ilosc kartek musi byc liczba');
end;
wyliczkoszt;
end;

procedure TDodajForm.kolorChange(Sender: TObject);
begin
if kolor.ItemIndex=0 then begin druk:=0.067; druk2:=0.06; end;
if kolor.ItemIndex=1 then begin druk:=0.134; druk2:=0.12; end;
if kolor.ItemIndex=2 then begin druk:=0.28; druk2:=0.33; end;
if kolor.ItemIndex=3 then begin druk:=0.347; druk2:=0.39; end;
if kolor.ItemIndex=4 then begin druk:=0.56; druk2:=0.66; end;
wyliczkoszt;
end;

procedure TDodajForm.Button1Click(Sender: TObject);
begin
wyliczkoszt;
end;

procedure TDodajForm.marza1Change(Sender: TObject);
begin
//if (trystrtocurr(marza1.Text,m)) then
//  begin
//  if ((strtocurr(marza1.Text))<=500)
//    then trackbar1.Position:= (round(strtocurr(marza1.Text)))
//    else trackbar1.Position:=500;
//  end;
if (trystrtocurr(koszt1.Text,m)) and (trystrtoint(marza1.Text,n)) then
  tcena1.Text:=currtostr((strtocurr(koszt1.Text))*(strtocurr(marza1.Text))/100+(strtocurr(koszt1.Text)));
end;

procedure TDodajForm.koszt1Change(Sender: TObject);
begin
if (trystrtocurr(koszt1.Text,m)) and (trystrtoint(marza1.Text,n)) then
  tcena1.Text:=currtostr((strtocurr(koszt1.Text))*(strtocurr(marza1.Text))/100+(strtocurr(koszt1.Text)));

end;

procedure TDodajForm.cenawstawClick(Sender: TObject);
begin
if (trystrtocurr(tcena1.Text,m)) then cena.Text:=tcena1.Text;
end;

procedure TDodajForm.koszt2Change(Sender: TObject);
begin
if (trystrtocurr(koszt2.Text,m)) and (trystrtocurr(tcena1.Text,m)) then
marza2.Text:= currtostr(((strtocurr(tcena1.Text)) - (strtocurr(koszt2.Text)))/ (strtocurr(koszt2.Text))*100);
end;

procedure TDodajForm.tcena1Enter(Sender: TObject);
begin
if (trystrtocurr(koszt2.Text,m)) and (trystrtocurr(tcena1.Text,m)) then
marza2.Text:= currtostr(((strtocurr(tcena1.Text)) - (strtocurr(koszt2.Text)))/ (strtocurr(koszt2.Text))*100);
if (trystrtocurr(koszt1.Text,m)) and (trystrtocurr(tcena1.Text,m)) then
marza1.Text:= currtostr(((strtocurr(tcena1.Text)) - (strtocurr(koszt1.Text)))/ (strtocurr(koszt1.Text))*100);
end;

procedure TDodajForm.tcena1Exit(Sender: TObject);
begin
if (trystrtocurr(koszt2.Text,m)) and (trystrtocurr(tcena1.Text,m)) then
marza2.Text:= currtostr(((strtocurr(tcena1.Text)) - (strtocurr(koszt2.Text)))/ (strtocurr(koszt2.Text))*100);
if (trystrtocurr(koszt1.Text,m)) and (trystrtocurr(tcena1.Text,m)) then
marza1.Text:= currtostr(((strtocurr(tcena1.Text)) - (strtocurr(koszt1.Text)))/ (strtocurr(koszt1.Text))*100);
end;

procedure TDodajForm.tcena1Change(Sender: TObject);
begin
if (trystrtocurr(koszt2.Text,m)) and (trystrtocurr(tcena1.Text,m)) then
marza2.Text:= currtostr(((strtocurr(tcena1.Text)) - (strtocurr(koszt2.Text)))/ (strtocurr(koszt2.Text))*100);
if (trystrtocurr(koszt1.Text,m)) and (trystrtocurr(tcena1.Text,m)) then
marza1.Text:= currtostr(((strtocurr(tcena1.Text)) - (strtocurr(koszt1.Text)))/ (strtocurr(koszt1.Text))*100);

if (trystrtocurr(tcena1.Text,m)) then tcena2.Text:= currtostr((strtocurr(tcena1.Text))*(strtoint(ilosc.Text)));

if (trystrtocurr(tcena1.Text,m)) and (trystrtocurr(koszt1.Text,m))
then zyska1.Text:= currtostr((strtocurr(tcena1.Text))-(strtocurr(koszt1.Text)));

if (trystrtocurr(tcena1.Text,m)) and (trystrtocurr(koszt2.Text,m))
then zyskb1.Text:= currtostr((strtocurr(tcena1.Text))-(strtocurr(koszt2.Text)));

end;

procedure TDodajForm.tcena2Change(Sender: TObject);
begin
if (trystrtocurr(tcena2.Text,m)) and (trystrtocurr(koszt1.Text,m)) then
begin
if ilosc.Text<>''
then zyska2.Text:= currtostr((strtocurr(tcena2.Text))-(strtocurr(koszt1.Text))*(strtoint(ilosc.Text)));
end;

if (trystrtocurr(tcena2.Text,m)) and (trystrtocurr(koszt2.Text,m)) then
begin
if ilosc.Text<>''
then zyskb2.Text:= currtostr((strtocurr(tcena2.Text))-(strtocurr(koszt2.Text))*(strtoint(ilosc.Text)));
end;

end;

procedure TDodajForm.zyska1Change(Sender: TObject);
begin
if (trystrtocurr(zyska1.Text,m))
then zyska3.Text:= currtostr((strtocurr(zyska1.Text))/(strtoint(ilosckar.Text))*(strtoint(naar.Text)));
end;

procedure TDodajForm.zyskb1Change(Sender: TObject);
begin
if (trystrtocurr(zyskb1.Text,m))
then zyskb3.Text:= currtostr((strtocurr(zyskb1.Text))/(strtoint(ilosckar.Text))*(strtoint(naar.Text)));
end;

end.
