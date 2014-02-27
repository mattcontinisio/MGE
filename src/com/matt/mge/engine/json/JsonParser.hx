package com.matt.mge.engine.json;

import haxe.Json;
import com.matt.mge.engine.debug.Debug;

/**
 * Contains static methods for deserializing JSON objects.
 * @author Matt Continisio
 */
class JsonParser
{
	/**
	 * Creates and returns a T object from a JSON object.
	 * 
	 * @param	json	The JSON object to get data from.
	 */
	// TODO - make this iterative instead of recursive
	public static function createFromJson<T>( classRef:Class<T>, json:Dynamic ):T
	{
		var object:T = Type.createInstance( classRef, [] );
		
		var fieldNames:Array<String> = Reflect.fields( json );
		
		for ( fieldName in fieldNames )
		{
			if ( Reflect.hasField( object, fieldName ) )
			{
				var value = Reflect.field( json, fieldName );
				
				// If the value is an Object, we call fromJson again.
				if ( Reflect.isObject( value ) )
				{
					var valueInObject = Reflect.field( object, fieldName );
					
					if ( valueInObject == null )
					{
						// TODO - figure out way to get type even though field's value is null
					}
					else
					{
						setupFromJson( valueInObject, value );
					}
				}
				else
				{
					Reflect.setField( object, fieldName, value );
				}
			}
		}
		
		return object;
	}
	
	/**
	 * Sets up the given object from a JSON object.
	 * 
	 * @param	json	The JSON object to get data from.
	 */
	// TODO - make this iterative instead of recursive
	public static function setupFromJson( object:Dynamic, json:Dynamic ):Void
	{		
		var fieldNames:Array<String> = Reflect.fields( json );
		
		for ( fieldName in fieldNames )
		{
			if ( Reflect.hasField( object, fieldName ) )
			{
				var value = Reflect.field( json, fieldName );
				
				// If the value is an Object, we call setupFromJson again.
				if ( Reflect.isObject( value ) )
				{
					var valueInObject = Reflect.field( object, fieldName );
					
					if ( valueInObject == null )
					{
						// TODO - figure out way to get type even though field's value is null
					}
					else
					{
						setupFromJson( valueInObject, value );
					}
				}
				else
				{
					Reflect.setField( object, fieldName, value );
				}
			}
		}
	}
}