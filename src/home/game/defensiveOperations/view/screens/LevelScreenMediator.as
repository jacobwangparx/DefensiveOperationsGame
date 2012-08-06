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
		 
		}
		
		private function showScreen(e:ScreenEvent):void 
		{
			view.transitionIn();
		}
		
	}

}