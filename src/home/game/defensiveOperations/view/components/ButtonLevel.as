package home.game.defensiveOperations.view.components 
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
	public class ButtonLevel extends LabelButton
	{
		private var _gameLevelVO:GameLevelVO;
		
		public function ButtonLevel(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			
			super.createChildren();
			
			textField = target.textField;
			bg = target.bg;
		}
		
		override protected function onRollOver(e:MouseEvent):void 
		{
			if (!enabled) {
				return;
			}
			
			super.onRollOver(e);
			
		}
		
		override protected function onRollOut(e:MouseEvent):void 
		{
			if (!enabled) {
				return;
			}
			
			super.onRollOut(e);
			
		} 
		
		
		public function get gameLevelVO():GameLevelVO 
		{
			return _gameLevelVO;
		}
		
		public function set gameLevelVO(value:GameLevelVO):void 
		{
			_gameLevelVO = value;
			textField.htmlText = 'Level '  + (value.index + 1);
		}
			
	 
		
	}

}