package com.matt.mge.engine.ads;

#if android

import openfl.utils.JNI;

#end

/**
 * ...
 * @author Matt Continisio
 */
// TODO - add functions to display and hide banner ad, https://developers.google.com/mobile-ads-sdk/docs/admob/intermediate
class AdManager
{
	public static var REF( get, null ):AdManager;
	
	public var bannerWidth:Float;
	public var bannerHeight:Float;
	
	public var showChartboostInterstitialAd:Dynamic;
	public var showRevMobAdFullscreen:Dynamic;
	
	private function new()
	{
		// TODO - get actual banner size, probably using JNI
		
		#if android
		
		bannerHeight = 50;
		bannerWidth = 320;
		
		showChartboostInterstitialAd = JNI.createStaticMethod( "com/matt/resolution/MainActivity", "showChartboostInterstitialAd", "()V" );
		showRevMobAdFullscreen = JNI.createStaticMethod( "com/matt/resolution/MainActivity", "showRevMobAdFullscreen", "()V" );
		
		#else
		
		bannerHeight = 0;
		bannerWidth = 0;
		
		#end
	}
	
	private static function get_REF():AdManager
	{
		if ( REF == null )
		{
			REF = new AdManager();
		}
		
		return REF;
	}
}