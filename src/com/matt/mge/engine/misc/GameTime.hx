package com.matt.mge.engine.misc;

import flash.Lib;

/**
 * Used to calculate delta time.
 * @author Matt Continisio
 */
class GameTime
{
	public static var REF( get, null ):GameTime;
	
	public var timeSinceStart:Float;
	public var timeSinceLastFrame:Float;
	public var timeScale:Float;
	
	private function new() 
	{
	}
	
	private static function get_REF():GameTime
	{
		if ( REF == null )
		{
			REF = new GameTime();
		}
		
		return REF;
	}
	
	public function init():Void
	{
		timeSinceStart = 0;
		timeSinceLastFrame = 30;
		timeScale = 1;
	}
	
	public function update():Void
	{
		var newTime:Int = Lib.getTimer();
		timeSinceLastFrame = ( ( newTime - timeSinceStart ) / 1000 ) * timeScale;
		timeSinceStart = newTime;
	}
}