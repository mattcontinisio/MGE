package com.matt.mge.engine.sound;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;

/**
 * ...
 * @author Matt Continisio
 */
class SoundObject
{
	private var sound:Sound;
	
	public var soundTransform( default, null ):SoundTransform;
	
	private var soundChannel:SoundChannel;
	
	public function new( sound:Sound, soundTransform:SoundTransform ) 
	{
		this.sound = sound;
		this.soundTransform = soundTransform;
	}
	
	public function play( startTime:Float, loops:Int ):Void
	{
		soundChannel = sound.play( startTime, loops, soundTransform );
	}
}