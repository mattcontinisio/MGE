package com.matt.mge.engine.save;

import flash.net.SharedObject;
import flash.net.SharedObjectFlushStatus;
import haxe.Log;

/**
 * ...
 * @author Matt Continisio
 */
class SavedData
{
	public static var REF( get, null ):SavedData;
	
	private var sharedObject:SharedObject;
	
	#if flash
	private var flushStatus:String;
	#else
	private var flushStatus:SharedObjectFlushStatus;
	#end
	
	private function new() 
	{
	}
	
	public function init():Void
	{
		sharedObject = SharedObject.getLocal( "MGESavedData" );
		//sharedObject.clear();
		
		flushStatus = null;
	}
	
	private static function get_REF():SavedData
	{
		if ( REF == null )
		{
			REF = new SavedData();
		}
		
		return REF;
	}
	
	public function save( key:String, value:Dynamic ):Void
	{
		Reflect.setField( sharedObject.data, key, value );
		
		try
		{
			flushStatus = sharedObject.flush();
		}
		catch ( e:Dynamic )
		{
			Log.trace( "couldn't save: " + key );
		}
		
		if ( flushStatus != null )
		{
			if ( flushStatus == SharedObjectFlushStatus.PENDING )
			{
				Log.trace( "requesting permission to save " + key );
			}
			else if ( flushStatus == SharedObjectFlushStatus.FLUSHED )
			{
				//Log.trace(key + " saved");
			}
		}
	}
	
	public function load( key:String ):Dynamic
	{
		return Reflect.field( sharedObject.data, key );
	}
	
	public function exists( key:String ):Bool
	{
		return Reflect.hasField( sharedObject.data, key );
	}
}