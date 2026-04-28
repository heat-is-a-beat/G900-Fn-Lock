#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon
SetScrollLockState "On"
; ==========================================
; ⚙️ MAIN OSD CONFIGURATION
; ==========================================
global OSD_W := 146         ; Box Width
global OSD_H := 134         ; Box Height
global OSD_X := 887         ; Screen X position
global OSD_Y := 819         ; Screen Y position 
global Radius := 23         ; Corner roundness (Tweak for smoothness)

global BgColor   := "AAA9A9" ; Opaque Gray
global ProgEmpty := "4D4948" ; Dark Grey unfilled
global ProgFill  := "FFFFFF" ; White filled
global IconColor := "FFFFFF" ; White sun logo

global Fade_Speed := 25      ; Faster = quicker fade (10 to 50 is best)

; ==========================================
; ⚙️ INTERNAL ELEMENTS CONFIGURATION 
; ==========================================
global Icon_Size := 47      ; Size of the Sun logo
global Icon_Y    := -6      ; Push logo down from the top of the box

global Bar_W      := 120    ; Width of the progress bar
global Bar_H      := 12     ; Thickness of the progress bar
global Bar_X      := 12     ; Left/Right position
global Bar_Y      := 100    ; Push bar down from the top of the box
global Bar_Radius := 8      ; Corner roundness of the dark gray container track

; ==========================================
; BRIGHTNESS CONTROL & OSD FUNCTIONS
; ==========================================

GetCurrentBrightness() {
    For property in ComObjGet("winmgmts:\\.\root\WMI").ExecQuery("SELECT * FROM WmiMonitorBrightness") {
        return property.CurrentBrightness
    }
    return 50
}

ChangeBrightness(brightness) {
    brightness := Max(0, Min(brightness, 100))
    For property in ComObjGet("winmgmts:\\.\root\WMI").ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods") {
        property.WmiSetBrightness(1, brightness)
    }
    ShowOSD(brightness)
}

ShowOSD(brightness) {
    static OSDGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20 -DPIScale")
    static TrackGui := ""
    static OSDProgFill := ""
    static initialized := false
    static CurrentAlpha := 0

    ; --- Asynchronous Fading Functions ---
    static FadeIn := () => (
        CurrentAlpha += Fade_Speed,
        (CurrentAlpha >= 255) ? (CurrentAlpha := 255, SetTimer(FadeIn, 0)) : "",
        WinSetTransparent(CurrentAlpha, OSDGui.Hwnd)
    )
    
    static FadeOut := () => (
        CurrentAlpha -= Fade_Speed,
        (CurrentAlpha <= 0) ? (CurrentAlpha := 0, SetTimer(FadeOut, 0), OSDGui.Hide()) : WinSetTransparent(CurrentAlpha, OSDGui.Hwnd)
    )
    
    static HideTimer := () => (SetTimer(FadeIn, 0), SetTimer(FadeOut, 15))

    if (!initialized) {
        OSDGui.MarginX := 0
        OSDGui.MarginY := 0
        OSDGui.BackColor := BgColor
        
        OSDGui.SetFont("s" Icon_Size " c" IconColor, "Segoe UI Symbol") 
        OSDGui.Add("Text", "x0 y" Icon_Y " w" OSD_W " Center BackgroundTrans", "☀")
        
        TrackGui := Gui("-Caption +Parent" OSDGui.Hwnd " -DPIScale")
        TrackGui.MarginX := 0
        TrackGui.MarginY := 0
        TrackGui.BackColor := ProgEmpty
        
        Fill_W := Round(Bar_W * (brightness / 100))
        OSDProgFill := TrackGui.Add("Text", "x0 y0 w" Fill_W " h" Bar_H " Background" ProgFill)
        
        TrackGui.Show("x" Bar_X " y" Bar_Y " w" Bar_W " h" Bar_H)
        WinSetRegion("0-0 w" Bar_W " h" Bar_H " R" Bar_Radius "-" Bar_Radius, TrackGui.Hwnd)
        
        WinSetTransparent(0, OSDGui.Hwnd) ; Set invisible before drawing the first time
        OSDGui.Show("Hide w" OSD_W " h" OSD_H) 
        WinSetRegion("0-0 w" OSD_W " h" OSD_H " R" Radius "-" Radius, OSDGui.Hwnd)
        
        initialized := true
    }
    
    ; Resize the flat white bar inside the rounded track
    Fill_W := Round(Bar_W * (brightness / 100))
    if (Fill_W <= 0) {
        OSDProgFill.Opt("+Hidden")
    } else {
        OSDProgFill.Opt("-Hidden")
        OSDProgFill.Move(,, Fill_W)
    }
    
    ; Logic to manage the active state and fade cleanly without stuttering
    SetTimer(FadeOut, 0) ; Stop fading out immediately if you hit the key again
    if (CurrentAlpha < 255) {
        OSDGui.Show("NoActivate x" OSD_X " y" OSD_Y " w" OSD_W " h" OSD_H)
        SetTimer(FadeIn, 15) ; Trigger the fade-in animation
    }
    
    SetTimer(HideTimer, -1500) ; Wait 1.5 seconds before triggering fade-out
}

; ==========================================
; FN LOCK TOGGLE (SCROLL LOCK)
; ==========================================

#HotIf GetKeyState("ScrollLock", "T")

F1::
F2::
F3::Send "#p"
F4::ChangeBrightness(GetCurrentBrightness() - 10)
F5::ChangeBrightness(GetCurrentBrightness() + 10)
F6::Send "{Volume_Mute}"
F7::Send "{Volume_Down}"
F8::Send "{Volume_Up}
F9::Send "{Media_Play_Pause}"
F10::Send "{Media_Stop}"
F11::Send "{Media_Prev}"
F12::"Send "{Media_Next}"
NumpadDiv::Send "{Home}"
NumpadMult::Send "{End}"

#HotIf

