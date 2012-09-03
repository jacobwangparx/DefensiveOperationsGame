package home.game.defensiveOperations.view.screens 
{

	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.enum.*;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class MenuScreenMediator extends Mediator
	{
		
		[Inject]
		public var view:MenuScreen;
		

		public function MenuScreenMediator() 
		{
			super();
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			
			eventMap.mapListener(eventDispatcher, ScreenEvent.MENUSCREEN, showScreen, ScreenEvent);
				
			eventMap.mapListener(eventDispatcher, ApplicationServiceEvent.LOAD_STRUCTURE, onLoadStructure, ApplicationServiceEvent);
			
			view.signalClickContinueGame.add(onClickButtonContinueGame);
			view.signalClickStartGame.add(onClickButtonStartGame);
			view.signalClickSelectLevel.add(onClickButtonLevel);
			view.signalClickCredits.add(onClickButtonCredits);
			view.signalClickExit.addOnce(onClickButtonExits);
			
		}
		
		private function onClickButtonContinueGame():void
		{
			view.transitionOut();
			
			var gameScreenEvent:GameScreenEvent = new GameScreenEvent(GameScreenEvent.CONTINUE_GAME);
			dispatch(gameScreenEvent);
		}
		
		private function onClickButtonStartGame():void 
		{
			view.transitionOut();
			
			var gameScreenEvent:GameScreenEvent = new GameScreenEvent(GameScreenEvent.START_GAME);
			dispatch(gameScreenEvent);
		}
		
		
		private function onClickButtonLevel():void
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.LEVELSCREEN);
			dispatch(screenEvent);
		}
		
		private function onClickButtonCredits():void
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.CREDITSSCREEN);
			dispatch(screenEvent);
		}
		
		private function onClickButtonExits():void 
		{
			trace("game exit");
		}
		
		
		
		private function onLoadStructure(e:ApplicationServiceEvent):void 
		{
			view.menuScreenVO = e.structure.menuScreenVO;
		}
		
		private function showScreen(e:ScreenEvent):void 
		{
			view.transitionIn();
		}
		
				
	}

}