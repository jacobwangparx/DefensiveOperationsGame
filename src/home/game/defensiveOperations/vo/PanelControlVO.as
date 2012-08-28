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
		public var bloodCharacter1:Number;
		public var bloodCharacter2:Number;
		
		public static function fromXML(xml:XML):PanelControlVO 
		{
			var vo:PanelControlVO = new PanelControlVO();
			
			vo.textMenu = 'MENU';
			vo.textPause = 'PAUSE';
			
			vo.characterImageUris = new Array();
			vo.unitImageUris = new Array();
			
			vo.bloodCharacter1 = 100;
			vo.bloodCharacter2 = 100;
			
			for each (var characterImageXML in xml.characterImages.characterImage) 
			{
				var imageUri:String;
				if (characterImageXML.@uri != undefined) imageUri = characterImageXML.@uri;
				vo.characterImageUris.push(imageUri);
			}
				
			for each (var unitImageXML in xml.unitImages.unitImage) 
			{
				var imageUri:String;
				if (unitImageXML.@uri != undefined) imageUri = unitImageXML.@uri;
				vo.unitImageUris.push(imageUri);
			}
			
			
			return vo;
		}
		
	}

}