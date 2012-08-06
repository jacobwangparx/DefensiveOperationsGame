package home.game.defensiveOperations.vo 
{
	import home.game.defensiveOperations.event.ScreenEvent;
	/**
	 * ...
	 * @author Jacob
	 */
	public class StructureVO
	{
		public var screens:Array;
		
		public var menuScreenVO:MenuScreenVO;
		public var gameScreenVO:GameScreenVO;
		public var creditsScreenVO:CreditsScreenVO;
		public var helpScreenVO:HelpScreenVO;
		public var levelScreenVO:LevelScreenVO;
		public var shopScreenVO:ShopScreenVO;
		
		public function StructureVO() 
		{
			
		}
		
		public static function fromXML(xml:XML):StructureVO 
		{
			var structure:StructureVO = new StructureVO();
			structure.screens = new Array();
			
			for each(var screenXML:XML in xml.screens.screen) 
			{
				structure.screens.push(String(screenXML.@id));
			}
			
			for each(screenXML in xml.structure.screen) 
			{
				switch(String(screenXML.@id)) {
			
					case ScreenEvent.MENUSCREEN:
						
						structure.menuScreenVO = MenuScreenVO.fromXML(screenXML);
					
					break;	
					
					case ScreenEvent.GAMESCREEN:
						
						structure.gameScreenVO = GameScreenVO.fromXML(screenXML);
					
					break;
					
					
					case ScreenEvent.CREDITSSCREEN:
						
						structure.creditsScreenVO = CreditsScreenVO.fromXML(screenXML);
					
					break;
					
					
					case ScreenEvent.LEVELSCREEN:
						
						structure.levelScreenVO = LevelScreenVO.fromXML(screenXML);
					
					break;
					
					
					case ScreenEvent.SHOPSCREEN:
						
						structure.shopScreenVO = ShopScreenVO.fromXML(screenXML);
				
					break;
					
					
					case ScreenEvent.HELPSCREEN:
						
						structure.helpScreenVO = HelpScreenVO.fromXML(screenXML);
					
					break;
					
					
				}
			}
			
			return structure;
		}
		
	}

}