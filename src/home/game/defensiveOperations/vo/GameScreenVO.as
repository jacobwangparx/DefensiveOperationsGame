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
		
		public var panelControlVO:PanelControlVO;
		public var characterVOs:Array;
		
		public var sentryGunVO:SentryGunVO;
		public var sentryRPGVO:SentryRPGVO;
		
		public var soliderVO:EnemyVO;
		public var tankVO:EnemyVO;
		public var btrVO:EnemyVO;
		
		public var soliderVOs:Array;
		public var tankVOs:Array;
		public var btrVOs:Array;
		
		public var isStart:Boolean;
		
		public static function fromXML(xml:XML):GameScreenVO 
		{
			var vo:GameScreenVO = new GameScreenVO();
			
			vo.textKilled = 'Killed:';
			vo.textLevel = 'Level:';
			
			vo.panelControlVO =  PanelControlVO.fromXML(XML(xml.panelControl));
			
			vo.characterVOs = new Array();
			for each (var characterXML:XML in xml.characters.character)
			{
				var characterVO:CharacterVO = CharacterVO.fromXML(characterXML);
				vo.characterVOs.push(characterVO);
			}
			
			vo.sentryGunVO = SentryGunVO.fromXML(XML(xml.sentryGun));
			trace( "vo.sentryGunVO : " + vo.sentryGunVO.bodyImageUri );
			vo.sentryRPGVO = SentryRPGVO.fromXML(XML(xml.sentryRPG));
			trace( "vo.sentryRPGVO : " + vo.sentryRPGVO.bodyImageUri );
			vo.soliderVO = EnemyVO.fromXML(XML(xml.solider));
			vo.tankVO = EnemyVO.fromXML(XML(xml.tank));
			vo.btrVO = EnemyVO.fromXML(XML(xml.btr));
			
			vo.panelControlVO.priceUnit1 = vo.sentryGunVO.price;
			vo.panelControlVO.priceUnit2 = vo.sentryRPGVO.price;
			
			vo.isStart = false;
			
			return vo;
		}
		
	}

}