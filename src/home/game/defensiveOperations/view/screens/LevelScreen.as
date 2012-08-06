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
	public class LevelScreen extends AbstractScreen
	{		
		private var _levelScreenVO:LevelScreenVO;
		 
		
		public function LevelScreen(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			
			super.createChildren();
			
		}
		
		public function get levelScreenVO():LevelScreenVO 
		{
			return _levelScreenVO;
		}
		
		public function set levelScreenVO(value:LevelScreenVO):void 
		{
			_levelScreenVO = value;
		}
			
	 
	
		
	}

}