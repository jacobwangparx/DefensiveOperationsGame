package com.twoandtwo.calculator.control 
{
	import com.twoandtwo.calculator.model.ScreenProxy;
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