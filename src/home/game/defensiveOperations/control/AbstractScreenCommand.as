package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.model.ScreenProxy;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class AbstractScreenCommand extends Command
	{
		[Inject]
		public var screenProxy:ScreenProxy;
		
		[Inject]
		public var event:ScreenEvent;
		
		override public function execute():void 
		{
			super.execute();
			screenProxy.currentScreen = event.type;
			
			dispatch(new ScreenEvent(ScreenEvent.HIDE_ALL));
		}
	}

}