package home.game.defensiveOperations.view.components 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.Component;
	import com.lookmum.view.ImageButton;
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
	public class PanelControl extends Component
	{	
		private var buttonMenu:LabelButton;
		private var buttonPause:LabelButton;
		
		private var labelMoney:TextComponent;
		private var labelGold:TextComponent;
				
		private var panelUnit:PanelUnit;
		
		private var buttonStart:LabelButton;
		
		private var characterLabelStacey:LabelCharacter;
		private var characterLabelJacob:LabelCharacter;
		
		public var signalClickPanelUnit:Signal;
		public var signalClickStartButton:Signal;
		public var signalClickButtonMenu:Signal;
		public var signalClickButtonPause:Signal;
		
		private var _panelControlVO:PanelControlVO;
	 
		public function PanelControl(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			buttonMenu = new LabelButton(target.buttonMenu);
			buttonMenu.addEventListener(MouseEvent.CLICK, onClickButtonMenu);
			
			buttonPause = new LabelButton(target.buttonPause);
			buttonPause.addEventListener(MouseEvent.CLICK, onClickButtonPause);
			
			labelMoney = new TextComponent(target.labelMoney);
			labelGold = new TextComponent(target.labelGold);
			
			panelUnit = new PanelUnit(target.panelUnit);
			panelUnit.signalClickUnit.add(onClickPanelUnit);
	
			buttonStart = new LabelButton(target.buttonStart);
			buttonStart.addEventListener(MouseEvent.CLICK, onClickButtonStart);
			
			characterLabelStacey = new LabelCharacter(target.characterLabelStacey);
			characterLabelStacey.index = 0;
			
			characterLabelJacob = new LabelCharacter(target.characterLabelJacob);
			characterLabelJacob.index = 1;
			
			signalClickPanelUnit = new Signal();
			signalClickStartButton = new Signal();
			signalClickButtonMenu = new Signal();
			signalClickButtonPause = new Signal();
		}
		
		private function onClickButtonPause(e:MouseEvent):void 
		{
			signalClickButtonPause.dispatch();
		}
		
		private function onClickButtonMenu(e:MouseEvent):void 
		{
			signalClickButtonMenu.dispatch();
		}
			
		private function onClickButtonStart(e:MouseEvent):void 
		{
			signalClickStartButton.dispatch();
		}
		
		private function onClickPanelUnit(index:int):void 
		{
			signalClickPanelUnit.dispatch(index);
		}
		
		public function get panelControlVO():PanelControlVO 
		{
			return _panelControlVO;
		}
		
		public function set panelControlVO(value:PanelControlVO):void 
		{
			_panelControlVO = value;
			
			buttonMenu.htmlText = value.textMenu;
			buttonPause.htmlText = value.textPause;
			
			labelMoney.htmlText = value.money.toString();
			labelGold.htmlText = value.gold.toString();
			
			panelUnit.panelControlVO = value;
			characterLabelStacey.panelControlVO = value;
			characterLabelJacob.panelControlVO = value;
		}
						
	}

}