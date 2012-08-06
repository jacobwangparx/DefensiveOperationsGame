package home.game.defensiveOperations.view.screens 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.LabelButton;
	import com.lookmum.view.TextComponent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class CreditsScreen extends AbstractScreen
	{
	 
		private var _creditsScreenVO:CreditsScreenVO;
		
		public function CreditsScreen(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			
			super.createChildren();
			
	 
		}
			
		public function get creditsScreenVO():CreditsScreenVO 
		{
			return _creditsScreenVO;
		}
		
		public function set creditsScreenVO(value:CreditsScreenVO):void 
		{
			_creditsScreenVO = value;
				
		}
		
	}

}