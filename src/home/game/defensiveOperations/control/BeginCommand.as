package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.model.*;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class BeginCommand extends Command
	{
		[Inject]
		public var screenProxy:ScreenProxy;
		
		override public function execute():void
		{
			
			super.execute();
			
			dispatch(new ScreenEvent(ScreenEvent.MENUSCREEN));
			screenProxy.begin();
			
		}
	}

}