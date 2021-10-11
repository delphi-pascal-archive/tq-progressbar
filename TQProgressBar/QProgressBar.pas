unit QProgressBar;

interface

uses Windows, Classes, Controls, Graphics, ExtCtrls, SysUtils, Math, Messages, Dialogs;

type

TStyleGradient  = ( sgHorizontal,sgVertical,sgTopLeft,sgTopRight,sgBottomLeft,
                    sgBottomRight,sgRadial,sgDoubleHorz,sgDoubleVert);
TStyleText      = (sttNone,sttValue,sttPercent,sttTexte);
TSensBar        = (sbLeftRight,sbRightLeft,sbRightLeftInv,sbBottomTop,sbTopBottom,sbBottomTopInv);
TSensBoucle     = (sbcLeftRight,sbcRightLeft,sbcTopBottom,sbcBottomTop);
TTickPos        = (tpBottomLeft,tpTopRight,tpAll);
TTickMarks      = (tmTriangle,tmRoundRect,tmLine);
TTypeBoucle     = (tbDefil,tbFondu);
TRGBArray       = array[0..0] of TRGBQuad;
PRGBArray       = ^TRGBArray;

//TQProgressBar = class;
//TCanResizeEvent = procedure(Sender: TObject; var NewWidth, NewHeight: Integer;
//    var Resize: Boolean) of object;

//TNotifyEventClick = Procedure (Sender : TObject) of object;

{TTimeThread = class (TThread)
    private
        FControl : TComponent;
        FProgressBar : TQProgressBar;
        procedure UpdateControl;
    protected
        constructor Create(AControl : TComponent);
        procedure Assign(AProgressBar : TQProgressBar);
        procedure Stop;
        destructor Destroy; override;
        procedure Execute; override;
end;}

TQProgressBar = class(TGraphicControl)
    private
        FMin : Integer;
        FMax : Integer;
        FPosition : Integer;
        FColorFirst : TColor;
        FColorEnd : TColor;
        FStyleGradient : TStyleGradient;
        FCircle : Boolean;
        FSegment : Integer;
        FBall : Boolean;
        FDiamBall : Integer;
        FPPie : Boolean;
        FStyleText : TStyleText;
        FText : string;
        FTransparentColor : TColor;
        FSensBar : TSensBar;
        FBoucle : Boolean;
        FTimer : TTimer;
        FTypeBoucle : TTypeBoucle;
        FSpeedDefil : Byte;
        FSpeedTimer : Integer;
        FSensBoucle : TSensBoucle;
        FSliderVisible : Boolean;
        FMouseVer : Boolean;
        FSliderWidth : Integer;
        FSliderStyleGradient : TStyleGradient;
        FSliderColorFirst : TColor;
        FSliderColorEnd : TColor;
        FTickVisible : Boolean;
        FTickColor : TColor;
        FTickPos : TTickPos;
        FTickFrequency : Integer;
        FTickMarks : TTickMarks;
        FTickSize : Integer;
        FColorFonduFirst : TColor;
        FColorFonduEnd : TColor;
        FSpeedFondu : Integer;
//        FTimeThread : TTimeThread;
        FOnChange: TNotifyEvent;
//        FOnCanResize: TCanResizeEvent;
        procedure SetMin(const Value : Integer);
        procedure SetMax(const Value : Integer);
        procedure SetPosition(const Value : Integer);
        procedure SetColorFirst(const Value : TColor);
        procedure SetColorEnd(const Value : TColor);
        procedure SetStyleGradient(const Value : TStyleGradient);
        procedure SetCircle(const Value : Boolean);
        procedure SetSegment(const Value : Integer);
        procedure SetBall(const Value : Boolean);
        procedure SetDiamBall(const Value : Integer);
        procedure SetPPie(const Value : Boolean);
        procedure SetStyleText(const Value : TStyleText);
        procedure SetText(const Value : string);
        procedure SetTransparentColor(const Value : TColor);
        procedure SetSensBar(const Value : TSensBar);
        procedure SetBoucle(const Value : Boolean);
        procedure SetSensBoucle(const Value : TSensBoucle);
        procedure SetTypeBoucle(const Value : TTypeBoucle);
        procedure Timer(Sender : TObject);
        procedure SetSpeedDefil(const Value : Byte);
        procedure SetSpeedTimer(const Value : Integer);
        procedure SetSliderVisible(const Value : Boolean);
        procedure SetSliderWidth(const Value : Integer);
        procedure SetSliderStyleGradient(Const Value : TStyleGradient);
        procedure SetSliderColorFirst(const Value : TColor);
        procedure SetSliderColorEnd(const Value : TColor);
        procedure SetTickVisible(const Value : Boolean);
        procedure SetTickColor(const Value : TColor);
        procedure SetTickPos(const Value : TTickPos);
        procedure SetTickFrequency(const Value : Integer);
        procedure SetTickMarks(const Value : TTickMarks);
        procedure SetTickSize(const Value : Integer);
        procedure SetColorFonduFirst(const Value : TColor);
        procedure SetColorFonduEnd(const Value : TColor);
        procedure SetSpeedFondu(const Value : Integer);
    protected
        procedure Paint; override;
        procedure ReDraw(VRect : TRect);
        Procedure TexteDraw(Bitmap: TBitmap; Text: String);
        procedure Fondu(Bitmap1, Bitmap2, Bitmap3 : TBitmap; Pos : Integer);
        procedure RotationCircle(Bitmap1, Bitmap2 : TBitmap; Angle: Integer);
        procedure BitmapGradient(Bitmap: TBitmap; VRect: TRect; ColorDeb, ColorFin: TColor; StyleGradient : TStyleGradient; Region: HRGN; Saut:Boolean);
        procedure Contour(VRect : TRect; BitmapFin, TabTemp : TBitmap);
        procedure ContourCircle(TempBitmap : TBitmap; VRect : TRect; Rayon : Single);
        procedure DrawBall(Rayon : Single; VRect : TRect; TempBitmap : TBitmap);
        procedure DrawCircle(Rayon : Single; VRect : TRect; TempBitmap : TBitmap);
        procedure DrawText(TempBitmap : TBitmap);
        procedure DrawBar(VRect : TRect; TempBitmap : TBitmap);
        procedure DrawTip(VRect : TRect; TempBitmap : TBitmap);
        function CalNewPos(VRect : TRect): Integer;
        procedure DrawSlider(VRect : TRect);
        procedure DrawTick(VRect : TRect);
        procedure DrawPie(VRect : TRect; Bitmap : TBitmap);
        procedure UpdateImageProgress(const Bitmap : TBitmap; VRect : TRect) ;
        procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
        procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
        procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
        procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
        procedure WMMouseDblClk(var Message: TWMMButtonDblClk); message WM_LBUTTONDBLCLK;
        procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
        procedure Changed; dynamic;
        function CalRect():TRect;
    public                   
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
    published
        property Min: Integer read FMin write SetMin default 0;
        property Max: Integer read FMax write SetMax default 100;
        property Position : Integer read FPosition write SetPosition default 0;
        property ColorFirst : TColor read FColorFirst write SetColorFirst default clBlack;
        property ColorEnd : TColor read FColorEnd write SetColorEnd default clRed;
        property StyleGradient : TStyleGradient read FStyleGradient write  SetStyleGradient default sgRadial;
        property Circle : Boolean read FCircle write SetCircle default False;
        property Segment : Integer read FSegment write SetSegment default 12;
        property Ball : Boolean read FBall write SetBall default False;
        property DiamBall : Integer read FDiamBall write SetDiamBall default 0;
        property PPie : Boolean read FPPie write SetPPie default False;
        property StyleText : TStyleText read FStyleText write SetStyleText default sttTexte;
        property Text : string read FText write SetText;
        property TransparentColor : TColor read FTransparentColor write SetTransparentColor default clBackground;
        property SensBar : TSensBar read FSensBar write SetSensBar default sbLeftRight;
        property Boucle : Boolean read FBoucle write SetBoucle default False;
        property TypeBoucle : TTypeBoucle read FTypeBoucle write SetTypeBoucle default tbDefil;
        property SensBoucle : TSensBoucle read FSensBoucle write SetSensBoucle default sbcLeftRight;
        property SpeedDefil : Byte read FSpeedDefil write SetSpeedDefil default 5;
        property SpeedTimer : Integer read FSpeedTimer write SetSpeedTimer default 100;
        property SliderVisible : Boolean read FSliderVisible write SetSliderVisible default False;
        property SliderWidth : Integer read FSliderWidth write SetSliderWidth default 10;
        property SliderStyleGradient : TStyleGradient read FSliderStyleGradient write SetSliderStyleGradient default sgRadial;
        property SliderColorFirst : TColor read FSliderColorFirst write SetSliderColorFirst default clLime;
        property SliderColorEnd : TColor read FSliderColorEnd write SetSliderColorEnd default clBlack;
        property TickVisible : Boolean read FTickVisible write SetTickVisible default False;
        property TickColor : TColor read FTickColor write SetTickColor default clBlue;
        property TickPos : TTickPos read FTickPos write SetTickPos default tpBottomLeft;
        property TickFrequency : Integer read FTickFrequency write SetTickFrequency default 10;
        property TickMarks : TTickMarks read FTickMarks write SetTickMarks default tmTriangle;
        property TickSize : Integer read FTickSize write SetTickSize default 4;
        property ColorFonduFirst : TColor read FColorFonduFirst write SetColorFonduFirst default clBlack;
        property ColorFonduEnd : TColor read FColorFonduEnd write SetColorFonduEnd default clWhite;
        Property SpeedFondu : Integer read FSpeedFondu write SetSpeedFondu default 10;
        property Font;
        property OnChange: TNotifyEvent read FOnChange write FOnChange;
        property Width default 200;
        property Height default 25;
    end;

procedure Register;

implementation

const
    Deg = Pi / 180;

var
    BRect           : TRect;
    TabBitmap       : array [0..3] of TBitmap;
    TabTempBitmap   : array [0..2] of TBitmap;
    TabCircle       : array [0..2] of TBitmap;
    TempFondu       : Integer;
    TabCirclePt     : array of array [0..1] of Integer;
    TabCirclePtPie  : array of array [0..1] of Integer;
    TabCentBall     : array of array [0..1] of Integer;
    TabInfBall      : array [0..3] of Single;
    // 0 : TabBitmap font principale barre
    // 1 : TabBitmap Slider
    // 2 : TabBitmap Tick
    // 3 : TabBitmap font pour boucle

procedure Register;
begin
    RegisterComponents('Exemples', [TQProgressBar]);
end;
{
procedure TTimeThread.UpdateControl;
begin
    FProgressBar.Timer(nil);
end;

constructor TTimeThread.Create(AControl : TComponent);
begin
    FControl := AControl;
    inherited Create(True);
//    FreeOnTerminate := True;
    Priority := tpNormal;
end;

procedure TTimeThread.Assign(AProgressBar : TQProgressBar);
begin
    FProgressBar := AProgressBar;
end;

procedure TTimeThread.Stop;
begin
    Suspend;
end;

destructor TTimeThread.Destroy;
begin
    Terminate;
    inherited Destroy;
end;

procedure TTimeThread.Execute;
begin
    repeat
        Sleep(100);
        Synchronize(UpdateControl);
    until Terminated;
end;
}

procedure TQProgressBar.WMLButtonUp(var Message: TWMLButtonUp);
begin
    FMouseVer := False;
