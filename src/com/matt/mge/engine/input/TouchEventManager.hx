package com.matt.mge.engine.input;

import flash.events.TouchEvent;

/**
 * Manages all touch event listeners
 * @author Matt Continisio
 */
class TouchEventManager
{
	public static var REF( get, null ):TouchEventManager;
	
	private function new() 
	{
		
	}
	
	private static function get_REF():TouchEventManager
	{
		if ( REF == null )
		{
			REF = new TouchEventManager();
		}
		
		return REF;
	}
	
	public function onTouchBegin( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchBeginFunctions )
		{
			onTouchFunction( event );
		}
	}
	
	public function onTouchEnd( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchEndFunctions )
		{
			onTouchFunction( event );
		}
	}
	
	public function onTouchMove( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchMoveFunctions )
		{
			onTouchFunction( event );
		}
	}
	
	public function onTouchOut( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchOutFunctions )
		{
			onTouchFunction( event );
		}
	}
	
	public function onTouchOver( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchOverFunctions )
		{
			onTouchFunction( event );
		}
	}
	
	public function onTouchRollOut( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchRollOutFunctions )
		{
			onTouchFunction( event );
		}
	}
	
	public function onTouchRollOver( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchRollOverFunctions )
		{
			onTouchFunction( event );
		}
	}
	
	public function onTouchTap( event:TouchEvent ):Void
	{
		for ( onTouchFunction in InputFunctionManager.REF.onTouchTapFunctions )
		{
			onTouchFunction( event );
		}
	}
}