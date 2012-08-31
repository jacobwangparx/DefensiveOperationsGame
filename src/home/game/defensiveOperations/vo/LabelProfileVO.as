package home.game.defensiveOperations.vo 
{
	import adobe.utils.CustomActions;
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class LabelProfileVO 
	{	
		public var textHeading:String;
		public var level:int;
		public var price:int;
		public var index:int;
		
		public static function fromXML(xml:XML):LabelProfileVO 
		{
			var vo:LabelProfileVO = new LabelProfileVO();
		 
			if (xml.@textHeading != undefined) vo.textHeading = xml.@textHeading;
			if (xml.@level != undefined) vo.level = xml.@level;
			if (xml.@price != undefined) vo.price = xml.@price;
			
			return vo;
		}
		
	}

}