package com.matt.mge.engine.misc;

/**
 * Can be ticked.
 * @author Matt Continisio
 */
interface ITickable
{
	public function tick( deltaTime:Float ):Void;
}