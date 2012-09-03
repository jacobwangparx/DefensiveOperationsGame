package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import com.peachpit.aas3wdp.iterators.ArrayIterator;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class ShopScreenVO 
	{	
 
		public var gold:int;
		
		public var characterVOs:Array;
		
		public var labelProfileVOs:Array;
		
		public var panelProfileVOs:Array;
		
		public static function  fromXML(xml:XML):ShopScreenVO 
		{
			var vo:ShopScreenVO = new ShopScreenVO();
			
			vo.gold = 0;
			
			vo.characterVOs = new Array();
			
			vo.labelProfileVOs = new Array();
			vo.panelProfileVOs = new Array();
			
			var counter:int = 0;
			for each (var labelCharacterXML:XML in xml) 
			{
				var labelCharacterVO:LabelCharacterVO = LabelCharacterVO.fromXML(labelCharacterXML);
				labelCharacterVO.index = counter;
				
				vo.characterVOs.push(labelCharacterVO);
				counter++;
			}
			
			counter = 0;
			for each (var panelProfileXML:XML in xml) 
			{
				var panelProfileVO:PanelProfileVO = PanelProfileVO.fromXML(panelProfileXML);
				panelProfileVO.index = counter;
				
				vo.panelProfileVOs.push(panelProfileVO);
				counter++;
			}
			
			
			return vo;
		}
		
	}

}