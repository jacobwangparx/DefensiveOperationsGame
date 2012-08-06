package home.game.defensiveOperations.event 
{
	/**
	 * ...
	 * @author Jake
	 */
	public class GameScreenEvent 
	{		
		//public static const TO_START_GAME_SCREEN:String = "MenuScreenEvent.TO_START_GAME_SCREEN";
		//public static const TO_SELECT_LEVEL_SCREEN:String = "MenuScreenEvent.TO_SELECT_LEVEL_SCREEN";
		//public static const TO_CREDITS_SCREEN:String = "MenuScreenEvent.TO_CREDITS_SCREEN";
		//public static const TO_HELP_SCREEN:String = "MenuScreenEvent.TO_HELP_SCREEN";
		
		public function GameScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);		
		} 
		
		public override function clone():Event 
		{ 
			return new GameScreenEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("GameScreenEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
				
	}

}