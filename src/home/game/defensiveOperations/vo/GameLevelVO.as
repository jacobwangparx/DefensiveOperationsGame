package home.game.defensiveOperations.vo 
{
	import adobe.utils.CustomActions;
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameLevelVO 
	{	
		public var index:int;
		public var stepTotal:int;
		
		public var stepVOs:Array;
		
		public static function fromXML(xml:XML):GameLevelVO 
		{
			var vo:GameLevelVO = new GameLevelVO();
			
			return vo;
		}
		
	}

}