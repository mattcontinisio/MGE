package com.matt.mge.engine.scene;

/**
 * ...
 * @author Matt Continisio
 */
class Cell
{
	public var actors( default, null ):List< Actor >;
	
	public function new() 
	{
		actors = new List< Actor >;
	}
	
	public function addActor( actor:Actor ):Void 
	{
		actors.add( actors );
	}
	
	public function removeActor( actor:Actor ):Void 
	{
		actors.remove( actor );
	}
}