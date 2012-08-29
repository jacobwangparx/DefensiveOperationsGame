package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class CharacterVO 
	{	
		public var name:String;
		
		public var currentLevel:int;
		
		public var currentAttack:int;
		public var currentSpeed:int;
		public var currentRange:int;
		public var currentHealth:int;
		
		public var positionX:int;
		public var positionY:int;
		
		public var levelVOs:Array;
		
		public static function fromXML(xml:XML):CharacterVO 
		{
			var vo:CharacterVO = new CharacterVO();
			
			if (xml.@name != undefined) vo.name = xml.@name;
			if (xml.@currentLevel != undefined) vo.currentLevel = xml.@currentLevel;
			
			for each (var levelXML in xml.levels.level ) 
			{
				var levelVO:LevelCharacterVO = LevelCharacterVO.fromXML(levelXML);
				
				if (vo.currentLevel = levelVO.levelNum)
				{
					vo.currentAttack = levelVO.attack;
					vo.currentHealth = levelVO.health;
					vo.currentRange = levelVO.range;
					vo.currentSpeed = levelVO.speed;
				}
				
				vo.levelVOs.push(levelVO);
			}
			
			vo.positionX = 0;
			vo.positionY = 0;
			
			return vo;
		}
		
	}

}