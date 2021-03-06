unit SOZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    grid: TStringGrid;
    Button1: TButton;
    Dodaj: TButton;
    IdFTP1: TIdFTP;
    online: TCheckBox;
    update: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DodajClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure updateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  F: textfile;
  z: char;
  i: integer;
  s: string;
  y: boolean;
  l: integer;

implementation

uses Dodaj;

{$R *.dfm}
procedure fopen;
begin
repeat
read(F,z);
Until z='<';
end;

procedure fclose;
begin
repeat
read(F,z);
Until z='>';
end;

procedure readlab;
begin
s:='';
repeat
read(F,z);
if z<>'>' then s:=s+z;
Until z='>';
end;

procedure readval;
begin
s:='';
repeat
read(F,z);
if z<>'<' then s:=s+z;
Until z='<';
end;

procedure import;
begin
if form1.online.checked then
  begin

  AssignFile(F,'C:\!Marcin\zlecenia.xml');
  if FileExists('C:\!Marcin\zlecenia.old') then
  DeleteFile('C:\!Marcin\zlecenia.old');
  Rename(F,'C:\!Marcin\zlecenia.old');
  form1.IdFTP1.Connect();
  form1.IdFTP1.Get('zlecenia.xml','C:\!Marcin\zlecenia.xml');
  form1.IdFTP1.Disconnect;
  Showmessage('Import z FTP zakonczony');
  end;
AssignFile(F,'C:\!Marcin\zlecenia.xml');
Reset(F);
y:=false;
l:=1;
fclose;
fclose;
 repeat
    fclose;
    readval;
    Form1.grid.Cells[0,l]:=s;
    for i:= 1 to 19 do
    begin
    fclose;
    fclose;
    readval;
    form1.grid.Cells[i,l]:=s;
    end;
 fopen;
 fopen;
 readlab;
 if s='/baza' then y:=true;
 l:=l+1;
 form1.grid.RowCount:=l+1;
 Until y;
form1.grid.RowCount:=l;

Closefile(F);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
grid.Cells[0,0]:='Numer'; grid.ColWidths[0]:=80;
grid.Cells[1,0]:='Nazwa'; grid.ColWidths[1]:=120;
grid.Cells[2,0]:='Klient'; grid.ColWidths[2]:=120;
grid.Cells[3,0]:='Status'; grid.ColWidths[3]:=100;
grid.Cells[4,0]:='Data zlec'; grid.ColWidths[4]:=75;
grid.Cells[5,0]:='Data odb'; grid.ColWidths[5]:=75;
grid.Cells[6,0]:='Cena'; grid.ColWidths[6]:=60;
grid.Cells[7,0]:='Ilosc'; grid.ColWidths[7]:=60;
grid.Cells[8,0]:='Wartosc'; grid.ColWidths[8]:=60;
grid.Cells[9,0]:='Kolor'; grid.ColWidths[9]:=50;
grid.Cells[10,0]:='X'; grid.ColWidths[10]:=40;
grid.Cells[11,0]:='Y'; grid.ColWidths[11]:=40;
grid.Cells[12,0]:='Na Ar'; grid.ColWidths[12]:=40;
grid.Cells[13,0]:='Ilosc k'; grid.ColWidths[13]:=40;
grid.Cells[14,0]:='Papier'; grid.ColWidths[14]:=120;
grid.Cells[15,0]:='Cena P'; grid.ColWidths[15]:=60;
grid.Cells[16,0]:='Folia'; grid.ColWidths[16]:=60;
grid.Cells[17,0]:='Big'; grid.ColWidths[17]:=40;
grid.Cells[18,0]:='Skla'; grid.ColWidths[18]:=40;
grid.Cells[19,0]:='Zysk'; grid.ColWidths[19]:=60;


end;

procedure TForm1.Button1Click(Sender: TObject);

begin
import;
end;

procedure TForm1.DodajClick(Sender: TObject);
begin
DodajForm.showmodal;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
import;
end;

procedure TForm1.gridDblClick(Sender: TObject);
begin

showmessage('wybrany element '+inttostr(grid.selection.top));
end;

procedure TForm1.updateClick(Sender: TObject);
begin
AssignFile(F,'C:\!Marcin\zlecenia.xml');
  if FileExists('C:\!Marcin\zlecenia.old2') then
  DeleteFile('C:\!Marcin\zlecenia.old2');
  Rename(F,'C:\!Marcin\zlecenia.old2');

AssignFile(F,'C:\!Marcin\zlecenia.xml');
Rewrite(F);

Writeln(F,'<baza>');
for i:= 1 to l-1 do
  begin
  writeln(F,'<zlecenie>');
  s:='<numer>'+grid.Cells[0,i]+'</numer>';
  writeln(F,s);
  s:='<nazwa>'+grid.Cells[1,i]+'</nazwa>';
  writeln(F,s);
  s:='<klient>'+grid.Cells[2,i]+'</klient>';
  writeln(F,s);
  s:='<status>'+grid.Cells[3,i]+'</status>';
  writeln(F,s);
  s:='<dzlec>'+grid.Cells[4,i]+'</dzlec>';
  writeln(F,s);
  s:='<dodb>'+grid.Cells[5,i]+'</dodb>';
  writeln(F,s);
  s:='<cena>'+grid.Cells[6,i]+'</cena>';
  writeln(F,s);
  s:='<ilosc>'+grid.Cells[7,i]+'</ilosc>';
  writeln(F,s);
  s:='<wartosc>'+grid.Cells[8,i]+'</wartosc>';
  writeln(F,s);
  s:='<kolor>'+grid.Cells[9,i]+'</kolor>';
  writeln(F,s);
  s:='<x>'+grid.Cells[10,i]+'</x>';
  writeln(F,s);
  s:='<y>'+grid.Cells[11,i]+'</y>';
  writeln(F,s);
  s:='<naar>'+grid.Cells[12,i]+'</naar>';
  writeln(F,s);
  s:='<ilosckar>'+grid.Cells[13,i]+'</ilosckar>';
  writeln(F,s);
  s:='<papier>'+grid.Cells[14,i]+'</papier>';
  writeln(F,s);
  s:='<papcena>'+grid.Cells[15,i]+'</papcena>';
  writeln(F,s);
  s:='<folia>'+grid.Cells[16,i]+'</folia>';
  writeln(F,s);
  s:='<big>'+grid.Cells[17,i]+'</big>';
  writeln(F,s);
  s:='<skla>'+grid.Cells[18,i]+'</skla>';
  writeln(F,s);
  s:='<zysk>'+grid.Cells[19,i]+'</zysk>';
  writeln(F,s);
  writeln(F,'</zlecenie>');
  end;
Writeln(F,'</baza>');
Closefile(F);
Showmessage('Zapis zako?czony');
end;

end.
