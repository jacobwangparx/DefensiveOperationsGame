package com.twoandtwo.calculator.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class ScreenEvent extends Event 
	{
		public static const NEXT:String = "NEXT";
		public static const BEGIN:String = "BEGIN";
		public static const HIDE_ALL:String = "HIDE_ALL";
		
		public static const CALCULATORSCREEN:String = "CALCULATORSCREEN";
		
		/*screentag-event*/
		
		public function ScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ScreenEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ScreenEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}