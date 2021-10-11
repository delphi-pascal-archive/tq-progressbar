unit Unit1;

interface

uses
   StdCtrls, ComCtrls, Controls, ExtCtrls, Spin, Classes, Forms, QProgressBar, SysUtils, Graphics;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit1: TEdit;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    ColorBox1: TColorBox;
    Label4: TLabel;
    ColorBox2: TColorBox;
    Label5: TLabel;
    Label7: TLabel;
    ColorBox4: TColorBox;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    TrackBar3: TTrackBar;
    Label8: TLabel;
    TrackBar4: TTrackBar;
    GroupBox5: TGroupBox;
    CheckBox3: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    ColorBox5: TColorBox;
    ColorBox6: TColorBox;
    CheckBox4: TCheckBox;
    Label12: TLabel;
    ComboBox1: TComboBox;
    Label13: TLabel;
    ColorBox7: TColorBox;
    ComboBox2: TComboBox;
    Label14: TLabel;
    RadioButton7: TRadioButton;
    Label15: TLabel;
    ComboBox3: TComboBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    TrackBar2: TTrackBar;
    ComboBox4: TComboBox;
    Label16: TLabel;
    Shape1: TShape;
    Label17: TLabel;
    SpinEdit1: TSpinEdit;
    Label18: TLabel;
    ComboBox5: TComboBox;
    Label19: TLabel;
    ComboBox6: TComboBox;
    Label20: TLabel;
    Label21: TLabel;
    ColorBox8: TColorBox;
    ColorBox9: TColorBox;
    Label22: TLabel;
    TrackBar5: TTrackBar;
    Label23: TLabel;
    ComboBox7: TComboBox;
    Label24: TLabel;
    SpinEdit2: TSpinEdit;
    Label25: TLabel;
    ColorBox3: TColorBox;
    Label6: TLabel;
    Label26: TLabel;
    SpinEdit3: TSpinEdit;
    Label27: TLabel;
    SpinEdit4: TSpinEdit;
    Label28: TLabel;
    SpinEdit5: TSpinEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ColorBox4Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure Click(Sender : TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ColorBox5Change(Sender: TObject);
    procedure ColorBox6Change(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ColorBox7Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ColorBox8Change(Sender: TObject);
    procedure ColorBox9Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure SpinEdit5Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  Progress : TQProgressBar;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    Progress.Boucle := not Progress.Boucle;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    Progress.SpeedDefil := Progress.SpeedDefil + 1 ;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
    if not CheckBox1.Checked then
        Progress.StyleText := sttNone
    else
    begin
        RadioButton4.Checked := True;
        Progress.StyleText := sttValue;
    end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
    Progress.Boucle := CheckBox2.Checked;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
    Progress.SliderVisible := CheckBox3.Checked;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
    Progress.TickVisible := CheckBox4.Checked;
end;

procedure TForm1.ColorBox1Change(Sender: TObject);
begin
    Progress.ColorFirst := ColorBox1.Selected;
end;

procedure TForm1.ColorBox2Change(Sender: TObject);
begin
    Progress.ColorEnd := ColorBox2.Selected;
end;

procedure TForm1.ColorBox3Change(Sender: TObject);
begin
    Progress.Font.Color := ColorBox3.Selected;
end;

procedure TForm1.ColorBox4Change(Sender: TObject);
begin
    Progress.TransparentColor := ColorBox4.Selected;
end;

procedure TForm1.ColorBox5Change(Sender: TObject);
begin
    Progress.SliderColorFirst := ColorBox5.Selected;
end;

procedure TForm1.ColorBox6Change(Sender: TObject);
begin
    Progress.SliderColorEnd := ColorBox6.Selected;
end;

procedure TForm1.ColorBox7Change(Sender: TObject);
begin
    Progress.TickColor := ColorBox7.Selected;
end;

procedure TForm1.ColorBox8Change(Sender: TObject);
begin
    Progress.ColorFonduFirst := ColorBox8.Selected;
end;

procedure TForm1.ColorBox9Change(Sender: TObject);
begin
    Progress.ColorFonduEnd := ColorBox9.Selected;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
    Progress.StyleGradient := TStyleGradient(ComboBox1.ItemIndex);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
    Progress.SliderStyleGradient := TStyleGradient(ComboBox2.ItemIndex);
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
    Progress.TickMarks := TTickMarks(ComboBox3.ItemIndex);
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
    if not CheckBox2.Checked then
        Progress.TypeBoucle := TTypeBoucle(ComboBox4.ItemIndex)
    else
        if ComboBox4.ItemIndex = 0 then
            ComboBox4.ItemIndex := 1
        else
            ComboBox4.ItemIndex := 0;
end;

procedure TForm1.ComboBox5Change(Sender: TObject);
begin
    Progress.SensBoucle := TSensBoucle(ComboBox5.ItemIndex);
end;

procedure TForm1.ComboBox6Change(Sender: TObject);
begin
    Progress.SensBar := TSensBar(ComboBox6.ItemIndex);
end;

procedure TForm1.ComboBox7Change(Sender: TObject);
begin
    Progress.TickPos := TTickPos(ComboBox7.ItemIndex);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
    Progress.Text := Edit1.Text;
end;

procedure TForm1.Click(Sender : TObject);
begin
    Label9.Caption:=(IntTostr(Progress.Position));
    TrackBar1.Position := Progress.Position;
    CheckBox3.Checked := Progress.SliderVisible;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Progress := TQProgressBar.Create(Self);
    Progress.Parent := Self;
    Progress.Height := 200;
    Progress.Width := 200;
    Progress.Max := 100;
    Progress.Position := 80;
    Progress.Visible := True;
    Progress.Left := 75;
    Progress.Top := 15;
    Progress.ColorFirst := clRed;
    Progress.ColorEnd := clBlack;
    Progress.Text := 'TQProgressBar';
    Progress.StyleText := sttTexte;
    Progress.Font.Name := 'Tahoma';
    Progress.Font.Style := [fsBold];
    Progress.Font.Size := 10;
    Progress.Font.Color := clBlack;
    Progress.Ball := False;
    Progress.StyleGradient := sgRadial;
    Progress.TransparentColor := clBackground; // Attention changé la couleur si pb affichage transparence
    Progress.SensBar := sbLeftRight;
    Progress.SpeedDefil := 15;
    Progress.SpeedTimer := 100;
    Progress.SensBoucle := sbcLeftRight;
    Progress.SliderVisible := TRue;
    Progress.SliderWidth := 15;
    Progress.SliderStyleGradient := sgRadial;
    Progress.SliderColorFirst := clLime;
    Progress.SliderColorEnd := clBlack;
    Progress.TickPos := tpBottomLeft;
    Progress.TickColor := clYellow;
    Progress.TickFrequency := 10;
    Progress.TickMarks := tmTriangle;
    Progress.TickSize := 4;
    Progress.PPie := False;
    Progress.Segment := 12;
    Progress.TypeBoucle := tbDefil;
    Progress.ColorFonduFirst := clBlack;
    Progress.ColorFonduEnd := clRed;
    Progress.OnChange := Click;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
    Progress.Circle := False;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
    Progress.Circle := True;
    Progress.Ball := False;
    Progress.PPie := False;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
    Progress.Ball := True;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
    Progress.StyleText := sttValue;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
    Progress.StyleText := sttPercent;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
    Progress.StyleText := sttTexte;
end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
    Progress.PPie := True;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
    Progress.Segment := SpinEdit1.Value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
    Progress.Font.Size := SpinEdit2.Value;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
    Progress.TickSize := SpinEdit3.Value;
end;

procedure TForm1.SpinEdit4Change(Sender: TObject);
begin
    Progress.TickFrequency := SpinEdit4.Value;
end;

procedure TForm1.SpinEdit5Change(Sender: TObject);
begin
    Progress.SliderWidth := SpinEdit5.Value;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
    Progress.Position := TrackBar1.Position;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
    Progress.DiamBall := TrackBar2.Position;
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
    Progress.SpeedDefil := TrackBar3.Position;
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
    Progress.SpeedTimer := TrackBar4.Position * 10;
end;

procedure TForm1.TrackBar5Change(Sender: TObject);
begin
    Progress.SpeedFondu := TrackBar5.Position;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Progress.Free;
end;

end.
