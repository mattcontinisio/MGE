package com.matt.mge.engine.structures;

/**
 * LIFO data structure.
 * @author Matt Continisio
 */
// TODO - test
class Stack
{
	private var data:Array<T>;
	
	public function new() 
	{
		data = new Array<T>();
	}
	
	public function push( x:T ):Void
	{
		data.push( x );
	}
	
	public function pop():T
	{
		return data.pop();
	}
	
	public function peek():T
	{
		return data[data.length - 1];
	}
}