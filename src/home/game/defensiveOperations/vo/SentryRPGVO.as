package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class SentryRPGVO extends GameElementVO
	{	
		public var name:String;
		public var bodyImageUri:String;
	
		public var rpgAttack:int;
		public var rpgAttackSpeed:int;
		
		public var price:int;
 
		public static function fromXML(xml:XML):SentryRPGVO 
		{
			var vo:SentryRPGVO = new SentryRPGVO();
			
			if (xml.@name != undefined) vo.name = xml.@name;
			if (xml.@bodyImageUri != undefined) vo.bodyImageUri = xml.@bodyImageUri;
		 	
			if (xml.@attack != undefined) vo.attack = xml.@attack;
			if (xml.@range != undefined) vo.range = xml.@range;
			if (xml.@health != undefined) vo.healthMax = xml.@health;
			if (xml.@speed != undefined) vo.speed = xml.@speed;
			
			if (xml.@rpgAttack != undefined) vo.rpgAttack = xml.@rpgAttack;
			if (xml.@rpgSpeed != undefined) vo.rpgAttackSpeed = xml.@rpgSpeed;
			
			if (xml.@price != undefined) vo.price = xml.@price;
			
			return vo;
		}
		
	}

}