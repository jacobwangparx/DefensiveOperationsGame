package home.game.defensiveOperations.event 
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
		
		public static const MENUSCREEN:String = "MENUSCREEN";
		public static const UPDATESCREEN:String = "UPDATESCREEN";
		public static const GAMESCREEN:String = "GAMESCREEN";
		public static const HELPSCREEN:String = "HELPSCREEN";
		public static const CREDITSSCREEN:String = "CREDITSSCREEN";
		public static const LEVELSCREEN:String = "LEVELSCREEN";
		
		
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