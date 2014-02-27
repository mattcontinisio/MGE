package com.matt.mge.engine.render;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.Lib;
import openfl.display.Tilesheet;

/**
 * Draws bitmaps to itself. Doesn't manage actors, just tiles.
 * @author Matt Continisio
 */
class BitmapLayer extends Sprite
{
	// Non-flash = drawTiles
	public var tilesheet:Tilesheet;
	public var tileData:Array<Float>;
	public var numTiles(default, null):Int;
	public var smooth:Bool;
	public var flags:Int;
	public var numFlags:Int;
	public var availableTileNums:Array<Int>;
	public var nextTileNum:Int;
	
	// Flash = copyPixels
	public var tiles:Array<Tile>;	// For blitting
	public var blitSurface:BitmapData;
	
	private function new()
	{
		super();
		
		// Non-flash
		tilesheet = SpriteSheet.REF.tilesheet;
		tileData = new Array<Float>();
		numTiles = 0;
		this.smooth = SpriteSheet.REF.smooth;
		this.flags = SpriteSheet.REF.flags;
		this.numFlags = SpriteSheet.REF.numFlags;
		availableTileNums = new Array<Int>();
		nextTileNum = 0;
		
		// Flash
		tiles = new Array<Tile>();
		blitSurface = new BitmapData( Lib.current.stage.stageWidth, Lib.current.stage.stageWidth, true, 0x00FFFFFF );
		
		//#if flash
		addChild( new Bitmap( blitSurface ) );	// This is added on no-flash so gestures work TODO - make gestures work without this
		//#end
	}
	
	public function addTile( tile:Tile ):Void
	{
		// Flash
		tiles.push( tile );
		
		var tileNum:Int;
		
		if ( availableTileNums.length > 0 )
		{
			tileNum = availableTileNums[0];
			availableTileNums.remove( tileNum );
			
			tile.onAddedToBitmapLayer( tileData, tileNum );
		}
		else
		{
			tileNum = nextTileNum;
			nextTileNum++;
			
			tile.onAddedToBitmapLayer( tileData, tileNum );
		}
		
		numTiles++;
	}
	
	public function removeTile( tile:Tile ):Void
	{
		tiles.remove( tile );
		
		availableTileNums.push( tile.tileNum );
		numTiles--;
	}
	
	public function draw():Void
	{
		#if flash
		
		blitSurface.fillRect( blitSurface.rect, 0x00FFFFFF );
		for ( tile in tiles )
		{
			//blitSurface.copyPixels(tile.bitmap.bitmapData, tile.sourceRect, tile.bitmapScreenPosition);	// no alpha or color
			blitSurface.draw( tile.bitmap, tile.bitmapMatrix, tile.colorTransform );						// alpha and color work
		}
		
		//tilesheet.drawTiles(graphics, tileData, smooth, flags);
		
		#else
		
		/*blitSurface.fillRect(blitSurface.rect, 0x00ffffff);
		for (tile in tiles)
		{
			// TODO - add alpha support
			//blitSurface.copyPixels(tile.bitmap.bitmapData, tile.sourceRect, tile.bitmapScreenPosition);
			blitSurface.draw(tile.bitmap, tile.bitmapMatrix, tile.colorTransform);
		}*/
		
		graphics.clear();
		tilesheet.drawTiles( graphics, tileData, smooth, flags );
		
		#end
	}
}