package home.game.defensiveOperations.view.screens 
{

	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.enum.*;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class HelpScreenMediator extends Mediator
	{
		
		[Inject]
		public var view:HelpScreen;
		

		public function HelpScreenMediator() 
		{
			super();
		}
		
		override public function onRegister():void 
		{
			super.onRegister();	
			
			eventMap.mapListener(eventDispatcher, ScreenEvent.HELPSCREEN, showScreen, ScreenEvent);
		}
			
		private function showScreen(e:ScreenEvent):void 
		{
			view.transitionIn();
		}
				
	}

}