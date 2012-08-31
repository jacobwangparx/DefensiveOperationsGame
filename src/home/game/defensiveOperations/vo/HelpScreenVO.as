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
		
		public var text:String; 
		
		public var imageUri:String;
		
		public static function  fromXML(xml:XML):HelpScreenVO 
		{
			var vo:HelpScreenVO = new HelpScreenVO();
			
			vo.text = "This is dummy text";
			
			return vo;
		}
		
	}

}