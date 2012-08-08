package home.game.defensiveOperations.view.screens 
{

	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.enum.*;
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
			
			view.signalClickButtonBack.add(backToMenuScreen);
		 
		}
		
		private function backToMenuScreen():void 
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.MENUSCREEN);
			dispatch(screenEvent);
			view.transitionOut();
		}
		
		private function showScreen(e:ScreenEvent):void 
		{
			view.transitionIn();
		}
		
	}

}