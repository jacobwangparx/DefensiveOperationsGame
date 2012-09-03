package home.game.defensiveOperations.view.screens 
{

	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.enum.*;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class GameScreenMediator extends Mediator
	{
		
		[Inject]
		public var view:GameScreen;
		

		public function GameScreenMediator() 
		{
			super();
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			
			eventMap.mapListener(eventDispatcher, GameScreenEvent.CHANGE_CURRENT_GAME_SCREEN, onChangeGameScreenVO, GameScreenEvent);
			
			eventMap.mapListener(eventDispatcher, GameScreenEvent.CONTINUE_GAME, onTransitionInScreen, GameScreenEvent);
			eventMap.mapListener(eventDispatcher, GameScreenEvent.START_GAME, onTransitionInScreen, GameScreenEvent);
		
			view.signalClickButtonRestart.add(onClickButtonRestart);
			view.signalClickButtonMenu.add(onClickButtonMenuOnPanelControl);
		}
		
		private function onClickButtonMenuOnPanelControl():void 
		{
			view.transitionOut();
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.MENUSCREEN);
			dispatch(screenEvent);
		}
		
		private function onClickButtonRestart():void 
		{
			//var gameScreenEvent:GameScreenEvent = new GameScreenEvent(GameScreenEvent.START_GAME);
			//dispatch(gameScreenEvent);
			
			trace("restart");
		}
		
		private function onChangeGameScreenVO(e:GameScreenEvent):void 
		{
			view.gameScreenVO = e.currentGameScreenVO;
		}
		
		private function onTransitionInScreen(e:GameScreenEvent):void 
		{
			view.transitionIn();
		}
				
				

	}

}