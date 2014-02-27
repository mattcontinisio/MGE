package com.matt.mge.engine.scene;

import openfl.Assets;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.geom.Point;

import com.matt.mge.engine.physics.PhysicsComponent;
import com.matt.mge.engine.collision.CollisionComponent;
import com.matt.mge.engine.math.Vec2;

/**
 * A game object. Essentially an aggregation of components.
 * @author Matt Continisio
 */
class Actor
{
	private static var nextId( null, null ):Int = 0;
	
	// Unique id
	public var id( default, null ):Int;
	
	// Type of actor (e.g. "wall" or "player")
	public var type( default, null ):String;
	
	// Position in world
	public var worldPosition( default, null ):Point2;
	
	// Position on screen
	public var screenPosition( default, null ):Point2;
	
	// Radius
	public var radius( default, null ):Float;
	
	// Whether or not the actor is alive
	public var isAlive( default, null ):Bool;
	
	// Whether or not the actor is in the scene
	public var inScene( default, default ):Bool;
	
	// Physics component
	public var physicsComponent( default, null ):PhysicsComponent;
	
	// Collision component
	public var collisionComponent( default, null ):CollisionComponent;
	
	// Function to call on collision with actor
	public var onCollision:Actor->Void;
	
	/// Drawable component
	public var sprite( default, null ):Sprite;
	
	public function new( type:String, x:Float, y:Float, radius:Float, width:Float, height:Float, hasPhysics:Bool, canCollide:Bool, hasSprite:Bool )
	{
		id = nextId++;
		this.type = type;
		worldPosition = new Point2( x, y );
		this.radius = radius;
		isAlive = true;
		inScene = false;
		
		if ( hasPhysics )
		{
			physicsComponent = new PhysicsComponent();
		}
		
		if ( canCollide )
		{
			collisionComponent = new CollisionComponent( x, y, radius, width, height, COLLISION_CIRCLE );
		}
		
		onCollision = null;
		
		if ( hasSprite )
		{
			sprite = new Sprite();
			
			//sprite.addChild( new Bitmap( Assets.getBitmapData( "img/sprites/ball.png" ) ) );
			
			sprite.x = x - ( sprite.width / 2 );
			sprite.y = y - ( sprite.height / 2 );
		}
	}
	
	public function moveTo( x:Float, y:Float ):Void
	{
		worldPosition.x = x;
		worldPosition.y = y;
		
		if ( collisionComponent != null )
		{
			collisionComponent.moveTo( x, y );
		}
		
		if ( sprite != null )
		{
			sprite.x = x - ( sprite.width / 2 );
			sprite.y = y - ( sprite.height / 2 );
		}
	}
	
	public function move( dx:Float, dy:Float ):Void
	{
		worldPosition.x += dx;
		worldPosition.y += dy;
		
		if ( collisionComponent != null )
		{
			collisionComponent.moveTo( worldPosition.x, worldPosition.y );
		}
		
		if ( sprite != null )
		{
			sprite.x = worldPosition.x - ( sprite.width / 2 );
			sprite.y = worldPosition.y - ( sprite.height / 2 );
		}
	}
}