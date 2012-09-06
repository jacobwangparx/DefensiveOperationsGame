package home.game.defensiveOperations.event 
{
	import flash.events.Event;
	import home.game.defensiveOperations.vo.GameScreenVO;
	/**
	 * ...
	 * @author Jake
	 */
	public class GameScreenEvent extends Event
	{		
		public static const SET_CURRENT_GAME_SCREEN:String = "GameScreenEvent.SET_CURRENT_GAME_SCREEN";
		public static const CHANGE_CURRENT_GAME_SCREEN:String = "GameScreenEvent.CHANGE_CURRENT_GAME_SCREEN";
		
		public static const START_GAME:String = "GameScreenEvent.START_GAME";
		public static const CONTINUE_GAME:String = "GameScreenEvent.CONTINUE_GAME";
			
		private var _currentGameScreenVO:GameScreenVO;
		
		public function GameScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);		
		} 
		
		public override function toString():String 
		{ 
			return formatToString("GameScreenEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get currentGameScreenVO():GameScreenVO 
		{
			return _currentGameScreenVO;
		}
		
		public function set currentGameScreenVO(value:GameScreenVO):void 
		{
			_currentGameScreenVO = value;
		}
				
	}

}