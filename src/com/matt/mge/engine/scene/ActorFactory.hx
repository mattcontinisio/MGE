package com.matt.mge.engine.scene;

import haxe.Json;
import openfl.Assets;
import com.matt.mge.engine.json.JsonParser;

/**
 * Creates Actors and sets them up in the scene.
 * @author Matt Continisio
 */
class ActorFactory
{
	public static var REF( get, null ):ActorFactory;
	
	private var actorMap:Map<String, Dynamic>;
	
	public function getActor( type:String, x:Float, y:Float, hasPhysics:Bool, hasTile:Bool ):Actor
	{
		if ( !actorMap.exists( type ) )
		{
			return null;
		}
		
		// Create Actor and set up from json object in actorMap
		var actor:Actor = new Actor( x, y, hasPhysics, hasTile );
		var json:Dynamic = actorMap[type];
		JsonParser.setupFromJson( actor, json );
		
		return actor;
	}
	
	private function new()
	{
		// Set up actorMap from JSON file(data/actors.json)
		actorMap = new Map<String, Dynamic>();
		
		var json:Dynamic = Json.parse( Assets.getText( "data/actors.json" ) );
		var actorNames:Array<String> = Reflect.fields( json.actors );
		
		for ( actorName in actorNames )
		{
			actorMap[actorName] = Reflect.field( json, actorName );
		}
	}
	
	private static function get_REF():ActorFactory
	{
		if ( REF == null )
		{
			REF = new ActorFactory();
		}
		
		return REF;
	}
}