package com.matt.mge.engine.physics;

import com.matt.mge.engine.scene.Actor;
import com.matt.mge.engine.misc.ITickable;

/**
 * Controls a group of actors with PhysicsComponent
 * @author Matt Continisio
 */
class PhysicsController implements ITickable
{
	public var actors:Array<Actor>;
	
	public function new() 
	{
		actors = new Array<Actor>();
	}
	
	public function addActor( actor:Actor ):Void
	{
		actors.push( actor );
	}
	
	public function removeActor( actor:Actor ):Void
	{
		actors.remove( actor );
	}
	
	public function tick( deltaTime:Float ):Void
	{
		for ( actor in actors )
		{
			if ( actor.physicsComponent != null )
			{
				// Calculate x velocity
				if ( actor.physicsComponent.acceleration.x != 0 )
				{
					actor.physicsComponent.velocity.x += actor.physicsComponent.acceleration.x * deltaTime;
				}
				else
				{
					//actor.physicsComponent.velocity.x *= actor.physicsComponent.drag.x;
				}
				
				// Calculate y velocity
				if ( actor.physicsComponent.acceleration.y != 0 )
				{
					actor.physicsComponent.velocity.y += actor.physicsComponent.acceleration.y * deltaTime;
				}
				else
				{
					//actor.physicsComponent.velocity.y *= actor.physicsComponent.drag.y;
				}
				
				// TODO - perform better integration here
				actor.move( actor.physicsComponent.velocity.x * deltaTime, actor.physicsComponent.velocity.y * deltaTime );
				
				// Keep actor within bounds
				actor.moveTo( Math.max( actor.worldPosition.x, actor.physicsComponent.minPosition.x )
							, Math.max( actor.worldPosition.y, actor.physicsComponent.minPosition.y ) );
							
				actor.moveTo( Math.min( actor.worldPosition.x, actor.physicsComponent.maxPosition.x )
							, Math.min( actor.worldPosition.y, actor.physicsComponent.maxPosition.y ) );
			}
		}
	}
}