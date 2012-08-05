package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.ApplicationServiceEvent;
	import home.game.defensiveOperations.service.ApplicationService;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class LoadTextCommand extends Command
	{
		[Inject]
		public var service:ApplicationService;
		
		override public function execute():void
		{
			super.execute();
			service.loadText();
		}
	}

}