package com.matt.mge.engine.physics;

import flash.geom.Point;
import com.matt.mge.engine.math.Vec2;

/**
 * Stores physics data.
 * @author Matt Continisio
 */
class PhysicsComponent
{
	public var velocity( default, null ):Vec2;
	public var acceleration( default, null ):Vec2;
	public var maxSpeed:Float;
	public var mass:Float;
	
	public var minPosition( default, null ):Point2;
	public var maxPosition( default, null ):Point2;
	
	// TODO - max velocity, angular velocity & acceleration
	
	public function new() 
	{
		velocity = new Vec2( 0, 0 );
		acceleration = new Vec2( 0, 0 );
		maxSpeed = 1000;
		mass = 1;
		
		minPosition = new Point2( -99999, -99999 );
		maxPosition = new Point2( 99999, 99999 );
	}
}