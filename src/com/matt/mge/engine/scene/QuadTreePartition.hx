package com.matt.mge.engine.scene;

/**
 * ...
 * @author Matt Continisio
 */
class QuadTreePartition implements IScenePartition
{
	private var root:QuadTreeNode;
	
	public function new() 
	{
		root = new QuadTreeNode();
	}
	
	public function addActor( actor:Actor ):Void
	{
	}
	
	public function removeActor( actor:Actor ):Void
	{
	}
	
	public function getNeighbors( actor:Actor, radius:Float, neighbors:Array< Actor > ):Void
	{
	}
}