package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.model.*;
	import home.game.defensiveOperations.vo.GameScreenVO;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class SetGameScreenCommand extends Command
	{
		[Inject]
		public var gameScreenProxy:GameScreenProxy;
		
		[Inject]
		public var gameScreenEvent:GameScreenEvent;
		
		override public function execute():void
		{
			super.execute();
		
			gameScreenProxy.currentGameScreenVO = gameScreenEvent.currentGameScreenVO;	
		}
	}

}