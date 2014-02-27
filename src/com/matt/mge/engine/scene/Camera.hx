package com.matt.mge.engine.scene;

import com.matt.mge.engine.misc.ITickable;
import flash.display.Sprite;
import flash.geom.Rectangle;

/**
 * ...
 * @author Matt Continisio
 */
class Camera implements ITickable
{
	// Position and size of camera
	public var bounds( default, null):Rectangle;
	
	// Target for camera to follow
	public var target( default, null):Actor;
	
	// Sprite that camera moves
	private var layer:Sprite;
	
	public function new( layer:Sprite, width:Float, height:Float ) 
	{
		bounds = new Rectangle( 0, 0, width, height );
		target = null;
		this.layer = layer;
	}
	
	public function tick( deltaTime:Float ):Void
	{
		layer.x = -bounds.x;
		layer.y = -bounds.y;
	}
}