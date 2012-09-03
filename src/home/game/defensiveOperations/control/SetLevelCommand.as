package home.game.defensiveOperations.control 
{
	
	import com.twoandtwo.calculator.event.*;
	import com.twoandtwo.calculator.model.*;
	import com.twoandtwo.calculator.vo.*;
	import home.game.defensiveOperations.event.LevelScreenEvent;
	import home.game.defensiveOperations.model.GameProxy;
	import home.game.defensiveOperations.model.LevelProxy;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class SetLevelCommand extends Command
	{
		
		[Inject]
		public var levelEvent:LevelScreenEvent;
		
		public function SetLevelCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			super.execute();
		}
	}

}