package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.model.*;
	import home.game.defensiveOperations.vo.GameScreenVO;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class StartNewGameCommand extends Command
	{
		[Inject]
		public var gameScreenProxy:GameScreenProxy;
		
		[Inject]
		public var screenProxy:ScreenProxy;
		
		[Inject ]
		public var gameLevelProxy:GameLevelProxy;
		
		override public function execute():void
		{
			super.execute();
			gameScreenProxy.currentGameScreenVO = screenProxy.originGameScreenVO;	
			
			var gameLevelEvent:GameLevelEvent = new GameLevelEvent(GameLevelEvent.SET_CURRENT_LEVEL);
			gameLevelEvent.gameLevelVO = gameLevelProxy.levelScreenVO.gameLevelVOs[0];
			dispatch(gameLevelEvent);
		}
	}

}