package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.ApplicationServiceEvent;
	import home.game.defensiveOperations.event.GameScreenEvent;
	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.model.ScreenProxy;
	import home.game.defensiveOperations.vo.GameScreenVO;
	import home.game.defensiveOperations.vo.StructureVO;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class SetStructureCommand extends Command
	{
		[Inject]
		public var event:ApplicationServiceEvent;
		
		[Inject]
		public var screenProxy:ScreenProxy;
		
		public function SetStructureCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			super.execute();
			var structure:StructureVO = event.structure;
			screenProxy.screens = structure.screens;
			
			var gameScreenEvent:GameScreenEvent = new GameScreenEvent(GameScreenEvent.SET_CURRENT_GAME_SCREEN);
			gameScreenEvent.currentGameScreenVO = event.structure.gameScreenVO;
			screenProxy.originGameScreenVO = event.structure.gameScreenVO;
			dispatch(gameScreenEvent);
			
			var levelScreenEvent:GameLevelEvent = new GameLevelEvent(GameLevelEvent.SET_CURRENT_LEVELSCREEN);
			levelScreenEvent.levelScreenVO = event.structure.levelScreenVO;
			dispatch(levelScreenEvent);
			
			var gameLevelEvent:GameLevelEvent = new GameLevelEvent(GameLevelEvent.SET_CURRENT_LEVEL);
			gameLevelEvent.gameLevelVO = event.structure.levelScreenVO.gameLevelVOs[0];
			dispatch(gameLevelEvent);
			
			dispatch(new ScreenEvent(ScreenEvent.BEGIN));
		}
	}

}