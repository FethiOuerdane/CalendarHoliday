program Project1_calendar;

uses
  Vcl.Forms,
  Calendar_app_unit1 in 'Calendar_app_unit1.pas' {CalendarApp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCalendarApp, CalendarApp);
  Application.Run;
end.
