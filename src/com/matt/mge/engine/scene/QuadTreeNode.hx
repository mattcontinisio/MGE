package com.matt.mge.engine.scene;

/**
 * ...
 * @author Matt Continisio
 */
class QuadTreeNode
{
	private var actors:Array<Actor>;
	private var children:Array<QuadTreeNode>;
	
	public function new() 
	{
		actors = new Array<Actor>();
	}
	
	public function insert( actor:Actor ):Void
	{
		
	}
}