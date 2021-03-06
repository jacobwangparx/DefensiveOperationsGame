package home.game.defensiveOperations.model 
{
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.vo.GameScreenVO;
	import home.game.defensiveOperations.vo.StructureVO;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class ScreenProxy extends Actor
	{
		public function ScreenProxy() 
		{
			super();
		}
		
		private var _screens:Array;
		
		public function get screens():Array { return _screens; }
		public function set screens(value:Array):void 
		{
			_screens = value;
		}
		
		private var _currentScreen:String;
		
		private var _originGameScreenVO:GameScreenVO;
		
		public function get currentScreen():String { return _currentScreen; }
		public function set currentScreen(value:String):void 
		{
			_currentScreen = value;
		}
		
		public function get originGameScreenVO():GameScreenVO 
		{
			return _originGameScreenVO;
		}
		
		public function set originGameScreenVO(value:GameScreenVO):void 
		{
			_originGameScreenVO = value;
		}
			
		public function next():void 
		{
			if (!screens || screens.length == 0) return;
			for (var i:int = 0; i < screens.length; i++) 
			{
				if (screens[i] == currentScreen)
				{
					if (i < screens.length - 1) 
					{
						dispatch(new ScreenEvent(screens[i + 1]));
						return;
					}
					else 
					{
						//is last screen
					}
				}
			}
		}
		
		public function begin():void
		{
			if (!screens || screens.length == 0) return;
			dispatch(new ScreenEvent(screens[0]));
		}
			
	}

}