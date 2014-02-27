package com.matt.mge.engine.input;

import flash.events.KeyboardEvent;

/**
 * Keyboard Event listener functions. TODO - research soft keyboard
 * @author Matt Continisio
 */
class KeyboardEventManager
{
	public static var REF( get, null ):KeyboardEventManager;
	
	private function new() 
	{
		
	}
	
	private static function get_REF():KeyboardEventManager
	{
		if ( REF == null )
		{
			REF = new KeyboardEventManager();
		}
		
		return REF;
	}
	
	public function onKeyDown( event:KeyboardEvent ):Void
	{
		for ( onKeyDownFunction in InputFunctionManager.REF.onKeyDownFunctions )
		{
			onKeyDownFunction( event );
		}
	}
	
	public function onKeyUp( event:KeyboardEvent ):Void
	{
		for ( onKeyUpFunction in InputFunctionManager.REF.onKeyUpFunctions )
		{
			onKeyUpFunction( event );
		}
	}
}