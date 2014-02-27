package com.matt.mge.engine.math;

import flash.geom.Point;

/**
 * A vector in 2D space.
 * @author Matt Continisio
 */
class Vec2 extends Point
{
	public function new( x:Float = 0, y:Float = 0 ) 
	{
		super( x, y );
	}
	
	public function negate():Vec2
	{
		return new Vec2( -x, -y );
	}
	
	public function plus( b:Vec2 ):Vec2
	{
		return new Vec2( x + b.x, y + b.y );
	}
	
	public function minus( b:Vec2 ):Vec2
	{
		return new Vec2( x - b.x, y - b.y );
	}
	
	public function multiply( scale:Float ):Vec2
	{
		return new Vec2( x * scale, y * scale );
	}
	
	public function scale( scale:Float ):Void
	{
		x *= scale;
		y *= scale;
	}
	
	/*public function length():Float
	{
		return Math.sqrt( x * x + y * y );
	}*/
	
	public function sqrLength():Float
	{
		return x * x + y * y;
	}
	
	public function dot( b:Vec2 ):Float
	{
		return x * b.x + y * b.y;
	}
	
	public function rightHandNormal():Vec2
	{
		return new Vec2( -y, x );
	}
	
	public function leftHandNormal():Vec2
	{
		return new Vec2( y, -x );
	}
}

typedef Point2 = Vec2;