end;

procedure TQProgressBar.WMLButtonDown(var Message: TWMLButtonDown);
var
    NewPosX : Integer;
    NewPosY : Integer;
    Ofs     : Integer;
begin
    if not SliderVisible or Circle then
        exit;
    Ofs := (SliderWidth div 2)+ 3;
    if (SensBar = sbLeftRight)or(SensBar = sbRightLeftInv)or(SensBar = sbRightLeft) then
        NewPosX := Round((Message.XPos - Ofs)*(ClientRect.Right/(ClientRect.Right-(Ofs*2))))
    else
        NewPosY := Round((Message.YPos - Ofs)*(ClientRect.Bottom/(ClientRect.Bottom-(Ofs*2))));
    if NewPosX > ClientRect.Right then
        NewPosX := ClientRect.Right;
    if (SensBar = sbLeftRight)or(SensBar = sbRightLeftInv) then
        if ((NewPosX) < Round(ClientRect.Left +(((ClientRect.Right-ClientRect.Left)*Position)div Max))+ (SliderWidth div 2)) and
            ((NewPosX) > Round(ClientRect.Left +(((ClientRect.Right-ClientRect.Left)*Position)div Max))- (SliderWidth div 2)) then
        begin
            FMouseVer := True;
            WMMouseMove(Message);
        end;
    if (SensBar = sbRightLeft) then
        if ((NewPosX) < Round(ClientRect.Left +(((ClientRect.Right-ClientRect.Left)*(Max - Position))div Max))+ (SliderWidth div 2)) and
            ((NewPosX) > Round(ClientRect.Left +(((ClientRect.Right-ClientRect.Left)*(Max - Position))div Max))- (SliderWidth div 2)) then
        begin
            FMouseVer := True;
            WMMouseMove(Message);
        end;
    if (SensBar = sbBottomTop) then
        if ((NewPosY) < Round(ClientRect.Top +(((ClientRect.Bottom-ClientRect.Top)*(Max - Position))div Max))+ (SliderWidth div 2)) and
            ((NewPosY) > Round(ClientRect.Top +(((ClientRect.Bottom-ClientRect.Top)*(Max - Position))div Max))- (SliderWidth div 2)) then
        begin
            FMouseVer := True;
            WMMouseMove(Message);
        end;
    if (SensBar = sbTopBottom)or(SensBar = sbBottomTopInv) then
        if ((NewPosY) < Round(ClientRect.Top +(((ClientRect.Bottom-ClientRect.Top)*(Position))div Max))+ (SliderWidth div 2)) and
            ((NewPosY) > Round(ClientRect.Top +(((ClientRect.Bottom-ClientRect.Top)*(Position))div Max))- (SliderWidth div 2)) then
        begin
            FMouseVer := True;
            WMMouseMove(Message);
        end;
end;

procedure TQProgressBar.WMMouseMove(var Message: TWMMouseMove);
var
    OldT    : Integer;
    NewPos  : Integer;
    Ofs     : Integer;
    OldPos  : Integer;
begin
    if not SliderVisible or Circle then
        Exit;
    if FMouseVer then
    begin
        if Message.XPos >= 0 then
        begin
            Ofs := (SliderWidth div 2)+ 3;
            if (SensBar = sbLeftRight)or(SensBar = sbRightLeftInv) then
            begin
                NewPos := Round((Message.XPos - Ofs)*(ClientRect.Right/(ClientRect.Right-(Ofs*2))));
                Oldt := Round((NewPos/((ClientRect.Right-ClientRect.Left)/Max))-(ClientRect.Left div 2));
            end;
            if (SensBar = sbRightLeft) then
            begin
                OldPos := ClientRect.Right - Message.XPos;
                NewPos := Round((OldPos - Ofs)*(ClientRect.Right/(ClientRect.Right-(Ofs*2))));
                Oldt := Round((NewPos/((ClientRect.Right-ClientRect.Left)/Max))-(ClientRect.Left div 2));
            end;
            if (SensBar = sbTopBottom)or(SensBar = sbBottomTopInv) then
            begin
                NewPos := Round((Message.YPos - Ofs)*(ClientRect.Bottom/(ClientRect.Bottom-(Ofs*2))));
                Oldt := Round((NewPos/((ClientRect.Bottom-ClientRect.Top)/Max))-(ClientRect.Top div 2));
            end;
            if (SensBar = sbBottomTop) then
            begin
                OldPos := ClientRect.Bottom - Message.YPos;
                NewPos := Round((OldPos - Ofs)*(ClientRect.Bottom/(ClientRect.Bottom-(Ofs*2))));
                Oldt := Round((NewPos/((ClientRect.Bottom-ClientRect.Top)/Max))-(ClientRect.Top div 2));
            end;
            Position := OldT;
        end
        else
            Position := 0;
        Changed;
    end;
end;

procedure TQProgressBar.CMMouseLeave(var Message: TMessage);
begin
    if not SliderVisible or Circle then
        Exit;
    FMouseVer := False;
    Invalidate;
end;

procedure TQProgressBar.WMMouseDblClk(var Message: TWMMButtonDblClk);
begin
    if not SliderVisible or Circle then
        exit;
    FMouseVer := True;
    WMMouseMove(Message);
    FMouseVer := False;
end;

procedure TQProgressBar.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
//    inherited;
    ReDraw(CalRect);
    if SliderVisible then
        DrawSlider(CalRect);
    if TickVisible then
        DrawTick(CalRect);
end;

//function TQProgressBar.CanResize(var NewWidth, NewHeight: Integer): Boolean;
//begin
//    Result := True;
//    if Assigned(FOnCanResize) then
//        FOnCanResize(Self, NewWidth, NewHeight, Result);
//end;

procedure TQProgressBar.Changed;
begin
    if Assigned(FOnChange) then
        FOnChange(Self);
end;

constructor TQProgressBar.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    if AOwner.ClassName = 'TCustomControl' then
        TCustomControl(TQProgressBar).DoubleBuffered := True
    else
        TWinControl(AOwner).DoubleBuffered := True;
    FTimer := TTimer.Create(Self);
    FTimer.Enabled := False;
    FTimer.OnTimer := Timer;
//    FTimeThread := TTimeThread.Create(AOwner);
//    FTimeThread.Assign(Self);
    TabBitmap[0]:=TBitmap.Create;
    TabBitmap[1]:=TBitmap.Create;
    TabBitmap[2]:=TBitmap.Create;
    TabBitmap[3]:=TBitmap.Create;
    TabTempBitmap[0]:=TBitmap.Create;
    TabTempBitmap[1]:=TBitmap.Create;
    TabTempBitmap[2]:=TBitmap.Create;
    TabCircle[0]:=TBitmap.Create;
    TabCircle[1]:=TBitmap.Create;
    TabCircle[2]:=TBitmap.Create;
    Canvas.Brush.Color := clBackground;
    Canvas.Brush.Style := bsClear;
    FColorFirst := clBlack;
    FColorEnd := clRed;
    FStyleGradient := sgRadial;
    FCircle := False;
    FSegment := 12;
    FMin := 0;
    FMax := 100;
    FPosition := 0;
    FBall := False;
    FDiamBall := 0;
    FStyleText := sttTexte;
    FBoucle := False;
    FSpeedDefil := 5;
    FSpeedTimer := 100;
    FSliderVisible := False;
    FSliderWidth := 10;
    FSliderColorFirst := clLime;
    FSliderColorEnd := clBlack;
    FSliderStyleGradient := sgRadial;
    FTickColor := clBlue;
    FTickVisible := False;
    FTickPos := tpBottomLeft;
    FTickFrequency := 10;
    FTickMarks := tmTriangle;
    FTickSize := 4;
    FTransparentColor := clBackground;
    FColorFonduFirst := clBlack;
    FColorFonduEnd := clWhite;
    FSpeedFondu := 10;
    FPPie := False;
    FText := Name;
    Width := 200;
    Height := 25;
end;

destructor TQProgressBar.Destroy;
begin
    TabBitmap[0].Free;
    TabBitmap[1].Free;
    TabBitmap[2].Free;
    TabBitmap[3].Free;
    TabTempBitmap[0].Free;
    TabTempBitmap[1].Free;
    TabTempBitmap[2].Free;
    TabCircle[0].Free;
    TabCircle[1].Free;
    TabCircle[2].Free;
    FTimer.Free;
//    if Assigned(FTimeThread) then
//    begin
//        FTimeThread.Terminate;
//        FTimeThread.Destroy;
//    end;
    inherited Destroy;
end;

Procedure TQProgressBar.SetMin(Const Value : Integer);
begin
    if FMin <> Value then
    begin
        if Value > Position then
            Position := Value;
        if Value > Max then
            Max := Value + 1;
         FMin := Value;
         Invalidate;
    end;
end;

Procedure TQProgressBar.SetMax(Const Value : Integer);
begin
    if FMax <> Value then
    begin
        if Value < Position then
            Position := Value;
        if Value < Min then
            Min := Value - 1;
        FMax := Value;
        Invalidate;
    end;
end;

Procedure TQProgressBar.SetPosition(Const Value : Integer);
begin
    if FPosition <> Value then
    begin
        if (Boucle) and (Position = Max) then
            exit;
        if Value > Max then
        begin
            FPosition := Max;
            Exit;
        end;
        if Value < Min then
        begin
            FPosition := Min;
            Exit;
        end;
        FPosition := Value;
        Invalidate;
        Changed;
    end;
end;

Procedure TQProgressBar.SetColorFirst(Const Value : TColor);
begin
    if FColorFirst <> Value then
    begin
        FColorFirst := Value;
        if SliderVisible and not Circle then
            DrawSlider(CalRect);
        if TickVisible and not Circle then
            DrawTick(CalRect);
        ReDraw(CalRect);
        Invalidate;
    end;
end;

Procedure TQProgressBar.SetColorEnd(Const Value : TColor);
begin
    if FColorEnd <> Value then
    begin
        FColorEnd := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        if TickVisible then
            DrawTick(CalRect);
        ReDraw(CalRect);
        Invalidate;
    end;
end;

Procedure TQProgressBar.SetStyleGradient(const Value : TStyleGradient);
begin
    if FStyleGradient <> Value then
    begin
        FStyleGradient := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        if TickVisible then
            DrawTick(CalRect);
        ReDraw(CalRect);
        Invalidate;
    end;
end;

Procedure TQProgressBar.SetCircle(const Value : Boolean);
begin
    if FCircle <> Value then
    begin
        FCircle := Value;
        if not Value then
        begin
            Ball := False;
            PPie := False;
            if SliderVisible then
                DrawSlider(CalRect);
            if TickVisible then
                DrawTick(CalRect);
        end;
        ReDraw(CalRect);
        Invalidate;
    end;
end;

Procedure TQProgressBar.SetSegment(const Value : Integer);
begin
    if FSegment <> Value then
    begin
        if Value >= 0 then
        begin
            FSegment := Value;
            if not Circle then
            begin
                if SliderVisible then
                    DrawSlider(CalRect);
                if TickVisible then
                    DrawTick(CalRect);
            end;
            ReDraw(CalRect);
            Invalidate;
        end;
    end;
end;

