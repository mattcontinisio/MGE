package com.matt.mge.engine.ui;

import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

/**
 * ...
 * @author Matt Continisio
 */
class Button extends SimpleButton
{
	private var upSprite:Sprite;
	private var overSprite:Sprite;
	private var downSprite:Sprite;
	
	// This is an array because the sprite for each state needs to have its own TextField child
	private var textFields:Array<TextField>;
	
	private var onClick:MouseEvent->Void;
	
	public function new( x:Float, y:Float, width:Float, height:Float, upColor:Int, overColor:Int, downColor:Int, alpha:Int, text:String ) 
	{
		// TODO - test alpha
		upSprite = new Sprite();
		//upSprite.alpha = alpha;
		upSprite.graphics.beginFill( upColor, 1 );
		upSprite.graphics.drawRect( 0, 0, width, height );
		upSprite.graphics.endFill();
		
		overSprite = new Sprite();
		//overSprite.alpha = alpha;
		overSprite.graphics.beginFill( overColor, 1 );
		overSprite.graphics.drawRect( 0, 0, width, height );
		overSprite.graphics.endFill();
		
		downSprite = new Sprite();
		//downSprite.alpha = alpha;
		downSprite.graphics.beginFill( downColor, 1 );
		downSprite.graphics.drawRect( 0, 0, width, height );
		downSprite.graphics.endFill();
		
		super( upSprite, overSprite, downSprite, upSprite );
		
		textFields = new Array<TextField>();
		for ( i in 0...3 )
		{
			var textField:TextField = new TextField();
			textField.defaultTextFormat = new TextFormat( "Visitor TT1 BRK", 30, 0x000000, false, false, false, null, null, TextFormatAlign.CENTER );
			textField.embedFonts = true;
			textField.selectable = false;
			textField.width = width;
			textField.height = height;
			textField.text = text;
			textFields.push( textField );
		}
		
		upSprite.addChild( textFields[0] );
		overSprite.addChild( textFields[1] );
		downSprite.addChild( textFields[2] );
		
		this.x = x;
		this.y = y;
		
		onClick = null;
	}
}