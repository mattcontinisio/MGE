package com.matt.mge.engine.input;

import com.roxstudio.haxe.gesture.RoxGestureEvent;
import flash.events.AccelerometerEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TouchEvent;

/**
 * Contains arrays of functions that are called on input events. TODO - figure out mouse vs. touch events
 * @author Matt Continisio
 */
class InputFunctionManager
{
	public static var REF(get, null):InputFunctionManager;
	
	// Touch
	public var onTouchBeginFunctions:Array< TouchEvent->Void >;
	public var onTouchEndFunctions:Array< TouchEvent->Void >;
	public var onTouchMoveFunctions:Array< TouchEvent->Void >;
	public var onTouchOutFunctions:Array< TouchEvent->Void >;
	public var onTouchOverFunctions:Array< TouchEvent->Void >;
	public var onTouchRollOutFunctions:Array< TouchEvent->Void >;
	public var onTouchRollOverFunctions:Array< TouchEvent->Void >;
	public var onTouchTapFunctions:Array< TouchEvent->Void >;
	
	// Mouse
	public var onMouseClickFunctions:Array< MouseEvent->Void >;
	public var onMouseDoubleClickFunctions:Array< MouseEvent->Void >;
	public var onMouseDownFunctions:Array< MouseEvent->Void >;
	public var onMouseMoveFunctions:Array< MouseEvent->Void >;
	public var onMouseOutFunctions:Array< MouseEvent->Void >;
	public var onMouseOverFunctions:Array< MouseEvent->Void >;
	public var onMouseUpFunctions:Array< MouseEvent->Void >;
	public var onMouseMiddleClickFunctions:Array< MouseEvent->Void >;
	public var onMouseMiddleMouseDownFunctions:Array< MouseEvent->Void >;
	public var onMouseMiddleMouseUpFunctions:Array< MouseEvent->Void >;
	public var onMouseRightClickFunctions:Array< MouseEvent->Void >;
	public var onMouseRightMouseDownFunctions:Array< MouseEvent->Void >;
	public var onMouseRightMouseUpFunctions:Array< MouseEvent->Void >;
	public var onMouseWheelFunctions:Array< MouseEvent->Void >;
	public var onMouseRollOutFunctions:Array< MouseEvent->Void >;
	public var onMouseRollOverFunctions:Array< MouseEvent->Void >;
	
	// Accelerometer
	public var onAccelerometerUpdateFunctions:Array< AccelerometerEvent->Void >;
	
	// Keyboard
	public var onKeyDownFunctions:Array< KeyboardEvent->Void >;
	public var onKeyUpFunctions:Array< KeyboardEvent->Void >;
	
	// roxlib
	public var onSwipeFunctions:Array< RoxGestureEvent->Void >;
	public var onPanFunctions:Array< RoxGestureEvent->Void >;
	public var onRotationFunctions:Array< RoxGestureEvent->Void >;
	public var onPinchFunctions:Array< RoxGestureEvent->Void >;
	public var onLongPressFunctions:Array< RoxGestureEvent->Void >;
	
	private function new() 
	{
	}
	
	public function init():Void
	{
		// Touch
		onTouchBeginFunctions = new Array< TouchEvent->Void >();
		onTouchEndFunctions = new Array< TouchEvent->Void >();
		onTouchMoveFunctions = new Array< TouchEvent->Void >();
		onTouchOutFunctions = new Array< TouchEvent->Void >();
		onTouchOverFunctions = new Array< TouchEvent->Void >();
		onTouchRollOutFunctions = new Array< TouchEvent->Void >();
		onTouchRollOverFunctions = new Array< TouchEvent->Void >();
		onTouchTapFunctions = new Array< TouchEvent->Void >();
		
		// Mouse (16 functions)
		onMouseClickFunctions = new Array< MouseEvent->Void >();
		onMouseDoubleClickFunctions = new Array< MouseEvent->Void >();
		onMouseDownFunctions = new Array< MouseEvent->Void >();
		onMouseMoveFunctions = new Array< MouseEvent->Void >();
		onMouseOutFunctions = new Array< MouseEvent->Void >();
		onMouseOverFunctions = new Array< MouseEvent->Void >();
		onMouseUpFunctions = new Array< MouseEvent->Void >();
		onMouseMiddleClickFunctions = new Array< MouseEvent->Void >();
		onMouseMiddleMouseDownFunctions = new Array< MouseEvent->Void >();
		onMouseMiddleMouseUpFunctions = new Array< MouseEvent->Void >();
		onMouseRightClickFunctions = new Array< MouseEvent->Void >();
		onMouseRightMouseDownFunctions = new Array< MouseEvent->Void >();
		onMouseRightMouseUpFunctions = new Array< MouseEvent->Void >();
		onMouseWheelFunctions = new Array< MouseEvent->Void >();
		onMouseRollOutFunctions = new Array< MouseEvent->Void >();
		onMouseRollOverFunctions = new Array< MouseEvent->Void >();
		
		// Accelerometer
		onAccelerometerUpdateFunctions = new Array< AccelerometerEvent->Void >();
		
		// Keyboard
		onKeyDownFunctions = new Array< KeyboardEvent->Void >();
		onKeyUpFunctions = new Array< KeyboardEvent->Void >();
		
		// roxlib
		onSwipeFunctions = new Array< RoxGestureEvent->Void >();
		onPanFunctions = new Array< RoxGestureEvent->Void >();
		onRotationFunctions = new Array< RoxGestureEvent->Void >();
		onPinchFunctions = new Array< RoxGestureEvent->Void >();
		onLongPressFunctions = new Array< RoxGestureEvent->Void >();
	}
	
	private static function get_REF():InputFunctionManager
	{
		if (REF == null)
		{
			REF = new InputFunctionManager();
		}
		
		return REF;
	}
}