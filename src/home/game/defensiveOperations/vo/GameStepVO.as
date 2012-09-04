package home.game.defensiveOperations.vo 
{
	import adobe.utils.CustomActions;
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameStepVO 
	{	
		public var index:int;
		public var tankNum:int;
		public var soliderNum:int;
		public var btrNum:int;
		
		public static function fromXML(xml:XML):GameStepVO 
		{
			var vo:GameStepVO = new GameStepVO();
			
			vo.tankNum = xml.@tankNum;
			vo.btrNum = xml.@btrNum;
			vo.soliderNum = xml.@soliderNum;
			
			return vo;
		}
		
	}

}