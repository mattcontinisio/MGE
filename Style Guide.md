# Style Guide

Haxe style guide for this project.

## Example Class

    package com.matt.mge.engine.scene;
    
    import flash.geom.Point;
    
    /**
     *  A game entity. Essentially an aggregation of components.
     *  @author Matt Continisio
     */
     
    class Actor
    {
        /// The position of the Actor
        public var position( default, null ):Point;
        
        public function new( x:Float, y:Float )
        {
            position = new Point( x, y );
        }
        
        /**
         *  Sets the position of the Actor.
         */
        public function moveTo( x:Float, y:Float ):Void
        {
            position.x = x;
            position.y = y;
        }
    }