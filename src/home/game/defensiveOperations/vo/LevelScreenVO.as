package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class LevelScreenVO 
	{
		public var currentLevel:int;
		
		
		public static function  fromXML(xml:XML):LevelScreenVO 
		{
			var vo:LevelScreenVO = new LevelScreenVO();
			
			vo.currentLevel = 1;
			
			return vo;
		}
		
	}

}