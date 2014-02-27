package com.matt.mge.engine.input;

import com.roxstudio.haxe.gesture.RoxGestureEvent;

/**
 * TODO - maybe add tap gesture
 * @author Matt Continisio
 */
class RoxGestureEventManager
{
	public static var REF( get, null ):RoxGestureEventManager;
	
	private function new() 
	{
		
	}
	
	private static function get_REF():RoxGestureEventManager
	{
		if ( REF == null )
		{
			REF = new RoxGestureEventManager();
		}
		
		return REF;
	}
	
	public function onSwipe( event:RoxGestureEvent ):Void
	{
		for ( onSwipeFunction in InputFunctionManager.REF.onSwipeFunctions )
		{
			onSwipeFunction( event );
		}
	}
	
	public function onPan( event:RoxGestureEvent ):Void
	{
		for ( onPanFunction in InputFunctionManager.REF.onPanFunctions )
		{
			onPanFunction( event );
		}
	}
	
	public function onRotation( event:RoxGestureEvent ):Void
	{
		for ( onRotationFunction in InputFunctionManager.REF.onRotationFunctions )
		{
			onRotationFunction( event );
		}
	}
	
	public function onPinch( event:RoxGestureEvent ):Void
	{
		for ( onPinchFunction in InputFunctionManager.REF.onPinchFunctions )
		{
			onPinchFunction( event);
		}
	}
	
	public function onLongPress( event:RoxGestureEvent ):Void
	{
		for ( onLongPressFunction in InputFunctionManager.REF.onLongPressFunctions )
		{
			onLongPressFunction( event );
		}
	}
}