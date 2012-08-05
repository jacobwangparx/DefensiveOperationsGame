package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.ApplicationServiceEvent;
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.model.ScreenProxy;
	import home.game.defensiveOperations.vo.StructureVO;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class SetStructureCommand extends Command
	{
		[Inject]
		public var event:ApplicationServiceEvent;
		[Inject]
		public var screenProxy:ScreenProxy;
		public function SetStructureCommand() 
		{
			
		}
		override public function execute():void 
		{
			super.execute();
			var structure:StructureVO = event.structure;
			screenProxy.screens = structure.screens;
			dispatch(new ScreenEvent(ScreenEvent.BEGIN));
		}
	}

}