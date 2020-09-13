unit ktksunit;

{$mode objfpc}{$H+}

{ info:
Fixed-fixed: This is the most rigid form of end fixity. It provides the highest speed capability and support for buckling loads, but it doesn’t allow any axial movement of the screw in the case of thermal expansion. Screws that are placed in tension, such as those used with driven ball nuts, use fixed-fixed bearing supports.
Fixed-floating (aka fixed-simple): This is probably the most common type of end fixity. It provides both axial and radial support for the screw and contributes to high critical speeds and buckling loads, while still allowing for thermal expansion of the screw shaft.
Floating-floating (aka simple-simple): This bearing arrangement has the benefit of easy mounting while still providing radial support for the screw. It also allows for compliance in the axial direction.
Fixed-free: Leaving one end of the screw assembly “free” (without bearing support) simplifies mounting, but greatly reduces the critical speed and buckling load capabilities. Thus, fixed-free support is used only for applications with short screw lengths and slow speeds.
}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button_beregn: TButton;
    ComboBox_kd: TComboBox;
    Edit_nk: TEdit;
    Edit_nmax: TEdit;
    Edit_maksfart: TEdit;
    FloatSpinEdit_lead: TFloatSpinEdit;
    FloatSpinEdit_di: TFloatSpinEdit;
    FloatSpinEdit_kritisklengde: TFloatSpinEdit;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button_beregnClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button_beregnClick(Sender: TObject);
var
  kd : Extended;
begin
    if ComboBox_kd.Text = 'A kd=2.74' then kd := 2.74
    else if ComboBox_kd.Text = 'B kd=1.88' then kd := 1.88
    else if ComboBox_kd.Text = 'C kd=1.22' then kd := 1.22
    else kd:=0.42;

    Edit_nk.Text:=FloatToStr( kd * (FloatSpinEdit_di.Value/(FloatSpinEdit_kritisklengde.Value*FloatSpinEdit_kritisklengde.Value)  ) * 100000000  );
    Edit_nmax.Text:= FloatToStr(StrToFloat(Edit_nk.Text) * 0.8);
    Edit_maksfart.Text:= FloatToStr((StrToFloat(Edit_nmax.Text) / 60) * FloatSpinEdit_lead.Value);
end;

end.

