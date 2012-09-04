package home.game.defensiveOperations.model 
{
	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.vo.GameLevelVO;
	import home.game.defensiveOperations.vo.LevelScreenVO;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class GameLevelProxy extends Actor
	{
		
		private var _gameLevelVO:GameLevelVO;
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
			var levelScreenEvent:GameLevelEvent = new GameLevelEvent(GameLevelEvent.CHANGE_CURRENT_LEVELSCREEN);
			levelScreenEvent.levelScreenVO = value;
			dispatch(levelScreenEvent);
		}
		
		public function get gameLevelVO():GameLevelVO 
		{
			return _gameLevelVO;
		}
		
		public function set gameLevelVO(value:GameLevelVO):void 
		{
			_gameLevelVO = value;
			
			var gameLevelEvent:GameLevelEvent = new GameLevelEvent(GameLevelEvent.CHANGE_CURRENT_LEVEL);
			gameLevelEvent.gameLevelVO = value;
			dispatch(gameLevelEvent);
		}
	}

}