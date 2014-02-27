package com.matt.mge.engine.collision;

import com.matt.mge.engine.debug.Debug;
import com.matt.mge.engine.scene.Actor;
import flash.geom.Point;
import flash.geom.Rectangle;

/**
 * Contains static functions for checking for collisions.
 * @author Matt Continisio
 */
class CollisionCheck
{
	private function new() {}
	 
	/**
	 * Checks if two actors are overlapping (colliding)
	 * @param	a	Actor a
	 * @param	b	Actor b
	 * @return	true if a and b are overlapping, false otherwise
	 */
	public static function overlap( a:Actor, b:Actor ):Bool
	{
		// Actor can't collide with itself
		if ( a.id == b.id )
		{
			return false;
		}
		
		// Circle-circle overlap test
		if ( a.collisionComponent.type == COLLISION_CIRCLE && b.collisionComponent.type == COLLISION_CIRCLE )
		{
			return Point.distance( a.worldPosition, b.worldPosition ) < a.radius + b.radius;
		}
		
		// Circle-rect overlap test
		if ( a.collisionComponent.type == COLLISION_CIRCLE && b.collisionComponent.type == COLLISION_RECTANGLE )
		{
			// TODO - this is rect-rect right now, should be circle-rect
			return a.collisionComponent.aabb.intersects( b.collisionComponent.aabb );
		}
		
		// Rect-circle overlap test
		if ( a.collisionComponent.type == COLLISION_RECTANGLE && b.collisionComponent.type == COLLISION_CIRCLE )
		{
			// TODO - this is rect-rect right now, should be rect-circle
			return a.collisionComponent.aabb.intersects( b.collisionComponent.aabb );
		}
		
		// Rect-rect overlap test
		if ( a.collisionComponent.type == COLLISION_RECTANGLE && b.collisionComponent.type == COLLISION_RECTANGLE )
		{
			return a.collisionComponent.aabb.intersects( b.collisionComponent.aabb );
		}
		
		return false;
	}
}