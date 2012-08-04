package home.game.defensiveOperations.event
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Jacob
	 */
	public class DebugEvent extends Event
	{		
		// command
		public static const SET_IS_DEBUG:String = "SET_IS_DEBUG";
		
		// proxy
		public static const CHANGE_IS_DEBUG:String = "CHANGE_IS_DEBUG";
		
		public var isDebug:Boolean;
		
		public function DebugEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);	
		} 
		
		public override function clone():Event 
		{ 
			return new DebugEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("DebugEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}

}