package com.matt.mge.engine.misc;

import haxe.Timer;

/**
 * Used to time things. Can be started, paused, and restarted.
 * @author Matt Continisio
 */
// TODO - test
class Stopwatch
{
	/// Time on stopwatch, in seconds.
	public var time( get, null ):Float;
	
	/// If the timer is currently running
	public var isRunning( default, null ):Bool;
	
	private var startTime:Float;
	private var pausedTime:Float;
	
	public function new() 
	{
		time = 0;
		isRunning = false;
		startTime = 0;
		pausedTime = 0;
	}
	
	/**
	 * Starts the timer.
	 */
	public function start():Void
	{
		startTime = Timer.stamp();
		isRunning = true;
	}
	
	/**
	 * Pauses the timer.
	 */
	public function pause():Void
	{
		pausedTime += Timer.stamp() - startTime;
		isRunning = false;
	}
	
	/**
	 * Resets the timer.
	 */
	public function reset():Void
	{
		pausedTime = 0;
		isRunning = false;
	}
	
	private function get_time():Float
	{
		if ( isRunning )
		{
			return pausedTime + Timer.stamp() - startTime;
		}
		else
		{
			return pausedTime;
		}
	}
}