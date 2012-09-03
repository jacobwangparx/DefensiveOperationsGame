package home.game.defensiveOperations.model 
{
	import home.game.defensiveOperations.event.GameScreenEvent;
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.vo.GameScreenVO;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class GameScreenProxy extends Actor
	{
	
		private var _currentGameScreenVO:GameScreenVO;
		
		public function GameScreenProxy() 
		{
			super();
		}
		
		public function get currentGameScreenVO():GameScreenVO 
		{
			return _currentGameScreenVO;
		}
		
		public function set currentGameScreenVO(value:GameScreenVO):void 
		{
			_currentGameScreenVO = value;
			
			var gameScreenEvent:GameScreenEvent = new GameScreenEvent(GameScreenEvent.CHANGE_CURRENT_GAME_SCREEN);
			gameScreenEvent.currentGameScreenVO = value;
			dispatch(gameScreenEvent);
		}
	}

}