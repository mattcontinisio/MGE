package com.matt.mge.engine.input;

import flash.events.AccelerometerEvent;

/**
 * ...
 * @author Matt Continisio
 */
class AccelerometerEventManager
{
	public static var REF( get, null ):AccelerometerEventManager;
	
	private function new() 
	{
	}
	
	private static function get_REF():AccelerometerEventManager
	{
		if ( REF == null )
		{
			REF = new AccelerometerEventManager();
		}
		
		return REF;
	}
	
	public function onAccelerometerUpdate( event:AccelerometerEvent )
	{
		for ( onAccelerometerUpdateFunction in InputFunctionManager.REF.onAccelerometerUpdateFunctions )
		{
			onAccelerometerUpdateFunction( event );
		}
	}
}