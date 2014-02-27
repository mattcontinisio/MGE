package com.matt.mge.engine.render;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import openfl.Assets;

/**
 * Drawable component of an Actor.
 * @author Matt Continisio
 */
class Tile
{
	// tileData values
	public var screenX( default, set ):Float;
	public var screenY( default, set ):Float;
	public var tileRectID( default, default ):Int;
	public var scale( default, set ):Float;
	public var rotation( default, set ):Float;
	public var red( default, set ):Float;
	public var green( default, set ):Float;
	public var blue( default, set ):Float;
	public var alpha( default, set ):Float;
	
	// Indices in tileData
	private var xIndex:Int;
	private var yIndex:Int;
	private var tileRectIDIndex:Int;
	private var scaleIndex:Int;
	private var rotationIndex:Int;
	private var redIndex:Int;
	private var greenIndex:Int;
	private var blueIndex:Int;
	private var alphaIndex:Int;
	
	// Used to find position in tileData array
	public var tileNum( default, null ):Int;
	
	public var tileRectKey( default, null ):String;
	public var inScene( default, null ):Bool;
	public var tileData( default, null ):Array<Float>;
	public var screenPosition( default, null ):Point;
	
	/// Bitmap for blitting (on Flash)
	public var bitmap( default, null ):Bitmap;
	public var bitmapMatrix( default, null ):Matrix;
	public var bitmapScreenPosition( default, null ):Point;
	public var colorTransform( default, null ):ColorTransform;
	public var rect( default, null ):Rectangle;
	public var sourceRect( default, null ):Rectangle;
	
	public function new( x:Float=0, y:Float=0, scale:Float=1, rotation:Float=0, red:Float=1, green:Float=1, blue:Float=1, alpha:Float=1 ) 
	{
		//tileRectKey = key;
		inScene = false;
		
		//bitmap = SpriteSheet.REF.tileBitmapMap[key];
		bitmapMatrix = new Matrix( 1, 0, 0, 1, x, y );
		colorTransform = new ColorTransform( red, green, blue, alpha );
		
		screenPosition = new Point( x, y );
		//bitmapScreenPosition = new Point( x - ( bitmap.width / 2 ), y - ( bitmap.height / 2 ) );
		//rect = new Rectangle( x, y, bitmap.width, bitmap.height );
		//sourceRect = new Rectangle( 0, 0, bitmap.width, bitmap.height );
		
		this.screenX = x;
		this.screenY = y;
		//this.tileRectID = SpriteSheet.REF.tileRectMap[key];
		this.scale = scale;
		this.rotation = rotation;
		this.red = red;
		this.green = green;
		this.blue = blue;
		this.alpha = alpha;
	}
	
	public function onAddedToBitmapLayer( tileData:Array<Float>, tileNum:Int ):Void
	{
		this.tileData = tileData;
		this.tileNum = tileNum;
		
		xIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.xIndexOffset;
		yIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.yIndexOffset;
		tileRectIDIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.tileRectIDIndexOffset;
		scaleIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.scaleIndexOffset;
		rotationIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.rotationIndexOffset;
		redIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.redIndexOffset;
		greenIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.greenIndexOffset;
		blueIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.blueIndexOffset;
		alphaIndex = tileNum * SpriteSheet.REF.numFlags + SpriteSheet.REF.alphaIndexOffset;
		
		if ( tileData != null )
		{
			tileData[xIndex] = screenX;
			tileData[yIndex] = screenY;
			tileData[tileRectIDIndex] = tileRectID;
			tileData[scaleIndex] = scale;
			tileData[rotationIndex] = rotation;
			tileData[redIndex] = red;
			tileData[greenIndex] = green;
			tileData[blueIndex] = blue;
			tileData[alphaIndex] = alpha;
		}
		
		// TODO - finish
	}
	
	public function onRemovedFromBitmapLayer():Void
	{
		inScene = false;
		
		// TODO - finish
	}
	
	private function set_screenX( x:Float ):Float
	{
		screenX = x;
		screenPosition.x = x;
		bitmapScreenPosition.x = x - ( bitmap.width / 2 );
		bitmapMatrix.tx = x;
		
		#if flash
		#else
		if ( inScene && tileData != null )
		{
			tileData[xIndex] = x;
		}
		#end
		
		return screenX;
	}
	
	private function set_screenY( y:Float ):Float
	{
		screenY = y;
		screenPosition.y = y;
		bitmapScreenPosition.y = y - (bitmap.height / 2);
		bitmapMatrix.ty = y;
		
		#if flash
		#else
		if ( inScene && tileData != null )
		{
			tileData[yIndex] = y;
		}
		#end
		
		return screenY;
	}
	
	private function set_scale( scale:Float ):Float
	{
		this.scale = scale;
		bitmapMatrix.scale( scale, scale );	// TODO - test this
		// TODO - scale bitmap
		
		#if flash
		#else
		if ( inScene && tileData != null )
		{
			tileData[scaleIndex] = scale;
		}
		#end
		
		return scale;
	}
	
	private function set_rotation( rotation:Float ):Float
	{
		this.rotation = rotation;
		bitmapMatrix.rotate( rotation );	// TODO - test this
		// TODO - rotate bitmap
		
		#if flash
		#else
		if ( inScene && tileData != null )
		{
			tileData[rotationIndex] = rotation;
		}
		#end
		
		return rotation;
	}
	
	private function set_red( red:Float ):Float
	{
		this.red = red;
		colorTransform.redMultiplier = red;
		
		#if flash
		#else
		if ( inScene && tileData != null )
		{
			tileData[redIndex] = red;
		}
		#end
		
		return red;
	}
	
	private function set_blue( blue:Float ):Float
	{
		this.blue = blue;
		colorTransform.blueMultiplier = blue;
		
		#if flash
		#else
		if (inScene && tileData != null)
		{
			tileData[blueIndex] = blue;
		}
		#end
		
		return blue;
	}
	
	private function set_green( green:Float ):Float
	{
		this.green = green;
		colorTransform.greenMultiplier = green;
		
		#if flash
		#else
		if ( inScene && tileData != null )
		{
			tileData[greenIndex] = green;
		}
		#end
		
		return green;
	}
	
	private function set_alpha( alpha:Float ):Float
	{
		this.alpha = alpha;
		colorTransform.alphaMultiplier = alpha;
		
		#if flash
		#else
		if ( inScene && tileData != null )
		{
			tileData[alphaIndex] = alpha;
		}
		#end
		
		return alpha;
	}
	
	public function destroy():Void
	{
		// TODO - destroy everything
	}
}