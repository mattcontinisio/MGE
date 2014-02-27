package com.matt.mge.engine.collision;

import flash.geom.Rectangle;

import com.matt.mge.engine.collision.CollisionComponent.ECollisionShape;
import com.matt.mge.engine.math.Vec2;

enum ECollisionShape
{
	COLLISION_NONE;
	COLLISION_CIRCLE;
	COLLISION_RECTANGLE;
}

/**
 * Stores information about the collision box of an actor. Has a position, radius, AABB, and type (circle or rectangle).
 * @author Matt Continisio
 */
class CollisionComponent
{
	// Center point
	public var worldPosition( default, null ):Point2;
	
	// Radius
	public var radius( default, null ):Float;
	
	// Axis aligned bounding box
	public var aabb( default, null ):Rectangle;
	
	// What type of shape should be used for collision checks
	public var type( default, default ):ECollisionShape;
	
	/**
	 * Creates a new CollisionComponent
	 * @param	x		X-coordinate of center position
	 * @param	y		Y-coordinate of center position
	 * @param	radius	Radius
	 * @param	width	Width of AABB
	 * @param	height	Height of AABB
	 * @param	type	Either COLLISION_NONE, COLLISION_CIRCLE, or COLLISION_RECTANGLE
	 */
	public function new( x:Float, y:Float, radius:Float, width:Float, height:Float, type:ECollisionShape ) 
	{
		worldPosition = new Point2( x, y );
		
		this.radius = radius;
		
		aabb = new Rectangle( x - ( width / 2 ), y - ( height / 2 ), width, height );
		
		this.type = type;
	}
	
	/**
	 * Updates position.
	 * @param	x	New x-coordinate of center position
	 * @param	y	New y-coordinate of center position
	 */
	public function moveTo( x:Float, y:Float ):Void
	{
		worldPosition.x = x;
		worldPosition.y = y;
		
		aabb.x = x - ( aabb.width / 2 );
		aabb.y = y - ( aabb.height / 2 );
	}
}