package com.matt.mge.engine.ai;

import com.matt.mge.engine.misc.ITickable;
import com.matt.mge.engine.scene.Actor;

/**
 * A state that a StateMachine can be in.
 * @author Matt Continisio
 */
class State implements ITickable
{
	// Reference to actor
	private var actor:Actor;
	
	// Shared data shared among states
	private var sharedData:Dynamic;
	
	// The name of this state
	public var name( default, null ):String;
	
	// The name of the state that should be transitioned to. Empty string if state should remain current state.
	public var nextState( default, null ):String;
	
	/**
	 * Creates a new State.
	 * @param	name		Name of state
	 * @param	actor		Reference to actor
	 * @param	sharedData	Data shared among states
	 */
	public function new( name:String, actor:Actor, sharedData:Dynamic ) 
	{
		this.name = name;
		this.actor = actor;
		this.sharedData = sharedData;
		nextState = "";
	}
	
	/**
	 * Called when this state is switched to.
	 */
	public function onEnter():Void 
	{
	}
	
	/**
	 * State logic. Called every frame.
	 * @param	deltaTime
	 */
	public function tick( deltaTime:Float ):Void 
	{
	}
	
	/**
	 * Called when this state is switched from.
	 */
	public function onExit():Void 
	{
	}
}