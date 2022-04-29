unit Calendar_app_unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls,DateUtils;

type
  TCalendarApp = class(TForm)
    CalendarView1: TCalendarView;
    Label1: TLabel;
    SelectedDateText: TLabel;
    NbrDays: TEdit;
    Label2: TLabel;
    GetButton: TButton;
    DateRetour: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    JourEdit: TEdit;
    MonthEdit: TEdit;
    YearEdit: TEdit;
    Label5: TLabel;
    procedure CalendarView1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetButtonClick(Sender: TObject);
    procedure func1(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalendarApp: TCalendarApp;  ndays : integer;  currentDate : TDateTime;

implementation

{$R *.dfm}

procedure TCalendarApp.CalendarView1Change(Sender: TObject);
  // Variables
var
    SelectedDate : TDateTime; Year,Month,Day : word;

begin
    // input
       SelectedDate := CalendarView1.SelectedDates[0];
       DecodeDate(SelectedDate, Year, Month, Day);
       MonthEdit.Text := IntToStr(Month);
       JourEdit.Text := IntToStr(Day);
       YearEdit.Text := IntToStr(Year);
    // Processing

    // Output
     //  SelectedDateText.Caption := formatdatetime('d mmmm yyyy', SelectedDate);
        //DateToStr(SelectedDate);

end;



procedure TCalendarApp.FormCreate(Sender: TObject);
begin
       currentDate := Now;
       SelectedDateText.Caption :=  formatdatetime('d mmmm yyyy', currentDate);
end;

procedure TCalendarApp.func1(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   TypedDate: TDateTime;
begin
  if (Key = VK_RETURN) then
  begin
    //ShowMessage(' A number must be entered');
    if NbrDays.Text <> '' then
    begin
      ndays := StrToInt(NbrDays.Text);
      if (JourEdit.Text <> '') AND (MonthEdit.Text <> '') AND (YearEdit.Text <> '') then
    begin
     TypedDate := EncodeDate(StrToInt(YearEdit.Text),StrToInt(MonthEdit.Text),StrToInt(JourEdit.Text));
     DateRetour.Caption := formatdatetime('d mmmm yyyy', TypedDate+ ndays);
    end;
    //DateRetour.Caption := formatdatetime('d mmmm yyyy',(CalendarView1.SelectedDates[0]
    //+ ndays));
    end
    else
    begin
      ShowMessage(' A number must be entered');
    end;



  end;
end;
procedure TCalendarApp.GetButtonClick(Sender: TObject);
var
    TypedDate : TDateTime;
begin
        if NbrDays.Text <> '' then
    begin
      ndays := StrToInt(NbrDays.Text);
      if (JourEdit.Text <> '') AND (MonthEdit.Text <> '') AND (YearEdit.Text <> '') then
    begin
     TypedDate := EncodeDate(StrToInt(YearEdit.Text),StrToInt(MonthEdit.Text),StrToInt(JourEdit.Text));
     DateRetour.Caption := formatdatetime('d mmmm yyyy', TypedDate+ ndays);
    end;
    //DateRetour.Caption := formatdatetime('d mmmm yyyy',(CalendarView1.SelectedDates[0]
    //+ ndays));
    end
    else
    begin
      ShowMessage(' A number must be entered');
    end;
end;



end.
