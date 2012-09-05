package home.game.defensiveOperations.view.screens 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.LabelButton;
	import com.lookmum.view.TextComponent;
	import com.lookmum.view.ToggleButton;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import home.game.defensiveOperations.view.components.PanelControl;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameScreen extends AbstractScreen
	{
		
		private var labelKilled:TextComponent;
		private var labelLevel:TextComponent;
		private var buttonRestart:LabelButton;
		private var buttonSound:ToggleButton;
		private var panelControl:PanelControl;
		
		private var _gameLevelVO:GameLevelVO;
		private var _gameScreenVO:GameScreenVO;
		
		public var signalClickButtonRestart:Signal;
		public var signalClickButtonMenu:Signal;
		
		public function GameScreen(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			labelKilled = new TextComponent(target.labelKilled); 
			labelLevel = new TextComponent(target.labelLevel);
			
			buttonSound = new ToggleButton(target.buttonSound);
			buttonSound.addEventListener(MouseEvent.CLICK, onClickButtonSound);
			
			buttonRestart = new LabelButton(target.buttonRestart);
			buttonRestart.addEventListener(MouseEvent.CLICK, onClickButtonRestart);
			signalClickButtonRestart = new Signal();
			
			panelControl = new PanelControl(target.panelControl);
			panelControl.signalClickPanelUnit.add(onClickPanelUnitOnPanelControl);
			panelControl.signalClickStartButton.add(onClickButtonStartOnPanelControl);
			panelControl.signalClickCharacterLabel.add(onClickCharacterLabelOnPanelControl);
			panelControl.signalClickButtonMenu.add(onClickButtonMenuOnPanelControl);
			signalClickButtonMenu = new Signal();
			panelControl.signalClickButtonPause.add(onClickButtonPauseOnPanelControl);
		}
		
		private function onClickButtonPauseOnPanelControl():void 
		{
			trace("click button pause");
		}
		
		private function onClickButtonMenuOnPanelControl():void 
		{
			trace("click button menu");
			signalClickButtonMenu.dispatch();
		}
		
		private function onClickButtonSound(e:MouseEvent):void 
		{
			trace("add button sound");
		}
		
		private function onClickButtonRestart(e:MouseEvent):void 
		{
			signalClickButtonRestart.dispatch();
		}
		
		private function onClickCharacterLabelOnPanelControl(index:int):void 
		{
			trace("click character label: + index: " + index);
		}
		
		private function onClickButtonStartOnPanelControl():void 
		{
			trace("click button start");
		}
		
	
		private function onClickPanelUnitOnPanelControl(index:int):void 
		{
			trace("click button unit: + index: " + index);
		}
				
		public function get gameScreenVO():GameScreenVO 
		{
			return _gameScreenVO;
		}
		
		public function set gameScreenVO(value:GameScreenVO):void 
		{
			_gameScreenVO = value;
			
			labelKilled.htmlText = value.textKilled;
			labelLevel.htmlText = value.textLevel;
			
			panelControl.panelControlVO = gameScreenVO.panelControlVO;

		}
		
		public function get gameLevelVO():GameLevelVO 
		{
			return _gameLevelVO;
		}
		
		public function set gameLevelVO(value:GameLevelVO):void 
		{
			_gameLevelVO = value;
			labelLevel.htmlText =  gameScreenVO.textLevel + (value.index + 1).toString();
		}
			
	  
	}

}