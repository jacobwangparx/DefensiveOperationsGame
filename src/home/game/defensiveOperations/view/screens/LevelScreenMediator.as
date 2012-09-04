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
			//var gameScreenEvent:GameScreenEvent = new GameScreenEvent();
			trace("get index: " + gameLevelVO.index);
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