package com.matt.mge.engine.scene;

/**
 * ...
 * @author Matt Continisio
 */
class CellSpacePartition implements IScenePartition
{
	private var cells:Array<Cell>;
	private var width:Int;
	private var height:Int;
	
	public function new( width:Int, height:Int ) 
	{
		cells = new Array<Cell>();
	}
	
	public function addActor( actor:Actor ):Void
	{
		// Add actor to correct cell
	}
	
	public function removeActor( actor:Actor ):Void
	{
		// Remove actor from cell
	}
	
	public function getNeighbors( actor:Actor, radius:Float, neighbors:Array<Actor> ):Void
	{
		// Get actors from cells within radius
	}
}