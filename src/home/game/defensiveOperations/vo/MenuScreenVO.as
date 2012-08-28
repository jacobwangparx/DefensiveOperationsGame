package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class MenuScreenVO 
	{
		public var textHeading:String;
		public var textStartGame:String;
		public var textSelectLevel:String;
		public var textCredits:String;
		public var textHelp:String;
		public var textExit:String;
		
		public static function  fromXML(xml:XML):MenuScreenVO 
		{
			var vo:MenuScreenVO = new MenuScreenVO();
			
			if (xml.@textHeading != undefined) vo.textHeading = TextManager.getText(xml.@textHeading);
			if (xml.@textStartGame != undefined) vo.textStartGame = TextManager.getText(xml.@textStartGame);
			if (xml.@textSelectLevel != undefined) vo.textSelectLevel = TextManager.getText(xml.@textSelectLevel);
			if (xml.@textCredits != undefined) vo.textCredits = TextManager.getText(xml.@textCredits);
			if (xml.@textHelp != undefined) vo.textHelp = TextManager.getText(xml.@textHelp);
			
			vo.textExit = 'EXIT';
			
			return vo;
		}
		
	}

}