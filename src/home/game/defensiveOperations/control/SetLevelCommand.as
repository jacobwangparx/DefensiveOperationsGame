package home.game.defensiveOperations.control 
{
	

	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.model.GameLevelProxy;

	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class SetLevelCommand extends Command
	{
		
		[Inject]
		public var levelEvent:GameLevelEvent;
		
		[Inject]
		public var gameLevelProxy:GameLevelProxy;
		
		public function SetLevelCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			super.execute();
			gameLevelProxy.gameLevelVO = levelEvent.gameLevelVO;
			
		}
	}

}