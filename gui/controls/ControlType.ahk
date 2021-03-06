﻿Class ControlType {
	__New(Gui, Options := "", Text := "") {
		this.Gui := Gui
		
		Gui % this.Gui.hwnd ":Add", % this.Type, % "hwndhwnd " Options, % Text
		this.hwnd := hwnd
		
		SafeRef := new IndirectReferenceHolder(this)
		
		this.Position := new GuiBase.ControlPosition(SafeRef)
		
		this.Gui.Print(this.__Class " created")
		
		return SafeRef
	}
	
	__Delete() {
		;p(type(this) " released")
	}
	
	Pos {
		get {
			return this.Position
		}
	}
	
	Options(Options) {
		GuiControl % this.Gui.hwnd ":" Options, % this.hwnd
	}
	
	Control(Command := "", Options := "") {
		this.Gui.Control(Command, this, Options)
	}
	
	ControlGet(Command := "", Options := "") {
		return this.Gui.ControlGet(Command, this, Options)
	}
	
	MoveDraw(Options) {
		this.Control("MoveDraw", Options)
	}
	
	OnEvent(Func := "") {
		if Func
			this.Control("+g", this.Gui.ControlEvent.Bind(this.Gui, Func))
		else
			this.Control("-g")
		return this
	}
}