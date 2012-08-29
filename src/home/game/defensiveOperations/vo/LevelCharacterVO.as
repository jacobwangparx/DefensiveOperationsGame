package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class LevelCharacterVO
	{	
		public var levelNum:int;
		public var imageUri:String;
		
		public var attack:int;
		public var attackPrice:int;
		
		public var speed:int;
		public var speedPrice:int;
		
		public var health:int;
		public var healthPrice:int;
		
		public var range:int;
		public var rangePrice:int;
		
		public static function fromXML(xml:XML):LevelCharacterVO 
		{
			var vo:LevelCharacterVO = new LevelCharacterVO();
			
			if (xml.@levelNum != undefined) vo.levelNum = xml.@levelNum;
			if (xml.@imageUri != undefined) vo.imageUri = xml.@imageUri;
			
			if (xml.@attack != undefined) vo.attack = xml.@attack;
			if (xml.@attackPrice != undefined) vo.attackPrice = xml.@attackPrice;
			
			if (xml.@speed != undefined) vo.speed = xml.@speed;
			if (xml.@speedPrice != undefined) vo.speedPrice = xml.@speedPrice;
			
			if (xml.@health != undefined) vo.health = xml.@health;
			if (xml.@healthPrice != undefined) vo.healthPrice = xml.@healthPrice
			
			if (xml.@range != undefined) vo.range = xml.@range;
			if (xml.@rangePrice != undefined) vo.rangePrice = xml.@rangePrice;
			
			return vo;
		}
		
	}

}