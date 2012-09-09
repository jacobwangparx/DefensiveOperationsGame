package home.game.defensiveOperations.view.components 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.Component;
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
	public class PanelUnit extends Component
	{	
		private var sentryGun:LabelUnit;
		private var sentryRPG:LabelUnit;
		
		public var signalClickUnit:Signal;
		
		private var _panelControlVO:PanelControlVO;
	 
		public function PanelUnit(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			sentryGun = new LabelUnit(target.sentryGun);
			sentryGun.index = 0;
			sentryGun.signalClickLabelImage.add(onClickLabelUnit);
			
			sentryRPG = new LabelUnit(target.sentryRPG);
			sentryRPG.index = 1;
			sentryRPG.signalClickLabelImage.add(onClickLabelUnit);
			
			signalClickUnit = new Signal();
		}
		
		private function onClickLabelUnit(index:int):void 
		{
			signalClickUnit.dispatch(index);
		}
		
		public function get panelControlVO():PanelControlVO 
		{
			return _panelControlVO;
		}
		
		public function set panelControlVO(value:PanelControlVO):void 
		{
			_panelControlVO = value;
			
			sentryGun.panelControlVO = value;
			sentryRPG.panelControlVO = value;
		
			
		}
						
	}

}