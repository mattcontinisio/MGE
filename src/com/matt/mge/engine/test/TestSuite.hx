package com.matt.mge.engine.test;

import com.matt.mge.engine.debug.Debug;
import com.matt.mge.engine.misc.Stopwatch;
import haxe.Log;
import haxe.Timer;

/**
 * Runs tests and logs the results.
 * @author Matt Continisio
 */
class TestSuite
{
	private var tests:Array<ITest>;
	private var numTestsPassed:Int;
	private var numTestsFailed:Int;
	private var stopwatch:Stopwatch;
	
	public function new() 
	{
		tests = new Array<ITest>();
		numTestsPassed = 0;
		numTestsFailed = 0;
		stopwatch = new Stopwatch();
	}
	
	/**
	 * Runs tests and logs results.
	 */
	public function run()
	{
		Debug.log( "Test", "Running tests" );
		
		stopwatch.start();
		
		// Run tests, print results for each test
		for ( test in tests )
		{
			var didTestSucceed:Bool = test.run();
			
			if ( didTestSucceed )
			{
				Debug.log( "Test", test.name + ": PASS" );
				numTestsPassed++;
			}
			else
			{
				Debug.log( "Test", test.name + ": FAIL - " + test.error );
				numTestsFailed++;
			}
		}
		
		stopwatch.pause();
		
		// Print summary
		Debug.log( "Test", "----" );
		Debug.log( "Test", "Passed: " + numTestsPassed );
		Debug.log( "Test", "Failed: " + numTestsFailed );
		Debug.log( "Test", "Total:  " + tests.length );
		Debug.log( "Test", "Time to run tests: " + stopwatch.time + " seconds" );
	}
	
	public function destroy():Void
	{
		for ( test in tests )
		{
			test = null;
		}
		
		tests = null;
		stopwatch = null;
	}
	
	/**
	 * Adds a test to be run.
	 * @param	test	The test to add
	 */
	private function addTest( test:ITest ):Void
	{
		tests.push( test );
	}
}