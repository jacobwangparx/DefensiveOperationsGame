package home.game.defensiveOperations.vo 
{
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class PanelControlVO 
	{	
		
		public var textMenu:String;
		public var textPause:String;
		
		public var characterImageUris:Array;
		public var unitImageUris:Array;
		
		public var healthCharacter1:Number;
		public var healthCharacter2:Number;
		
		public var priceUnit1:Number;
		public var priceUnit2:Number;
		
		public var nameCharacter1:String;
		public var nameCharacter2:String;
		
		public var money:int;
		public var gold:int;
		
		public static function fromXML(xml:XML):PanelControlVO 
		{
			var vo:PanelControlVO = new PanelControlVO();
			
			vo.textMenu = "MENU";
			vo.textPause = "PAUSE";
			
			vo.characterImageUris = new Array();
			vo.unitImageUris = new Array();
			
			vo.healthCharacter1 = 0;
			vo.healthCharacter2 = 0;
			
			vo.priceUnit1 = 0;
			vo.priceUnit2 = 0;
			
			var imageUri:String;
			for each (var characterImageXML:XML in xml.characterImages.characterImage) 
			{
				if (characterImageXML.@uri != undefined) imageUri = characterImageXML.@uri;
				vo.characterImageUris.push(imageUri);
			}
				
			for each (var unitImageXML:XML in xml.unitImages.unitImage) 
			{
				if (unitImageXML.@uri != undefined) imageUri = unitImageXML.@uri;
				vo.unitImageUris.push(imageUri);
			}
			
			return vo;
		}
		
	}

}