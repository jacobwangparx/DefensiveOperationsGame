package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class ShopScreenVO 
	{	
		
		public function ShopScreenVO() 
		{
			
		}
		
		public static function  fromXML(xml:XML):ShopScreenVO 
		{
			var vo:ShopScreenVO = new ShopScreenVO();
			
			return vo;
		}
		
	}

}