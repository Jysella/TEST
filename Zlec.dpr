program Zlec;

uses
  Forms,
  SOZ in 'SOZ.pas' {Form1},
  Dodaj in 'Dodaj.pas' {DodajForm},
  formaty in 'formaty.pas' {FormatyForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDodajForm, DodajForm);
  Application.CreateForm(TFormatyForm, FormatyForm);
  Application.Run;
end.
