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
						
						structure.menuScreenVO = menuScreenVO.fromXML(screenXML);
					
					break;					
				}
			}
			
			return structure;
		}
		
	}

}