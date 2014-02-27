package com.matt.mge.engine.input;

import com.roxstudio.haxe.gesture.RoxGestureAgent;
import com.roxstudio.haxe.gesture.RoxGestureEvent;
import flash.display.InteractiveObject;
import flash.events.TouchEvent;
import flash.events.MouseEvent;
import flash.events.AccelerometerEvent;
import flash.events.KeyboardEvent;

/**
 * Manages all input event listeners
 * @author Matt Continisio
 */
class InputEventManager
{
	public static var REF(get, null):InputEventManager;
	
	private var roxAgent:RoxGestureAgent;
	
	private function new() 
	{
	}
	
	public function init( inputOwner:InteractiveObject ):Void
	{
		// Touch
		inputOwner.addEventListener( TouchEvent.TOUCH_BEGIN, TouchEventManager.REF.onTouchBegin );
		inputOwner.addEventListener( TouchEvent.TOUCH_END, TouchEventManager.REF.onTouchEnd );
		inputOwner.addEventListener( TouchEvent.TOUCH_MOVE, TouchEventManager.REF.onTouchMove );
		inputOwner.addEventListener( TouchEvent.TOUCH_OUT, TouchEventManager.REF.onTouchOut );
		inputOwner.addEventListener( TouchEvent.TOUCH_OVER, TouchEventManager.REF.onTouchOver );
		inputOwner.addEventListener( TouchEvent.TOUCH_ROLL_OUT, TouchEventManager.REF.onTouchRollOut );
		inputOwner.addEventListener( TouchEvent.TOUCH_ROLL_OVER, TouchEventManager.REF.onTouchRollOver );
		inputOwner.addEventListener( TouchEvent.TOUCH_TAP, TouchEventManager.REF.onTouchTap );
		
		// Mouse
		inputOwner.addEventListener( MouseEvent.CLICK, MouseEventManager.REF.onMouseClick );
		inputOwner.addEventListener( MouseEvent.DOUBLE_CLICK, MouseEventManager.REF.onMouseDoubleClick );
		inputOwner.addEventListener( MouseEvent.MOUSE_DOWN, MouseEventManager.REF.onMouseDown );
		inputOwner.addEventListener( MouseEvent.MOUSE_MOVE, MouseEventManager.REF.onMouseMove );
		inputOwner.addEventListener( MouseEvent.MOUSE_OUT, MouseEventManager.REF.onMouseOut );
		inputOwner.addEventListener( MouseEvent.MOUSE_OVER, MouseEventManager.REF.onMouseOver );
		inputOwner.addEventListener( MouseEvent.MOUSE_UP, MouseEventManager.REF.onMouseUp );
		inputOwner.addEventListener( MouseEvent.RIGHT_CLICK, MouseEventManager.REF.onMouseRightClick );
		inputOwner.addEventListener( MouseEvent.RIGHT_MOUSE_DOWN, MouseEventManager.REF.onMouseRightMouseDown );
		inputOwner.addEventListener( MouseEvent.RIGHT_MOUSE_UP, MouseEventManager.REF.onMouseRightMouseUp );
		inputOwner.addEventListener( MouseEvent.MOUSE_WHEEL, MouseEventManager.REF.onMouseWheel );
		inputOwner.addEventListener( MouseEvent.ROLL_OUT, MouseEventManager.REF.onMouseRollOut );
		inputOwner.addEventListener( MouseEvent.ROLL_OVER, MouseEventManager.REF.onMouseRollOver );
		
		#if not html5
		
		inputOwner.addEventListener( MouseEvent.MIDDLE_CLICK, MouseEventManager.REF.onMouseMiddleClick );
		inputOwner.addEventListener( MouseEvent.MIDDLE_MOUSE_DOWN, MouseEventManager.REF.onMouseMiddleMouseDown );
		inputOwner.addEventListener( MouseEvent.MIDDLE_MOUSE_UP, MouseEventManager.REF.onMouseMiddleMouseUp );
		
		#end
		
		// Accelerometer
		#if mobile
		
		inputOwner.addEventListener( AccelerometerEvent.UPDATE, AccelerometerEventManager.REF.onAccelerometerUpdate );
		
		#end
		
		// Keyboard
		inputOwner.addEventListener( KeyboardEvent.KEY_DOWN, KeyboardEventManager.REF.onKeyDown );
		inputOwner.addEventListener( KeyboardEvent.KEY_UP, KeyboardEventManager.REF.onKeyUp );
		
		// roxlib (gestures)
		#if mobile
		
		roxAgent = new RoxGestureAgent( inputOwner, RoxGestureAgent.GESTURE );
		inputOwner.addEventListener( RoxGestureEvent.GESTURE_SWIPE, RoxGestureEventManager.REF.onSwipe );
		inputOwner.addEventListener( RoxGestureEvent.GESTURE_PAN, RoxGestureEventManager.REF.onPan );
		inputOwner.addEventListener( RoxGestureEvent.GESTURE_ROTATION, RoxGestureEventManager.REF.onRotation );
		inputOwner.addEventListener( RoxGestureEvent.GESTURE_PINCH, RoxGestureEventManager.REF.onPinch );
		inputOwner.addEventListener( RoxGestureEvent.GESTURE_LONG_PRESS, RoxGestureEventManager.REF.onLongPress );
		
		#end
	}
	
	private static function get_REF():InputEventManager
	{
		if ( REF == null )
		{
			REF = new InputEventManager();
		}
		
		return REF;
	}
}