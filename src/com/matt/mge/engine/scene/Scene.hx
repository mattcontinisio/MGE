package com.matt.mge.engine.scene;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.text.TextField;

import com.matt.mge.engine.misc.ITickable;
import com.matt.mge.engine.misc.ScreenInfo;

/**
 * Contains actors and tickables.
 * @author Matt Continisio
 */
class Scene extends Sprite
{
	// All actors in the scene
	private var actors:Array<Actor>;
	
	// All tickables in the scene
	private var tickables:Array<ITickable>;
	
	// Scene partition
	private var partition:IScenePartition;
	
	// Camera
	public var camera( default, null ):Camera;
	
	// Background layer
	public var bgLayer( default, null ):Sprite;
	
	// Actor layer
	public var actorLayer( default, null ):Sprite;
	
	// Input layer
	public var inputLayer( default, null ):Sprite;
	
	// UI layer
	public var uiLayer( default, null ):Sprite;
	
	public function new( partition:IScenePartition, width:Float, height:Float ) 
	{
		super();
		
		actors = new Array<Actor>();
		tickables = new Array<ITickable>();
		
		this.partition = partition;
		
		camera = new Camera( this, width, height );
		
		bgLayer = new Sprite();
		actorLayer = new Sprite();
		inputLayer = new Sprite();
		inputLayer.addChild( new Bitmap( new BitmapData( Std.int( width ), Std.int( height ), true, 0x00000000 ) ) );	// Cover screen
		uiLayer = new Sprite();
		
		addChild( bgLayer );
		addChild( actorLayer );
		addChild( inputLayer );
		addChild( uiLayer );
		
		bgLayer.x = ScreenInfo.REF.xOffset;
		bgLayer.y = ScreenInfo.REF.yOffset;
		actorLayer.x = ScreenInfo.REF.xOffset;
		actorLayer.y = ScreenInfo.REF.yOffset;
		uiLayer.x = ScreenInfo.REF.xOffset;
		uiLayer.y = ScreenInfo.REF.yOffset;
		scaleX = ScreenInfo.REF.scaleFactor;
		scaleY = ScreenInfo.REF.scaleFactor;
	}
	
	public function addActor( actor:Actor ):Void
	{
		actors.push( actor );
		actor.inScene = true;
		
		// Add actor to scene partition
		partition.addActor( actor );
		
		// Add actor's sprite
		if ( actor.sprite != null )
		{
			actorLayer.addChild( actor.sprite );
		}
	}
	
	public function removeActor( actor:Actor ):Void
	{
		actors.remove( actor );
		actor.inScene = false;
		
		// Remove actor from scene partition
		partition.removeActor( actor );
		
		// Remove actor's sprite
		if ( actor.sprite != null )
		{
			actorLayer.removeChild( actor.sprite );
		}
	}
	
	public function addTickable( tickable:ITickable ):Void
	{
		tickables.push( tickable );
	}
	
	public function removeTickable( tickable:ITickable ):Void
	{
		tickables.remove( tickable );
	}
	
	public function getNeighbors( actor:Actor, radius:Float, neighbors:Array<Actor> ):Void
	{
		partition.getNeighbors( actor, radius, neighbors );
	}
	
	public function tick( deltaTime:Float ):Void
	{
		for ( tickable in tickables )
		{
			tickable.tick( deltaTime );
		}
		
		camera.tick( deltaTime );
		inputLayer.x = camera.bounds.x;
		inputLayer.y = camera.bounds.y;
	}
}