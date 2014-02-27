package com.matt.mge.engine.misc;

/**
 * Global event bus.
 * @author Matt Continisio
 */
class EventBus
{
	public static var REF( get, null ):EventBus;
	
	// Maps events to arrays of event listeners
	private var listenerMap:Map< String, Array < Dynamic->Void > >;
	
	private function new()
	{
		listenerMap = new Map< String, Array< Dynamic->Void > >();
	}
	
	private static function get_REF():EventBus
	{
		if ( REF == null )
		{
			REF = new EventBus();
		}
		
		return REF;
	}
	
	/**
	 * Adds an event listener to an event
	 * @param	event
	 * @param	listener
	 */
	public function addEventListener( event:String, listener:Dynamic->Void )
	{
		if ( !listenerMap.exists( event ) )
		{
			listenerMap[event] = new Array< Dynamic->Void >();
		}
		
		listenerMap[event].push( listener );
	}
	
	/**
	 * Removes an event listener from an event
	 * @param	event
	 * @param	listener
	 */
	public function removeEventListener( event:String, listener:Dynamic->Void ):Void 
	{
		if ( listenerMap.exists( event ) )
		{
			listenerMap[event].remove( listener );
		}
	}
	
	/**
	 * Dispathes an event, passing payload to all listeners
	 * @param	event
	 * @param	payload
	 */
	public function dispatch( event:String, payload:Dynamic ):Void
	{
		if ( listenerMap.exists( event ) )
		{
			for ( listener in listenerMap[event] )
			{
				listener( payload );
			}
		}
	}
}