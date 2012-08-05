package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.model.ScreenProxy;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class NextCommand extends Command
	{
		[Inject]
		public var screenProxy:ScreenProxy;
		
		override public function execute():void 
		{
			super.execute();
			screenProxy.next();
		}
	}

}