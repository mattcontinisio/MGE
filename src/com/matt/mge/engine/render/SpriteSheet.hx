package com.matt.mge.engine.render;

import haxe.Json;
import openfl.Assets;
import openfl.display.Tilesheet;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;

/**
 * Sets up the tilesheet and Bitmaps
 * @author Matt Continisio
 */
class SpriteSheet
{
	public static var REF(get, null):SpriteSheet;
	
	/// The BitmapData for the tilesheet
	public var tilesheetBitmapData( default, null ):BitmapData;
	
	/// The tilesheet, used on non-Flash platforms
	public var tilesheet( default, null ):Tilesheet;
	
	/// Maps a tile's key to its id in tilesheet
	public var tileRectMap( default, null ):Map<String, Int>;
	
	/// Maps a tile's key to its Bitmap
	public var tileBitmapMap( default, null ):Map<String, Bitmap>;
	
	/// If tiles are drawn with smoothing
	public var smooth( default, null ):Bool;
	
	/// Flags (scale, rotation, rgb, alpha) for tilesheet
	public var flags( default, null ):Int;
	
	/// Number of flags
	public var numFlags( default, null ):Int;
	
	// Whether or not scale, rotation, color, and alpha are used when drawing
	private var useScale:Bool;
	private var useRotation:Bool;
	private var useRGB:Bool;
	private var useAlpha:Bool;
	
	// Offsets of values in tileData array
	public var xIndexOffset( default, null ):Int;
	public var yIndexOffset( default, null ):Int;
	public var tileRectIDIndexOffset( default, null ):Int;
	public var scaleIndexOffset( default, null ):Int;
	public var rotationIndexOffset( default, null ):Int;
	public var redIndexOffset( default, null ):Int;
	public var greenIndexOffset( default, null ):Int;
	public var blueIndexOffset( default, null ):Int;
	public var alphaIndexOffset( default, null ):Int;
	
	private function new()
	{
		var origin:Point = new Point(0, 0);
		smooth = false;
		flags = 15;
		//flags = Tilesheet.TILE_RGB | Tilesheet.TILE_SCALE | Tilesheet.TILE_ROTATION | Tilesheet.TILE_ALPHA
		
		tilesheetBitmapData = Assets.getBitmapData("img/tilesheet.png");
		tilesheet = new Tilesheet(tilesheetBitmapData);
		tileRectMap = new Map<String, Int>();
		tileBitmapMap = new Map<String, Bitmap>();
		
		var jsonTiles:Array<Dynamic> = Json.parse(Assets.getText("data/tiles.json")).tiles;
		for (tile in jsonTiles)
		{
			var rectangle:Rectangle = new Rectangle(tile.rectangle.x, tile.rectangle.y, tile.rectangle.width, tile.rectangle.height);
			var centerPoint:Point = new Point(tile.centerPoint.x, tile.centerPoint.y);
			var key:String = tile.key;
			tileRectMap[key] = tilesheet.addTileRect(rectangle, centerPoint);
			
			var bitmapData:BitmapData = new BitmapData(Std.int(rectangle.width), Std.int(rectangle.height));
			bitmapData.copyPixels(tilesheetBitmapData, rectangle, origin);
			tileBitmapMap[key] = new Bitmap(bitmapData);
		}
		
		// Get flags used
		numFlags = 3;
		if ( ( flags & Tilesheet.TILE_SCALE ) > 0 )
		{
			numFlags++;
			useScale = true;
		}
		if ( ( flags & Tilesheet.TILE_ROTATION ) > 0 )
		{
			numFlags++;
			useRotation = true;
		}
		if ( ( flags & Tilesheet.TILE_RGB ) > 0 )
		{
			numFlags += 3;
			useRGB = true;
		}
		if ( ( flags & Tilesheet.TILE_ALPHA ) > 0 )
		{
			numFlags++;
			useAlpha = true;
		}
		
		// Calculate offsets
		xIndexOffset = 0;
		yIndexOffset = 1;
		tileRectIDIndexOffset = 2;
		if ( useScale || useRotation || useRGB || useAlpha )
		{
			var numValues = 3;
			
			if ( useScale )
			{
				scaleIndexOffset = numValues;
				numValues++;
			}
			
			if ( useRotation )
			{
				rotationIndexOffset = numValues;
				numValues++;
			}
			
			if ( useRGB )
			{
				redIndexOffset = numValues;
				greenIndexOffset = numValues + 1;
				blueIndexOffset = numValues + 2;
				numValues += 3;
			}
			
			if ( useAlpha )
			{
				alphaIndexOffset = numValues;
				numValues++;
			}
		}
	}
	
	private static function get_REF():SpriteSheet
	{
		if ( REF == null )
		{
			REF = new SpriteSheet();
		}
		
		return REF;
	}
}