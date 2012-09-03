package home.game.defensiveOperations.view.components 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.Button;
	import com.lookmum.view.Component;
	import com.lookmum.view.ImageButton;
	import com.lookmum.view.LabelButton;
	import com.lookmum.view.TextComponent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import home.game.defensiveOperations.view.screens.AbstractScreen;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class LabelCharacter extends Component
	{	
		private var buttonImage:ImageButton;
		private var healthLine:MovieClip;
		
		private var _index:int;
		
		public var signalClickLabelImage:Signal;
		
		private var _panelControlVO:PanelControlVO;
	 
		public function LabelCharacter(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			buttonImage = new ImageButton(target.buttonImage);
			signalClickLabelImage = new Signal();
			buttonImage.addEventListener(MouseEvent.CLICK, onClickLabelImage);
	
		}
		
		private function onClickLabelImage(e:MouseEvent):void 
		{
			signalClickLabelImage.dispatch(index);
		}
		
		public function get panelControlVO():PanelControlVO 
		{
			return _panelControlVO;
		}
		
		public function set panelControlVO(value:PanelControlVO):void 
		{
			_panelControlVO = value;
			buttonImage.load(value.characterImageUris[index]);
			
			if (index == 0)
				healthLine.width = value.healthCharacter1;
			else
				healthLine.width = value.healthCharacter2;
		}	
		
		public function get index():int 
		{
			return _index;
		}
		
		public function set index(value:int):void 
		{
			_index = value;
		}
						
	}

}