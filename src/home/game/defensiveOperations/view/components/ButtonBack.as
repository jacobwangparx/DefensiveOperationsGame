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
	public class ButtonBack extends LabelButton
	{
	 
		
		private var _buttonVO:ButtonVO;
		
		public function ButtonBack(target:MovieClip):void
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
		
		public function get buttonVO():ButtonVO 
		{
			return _buttonVO;
		}
		
		public function set buttonVO(value:ButtonVO):void 
		{
			_buttonVO = value;
			
			textField.htmlText = value.text;
		}
			
	 
		
	}

}