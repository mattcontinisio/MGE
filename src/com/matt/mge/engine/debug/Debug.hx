package com.matt.mge.engine.debug;

import haxe.Log;
import haxe.Timer;

/**
 * Contains static methods for debugging purposes.
 * @author Matt Continisio
 */
class Debug
{
	/// Debug channels and whether or not they are open
	// TODO - load these from debug.json once JsonParser is tested
	private static var channels:Map < String, Bool > = [ "General" => true, "Test" => true, "Json" => true ];
	
	/**
	 * Logs v with timestamp to the console if channel is open
	 * 
	 * @param	channel	The debug channel to write to.
	 * @param	v		What should be logged to the console.
	 */
	public static function log( channel:String, v:Dynamic ):Void
	{
		// Only log if channel exists and is open
		if ( channels.exists( channel ) && channels[channel] == true )
		{
			var time:Float = Timer.stamp();
			var message:String = time + " " + channel + ": " + v;
			Log.trace( message );
		}
	}
}