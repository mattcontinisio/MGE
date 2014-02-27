package com.matt.mge.engine.test;

/**
 * Runs all TestSuites.
 * @author Matt Continisio
 */
class TestSuiteRunner
{
	private var testSuites:Array<TestSuite>;
	
	public function new() 
	{
		testSuites = [
			new JsonParserTestSuite()
		];
	}
	
	/**
	 * Runs all TestSuites.
	 */
	public function run():Void
	{
		for ( testSuite in testSuites )
		{
			testSuite.run();
		}
	}
	
	/**
	 * Destroys all TestSuites and nulls everything.
	 */
	public function destroy():Void
	{
		for ( testSuite in testSuites )
		{
			testSuite.destroy();
			testSuite = null;
		}
		
		testSuites = null;
	}
}