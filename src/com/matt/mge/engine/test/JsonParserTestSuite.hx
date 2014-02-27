package com.matt.mge.engine.test;

import openfl.Assets;
import com.matt.mge.engine.json.JsonParser;
import com.matt.mge.engine.scene.Actor;
import haxe.Json;

/**
 * Tests JsonParser.
 * @author Matt Continisio
 */
class JsonParserTestSuite extends TestSuite
{
	public function new() 
	{
		super();
		
		addTest( new TestFromJson() );
	}
}

private class TestFromJson implements ITest
{
	public var name( default, null ):String;
	public var error( default, null ):String;
	
	public function new()
	{
		name = "TestFromJson";
		error = "";
	}
	public function run():Bool
	{
		var json = Json.parse( Assets.getText( "data/actors_test.json" ) );
		var jsonActor = json.actors.TestActor;
		var actor:Actor = JsonParser.createFromJson( Actor, jsonActor );
		
		if ( actor.worldPosition.x != 10 || actor.worldPosition.y != 20 )
		{
			error = "Did not set worldPosition correctly.";
			return false;
		}
		
		error = "";
		return true;
	}
}