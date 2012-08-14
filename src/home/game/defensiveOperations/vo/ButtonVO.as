package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class ButtonVO 
	{	
		
		public function ButtonVO() 
		{
			
		}
		
		public static function  fromXML(xml:XML):ShopScreenVO 
		{
			var vo:ButtonVO = new ButtonVO();
			
			return vo;
		}
		
	}

}