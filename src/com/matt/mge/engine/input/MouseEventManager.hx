package com.matt.mge.engine.input;

import flash.events.MouseEvent;

/**
 * ...
 * @author Matt Continisio
 */
class MouseEventManager
{
	public static var REF( get, null ):MouseEventManager;
	
	private function new() 
	{
		
	}
	
	private static function get_REF():MouseEventManager
	{
		if ( REF == null )
		{
			REF = new MouseEventManager();
		}
		
		return REF;
	}
	
	public function onMouseClick( event:MouseEvent ):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseClickFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseDoubleClick( event:MouseEvent ):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseDoubleClickFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseDown(event:MouseEvent):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseDownFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseMove( event:MouseEvent ):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseMoveFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseOut( event:MouseEvent ):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseOutFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseOver( event:MouseEvent ):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseOverFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseUp( event:MouseEvent ):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseUpFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseMiddleClick( event:MouseEvent ):Void
	{
		for ( onMouseFunction in InputFunctionManager.REF.onMouseMiddleClickFunctions )
		{
			onMouseFunction( event );
		}
	}
	
	public function onMouseMiddleMouseDown(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseMiddleMouseDownFunctions)
		{
			onMouseFunction(event);
		}
	}
	
	public function onMouseMiddleMouseUp(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseMiddleMouseUpFunctions)
		{
			onMouseFunction(event);
		}
	}
	
	public function onMouseRightClick(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseRightClickFunctions)
		{
			onMouseFunction(event);
		}
	}
	
	public function onMouseRightMouseDown(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseRightMouseDownFunctions)
		{
			onMouseFunction(event);
		}
	}
	
	public function onMouseRightMouseUp(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseRightMouseUpFunctions)
		{
			onMouseFunction(event);
		}
	}
	
	public function onMouseWheel(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseWheelFunctions)
		{
			onMouseFunction(event);
		}
	}
	
	public function onMouseRollOut(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseRollOutFunctions)
		{
			onMouseFunction(event);
		}
	}
	
	public function onMouseRollOver(event:MouseEvent):Void
	{
		for (onMouseFunction in InputFunctionManager.REF.onMouseRollOverFunctions)
		{
			onMouseFunction(event);
		}
	}
}