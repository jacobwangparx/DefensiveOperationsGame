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
			
			eventMap.mapListener(eventDispatcher, ScreenEvent.GAMESCREEN, showScreen, ScreenEvent);
				
			
		}
				
		private function showScreen(e:ScreenEvent):void 
		{
			view.transitionIn();
		}
		

	}

}