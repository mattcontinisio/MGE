package com.matt.mge.engine.misc;

import com.matt.mge.engine.debug.Debug;
import flash.Lib;
import flash.system.Capabilities;

/**
 * Information about the screen of the device. Also stores expected screen size so that stage can be resized properly.
 * @author Matt Continisio
 */
class ScreenInfo
{
	public static var REF( get, null ):ScreenInfo;
	
	public var screenResolutionX( default, null ):Float;
	public var screenResolutionY( default, null ):Float;
	public var screenDPI( default, null ):Float;
	public var pixelAspectRatio( default, null ):Float;
	
	public var aspectRatio( default, null ):Float;
	
	public var expectedScreenWidth( default, null ):Float;
	public var expectedScreenHeight( default, null ):Float;
	
	public var screenWidth( default, null ):Float;
	public var screenHeight( default, null ):Float;
	
	public var scaleFactor( default, null ):Float;
	public var xOffset( default, null ):Float;
	public var yOffset( default, null ):Float;
	
	private function new()
	{
	}
	
	private static function get_REF():ScreenInfo
	{
		if ( REF == null )
		{
			REF = new ScreenInfo();
		}
		
		return REF;
	}
	
	public function init( expectedScreenWidth:Float, expectedScreenHeight:Float ):Void
	{
		screenResolutionX = Capabilities.screenResolutionX;
		screenResolutionY = Capabilities.screenResolutionY;
		screenDPI = Capabilities.screenDPI;
		pixelAspectRatio = Capabilities.pixelAspectRatio;
		
		Debug.log( "General", screenResolutionX + " / " + screenResolutionY );
		
		aspectRatio = screenResolutionX / screenResolutionY;
		
		this.expectedScreenWidth = expectedScreenWidth;
		this.expectedScreenHeight = expectedScreenHeight;
		
		// Set screen dimensions, mobile = full-screen, non-mobile = size of stage
		#if mobile
		
		screenWidth = screenResolutionX;
		screenHeight = screenResolutionX;
		
		#else
		
		screenWidth = Lib.current.stage.stageWidth;
		screenHeight = Lib.current.stage.stageHeight;
		
		//screenWidth = screenResolutionX;
		//screenHeight = screenResolutionY;
		
		#end
		
		// Set scale and offsets
		scaleFactor = 1;
		xOffset = 0;
		yOffset = 0;
		
		// Get ratios of actual screen size to expected screen size
		var xRatio:Float = screenWidth / expectedScreenWidth;
		var yRatio:Float = screenHeight / expectedScreenHeight;
		
		if ( xRatio < yRatio )
		{
			scaleFactor = xRatio;
			xOffset = 0;
			yOffset = ( screenHeight - ( expectedScreenHeight * scaleFactor ) ) / 2;
		}
		else if ( yRatio < xRatio )
		{
			scaleFactor = yRatio;
			xOffset = ( screenWidth - ( expectedScreenWidth * scaleFactor ) ) / 2;
			yOffset = 0;
		}
		else
		{
			scaleFactor = xRatio;
			xOffset = 0;
			yOffset = 0;
		}
	}
	
	public function worldToScreenX( worldX:Float ):Float
	{
		return ( worldX * scaleFactor ) + xOffset;
	}
	
	public function worldToScreenY( worldY:Float ):Float
	{
		return ( worldY * scaleFactor ) + yOffset;
	}
	
	public function screenToWorldX( screenX:Float ):Float
	{
		return ( screenX - xOffset ) / scaleFactor;
	}
	
	public function screenToWorldY( screenY:Float ):Float
	{
		return ( screenY - yOffset ) / scaleFactor;
	}
}