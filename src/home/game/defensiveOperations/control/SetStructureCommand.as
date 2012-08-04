package com.twoandtwo.calculator.control 
{
	import com.twoandtwo.calculator.event.ApplicationServiceEvent;
	import com.twoandtwo.calculator.event.ScreenEvent;
	import com.twoandtwo.calculator.model.ScreenProxy;
	import com.twoandtwo.calculator.vo.StructureVO;
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