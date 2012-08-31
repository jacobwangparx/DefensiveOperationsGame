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
		
		
		public static function fromXML(xml:XML):PanelProfileVO 
		{
			var vo:PanelProfileVO = new PanelProfileVO();
			
			vo.labelProfileVOs = new Array();
			
			return vo;
		}
		
	}

}