package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class PanelProfileVO 
	{	
		public var labelProfileVOs:Array;
		
		public var index:int;
		
		public static function fromXML(xml:XML):PanelProfileVO 
		{
			var vo:PanelProfileVO = new PanelProfileVO();
			
			vo.labelProfileVOs = new Array();
			
			var counter:int = 0;
			for each (var labelXML:XML in xml.labels.labelProfile) 
			{
				var labelVO:LabelProfileVO = LabelProfileVO.fromXML(labelXML);
				labelVO.index = counter;
				
				vo.labelProfileVOs.push(labelVO);
				counter++;
			}
			
			return vo;
		}
		
	}

}