package home.game.defensiveOperations.event 
{
	import flash.events.Event;
	import home.game.defensiveOperations.vo.GameLevelVO;
	import home.game.defensiveOperations.vo.LevelScreenVO;
	/**
	 * ...
	 * @author Jake
	 */
	public class GameLevelEvent extends Event
	{		

		public static const CHANGE_CURRENT_LEVEL:String = "GameLevelEvent.CHANGE_CURRENT_LEVEL";
		public static const SET_CURRENT_LEVEL:String = "GameLevelEvent.SET_CURRENT_LEVEL";
		
		public static const CHANGE_CURRENT_LEVELSCREEN:String = "GameLevelEvent.CHANGE_CURRENT_LEVELSCREEN";
		public static const SET_CURRENT_LEVELSCREEN:String = "GameLevelEvent.SET_CURRENT_LEVELSCREEN";
		
		private var _levelScreenVO:LevelScreenVO;
		private var _gameLevelVO:GameLevelVO;
		
		public function GameLevelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);		
		} 
		
		public override function clone():Event 
		{ 
			return new GameLevelEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("LevelScreenEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get levelScreenVO():LevelScreenVO 
		{
			return _levelScreenVO;
		}
		
		public function set levelScreenVO(value:LevelScreenVO):void 
		{
			_levelScreenVO = value;
		}
		
		public function get gameLevelVO():GameLevelVO 
		{
			return _gameLevelVO;
		}
		
		public function set gameLevelVO(value:GameLevelVO):void 
		{
			_gameLevelVO = value;
		}
				
	}

}