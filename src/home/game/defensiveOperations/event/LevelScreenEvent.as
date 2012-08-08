package home.game.defensiveOperations.event 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Jake
	 */
	public class LevelScreenEvent extends Event
	{		

		public static const CHANGE_CURRENT_LEVEL:String = "LevelScreenEvent.CHANGE_CURRENT_LEVEL";
		public static const SET_CURRENT_LEVEL:String = "LevelScreenEvent.SET_CURRENT_LEVEL";
		
		
		public function LevelScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);		
		} 
		
		public override function clone():Event 
		{ 
			return new LevelScreenEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("LevelScreenEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
				
	}

}