package home.game.defensiveOperations.vo 
{
	import adobe.utils.CustomActions;
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class LabelCharacterVO 
	{	
		public var textLabel:String;
		public var imageUri:String;
		
		public var index:int;
		
		public static function fromXML(xml:XML):LabelCharacterVO
		{
			var vo:LabelCharacterVO = new LabelCharacterVO();
		 
			if (xml.@textLabel != undefined) vo.textLabel = xml.@textLabel;
			if (xml.@imageUri != undefined) vo.imageUri = xml.@imageUri;			
			return vo;
		}
		
	}

}