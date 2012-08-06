package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class CreditsScreenVO 
	{
	 
	
		public function CreditsScreenVO() 
		{
			
		}
		
		public static function  fromXML(xml:XML):CreditsScreenVO 
		{
			var vo:CreditsScreenVO = new CreditsScreenVO();
			
		 
			
			return vo;
		}
		
	}

}