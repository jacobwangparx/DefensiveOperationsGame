package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class HelpScreenVO 
	{	
		public function HelpScreenVO() 
		{
			
		}
		
		public static function  fromXML(xml:XML):HelpScreenVO 
		{
			var vo:HelpScreenVO = new HelpScreenVO();
			
			return vo;
		}
		
	}

}