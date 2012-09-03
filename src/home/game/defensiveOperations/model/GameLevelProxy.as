package home.game.defensiveOperations.model 
{
	import home.game.defensiveOperations.event.LevelScreenEvent;
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.vo.LevelScreenVO;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class GameLevelProxy extends Actor
	{
		
		private var _levelScreenVO:LevelScreenVO;
		
		public function GameLevelProxy() 
		{
			super();
			
		} 
		
		public function get levelScreenVO():LevelScreenVO 
		{
			return _levelScreenVO;
		}
		
		public function set levelScreenVO(value:LevelScreenVO):void 
		{
			_levelScreenVO = value;
			var levelScreenEvent:LevelScreenEvent = new LevelScreenEvent(LevelScreenEvent.CHANGE_CURRENT_LEVEL);
			dispatch(levelScreenEvent);
		}
	}

}