Procedure TQProgressBar.SetBall(const Value : Boolean);
begin
    if FBall <> Value then
    begin
        FBall := Value;
        if Value and not Circle then
            FCircle := True;
        if Value and PPie then
            PPie := False;
        if not Circle then
        begin
            if SliderVisible then
                DrawSlider(CalRect);
            if TickVisible then
                DrawTick(CalRect);
        end;
        if Boucle then
        begin
            Boucle := False;
            ReDraw(CalRect);
            Boucle := True;
            Invalidate;
        end
        else
        begin
            ReDraw(CalRect);
            Invalidate;
        end;
    end;
end;

Procedure TQProgressBar.SetDiamBall(const Value : Integer);
begin
    if FDiamBall <> Value then
    begin
        if Value < 0 then
            FDiamBall := 0
        else
            FDiamBall := Value;
        if not Circle then
        begin
            if SliderVisible then
                DrawSlider(CalRect);
            if TickVisible then
                DrawTick(CalRect);
        end;
//        ReDraw(CalRect);
        Invalidate;
    end;
end;

Procedure TQProgressBar.SetStyleText(const Value : TStyleText);
begin
    if Value <> FStyleText then
    begin
        FStyleText := Value;
        Invalidate;
    end;
end;

Procedure TQProgressBar.SetText(const Value : string);
begin
    if Value <> FText then
    begin
        FText := Value;
        Invalidate;
    end;
end;

