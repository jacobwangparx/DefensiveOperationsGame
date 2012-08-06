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
	public class HelpScreen extends AbstractScreen
	{
	 
		private var _helpScreenVO:HelpScreenVO;
		
		public function HelpScreen(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			
			super.createChildren();
			
	 
		}
		
		public function get helpScreenVO():HelpScreenVO 
		{
			return _helpScreenVO;
		}
		
		public function set helpScreenVO(value:HelpScreenVO):void 
		{
			_helpScreenVO = value;
		}
			

	}

}