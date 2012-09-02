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
		
		public var sentryGunVO:SentryGunVO;
		public var sentryRPGVO:SentryRPGVO;
		
		public var soliderVO:SoliderVO;
		public var tankVO:TankVO;
		public var btrVO:BtrVO;
		
		public static function fromXML(xml:XML):GameScreenVO 
		{
			var vo:GameScreenVO = new GameScreenVO();
			
			vo.textKilled = 'Killed:';
			vo.textLevel = 'Level:';
			
			vo.panelControl =  PanelControlVO.fromXML(XML(xml.panelControl));
			
			vo.characterVOs = new Array();
			for each (var characterXML:XML in xml.characters.character)
			{
				var characterVO:CharacterVO = CharacterVO.fromXML(characterXML);
				
				vo.characterVOs.push(characterVO);
			}
			
			vo.sentryGunVO = SentryGunVO.fromXML(XML(xml.sentryGun));
			vo.sentryRPGVO = SentryRPGVO.fromXML(XML(xml.sentryRPG));
			vo.soliderVO = SoliderVO.fromXML(XML(xml.solider));
			vo.tankVO = TankVO.fromXML(XML(xml.tank));
			vo.btrVO = BtrVO.fromXML(XML(xml.btr));
			
			vo.panelControl.priceUnit1 = vo.sentryGunVO.price;
			vo.panelControl.priceUnit2 = vo.sentryRPGVO.price;
			
			return vo;
		}
		
	}

}