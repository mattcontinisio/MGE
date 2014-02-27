package com.matt.mge.engine.sound;

import haxe.Json;

import flash.media.SoundTransform;
import openfl.Assets;

/**
 * Plays sounds.
 * @author Matt Continisio
 */
class SoundManager
{
	public static var REF( get, null ):SoundManager;
	
	public static var SOUND_TRANSFORM_MUTE:SoundTransform = new SoundTransform( 0, 0 );
	
	// Maps strings to sounds
	private var soundMap:Map< String, SoundObject >;
	
	// Global volume
	public var volume:Float;
	
	private function new() 
	{
		soundMap = new Map< String, SoundObject >();
		volume = 1.0;
	}
	
	private static function get_REF():SoundManager
	{
		if ( REF == null )
		{
			REF = new SoundManager();
		}
		
		return REF;
	}
	
	public function init():Void
	{
		var jsonData = Json.parse( Assets.getText( "data/sounds.json" ) );
		var jsonSounds:Array<Dynamic> = jsonData.sounds;
		
		for( jsonSound in jsonSounds )
		{
			var soundObject:SoundObject = new SoundObject( Assets.getSound( jsonSound.file ), SOUND_TRANSFORM_MUTE );
			soundMap[cast( jsonSound.name, String )] = soundObject;
			playSound( jsonSound.name, 0 );		// This is done because there is lag when sound is played for first time, TODO - research this
		}
	}
	
	public function playSound( name:String, volume:Float ):Void
	{
		if ( soundMap.exists( name ) )
		{
			var soundObject:SoundObject = soundMap[name];
			soundObject.soundTransform.volume = this.volume * volume;
			soundObject.play( 0, 0 );
		}
	}
}