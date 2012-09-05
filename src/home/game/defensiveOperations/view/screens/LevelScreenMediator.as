package home.game.defensiveOperations.view.screens 
{

	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.enum.*;
	import home.game.defensiveOperations.vo.GameLevelVO;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class LevelScreenMediator extends Mediator
	{
		
		[Inject]
		public var view:LevelScreen;
		
		public function LevelScreenMediator() 
		{
			super();
		}
		
		override public function onRegister():void 
		{
			super.onRegister();	
			
			eventMap.mapListener(eventDispatcher, ScreenEvent.LEVELSCREEN, showScreen, ScreenEvent);
			eventMap.mapListener(eventDispatcher, GameLevelEvent.CHANGE_CURRENT_LEVELSCREEN, changeCurrentLevelScreenVO, GameLevelEvent);
			
			view.signalClickButtonBack.add(onClickButtonBackToMenuScreen);
			view.signalClickButtonLevel.add(onClickButtonLevel);
		}
		
		private function changeCurrentLevelScreenVO(e:GameLevelEvent):void 
		{
			view.levelScreenVO = e.levelScreenVO;
		}
		
		private function onClickButtonLevel(gameLevelVO:GameLevelVO):void 
		{
			view.transitionOut();
			var gameLevelEvent:GameLevelEvent = new GameLevelEvent(GameLevelEvent.SET_CURRENT_LEVEL);
			gameLevelEvent.gameLevelVO = gameLevelVO;
			dispatch(gameLevelEvent);
			
			var gameScreenEvent:GameScreenEvent =  new GameScreenEvent(GameScreenEvent.CONTINUE_GAME);
			dispatch(gameScreenEvent);
		
		}
		
		private function onClickButtonBackToMenuScreen():void 
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.MENUSCREEN);
			dispatch(screenEvent);
			view.transitionOut();
		}
		
		private function showScreen(e:ScreenEvent):void 
		{
			trace("transitonsIN");
			view.transitionIn();
		}
		
	}

}