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
				
			eventMap.mapListener(eventDispatcher, ScreenEvent.GAMESCREEN, toGameScreen, ScreenEvent);
			eventMap.mapListener(eventDispatcher, ScreenEvent.LEVELSCREEN, toLevelScreen, ScreenEvent);
			eventMap.mapListener(eventDispatcher, ScreenEvent.CREDITSSCREEN, toCreditsScreen, ScreenEvent);
			eventMap.mapListener(eventDispatcher, ScreenEvent.HELPSCREEN, toHelpScreen, ScreenEvent);
			
			eventMap.mapListener(eventDispatcher, ApplicationServiceEvent.LOAD_STRUCTURE, onLoadStructure, ApplicationServiceEvent);
			
			view.signalClickStartGame.add(onClickButtonStartGame);
			view.signalClickSelectLevel.add(onClickButtonSelectLevel);
			view.signalClickCredits.add(onClickButtonCredits);
			view.signalClickHelp.add(onClickButtonHelp);
			
		}
		

		private function onClickButtonStartGame():void
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.GAMESCREEN);
			dispatch(screenEvent);
		}
		
		private function onClickButtonSelectLevel():void
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.LEVELSCREEN);
			dispatch(screenEvent);
		}
		
		private function onClickButtonCredits():void
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.CREDITSSCREEN);
			dispatch(screenEvent);
		}
		
		private function onClickButtonHelp():void
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.HELPSCREEN);
			dispatch(screenEvent);
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