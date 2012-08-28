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
		
		
		public static function fromXML(xml:XML):GameScreenVO 
		{
			var vo:GameScreenVO = new GameScreenVO();
			vo.textKilled = 'Killed:';
			vo.textLevel = 'Level:';
			vo.panelControl = PanelControlVO.fromXML(xml.panelControl);
			
			return vo;
		}
		
	}

}