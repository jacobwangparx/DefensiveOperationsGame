package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameScreenVO 
	{	
		public function GameScreenVO() 
		{
			
		}
		
		public static function  fromXML(xml:XML):GameScreenVO 
		{
			var vo:GameScreenVO = new GameScreenVO();
			
			return vo;
		}
		
	}

}