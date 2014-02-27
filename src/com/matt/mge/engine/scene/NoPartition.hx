package com.matt.mge.engine.scene;

/**
 * ...
 * @author Matt Continisio
 */
class NoPartition implements IScenePartition
{
	private var actors:Array<Actor>;
	
	public function new() 
	{
		actors = new Array<Actor>();
	}
	
	public function addActor( actor:Actor ):Void
	{
		actors.push( actor );
	}
	
	public function removeActor( actor:Actor ):Void
	{
		actors.remove( actor );
	}
	
	public function getNeighbors( actor:Actor, radius:Float, neighbors:Array<Actor> ):Void
	{
		neighbors.splice( 0, neighbors.length );
		
		for ( actor in actors )
		{
			neighbors.push( actor );
		}
	}
}