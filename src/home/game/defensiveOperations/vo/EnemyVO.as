package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class EnemyVO 
	{	
		public var attack:int;
		public var range:int;
		public var health:int;
		public var speed:int;
		
		public var positionX:Number;
		public var positionY:Number;
 
		public var index:int;
		
		public static function fromXML(xml:XML):EnemyVO 
		{
			var vo:EnemyVO = new EnemyVO();
	 
			if (xml.@attack != undefined) vo.attack = xml.@attack;
			if (xml.@range != undefined) vo.range = xml.@range;
			if (xml.@health != undefined) vo.health = xml.@health;
			if (xml.@speed != undefined) vo.speed = xml.@speed;
	 
			return vo;
		}
		
	}

}