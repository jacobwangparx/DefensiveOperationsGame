package com.twoandtwo.calculator.event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class BusyEvent extends Event 
	{
		public static const SHOW_BUSY:String = "SHOW_BUSY";
		public static const HIDE_BUSY:String = "HIDE_BUSY";
		
		public var busyHeading:String = "Loading";
		public var busyText:String = "This module is currently loading...";
		
		public function BusyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new BusyEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BusyEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}