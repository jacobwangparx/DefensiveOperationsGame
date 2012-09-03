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
		
		public var gameLevelVOs:Array;
		
		public static function  fromXML(xml:XML):LevelScreenVO 
		{
			var vo:LevelScreenVO = new LevelScreenVO();
			
			vo.currentLevel = 1;
			vo.gameLevelVOs = new Array();
			
			var counter:int = 0;
			for each (var gameLevelXML in xml.gameLevels.level ) 
			{
				//var gameLevelVO:GameLevelVO = GameLevelVO.fromXML
			}
			
			
			
			return vo;
		}
		
	}

}