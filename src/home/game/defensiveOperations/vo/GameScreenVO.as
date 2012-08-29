package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameScreenVO 
	{	
		
		public var textLevel:String;
		public var textKilled:String;
		
		public var panelControl:PanelControlVO;
		public var characterVOs:Array;
		public var unitVOs:Array;
		
		public static function fromXML(xml:XML):GameScreenVO 
		{
			var vo:GameScreenVO = new GameScreenVO();
			vo.textKilled = 'Killed:';
			vo.textLevel = 'Level:';
			vo.panelControl = PanelControlVO.fromXML(xml.panelControl);
			
			vo.characterVOs = new Array();
			for each (var characterXML in xml.characters.character)
			{
				var characterVO:CharacterVO = CharacterVO.fromXML(characterXML);
				vo.characterVOs.push(characterVO);
			}
			
			vo.unitVOs = new Array();
			
			var counter:int = 0;
			
			for each (var unitXML in xml.units.unit) 
			{
				var unitVO:UnitVO = UnitVO.fromXML(unitXML);
				
				if(counter == 0)
					vo.panelControl.priceUnit1 = unitVO.price;
				else
					vo.panelControl.priceUnit2 = unitVO.price;
					
				vo.unitVOs.push(unitVO);
				
				counter++;
			}
			
			return vo;
		}
		
	}

}