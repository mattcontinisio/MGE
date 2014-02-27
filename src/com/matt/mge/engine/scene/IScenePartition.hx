package com.matt.mge.engine.scene;

/**
 * Interface for scene partitions to implement.
 * @author Matt Continisio
 */
interface IScenePartition
{
	public function addActor( actor:Actor ):Void;
	
	public function removeActor( actor:Actor ):Void;
	
	public function getNeighbors( actor:Actor, radius:Float, neighbors:Array<Actor> ):Void;
}