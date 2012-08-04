package com.twoandtwo.calculator.control 
{
	import com.twoandtwo.calculator.event.ApplicationServiceEvent;
	import com.twoandtwo.calculator.service.ApplicationService;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class LoadStructureCommand extends Command
	{
		[Inject]
		public var service:ApplicationService;
		
		override public function execute():void 
		{
			super.execute();
			service.loadStructure();
		}
	}

}