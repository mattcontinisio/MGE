package com.matt.mge.engine.test;

/**
 * Interface for tests to implement.
 * @author Matt Continisio
 */
interface ITest
{
	/// Name of test
	public var name( default, null ):String;
	
	/// Error message
	public var error( default, null ):String;
	
	// Runs the test
	public function run():Bool;
}