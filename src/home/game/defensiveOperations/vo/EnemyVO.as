package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class EnemyVO extends GameElementVO
	{	

		public static function fromXML(xml:XML):EnemyVO 
		{
			var vo:EnemyVO = new EnemyVO();
	 
			if (xml.@attack != undefined) vo.attack = xml.@attack;
			if (xml.@range != undefined) vo.range = xml.@range;
			if (xml.@health != undefined) vo.healthMax = xml.@health;
			if (xml.@speed != undefined) vo.speed = xml.@speed;
	 
			return vo;
		}
		
	}

}