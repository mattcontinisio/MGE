package com.matt.mge.engine.ai;

import flash.geom.Point;

import com.matt.mge.engine.scene.Actor;
import com.matt.mge.engine.math.Vec2;

enum EDeceleration 
{
	DECELERATION_FAST;
	DECELERATION_NORMAL;
	DECELERATION_SLOW;
}

/**
 * 
 * @author Matt Continisio
 */
class SteeringBehaviors
{
	// Maps EDeceleration enum values to float values that represent their actual deceleration modifier
	private static var decelerationMap:Map < EDeceleration, Float > = [ DECELERATION_FAST => 0.3, DECELERATION_NORMAL => 0.6, DECELERATION_SLOW => 0.9 ];
	
	// Reference to actor
	private var actor:Actor;
	
	public function new( actor:Actor ) 
	{
		this.actor = actor;
	}
	
	// Returns a force that directs an agent toward a target position
	public function seek( targetPosition:Point2 ):Vec2 
	{
		var actorToTarget:Point2 = targetPosition.minus( actor.worldPosition );
		actorToTarget.normalize( 1.0 );
		
		var desiredVelocity:Vec2 = actorToTarget.multiply( actor.physicsComponent.maxSpeed );
		
		return desiredVelocity.minus( actor.physicsComponent.velocity );
	}
	
	// Returns a force that directs an agent away from a target position
	public function flee( targetPosition:Point2 ):Vec2
	{
		var targetToActor:Point2 = actor.worldPosition.minus( targetPosition );
		targetToActor.normalize( 1.0 );
		
		var desiredVelocity:Vec2 = targetToActor.multiply( actor.physicsComponent.maxSpeed );
		
		return desiredVelocity.minus( actor.physicsComponent.velocity );
	}
	
	// Returns a force that directs an agent toward a target position, decelerating as the agent gets closer
	public function arrive( targetPosition:Point2, deceleration:EDeceleration ):Vec2 
	{
		var actorToTarget:Point2 = targetPosition.minus( actor.worldPosition );
		
		var distanceToTarget:Float = actorToTarget.length;
		
		if ( distanceToTarget > 0 )
		{
			var speed:Float = distanceToTarget / decelerationMap[deceleration];

			speed = Math.min( speed, actor.physicsComponent.maxSpeed );
			
			var desiredVelocity:Vec2 = actorToTarget;
			desiredVelocity.scale( speed );
			desiredVelocity.scale( 1 / distanceToTarget );
			
			return desiredVelocity.minus( actor.physicsComponent.velocity );
		}
		
		return new Vec2( 0, 0 );
	}
	
	// Returns a force that directs an agent toward a moving target
	/*public function pursuit( evader:Actor ):Vec2 
	{
		
	}*/
}