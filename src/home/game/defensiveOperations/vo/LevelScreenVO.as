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
	
		public function LevelScreenVO() 
		{
			
		}
		
		public static function  fromXML(xml:XML):LevelScreenVO 
		{
			var vo:LevelScreenVO = new LevelScreenVO();
			
			return vo;
		}
		
	}

}