procedure TQProgressBar.SetTransparentColor(const Value : TColor);
begin
    if Value <> FTransparentColor then
    begin
        FTransparentColor := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        if TickVisible then
            DrawTick(CalRect);
        ReDraw(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSensBar(const Value : TSensBar);
begin
    if Value <> FSensBar then
    begin
        FSensBar := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        if TickVisible then
            DrawTick(CalRect);
        ReDraw(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetBoucle(const Value : Boolean);
begin
    if Value <> FBoucle then
    begin
        FBoucle := Value;
        if Value then
        begin
            Position := Max;
            SensBar := sbLeftRight;
            SliderVisible := False;
            Changed;
//            FTimeThread.Resume;
        end
        else
        begin
//            FTimeThread.Stop;
            if SliderVisible then
                DrawSlider(CalRect);
            if TickVisible then
                DrawTick(CalRect);
        end;
        if not Circle then
            ReDraw(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetTypeBoucle(const Value : TTypeBoucle);
begin
    if Value <> FTypeBoucle then
    begin
        if not Boucle then
        begin
            FTypeBoucle := Value;
            ReDraw(CalRect);
        end;
    end;
end;

procedure TQProgressBar.SetSpeedDefil(const Value : Byte);
begin
    if Value <> FSpeedDefil then
    begin
        FSpeedDefil := Value;
    end;
end;

procedure TQProgressBar.SetSpeedTimer(const Value : Integer);
begin
    if Value <> FSpeedTimer then
    begin
        FSpeedTimer := Value;
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSensBoucle(const Value : TSensBoucle);
begin
    if Value <> FSensBoucle then
    begin
        FSensBoucle := Value;
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSliderVisible(const Value : Boolean);
begin
    if Value <> FSliderVisible then
    begin
        FSliderVisible := Value;
        if FSliderVisible then
            DrawSlider(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSliderWidth(const Value : Integer);
begin
    if Value <> FSliderWidth then
    begin
        if (Value >= 6) and (Value <= Height) then
            FSliderWidth := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSliderStyleGradient(const Value : TStyleGradient);
begin
    if Value <> FSliderStyleGradient then
    begin
        FSliderStyleGradient := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSliderColorFirst(Const Value : TColor);
begin
    if FSliderColorFirst <> Value then
    begin
        FSliderColorFirst := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSliderColorEnd(Const Value : TColor);
begin
    if FSliderColorEnd <> Value then
    begin
        FSliderColorEnd := Value;
        if SliderVisible then
            DrawSlider(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetTickVisible(Const Value : Boolean);
begin
    if FTickVisible <> Value then
    begin
        FTickVisible := Value;
        if TickVisible then
            DrawTick(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetTickColor(Const Value : TColor);
begin
    if FTickColor <> Value then
    begin
        FTickColor := Value;
        if TickVisible then
            DrawTick(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetTickPos(Const Value : TTickPos);
begin
    if FTickPos <> Value then
    begin
        FTickPos := Value;
        if TickVisible then
            DrawTick(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetTickFrequency(Const Value : Integer);
begin
    if FTickFrequency <> Value then
    begin
        if Value > 0 then
        begin
            FTickFrequency := Value;
            if TickVisible then
                DrawTick(CalRect);
            Invalidate;
        end;
    end;
end;

procedure TQProgressBar.SetTickMarks(Const Value : TTickMarks);
begin
    if FTickMarks <> Value then
    begin
        FTickMarks := Value;
        if TickVisible then
            DrawTick(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetTickSize(Const Value : Integer);
begin
    if FTickSize <> Value then
    begin
        if Value > 0 then
        begin
            FTickSize := Value;
            if TickVisible then
                DrawTick(CalRect);
            Invalidate;
        end;
    end;
end;

procedure TQProgressBar.SetPPie(Const Value : Boolean);
begin
    if FPPie <> Value then
    begin
        if not Boucle then
        begin
            if Value and not Boucle then
                Circle := True;
            if Ball and Value then
                Ball := False;
            if not Boucle then
                FPPie := Value;
            ReDraw(CalRect);
            Invalidate;
        end;
    end;
end;

procedure TQProgressBar.SetColorFonduFirst(Const Value : TColor);
begin
    if FColorFonduFirst <> Value then
    begin
        FColorFonduFirst := Value;
        if TypeBoucle = tbFondu then
            ReDraw(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetColorFonduEnd(Const Value : TColor);
begin
    if FColorFonduEnd <> Value then
    begin
        FColorFonduEnd := Value;
        if TypeBoucle = tbFondu then
            ReDraw(CalRect);
        Invalidate;
    end;
end;

procedure TQProgressBar.SetSpeedFondu(Const Value : Integer);
begin
    if FSpeedFondu <> Value then
    begin
        if (Value >= 0)and(Value <= 100) then
            FSpeedFondu := Value;
        Invalidate;
    end;
end;

procedure TQProgressBar.RotationCircle(Bitmap1, Bitmap2 : TBitmap; Angle: Integer);
var
    tXF         : tagXFORM;
    AnglePrinc  : Single;
    AngleDiag   : Single;
    RA          : Single;
begin
    SetGraphicsMode(Bitmap2.Canvas.Handle, GM_Advanced);
//    SetMapMode(Bitmap2.Canvas.Handle, MM_LOMETRIC);
    RA := Sqrt(Sqr(Bitmap1.Height) + Sqr(Bitmap1.Width));
    AnglePrinc := Angle * Deg;
    tXF.eM11 := +Cos(AnglePrinc);
    tXF.eM12 := +Sin(AnglePrinc);
    tXF.eM21 := -tXF.eM12;
    tXF.eM22 := tXF.eM11;
    AngleDiag := ArcCos(Bitmap1.Width / RA);   //math
    AnglePrinc := AnglePrinc + AngleDiag;
    tXF.eDX := (-Cos(AnglePrinc) + Cos(AngleDiag))*(RA / 2);
    tXF.eDY := (-Sin(AnglePrinc) + Sin(AngleDiag))*(RA / 2);
    SetWorldTransform(Bitmap2.Canvas.Handle, tXF);
    Bitmap2.Canvas.Draw(0, 0, Bitmap1);
end;

procedure TQProgressBar.Fondu(Bitmap1, Bitmap2, Bitmap3 : TBitmap; Pos : Integer);
var
    Ligne1  : PByteArray;
    Ligne2  : PByteArray;
    Ligne3  : PByteArray;
    I       : Integer;
    J       : Integer;
    Px      : Integer;
begin
    for J := 0 to Bitmap1.Height - 1 do
    begin
        Ligne1 := Bitmap1.ScanLine[J];    // ligne du bitmap 1
        Ligne2 := Bitmap2.ScanLine[J];    // ligne de bitmap 2
        Ligne3 := Bitmap3.ScanLine[J];    // ligne de bitmap 3
        for I := 0 to Bitmap1.Width - 1 do
        begin
            Px := I * 4;    //3 => 24bit 4 => 32bit
            Ligne3[Px]   := MulDiv(Ligne2[Px]  , Pos, 100) + MulDiv(Ligne1[Px]  , 100-Pos, 100); // Pourcentage Bleu
            Ligne3[Px+1] := MulDiv(Ligne2[Px+1], Pos, 100) + MulDiv(Ligne1[Px+1], 100-Pos, 100); // Pourcentage Vert
            Ligne3[Px+2] := MulDiv(Ligne2[Px+2], Pos, 100) + MulDiv(Ligne1[Px+2], 100-Pos, 100); // Pourcentage Rouge
        end;
    end;
end;

procedure TQProgressBar.Contour(VRect : TRect; BitmapFin, TabTemp : TBitmap);
begin
//    Suppression des angles
    BitmapFin.Assign(TabTemp);
    BitmapFin.TransparentColor := TransparentColor;
    BitmapFin.Canvas.Pen.Width := 5;
    BitmapFin.Canvas.Pen.Color := TransparentColor;
    BitmapFin.Canvas.Brush.Style := bsClear;
    BitmapFin.Canvas.RoundRect(-1, -1, VRect.Right+1, VRect.Bottom+1, 10, 10);
//    Mise en place du contour
    BitmapFin.Canvas.Brush.Style := bsClear;
    BitmapFin.Canvas.Pen.Width := 2;
    BitmapFin.Canvas.Pen.Color := clGray;
    BitmapFin.Canvas.RoundRect(1, 1, VRect.Right-1, VRect.Bottom-1, 8, 8);
    BitmapFin.Canvas.Pen.Width := 1;
    BitmapFin.Canvas.Pen.Color := clBlack;
    BitmapFin.Canvas.RoundRect(0, 0, VRect.Right,VRect.Bottom, 12, 12);
    BitmapFin.Canvas.Pen.Width := 1;
    BitmapFin.Canvas.Pen.Color := clSilver;
    BitmapFin.Canvas.RoundRect(2, 2, VRect.Right-2, VRect.Bottom-2, 8, 8);
    DrawText(BitmapFin);
end;

procedure TQProgressBar.ContourCircle(TempBitmap : TBitmap; VRect : TRect; Rayon : Single);
begin
//    Mise en place du contour
    TempBitmap.Canvas.Brush.Style := bsClear;

    TempBitmap.Canvas.Pen.Width := 2;
    TempBitmap.Canvas.Pen.Color := clGray;
    TempBitmap.Canvas.Ellipse(1, 1, VRect.Right-1, VRect.Bottom-1);

    TempBitmap.Canvas.Pen.Width := 1;
    TempBitmap.Canvas.Pen.Color := clBlack;
    TempBitmap.Canvas.Ellipse(0, 0, VRect.Right, VRect.Bottom);

    TempBitmap.Canvas.Pen.Width := 1;
    TempBitmap.Canvas.Pen.Color := clSilver;
    TempBitmap.Canvas.Ellipse(2, 2, VRect.Right-2, VRect.Bottom-2);
//    Mise en place du cercle centrale
    TempBitmap.Canvas.Brush.Style   := bsSolid;
    TempBitmap.Canvas.Brush.Color   := TransparentColor;
    TempBitmap.Canvas.Pen.Width     := 2;
    TempBitmap.Canvas.Pen.Color     := clGray;
    if not PPie then
        TempBitmap.Canvas.Ellipse(  Round((VRect.Right / 2)  - Rayon +(Rayon / 3)+1),
                                    Round((VRect.Bottom / 2) - Rayon +(Rayon / 3)+1),
                                    Round((VRect.Right / 2)  + Rayon -(Rayon / 3)-1),
                                    Round((VRect.Bottom / 2) + Rayon -(Rayon / 3)-1))
    else
        TempBitmap.Canvas.Ellipse(  Round((VRect.Right / 2)  -10),
                                    Round((VRect.Bottom / 2) -10),
                                    Round((VRect.Right / 2)  +10),
                                    Round((VRect.Bottom / 2) +10));
    TempBitmap.Canvas.Brush.Style   := bsClear;
    TempBitmap.Canvas.Pen.Width     := 1;
    TempBitmap.Canvas.Pen.Color     := clSilver;
    if not PPie then
        TempBitmap.Canvas.Ellipse(  Round((VRect.Right / 2)  - Rayon +(Rayon / 3)),
                                    Round((VRect.Bottom / 2) - Rayon +(Rayon / 3)),
                                    Round((VRect.Right / 2)  + Rayon -(Rayon / 3)),
                                    Round((VRect.Bottom / 2) + Rayon -(Rayon / 3)))
    else
        TempBitmap.Canvas.Ellipse(  Round((VRect.Right / 2)  - 9),
                                    Round((VRect.Bottom / 2) - 9),
                                    Round((VRect.Right / 2)  + 9),
                                    Round((VRect.Bottom / 2) + 9));
    TempBitmap.Canvas.Pen.Width     := 1;
    TempBitmap.Canvas.Pen.Color     := clBlack;
    if not PPie then
        TempBitmap.Canvas.Ellipse(  Round((VRect.Right / 2)  - Rayon +(Rayon / 3)+2),
                                    Round((VRect.Bottom / 2) - Rayon +(Rayon / 3)+2),
                                    Round((VRect.Right / 2)  + Rayon -(Rayon / 3)-2),
                                    Round((VRect.Bottom / 2) + Rayon -(Rayon / 3)-2))
    else
        TempBitmap.Canvas.Ellipse(  Round((VRect.Right / 2)  - 11),
                                    Round((VRect.Bottom / 2) - 11),
                                    Round((VRect.Right / 2)  + 11),
                                    Round((VRect.Bottom / 2) + 11));
    if PPie then
    begin
        DrawPie(VRect, TempBitmap);
        TempBitmap.Canvas.Pen.Width := 2;
        TempBitmap.Canvas.Pen.Color := clGray;
        TempBitmap.Canvas.PenPos    := Point(0, TempBitmap.Height -10);
        TempBitmap.Canvas.LineTo(TempBitmap.Width -1, TempBitmap.Height -10);
        TempBitmap.Canvas.Pen.Width := 1;
        TempBitmap.Canvas.Pen.Color := clBlack;
        TempBitmap.Canvas.PenPos    := Point(0, TempBitmap.Height -9);
        TempBitmap.Canvas.LineTo(TempBitmap.Width, TempBitmap.Height -9);
        TempBitmap.Canvas.Pen.Width := 1;
        TempBitmap.Canvas.Pen.Color := clSilver;
        TempBitmap.Canvas.PenPos    := Point(2, TempBitmap.Height -11);
        TempBitmap.Canvas.LineTo(TempBitmap.Width-2, TempBitmap.Height -11);
    end;
end;

procedure TQProgressBar.Timer(Sender : TObject);
var
    TempBitmap  : TBitmap;
    BitmapFin   : TBitmap;
    Step        : Integer;
    I           : Integer;
    FRect       : TRect;
begin
//    Fin de la boucle on coupe le timer
    if not Boucle then
    begin
        FTimer.Enabled := False;
        Invalidate;
        Exit;
    end;
//    Permet le défilement de la barre sur elle même
    TempBitmap := TBitmap.Create;
    BitmapFin:= TBitmap.Create;
    try
        Step := SpeedDefil;
        if (TypeBoucle = tbDefil) and not Circle and not Ball then
        begin
            TempBitmap.Width := TabBitmap[3].Width;
            TempBitmap.Height := TabBitmap[3].Height;
            TempBitmap.TransparentMode := tmFixed;
            TempBitmap.Transparent := True;
            TempBitmap.Canvas.Brush.Style := bsClear;
            TempBitmap.TransparentColor := TransparentColor;
            if SensBoucle = sbcLeftRight then
            begin
                BitBlt(TempBitmap.Canvas.Handle, Step, 0, TabBitmap[3].Width - Step, TabBitmap[3].Height, TabBitmap[3].Canvas.Handle, 0, 0, SRCCOPY) ;
                BitBlt(TempBitmap.Canvas.Handle, 0, 0, Step, TabBitmap[3].Height, TabBitmap[3].Canvas.Handle, TabBitmap[3].Width - Step, 0, SRCCOPY) ;
            end;
            if SensBoucle = sbcRightLeft then
            begin
                BitBlt(TempBitmap.Canvas.Handle, 0, 0, TabBitmap[3].Width - Step, TabBitmap[3].Height, TabBitmap[3].Canvas.Handle, Step, 0, SRCCOPY) ;
                BitBlt(TempBitmap.Canvas.Handle, TabBitmap[3].Width - Step, 0, Step, TabBitmap[3].Height, TabBitmap[3].Canvas.Handle, 0, 0, SRCCOPY) ;
            end;
            if SensBoucle = sbcTopBottom then
            begin
                BitBlt(TempBitmap.Canvas.Handle, 0, Step, TabBitmap[3].Width, TabBitmap[3].Height-Step, TabBitmap[3].Canvas.Handle, 0, 0, SRCCOPY) ;
                BitBlt(TempBitmap.Canvas.Handle, 0, 0, TabBitmap[3].Width, Step, TabBitmap[3].Canvas.Handle, 0, TabBitmap[3].Height - Step, SRCCOPY) ;
            end;
            if SensBoucle = sbcBottomTop then
            begin
                BitBlt(TempBitmap.Canvas.Handle, 0, 0, TabBitmap[3].Width, TabBitmap[3].Height-Step, TabBitmap[3].Canvas.Handle, 0, Step, SRCCOPY) ;
                BitBlt(TempBitmap.Canvas.Handle, 0, TabBitmap[3].Height - Step, TabBitmap[3].Width, Step, TabBitmap[3].Canvas.Handle, 0, 0, SRCCOPY) ;
            end;
            TabBitmap[3].Assign(TempBitmap) ;
            BitmapFin.Assign(TempBitmap) ;
            Contour(BRect, BitmapFin, TabBitmap[3]);
            Canvas.Draw(0,0,BitmapFin);
        end;
//        Type Fondu
        if (TypeBoucle = tbFondu) and  not Circle and not Ball then
        begin
            if Odd(TempFondu) then
            begin
                for I := 0 to SpeedFondu do
                begin
                    Fondu(TabTempBitmap[2],TabTempBitmap[1],TabTempBitmap[0],I*10);
                    Contour(BRect, BitmapFin, TabTempBitmap[0]);
                    Canvas.Draw(0, 0, BitmapFin);
                    TempFondu := 1;
                end;
            end;
            if not Odd(TempFondu) then
            begin
                for I := SpeedFondu downto 0 do
                begin
                    Fondu(TabTempBitmap[2],TabTempBitmap[1],TabTempBitmap[0],I*10);
                    Contour(BRect, BitmapFin, TabTempBitmap[0]);
                    Canvas.Draw(0, 0, BitmapFin);
                end;
            end;
            Inc(TempFondu);
        end;
//        Boucle ball
        if (TypeBoucle = tbFondu) and Ball then
        begin
            BitmapFin.Width := ClientWidth;
            BitmapFin.Height := ClientHeight;
            BitmapFin.TransparentColor := TransparentColor;
            BitmapFin.Transparent := True;
            BitmapFin.Canvas.Brush.Style:=bsSolid;
            Bitmapfin.canvas.brush.color := TransparentColor;
            BitmapFin.Canvas.Rectangle(-1,-1,ClientWidth+1,ClientHeight+1);
            if Odd(TempFondu) then
            begin
                for I := 0 to SpeedFondu do
                begin
                    Fondu(TabCircle[1],TabCircle[2],TabCircle[0],I*10);
                    BitmapFin.Canvas.Draw(0,0,TabCircle[0]);
                    DrawText(BitmapFin);
                    Canvas.Draw(0,0,BitmapFin);
                    TempFondu := 1;
                end;
            end;
            if not Odd(TempFondu) then
            begin
                for I := SpeedFondu downto 0 do
                begin
                    Fondu(TabCircle[1],TabCircle[2],TabCircle[0],I*10);
                    BitmapFin.Canvas.Draw(0,0,TabCircle[0]);
                    DrawText(BitmapFin);
                    Canvas.Draw(0,0,BitmapFin);
                end;
            end;
            Inc(TempFondu);
        end;
        if (TypeBoucle = tbDefil) and Ball then
        begin
//            Positionnement du topleft du rectangle au centre du ball
            FRect := Rect(  Round((BRect.Right / 2) +TabCentBall[TempFondu][0] -TabInfBall[0] +TabInfBall[2]),
                            Round((BRect.Bottom / 2)+TabCentBall[TempFondu][1] -TabInfBall[0] +TabInfBall[2] -TabInfBall[1]),
                            Round((BRect.Right / 2) +TabCentBall[TempFondu][0] +TabInfBall[0] -TabInfBall[2]),
                            Round((BRect.Bottom / 2)+TabCentBall[TempFondu][1] +TabInfBall[0] -TabInfBall[2] -TabInfBall[1]));
//            Copie du rectangle avec décalage du rayon ball
            BitmapFin.Assign(TabCircle[0]);
            BitmapFin.Canvas.Draw(FRect.Right-Round(TabInfBall[3]*2),FRect.Bottom-Round(TabInfBall[3]*2),TabCircle[1]);
            DrawText(BitmapFin);
            Canvas.Draw(0,0,BitmapFin);
//            Sens Horaire soit sbcLeftRight ou sbcTopBottom
            if (SensBoucle = sbcLeftRight) or (SensBoucle = sbcTopBottom) then
            begin
                Inc(TempFondu);
                if TempFondu > High(TabCentBall) then
                    TempFondu := 0;
            end;
//            Sens Anti-Horaire soit sbcRightLeft ou sbcBottomTop
            if (SensBoucle = sbcRightLeft) or (SensBoucle = sbcBottomTop) then
            begin
                Dec(TempFondu);
                if TempFondu < Low(TabCentBall) then
                    TempFondu := High(TabCentBall);
            end;
        end;
//        Boucle Circle defil
        if (TypeBoucle = tbDefil) and not Ball and Circle then
        begin
            if (SensBoucle = sbcLeftRight) or (SensBoucle = sbcTopBottom) then
            begin
                Inc(TempFondu, SpeedDefil);
                if TempFondu >= 360 then
                    TempFondu := TempFondu - 360;
            end;
            if (SensBoucle = sbcRightLeft) or (SensBoucle = sbcBottomTop) then
            begin
                Dec(TempFondu, SpeedDefil);
                if TempFondu <= 0 then
                    TempFondu := TempFondu + 360;
            end;
            TempBitmap.Assign(TabCircle[0]);
            BitmapFin.Assign(TabCircle[0]);
            RotationCircle(TempBitmap, BitmapFin, TempFondu);
            TempBitmap.Assign(BitmapFin);
            ContourCircle(TempBitmap, BRect, BRect.Bottom / 2);
            DrawText(TempBitmap);
            Canvas.Draw(0, 0, TempBitmap);
        end;
//        Boucle Circle fondu
        if (TypeBoucle = tbFondu) and not Ball and Circle then
        begin
            BitmapFin.Width := ClientWidth;
            BitmapFin.Height := ClientHeight;
            BitmapFin.TransparentColor := TransparentColor;
            BitmapFin.Transparent := True;
            BitmapFin.Canvas.Brush.Style:=bsSolid;
            Bitmapfin.canvas.brush.color := TransparentColor;
            BitmapFin.Canvas.Rectangle(-1,-1,ClientWidth+1,ClientHeight+1);
            if Odd(TempFondu) then
            begin
                for I := 0 to SpeedFondu do
                begin
                    Fondu(TabCircle[1],TabCircle[2],TabCircle[0],I*10);
                    BitmapFin.Canvas.Draw(0,0,TabCircle[0]);
                    ContourCircle(BitmapFin, BRect, BRect.Bottom / 2);
                    DrawText(BitmapFin);
                    Canvas.Draw(0,0,BitmapFin);
                    TempFondu := 1;
                end;
            end;
            if not Odd(TempFondu) then
            begin
                for I := SpeedFondu downto 0 do
                begin
                    Fondu(TabCircle[1],TabCircle[2],TabCircle[0],I*10);
                    BitmapFin.Canvas.Draw(0,0,TabCircle[0]);
                    ContourCircle(BitmapFin, BRect, BRect.Bottom / 2);
                    DrawText(BitmapFin);
                    Canvas.Draw(0,0,BitmapFin);
                end;
            end;
            Inc(TempFondu);
        end;
    finally
        TempBitmap.Free;
        BitmapFin.Free;
    end;
end;

procedure TQProgressBar.UpdateImageProgress(const Bitmap : TBitmap; VRect : TRect);
begin
    if not Circle then
        TabBitmap[3].Assign(Bitmap);
    if Circle then
    begin
        TabCircle[0].Assign(Bitmap);
        TabCircle[2].Assign(TabCircle[0]);
    end;
    BRect := VRect;
    FTimer.Interval := SpeedTimer;
    FTimer.Enabled := Boucle;
    Timer(nil);
end;

procedure TQProgressBar.BitmapGradient(Bitmap: TBitmap; VRect: TRect; ColorDeb, ColorFin: TColor; StyleGradient : TStyleGradient; Region: HRGN; Saut: Boolean);
var
    I, J, K     : Integer;
    MaxDist     : Integer;
    X1, X2      : Integer;
    LigDest     : PRGBArray;
    Deb         : array[0..2] of Integer;
    Diff        : array[0..2] of Double;
    Coef        : Double;
    Rayon       : Single;
    Res1        : Single;
    Res2        : Single;
    Res3        : Single;
    Angle1      : Single;
    Angle2      : Single;
    Centre1     : Single;
    Centre2     : Single;
    BitmapRond  : TBitmap;
    VRectRond   : TRect;
begin
    if (Segment = 0) and Boucle then
        Saut := True;
    if Saut then
        StyleGradient := sgTopLeft;
    if Bitmap.Empty then
        Exit;
    {if (ColorDeb = ColorFin)then
    begin
        Bitmap.Canvas.Brush.Color:=ColorDeb;
        if Region > 0 then
            FillRgn(Bitmap.Canvas.Handle, Region, Bitmap.Canvas.Brush.Handle)
        else
            Bitmap.Canvas.FillRect(VRect);
        exit;
    end;}
    X1 := ColorToRGB(ColorDeb);
    X2 := ColorToRGB(ColorFin);
    if Circle and not Saut then
    begin
        VRectRond.Left := 0;
        VRectRond.Top := 0;
//        Calcul du rayon du cercle à l'intérieur de la zone client
        if VRect.Right < VRect.Bottom then
        begin
            VRectRond.Right  := Round((VRect.Right * Pi)-3);
            VRectRond.Bottom := Round((VRect.Bottom * Pi)-3);
        end
        else
        begin
            VRectRond.Right  := Round((VRect.Bottom * Pi)-3);
            VRectRond.Bottom := Round((VRect.Right * Pi)-3);
        end;
        if Segment <> 0 then
        begin
            BitmapRond := TBitmap.Create;
            BitmapRond.PixelFormat := pf32Bit;
            BitmapRond.Width := VRectRond.Right;
            BitmapRond.Height := VRectRond.Bottom;
        end;
    end;
    case StyleGradient of
        sgVertical      : MaxDist := (VRect.Bottom - VRect.Top);
        sgHorizontal    : MaxDist := (VRect.Right - VRect.Left);
        sgTopLeft       : MaxDist := (Round(Sqrt(Sqr(VRect.Right-VRect.Left)+Sqr(VRect.Bottom-VRect.Top)))-VRect.Left);
        sgTopRight      : MaxDist := (Round(Sqrt(Sqr(VRect.Right-VRect.Left)+Sqr(VRect.Bottom-VRect.Top)))-VRect.Left);
        sgBottomLeft    : MaxDist := (Round(Sqrt(Sqr(VRect.Right-VRect.Left)+Sqr(VRect.Bottom-VRect.Top)))-VRect.Left);
        sgBottomRight   : MaxDist := (Round(Sqrt(Sqr(VRect.Right-VRect.Left)+Sqr(VRect.Bottom-VRect.Top)))-VRect.Left);
        sgRadial        : MaxDist := (Round(((Sqrt(Sqr(VRect.Right-VRect.Left)+Sqr(VRect.Bottom-VRect.Top)))- VRect.Left)/ 2));
        sgDoubleHorz    : MaxDist := (Round((VRect.Right - VRect.Left) / 2));
        sgDoubleVert    : MaxDist := (Round((VRect.Bottom - VRect.Top) / 2));
    end;
    if Circle and not Saut then
    begin
//        if not PPie then
//            MaxDist := (VRectRond.Right - VRectRond.Left)div Segment;//coef segment
//        else
//            MaxDist := (VRectRond.Right - VRectRond.Left)div 2;
        if Segment <> 0 then
            MaxDist := (VRectRond.Right - VRectRond.Left)div Segment;
    end;
    Deb[0]  := GetRValue(X1);
    Deb[1]  := GetGValue(X1);
    Deb[2]  := GetBValue(X1);
    Diff[0] := (GetRValue(X2) - Deb[0]) / MaxDist;
    Diff[1] := (GetGValue(X2) - Deb[1]) / MaxDist;
    Diff[2] := (GetBValue(X2) - Deb[2]) / MaxDist;
    if Diff[0] > 255 then
        Diff[0] := 255;
    if Diff[1] > 255 then
        Diff[1] := 255;
    if Diff[2] > 255 then
        Diff[2] := 255;

    if not Circle or Saut or (Segment = 0) then
    begin
    for K:= VRect.Top to VRect.Bottom -1 do
    begin
        LigDest := Bitmap.ScanLine[K];
        for J := VRect.Left to VRect.Right -1 do
        begin
            if (Region > 0) and not(PtInRegion(Region, J, K)) then
                Continue;
            case StyleGradient of
                sgHorizontal    : Coef := J - VRect.Left;
                sgVertical      : Coef := K - VRect.Top;
                sgTopLeft       : Coef := Sqrt(Sqr(J - VRect.Left) + Sqr(K - VRect.Top));
                sgTopRight      : Coef := Sqrt(Sqr(VRect.Right - J) + Sqr(K - VRect.Top));
                sgBottomLeft    : Coef := Sqrt(Sqr(J - VRect.Left) + Sqr(VRect.Bottom - K));
                sgBottomRight   : Coef := Sqrt(Sqr(VRect.Right - J) + Sqr(VRect.Bottom - K));
                sgRadial        : Coef := Sqrt(Sqr(((VRect.Right - VRect.Left) shr 1) - J) + Sqr(K - ((VRect.Bottom - VRect.Top) shr 1)));
                sgDoubleHorz    : Coef := Abs(J - MaxDist - VRect.Left);
                sgDoubleVert    : Coef := Abs(K - MaxDist - VRect.Top);
            end;
            LigDest[J].rgbRed   := Byte(Round(Deb[0]+(Diff[0]*Coef)));
            LigDest[J].rgbGreen := Byte(Round(Deb[1]+(Diff[1]*Coef)));
            LigDest[J].rgbBlue  := Byte(Round(Deb[2]+(Diff[2]*Coef)));
        end;
    end;
    end;
    if Circle and not Saut then
    begin
        if Segment <> 0 then
        begin
            LigDest := BitmapRond.ScanLine[VRectRond.Top];
            for J := VRectRond.Left to VRectRond.Right - 1 do
            begin
                if (Region > 0) and not PtInRegion(Region, J, K) then
                    Continue;
                Coef := J - VRectRond.Left;
                LigDest[J].rgbRed   := Byte(Round(Deb[0]+(Diff[0]*Coef)));
                LigDest[J].rgbGreen := Byte(Round(Deb[1]+(Diff[1]*Coef)));
                LigDest[J].rgbBlue  := Byte(Round(Deb[2]+(Diff[2]*Coef)));
            end;
        end;

        Rayon := Round(VRectRond.Right / Pi) / 2;
        SetLength(TabCirclePt,VRectRond.Right+1);
        Centre1 := VRect.Right / 2;
        Centre2 := VRect.Bottom / 2;
        if Segment <> 0 then
            Bitmap.Canvas.Pen.Width:=2;
        for I := VRectRond.Left to VRectRond.Right - 1 do
        begin
            if Segment <> 0 then
            begin
                if I = VRectRond.Right then
                    Bitmap.Canvas.Pen.Width := 1;
                Bitmap.Canvas.Pen.Color := BitmapRond.Canvas.Pixels[I,VRect.Top];
                Bitmap.Canvas.Brush.Color := Bitmap.Canvas.Pixels[I,VRect.Top];
                Bitmap.Canvas.PenPos := Point(VRect.Right div 2,VRect.Bottom div 2);// Positionnement au centre du cercle
            end;

            if PPie and (Segment = 2) then
                Angle1 := (90-(90/(VRectRond.Right/4)*I))/2
            else
                Angle1 := (180-(90/(VRectRond.Right/4)*I))/2;
            Res1:=(Cos(Deg*Angle1)*Rayon)*2;
            Angle2:=90-Angle1;
            Res2:=(Cos(Deg*Angle2)*Res1);
            Res3:=(Cos(Deg*Angle1)*Res1);
            if Segment <> 0 then
                Bitmap.Canvas.LineTo(Round(Centre1+Res2),Round(Res3));
            TabCirclePt[I][0]:=Round(Centre1+Res2); //Mise en place des points X du cercle
            TabCirclePt[I][1]:=Round(Res3);         //Mise en place des points Y du cercle
        end;

//            VRectRond.Right/4 => Nombre de points dans un quart de cercle
//            90/(VRectRond.Right/4) => un point tous les n degrés
//            (90/(VRectRond.Right/4)*I) => increment
//            (90-(90/(VRectRond.Right/4)*I)) => on part de 90°
//            Donc un angle de 90° vers 0° puis 0° vers -90°

        //Mise en place des points du cercle pour le demi cercle 4eme quart puis 1er quart
        SetLength(TabCirclePtPie,(VRectRond.Right div 2)+1);
        J := High(TabCirclePt);
        if (Segment = 2)and PPie then
        begin
//            si on travaille sur pie complet sans segment donc 2
            for I := ((J div 2)+(J div 4)+1) to (J-(J div 4)) do
            begin
                TabCirclePtPie[I-((J div 2)+(J div 4))][0]:=TabCirclePt[I][0];
                TabCirclePtPie[I-((J div 2)+(J div 4))][1]:=TabCirclePt[I][1];
            end;
            for I := (J-(J div 4)) to J do
            begin
                TabCirclePtPie[I-(J div 2)][0] := TabCirclePt[I][0];
                TabCirclePtPie[I-(J div 2)][1] := TabCirclePt[I][1];
            end;
        end
        else
        begin
//            Si on travaille sur plusieurs segments
            for I := (J-(J div 4)) to J do
            begin
                TabCirclePtPie[I-(J-(J div 4))][0] := TabCirclePt[I][0];
                TabCirclePtPie[I-(J-(J div 4))][1] := TabCirclePt[I][1];
            end;
            for I := 0 to (J div 4) do
            begin
                TabCirclePtPie[I+(J div 4)][0]:=TabCirclePt[I][0];
                TabCirclePtPie[I+(J div 4)][1]:=TabCirclePt[I][1];
            end;
        end;
        if (Segment <> 0) and Circle then
            BitmapRond.Free;
    end;
end;

Procedure TQProgressBar.TexteDraw(Bitmap: TBitmap; Text: String);
begin
//    Bitmap.Canvas.Font.Color:=clBlack;
    if not PPie then
        Bitmap.Canvas.TextRect(Bitmap.Canvas.ClipRect,
            (Bitmap.Width div 2)-((Bitmap.Canvas.TextWidth(Text))div 2),
            (Bitmap.Height div 2)-((Bitmap.Canvas.TextHeight(Text))div 2),
            Text)
    else
        Bitmap.Canvas.TextRect(Bitmap.Canvas.ClipRect,
            (Bitmap.Width div 2)-((Bitmap.Canvas.TextWidth(Text))div 2),
            (Bitmap.Height div 2)-((Bitmap.Canvas.TextHeight(Text))div 2)-40,
            Text);
end;

procedure FlouBitmap(Bitmap : TBitmap);
var
    I       : Integer;
    J       : Integer;
    K       : Integer;
    L       : Integer;
    Ligne   : PByteArray;
begin
    for I := 0 to 2 do
    begin
        for J := 0 to Bitmap.Height - 1 do
        begin
            Ligne := Bitmap.ScanLine[J];
            for K := 1 to Bitmap.Width - 1 do
            begin
               L := K * 3;
               Ligne[L+2] := (Ligne[L+2]+Ligne[L-1]) div 2;
               Ligne[L+1] := (Ligne[L+1]+Ligne[L-2]) div 2;
               Ligne[L+0] := (Ligne[L+0]+Ligne[L-3]) div 2;
            end;
        end;
    end;
end;

Procedure TQProgressBar.DrawBall(Rayon : Single; VRect : TRect; TempBitmap : TBitmap);
var
    DebBitmap   : TBitmap;
    DiaBall     : Single;
    RayBall     : Single;
    Ray2Ball    : Single;
    PerBall     : Single;
    NoCerBall   : Integer;
    SizeBall    : Single;
    I           : Integer;
    Pos         : Integer;
    Angle1      : Single;
    Angle2      : Single;
    Res1        : Single;
    Res2        : Single;
    Res3        : Single;
    GRect       : TRect;
begin
    DebBitmap := TBitmap.Create;
    try
        DebBitmap.Width := VRect.Right;
        DebBitmap.Height := VRect.Bottom;
        if DiamBall = 0 then
            DiaBall := Rayon / 2
        else
            if DiamBall > (Rayon / 1.1) then
                DiaBall := Rayon / 1.1
            else
                DiaBall := DiamBall;
        RayBall   := DiaBall / 2; // Rayon du cercle principal ball, Espacement entre les cercles (lié au diamètre)
        Ray2Ball  := Rayon - (RayBall +(RayBall / 5)); // Rayon des Ball
        PerBall   := Ray2Ball * 2 * Pi; // Perimetre des ball
        NoCerBall := Round(PerBall / DiaBall); // Nombre de ball possible
        SizeBall  := DiaBall / 10; // Décalage des balls
//        Mise en place des transparences dans le bitmap de travail
        DebBitmap.Canvas.Brush.Color := TransparentColor;
        DebBitmap.Canvas.Pen.Color := clWhite;
        DebBitmap.TransparentMode := tmFixed;
        DebBitmap.Transparent := True;
        DebBitmap.TransparentColor := clWhite;
//        Inversion des couleurs pour avoir les petits cercle transparent
        DebBitmap.Canvas.Rectangle( -1, -1, VRect.Right +1, VRect.Bottom +1);
        DebBitmap.Canvas.Brush.Color := clWhite;
//        Si la position est à 0 ont dessines des cercles vide
//        if Position = 0 then                        // afficher des points vide quand position 0
//            DebBitmap.Canvas.Pen.Color := clBlack;
//        Dessin des cercles en fonction du diam et du nombres de cercles
        SetLength(TabCentBall,NoCerBall+1);
        TabInfBall[0] := RayBall;
        TabInfBall[1] := Ray2Ball;
        TabInfBall[2] := SizeBall;
        TabInfBall[3] := (DiaBall-(SizeBall*2))/2;
        for I := 1 to NoCerBall do
        begin
            Angle1 := (180-((90/(PerBall/4))*(PerBall*(I / NoCerBall))))/2;
            Res1 := (Cos(Deg*Angle1)*Ray2Ball)*2;
            Angle2 := 180-(Angle1+90);
            Res2 := (Cos(Deg*Angle2)*Res1);
            Res3 := (Cos(Deg*Angle1)*Res1);
//            Mise en place des centres des cercles dans un tableau
            TabCentBall[I][0]:=Round(Res2);
            TabCentBall[I][1]:=Round(Res3);

            {DebBitmap.Canvas.Pen.Width := 1;
            DebBitmap.Canvas.Pen.Color := clGray;
            DebBitmap.Canvas.Ellipse(   Round((VRect.Right / 2) +Res2 -RayBall +SizeBall+1),
                                        Round((VRect.Bottom / 2)-Ray2Ball +Res3 -RayBall +SizeBall+1),
                                        Round((VRect.Right / 2) +Res2 +RayBall -SizeBall-1),
                                        Round((VRect.Bottom / 2)-Ray2Ball +Res3 +RayBall -SizeBall)-1);}

            DebBitmap.Canvas.Pen.Width := 1;
            DebBitmap.Canvas.Pen.Color := clBlack;
            DebBitmap.Canvas.Ellipse(   Round((VRect.Right / 2) +Res2 -RayBall +SizeBall),
                                        Round((VRect.Bottom / 2)+Res3 -RayBall +SizeBall -Ray2Ball),
                                        Round((VRect.Right / 2) +Res2 +RayBall -SizeBall),
                                        Round((VRect.Bottom / 2)+Res3 +RayBall -SizeBall -Ray2Ball));

            {DebBitmap.Canvas.Pen.Width := 1;
            DebBitmap.Canvas.Pen.Color := clSilver;
            DebBitmap.Canvas.Ellipse(   Round((VRect.Right / 2) +Res2 -RayBall +SizeBall+2),
                                        Round((VRect.Bottom / 2)-Ray2Ball +Res3 -RayBall +SizeBall+2),
                                        Round((VRect.Right / 2) +Res2 +RayBall -SizeBall-2),
                                        Round((VRect.Bottom / 2)-Ray2Ball +Res3 +RayBall -SizeBall)-2);}
        end;
//        Copie dans le bitmap courant pour suppression des couleurs extérieur au ball
        TempBitmap.Canvas.Draw(0, 0, DebBitmap);
        TempBitmap.Canvas.Pen.Color := TransparentColor;
        TabCircle[1].Assign(TempBitmap);
        if Boucle and (TypeBoucle = tbFondu) then
        begin
            BitmapGradient(TabCircle[1],VRect,ColorFonduFirst,ColorFonduEnd,sgTopRight,0,False);
            TabCircle[1].Canvas.Draw(0, 0, DebBitmap);
        end;
        if Boucle and (TypeBoucle = tbDefil) then
        begin
            Pos := Round(DiaBall-(SizeBall*2));
            GRect := Rect(0,0,Pos,Pos);
            TabCircle[1].Width := Pos;
            TabCircle[1].Height := Pos;
//            mise en place des couleurs de la ball defil
            BitmapGradient(TabCircle[1], GRect, ColorFonduFirst, ColorFonduEnd, sgTopRight, 0,true);
            DebBitmap.Assign(nil);
            DebBitmap.Width := VRect.Right;
            DebBitmap.Height := VRect.Bottom;
            DebBitmap.Canvas.Brush.Color := TransparentColor;
            DebBitmap.Canvas.Pen.Color := clWhite;
            DebBitmap.TransparentMode := tmFixed;
            DebBitmap.Transparent := True;
            DebBitmap.TransparentColor := clWhite;
//            Inversion des couleurs pour avoir les petits cercle transparent
            DebBitmap.Canvas.Rectangle( -1, -1, Pos + 1, Pos + 1);
            DebBitmap.Canvas.Brush.Color := clWhite;
            DebBitmap.Canvas.Ellipse( 0, 0, Pos, Pos);
            TabCircle[1].Canvas.Draw(0, 0, DebBitmap);
        end;
    finally
        DebBitmap.Free;
    end;
end;

procedure TQProgressBar.DrawCircle(Rayon : Single; VRect : TRect; TempBitmap : TBitmap);
var
    PtXY        : Integer;
    PtX         : Integer;
    PtY         : Integer;
    Pos         : Integer;
begin
    if Circle then
    begin
//         Diminution des irrégularitées et suppression des extérieurs
        Pos := Round(Sqrt(Sqr(Rayon)+Sqr(Rayon))-Rayon)+ 3;
        TempBitmap.Canvas.Pen.Width := Pos + 3;
        Pos := Pos div 2;
        TempBitmap.Canvas.Brush.Style := bsClear;
        TempBitmap.Canvas.Pen.Color := TransparentColor;
        TempBitmap.Canvas.Ellipse(-Pos, -Pos, VRect.Right + Pos, VRect.Bottom + Pos);
        if not Boucle then
        begin
            TempBitmap.Canvas.Pen.Width := 1;
            TempBitmap.Canvas.Pen.Color := clBlack;
            TempBitmap.Canvas.Ellipse( 0, 0, VRect.Right, VRect.Bottom);
        end;
//        Verification des min max
        if Min < 0 then
        begin
            Max := Max - Min;
            Min := 0;
        end;
        if Position > Max then
            Max := Position;
        if Position < Min then
            Min := Position;
//        Mise en place des ball
        if Ball then
            DrawBall(Rayon, VRect, TempBitmap);
        if Boucle and Circle then
        begin
            if (TypeBoucle = tbFondu)and not Ball then
            begin
                TabCircle[1].Assign(TempBitmap);
                BitmapGradient(TabCircle[1],VRect,ColorFonduFirst,ColorFonduEnd,sgTopRight,0, False);
            end;
            UpdateImageProgress(TempBitmap, VRect);
            Exit;
        end;
//        Mise en place de la part
        if (Position >= 0) and (Position <> Max)then
        begin
            if not PPie then
            begin
                PtXY := Round((High(TabCirclePt)+1)*(Position / Max));
                PtX  := TabCirclePt[PtXY][0];
                PtY  := TabCirclePt[PtXY][1];
            end
            else
            begin
                PtXY := Round((High(TabCirclePtPie)+1)*(Position / Max));
                PtX  := TabCirclePtPie[PtXY][0];
                PtY  := TabCirclePtPie[PtXY][1];
            end;

            TempBitmap.Canvas.Brush.Color := TransparentColor;
            if not PPie then
                TempBitmap.Canvas.Pie(  Round((VRect.Right / 2)-Rayon),Round((VRect.Bottom / 2)-Rayon),
                                        Round((VRect.Right / 2)+Rayon),Round((VRect.Bottom / 2)+Rayon),
                                        Round((VRect.Right / 2)),Round((VRect.Bottom / 2)-Rayon),
                                        PtX,PtY)
            else
                TempBitmap.Canvas.Pie(  Round((VRect.Right / 2)-Rayon),Round((VRect.Bottom / 2)-Rayon),
                                        Round((VRect.Right / 2)+Rayon),Round((VRect.Bottom / 2)+Rayon),
                                        Round((VRect.Right / 2)-Rayon),Round((VRect.Bottom / 2)),
                                        PtX,PtY);

        end;
        if not Ball then
            ContourCircle(TempBitmap, VRect, Rayon);
    end;
end;

procedure TQProgressBar.DrawText(TempBitmap : TBitmap);
begin
    TempBitmap.Canvas.Brush.Color := TransparentColor;
    TempBitmap.Canvas.Brush.Style := bsClear;
    TempBitmap.Canvas.Font := Font;
//    Affichage de la valeur
    if StyleText = sttValue then
        TexteDraw(TempBitmap, Format('%d',[Round(Position)]));
//    Affichage du pourcentage
    if StyleText = sttPercent then
        TexteDraw(TempBitmap, Format('%d %s',[Round((Position / Max)*100),'%']));
//    Affichage du texte brut
    if StyleText = sttTexte then
        TexteDraw(TempBitmap, Format('%s',[Text]));
end;

procedure TQProgressBar.DrawBar(VRect : TRect; TempBitmap : TBitmap);
var
    VRectSup    : TRect;
    Ofs         : Integer;
begin
//    Suppression de la partie inutile
    if not Boucle then
    begin
        TempBitmap.Canvas.Brush.Style:=bsSolid;
        TempBitmap.Canvas.Brush.Color:=TransparentColor;
        TempBitmap.Canvas.Pen.Color:=TransparentColor;
        VRectSup:=TempBitmap.Canvas.ClipRect;
    end;

    if (Position >= 0) and (not Boucle) then
    begin
        if SensBar = sbLeftRight then
            VRectSup.Left:=Round(VRectSup.Left+(((VRectSup.Right-VRectSup.Left)*Position)div Max));
        if SensBar = sbRightLeft then
            VRectSup.Right:=Round(((VRectSup.Right)*(Max-Position))div Max);
        if SensBar = sbRightLeftInv then
            VRectSup.Right:=Round(((VRectSup.Right)*Position)div Max);
        if SensBar = sbTopBottom then
            VRectSup.Top:=Round(VRectSup.Top+(((VRectSup.Bottom-VRectSup.Top)*Position)div Max));
        if SensBar = sbBottomTop then
            VRectSup.Bottom:=Round(((VRectSup.Bottom)*(Max-Position))div Max);
        if SensBar = sbBottomTopInv then
            VRectSup.Bottom:=Round(((VRectSup.Bottom)*Position)div Max);
    end;

    if (SliderVisible) and (Position >= 0) and (not Boucle) then
    begin
        Ofs := (SliderWidth div 2);
        if (SensBar = sbLeftRight) then
            VRectSup.Left:=Round(VRectSup.Left/(VRectSup.Right/(VRectSup.Right-SliderWidth))+Ofs);
        if (SensBar = sbRightLeft) or(SensBar = sbRightLeftInv)then
            VRectSup.Right:=Round(VRectSup.Right/(TempBitmap.Canvas.ClipRect.Right/(TempBitmap.Canvas.ClipRect.Right - SliderWidth))+Ofs);
        if (SensBar = sbTopBottom) then
            VRectSup.Top:=Round(VRectSup.Top/(VRectSup.Bottom/(VRectSup.Bottom-SliderWidth))+Ofs);
        if (SensBar = sbBottomTop)or(SensBar = sbBottomTopInv)then
            VRectSup.Bottom:=Round(VRectSup.Bottom/(TempBitmap.Canvas.ClipRect.Bottom/(TempBitmap.Canvas.ClipRect.Bottom - SliderWidth))+Ofs);
    end;
    TempBitmap.Canvas.Rectangle(VRectSup);

    if Boucle and not SliderVisible then
        UpdateImageProgress(TempBitmap, VRect);
end;

procedure TQProgressBar.DrawTip(VRect : TRect; TempBitmap : TBitmap);
begin
//    Suppression des angles
    TempBitmap.Canvas.Brush.Style := bsClear;
    TempBitmap.Canvas.Pen.Width := 5;
    TempBitmap.Canvas.Pen.Color := TransparentColor;
    TempBitmap.Canvas.RoundRect(0,0,VRect.Right,VRect.Bottom,12,12);

//    Mise en place du contour
    TempBitmap.Canvas.Pen.Width := 2;
    TempBitmap.Canvas.Pen.Color := clGray;
    TempBitmap.Canvas.RoundRect(1,1,VRect.Right-1,VRect.Bottom-1,8,8);

    TempBitmap.Canvas.Pen.Width := 1;
    TempBitmap.Canvas.Pen.Color := clBlack;
    TempBitmap.Canvas.RoundRect(0,0,VRect.Right,VRect.Bottom,12,12);

    TempBitmap.Canvas.Pen.Width := 1;
    TempBitmap.Canvas.Pen.Color := clSilver;
    TempBitmap.Canvas.RoundRect(2,2,VRect.Right-2,VRect.Bottom-2,8,8);
end;

procedure TQProgressBar.DrawTick(VRect : TRect);
var
    Ofs     : Integer;
    Ofs2    : Single;
    I       : Integer;
    VBitmap : TBitmap;
begin
//        Partie curseur bas
    VBitmap := TBitmap.Create;
    try
        if (TickVisible) then
        begin
            VBitmap.Width := VRect.Right;
            VBitmap.Height := VRect.Bottom;
            VBitmap.PixelFormat := pf32Bit;
            VBitmap.TransparentMode := tmFixed;
            VBitmap.Transparent := True;
            VBitmap.Canvas.Brush.Style := bsClear;
            VBitmap.TransparentColor := TransparentColor;
            VBitmap.Canvas.Brush.Color := TransparentColor;
            VBitmap.Canvas.Pen.Color := TransparentColor;
            VBitmap.Canvas.Rectangle(0, 0, VBitmap.Width, VBitmap.Height);
            Ofs := (SliderWidth div 2);
            VBitmap.Canvas.Pen.Width := 1;
            if TickMarks <> tmLine then
                VBitmap.Canvas.Pen.Color := clBlack
            else
                VBitmap.Canvas.Pen.Color := TickColor;
            VBitmap.Canvas.Brush.Color := TickColor;
            Ofs2 := (VRect.Right-Ofs)/(ClientRect.Right / TickFrequency); //TickFrequency valeur multi
            if (SensBar = sbLeftRight)or(SensBar = sbRightLeft)or(SensBar = sbRightLeftInv)then
            begin
                if (TickPos = tpBottomLeft)or(TickPos = tpAll) then
                begin
                    if TickMarks = tmTriangle then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                              VBitmap.Canvas.Polygon([Point(Round((Ofs2 * I)-3),VRect.Bottom-1),
                                                    Point(Round((Ofs2 * I)),VRect.Bottom - TickSize),
                                                    Point(Round((Ofs2 * I)+3),VRect.Bottom-1)]);
                    if TickMarks = tmRoundRect then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                            VBitmap.Canvas.RoundRect(Round((Ofs2 * I)-2),
                                                    VRect.Bottom - TickSize,
                                                    Round((Ofs2 * I)+2),
                                                    VRect.Bottom + 3,5,5);
                    if TickMarks = tmLine then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                        begin
                            VBitmap.Canvas.PenPos := Point(Round(Ofs2 * I),VRect.Bottom);
                            VBitmap.Canvas.LineTo(Round(Ofs2 * I),VRect.Bottom - TickSize);
                        end;
                end;
                if (TickPos = tpTopRight)or(TickPos = tpAll) then
                begin
                    if TickMarks = tmTriangle then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                              VBitmap.Canvas.Polygon([Point(Round((Ofs2 * I)-3),0),
                                                     Point(Round((Ofs2 * I)),TickSize),
                                                     Point(Round((Ofs2 * I)+3),0)]);
                    if TickMarks = tmRoundRect then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                            VBitmap.Canvas.RoundRect(Round((Ofs2 * I)-2),-3,
                                                    Round((Ofs2 * I)+2),TickSize,5,5);
                    if TickMarks = tmLine then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                        begin
                            VBitmap.Canvas.PenPos := Point(Round(Ofs2 * I),0);
                            VBitmap.Canvas.LineTo(Round(Ofs2 * I),TickSize);
                        end;
                end;
            end
            else
            begin
                if (TickPos = tpBottomLeft)or(TickPos = tpAll) then
                begin
                    if TickMarks = tmTriangle then
                        for I := 1 to (ClientRect.Bottom div TickFrequency) do
                              VBitmap.Canvas.Polygon([Point(0,Round(Ofs2 * I)-4),
                                                     Point(TickSize,Round(Ofs2 * I)),
                                                     Point(0,Round(Ofs2 * I)+4)]);
                    if TickMarks = tmRoundRect then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                            VBitmap.Canvas.RoundRect(-3,Round((Ofs2 * I)-2),
                                                    TickSize,Round((Ofs2 * I)+2),5,5);
                    if TickMarks = tmLine then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                        begin
                            VBitmap.Canvas.PenPos := Point(0,Round(Ofs2 * I));
                            VBitmap.Canvas.LineTo(TickSize,Round(Ofs2 * I));
                        end;
                end;
                if (TickPos = tpTopRight)or(TickPos = tpAll) then
                begin
                    if TickMarks = tmTriangle then
                        for I := 1 to (ClientRect.Bottom div TickFrequency) do
                              VBitmap.Canvas.Polygon([Point((VRect.Right-1),Round(Ofs2 * I)-4),
                                                     Point((VRect.Right - TickSize),Round(Ofs2 * I)),
                                                     Point((VRect.Right-1),Round((Ofs2 * I)+4))]);
                    if TickMarks = tmRoundRect then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                            VBitmap.Canvas.RoundRect(VRect.Right - TickSize,
                                                    Round((Ofs2 * I)-2),
                                                    VRect.Right +3,
                                                    Round((Ofs2 * I)+2),5,5);
                    if TickMarks = tmLine then
                        for I := 1 to (ClientRect.Right div TickFrequency) do
                        begin
                            VBitmap.Canvas.PenPos := Point(VRect.Right,Round(Ofs2 * I));
                            VBitmap.Canvas.LineTo(VRect.Right - TickSize,Round(Ofs2 * I));
                        end;
                end;
            end;
            TabBitmap[2].Assign(VBitmap);
        end;
    finally
        VBitmap.Free;
    end;
end;

function TQProgressBar.CalNewPos(VRect : TRect): Integer;
var
    Pos     : Integer;
    NewPos  : Integer;
    Ofs     : Integer;
begin
    Ofs := (SliderWidth div 2);
    if (SensBar = sbLeftRight)or(SensBar = sbRightLeftInv) then
    begin
        Pos := Round((VRect.Left)+(((VRect.Right)-VRect.Left)*Position)div Max)- Ofs;
        NewPos := Round((Pos+Ofs)/(VRect.Right/(VRect.Right-(Ofs*2))));
    end;
    if (SensBar = sbRightLeft) then
    begin
        Pos := Round((VRect.Left)+(((VRect.Right)-VRect.Left)*(Max - Position))div Max)- Ofs;
        NewPos := Round((Pos+Ofs)/(VRect.Right/(VRect.Right-(Ofs*2))));
    end;
    if (SensBar = sbBottomTop) then
    begin
        Pos := Round((VRect.Top)+(((VRect.Bottom)-VRect.Top)*(Max - Position))div Max)- Ofs;
        NewPos := Round((Pos+Ofs)/(VRect.Bottom/(VRect.Bottom-(Ofs*2))));
    end;
    if (SensBar = sbTopBottom)or(SensBar = sbBottomTopInv) then
    begin
        Pos := Round((VRect.Top)+(((VRect.Bottom)-VRect.Top)*Position)div Max)- Ofs;
        NewPos := Round((Pos+Ofs)/(VRect.Bottom/(VRect.Bottom-(Ofs*2))));
    end;
    Result := NewPos;
end;

procedure TQProgressBar.DrawSlider(VRect : TRect);
var
    VBitmap : TBitmap;
begin
    VBitmap := TBitmap.Create;
    try
//        BringToFront;
        if (SensBar = sbLeftRight)or(SensBar = sbRightLeft)or(SensBar = sbRightLeftInv) then
        begin
            VBitmap.Height := Height - 6;
            VBitmap.Width := SliderWidth ;
        end
        else
        begin
            VBitmap.Width := Width - 6;
            VBitmap.Height := SliderWidth ;
        end;
        VBitmap.PixelFormat := pf32Bit;
        VBitmap.TransparentMode := tmFixed;
        VBitmap.Transparent := True;
        BitmapGradient(VBitmap, VBitmap.Canvas.ClipRect, SliderColorFirst, SliderColorEnd, SliderStyleGradient, 0, False);
        VBitmap.Canvas.Brush.Style := bsSolid;
        VBitmap.TransparentColor := TransparentColor;
        VBitmap.Canvas.Brush.Color := TransparentColor;
        VBitmap.Canvas.Pen.Width := 3;
        VBitmap.Canvas.Brush.Style := bsClear;
        VBitmap.Canvas.Pen.Color := TransparentColor;
        if (SensBar = sbLeftRight)or(SensBar = sbRightLeft)or(SensBar = sbRightLeftInv) then
            VBitmap.Canvas.Rectangle(0, 0, SliderWidth,VBitmap.Height)
        else
            VBitmap.Canvas.Rectangle(0, 0, VBitmap.Width,SliderWidth);
        VBitmap.Canvas.Brush.Style := bsClear;
//        Mise en place du contour
        VBitmap.Canvas.Pen.Color := clGray;
        if (SensBar = sbLeftRight)or(SensBar = sbRightLeft)or(SensBar = sbRightLeftInv) then
            VBitmap.Canvas.RoundRect(1,1,SliderWidth - 1,VBitmap.Height - 1,10,10) //Vertical
        else
            VBitmap.Canvas.RoundRect(1,1,VBitmap.Width - 1,SliderWidth - 1,10,10); //Horizontal
        VBitmap.Canvas.Pen.Width := 1;
        VBitmap.Canvas.Pen.Color := clBlack;
        if (SensBar = sbLeftRight)or(SensBar = sbRightLeft)or(SensBar = sbRightLeftInv) then
            VBitmap.Canvas.RoundRect(0,0,SliderWidth,VBitmap.Height,10,10)
        else
            VBitmap.Canvas.RoundRect(0,0,VBitmap.Width,SliderWidth,10,10);
        VBitmap.Canvas.Pen.Color := clSilver;
        if (SensBar = sbLeftRight)or(SensBar = sbRightLeft)or(SensBar = sbRightLeftInv) then
            VBitmap.Canvas.RoundRect(2,2,SliderWidth - 2,VBitmap.Height - 2,10,10)
        else
            VBitmap.Canvas.RoundRect(2,2,VBitmap.Width - 2,SliderWidth - 2,10,10);
        TabBitmap[1].Assign(VBitmap);
//        SetZOrder(True);
    finally
        VBitmap.Free;
    end;
end;

procedure TQProgressBar.DrawPie(VRect : TRect; Bitmap : TBitmap);
var
    VBRect   : TRect;
    VBDRect  : TRect;
begin
    VBRect := Bitmap.Canvas.ClipRect;
    VBDRect := Bitmap.Canvas.ClipRect;
    VBRect.Bottom := VBRect.Bottom div 2;
    VBDRect.Bottom := VBRect.Bottom div 2;
    VBDRect.Top := VRect.Bottom div 2;
    VBDRect.Bottom := VRect.Bottom;
    Bitmap.Canvas.Brush.Style := bsSolid;
    Bitmap.Canvas.Brush.Color := TransparentColor;
    Bitmap.Canvas.Pen.Color := TransparentColor;
    Bitmap.Canvas.Rectangle(VBDRect);
    VBDRect.Top := VBDRect.Top - 10;
    VBDRect.Bottom := VBDRect.Bottom - 10;
    Bitmap.Canvas.CopyRect(VBDRect,Bitmap.Canvas,VBRect);
    VBRect.Top := VBRect.Top - 10;
    VBRect.Bottom := VBRect.Bottom - 10;
    Bitmap.Canvas.Rectangle(VBRect);
end;

function TQProgressBar.CalRect():TRect;
begin
    Result := ClientRect;
    if (not Circle)and(not Boucle) then
    begin
        Result.Right := Result.Right - 6;
        Result.Bottom := Result.Bottom - 6;
    end;

    if Circle then
        if Result.Bottom <= Result.Right then
            Result.Right := Result.Bottom
        else
            Result.Bottom := Result.Right;
end;

procedure TQProgressBar.ReDraw(VRect : TRect);
var
    FinBitmapRe : TBitmap;
begin
    FinBitmapRe := TBitmap.Create;
    try
        FinBitmapRe.PixelFormat   := pf32Bit;
//        Mise en place des dimensions du bitmap
        FinBitmapRe.Canvas.Pen.Color := clBlack;
        FinBitmapRe.Canvas.Brush.Color := TransparentColor;
        FinBitmapRe.Width := VRect.Right;
        FinBitmapRe.Height := VRect.Bottom;
        FinBitmapRe.TransparentMode := tmFixed;
        FinBitmapRe.Transparent := True;
        FinBitmapRe.TransparentColor := TransparentColor;
//        Mise en place du dégrader dans le bitmap;
        if Position >= 0 then
        begin
            if not Boucle then
            begin
                BitmapGradient(FinBitmapRe, VRect, ColorFirst, ColorEnd, StyleGradient, 0, False);
                TabBitmap[0].Assign(FinBitmapRe);
            end
            else
            begin
                BitmapGradient(FinBitmapRe, VRect, ColorFirst, ColorEnd, StyleGradient, 0, False);
                if TypeBoucle = tbFondu then
                begin
                    TabBitmap[0].Assign(FinBitmapRe);
                    TabTempBitmap[2].Assign(FinBitmapRe);
                    BitmapGradient(FinBitmapRe, VRect, ColorFonduFirst, ColorFonduEnd, StyleGradient, 0, False);
                    if Circle then
                        TabBitmap[2].Assign(FinBitmapRe)
                    else
                    begin
                        TabTempBitmap[0].Assign(FinBitmapRe);
                        TabTempBitmap[1].Assign(FinBitmapRe);
                    end;
                end;
                if (TypeBoucle = tbDefil)then
                    TabBitmap[0].Assign(FinBitmapRe);
            end;
        end;
    finally
        FinBitmapRe.Free;
    end;
end;

procedure TQProgressBar.Paint;
var
    VRect       : TRect;
    FinBitmap   : TBitmap;
    Rayon       : Single;
    NewPos      : Integer;
begin
    FinBitmap  := TBitmap.Create;
    try
        VRect := ClientRect;
        if (not Circle) and (not Boucle)then
        begin
            VRect.Right := VRect.Right - 6;
            VRect.Bottom := VRect.Bottom - 6;
        end;

        if Circle then
        begin
            if VRect.Bottom <= VRect.Right then
            begin
                VRect.Right := VRect.Bottom;
                Rayon := VRect.Right / 2;
            end
            else
            begin
                VRect.Bottom := VRect.Right;
                Rayon := VRect.Bottom / 2;
            end;
        end;

        if TabBitmap[0].Empty then
            ReDraw(VRect);

//        On Charge le Bitmap
            FinBitmap.Assign(TabBitmap[0]);
//        FlouBitmap(FinBitmap);

//        Si la forme et un rond
        if Circle then
            DrawCircle(Rayon, VRect, FinBitmap);

//        Partie bar standard
        if not Circle then
            DrawBar(VRect, FinBitmap);

//        Mise en place du Slider
        if (SliderVisible)and(not Circle)and(not Boucle) then
        begin
            if TabBitmap[1].Empty then
                DrawSlider(VRect);
            NewPos := CalNewPos(VRect);
            if (SensBar = sbLeftRight)or(SensBar = sbRightLeft)or(SensBar = sbRightLeftInv) then
                FinBitmap.Canvas.Draw(NewPos, 0, TabBitmap[1])
            else
                FinBitmap.Canvas.Draw(0, NewPos, TabBitmap[1]);
        end;

//        Mise en place des Tick
        if (TickVisible)and(SliderVisible)and(not Circle)and(not Boucle) then
        begin
            if TabBitmap[2].Empty then
                DrawTick(VRect);
            FinBitmap.Canvas.Draw(0,0,TabBitmap[2]);
        end;

//        Mise en place du texte
        if (StyleText <> sttNone)and(not Boucle) then
            DrawText(FinBitmap);

//        Mise en place de la boucle
        if not Boucle then
        begin
            Canvas.Brush.Color := TransparentColor;
            Canvas.Brush.Style := bsClear;
            if not Circle then
            begin
                Canvas.Draw(3, 3, FinBitmap);
                FinBitmap.Assign(nil);
                VRect := ClientRect;
                FinBitmap.PixelFormat  := pf32Bit;
                FinBitmap.Canvas.Pen.Color := clBlack;
                FinBitmap.Canvas.Brush.Color := TransparentColor;
                FinBitmap.Width := VRect.Right;
                FinBitmap.Height := VRect.Bottom;
                FinBitmap.TransparentMode := tmFixed;
                FinBitmap.Transparent := True;
                FinBitmap.TransparentColor := TransparentColor;
                FinBitmap.Width := VRect.Right;
                FinBitmap.Height := VRect.Bottom;
                DrawTip(VRect,FinBitmap);
            end;
            Canvas.Draw(0, 0, FinBitmap);
        end;
    finally
        FinBitmap.Free;
    end;
end;

end.

