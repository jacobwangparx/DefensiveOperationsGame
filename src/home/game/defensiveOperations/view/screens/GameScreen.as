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
		
		private var panelControl:PanelControl;
		
		private var buttonRestart:LabelButton;
		
		private var _gameScreenVO:GameScreenVO;
	 
		public var signalClickButtonRestart:Signal;
		
		public function GameScreen(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			labelKilled = new TextComponent(target.labelKilled);
			 
			labelLevel = new TextComponent(target.labelLevel);
			
			panelControl = new PanelControl(target.panelControl);
			panelControl.signalClickPanelUnit.add(onClickPanelUnit);
			panelControl.signalClickStartButton.add(onClickButtonStart);
			panelControl.signalClickCharacterLabel.add(onClickCharacterLabel);
			
			buttonRestart = new LabelButton(target.buttonRestart);
			buttonRestart.addEventListener(MouseEvent.CLICK, onRestartGame);
			
			signalClickButtonRestart = new Signal();
		}
		
		private function onRestartGame(e:MouseEvent):void 
		{
			signalClickButtonRestart.dispatch();
		}
		
		private function onClickCharacterLabel(index:int):void 
		{
			trace("click character label: + index: " + index);
		}
		
		private function onClickButtonStart():void 
		{
			trace("click button start");
		}
		
	
		private function onClickPanelUnit(index:int):void 
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
			
	  
		
	}

}