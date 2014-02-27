package com.matt.mge.engine.ai;

import com.matt.mge.engine.misc.ITickable;
import com.matt.mge.engine.scene.Actor;

/**
 * Finite state machine.
 * @author Matt Continisio
 */
class StateMachine implements ITickable
{
	// Reference to actor
	private var actor:Actor;
	
	// Data shared among states
	private var sharedData:Dynamic;
	
	// This state is always ticked
	private var globalState:State;
	
	// Current state
	private var currentState:State;
	
	// States that this machine can be in. Maps state names to states
	private var stateMap:Map< String, State >;
	
	/**
	 * Creates a new StateMachine.
	 * @param	actor
	 */
	public function new( actor:Actor ) 
	{
		this.actor = actor;
		sharedData = { };
		stateMap = new Map< String, State >();
	}
	
	/**
	 * Adds a new state that this machine can be in.
	 * @param	name
	 * @param	state
	 */
	public function addState( name:String, state:State ):Void 
	{
		stateMap[name] = state;
	}
	
	/**
	 * Sets the global state of this machine. The global state is always ticked. Useful for behavior that is common among all states.
	 * @param	state
	 */
	public function setGlobalState( state:State ):Void 
	{
		globalState = state;
	}
	
	/**
	 * Changes the current state.
	 * @param	state
	 */
	public function changeState( state:State ):Void 
	{
		// Exit current state
		if ( currentState != null )
		{
			currentState.onExit();
		}
		
		// Change current state
		currentState = state;
		
		// Enter new state
		if ( currentState != null )
		{
			currentState.onEnter();
		}
	}
	
	/**
	 * Ticks the global state and current state. Changes current state if necessary.
	 * @param	deltaTime
	 */
	public function tick( deltaTime:Float ):Void 
	{
		// Tick global state
		if ( globalState != null )
		{
			globalState.tick( deltaTime );
		}
		
		// Tick current state
		if ( currentState != null )
		{
			currentState.tick( deltaTime );
		}
		
		// Change state
		// TODO - use transition table
		// TODO - allow transition to null?
		if ( stateMap.exists( currentState.nextState ) )
		{
			changeState( stateMap[currentState.nextState] );
		}
	}
}