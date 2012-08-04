package home.game.defensiveOperations.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class ApplicationEvent extends Event 
	{
		public static const LOAD_TEXT:String = "LOAD_TEXT";
		public function ApplicationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ApplicationEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ApplicationEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}