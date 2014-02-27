package com.matt.mge.engine.structures;

/**
 * FIFO data structure.
 * @author Matt Continisio
 */
// TODO - test
class Queue<T>
{
	private var data:Array<T>;
	
	public var size( get, never ):Int;
	
	public function new() 
	{
		data = new Array<T>();
	}
	
	public function enqueue( x:T ):Void
	{
		data.unshift( x );
	}
	
	public function dequeue():T
	{
		return data.pop();
	}
	
	public function peek():T
	{
		return data[data.length - 1];
	}
	
	public function isEmpty():Bool
	{
		return data.length == 0;
	}
	
	private function get_size():Int
	{
		return data.length;
	}
}