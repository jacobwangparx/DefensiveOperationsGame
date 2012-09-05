package home.game.defensiveOperations.view.screens 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.Button;
	import com.lookmum.view.LabelButton;
	import com.lookmum.view.TextComponent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import home.game.defensiveOperations.view.components.ButtonLevel;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 
	* ...
	 * @author Jake
	 */
	public class LevelScreen extends AbstractScreen
	{		
		private var _levelScreenVO:LevelScreenVO;
		
		private var buttonLevels:Array;
		
		public var signalClickButtonBack:Signal;
		public var signalClickButtonLevel:Signal;
		
		public function LevelScreen(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			
			super.createChildren();
			signalClickButtonBack = new Signal();
			buttonBack = new LabelButton(target.buttonBack);
			buttonBack.addEventListener(MouseEvent.CLICK, onClickButtonBack);
			
			buttonLevels = new Array();
			signalClickButtonLevel = new Signal();
		}
		
		public function get levelScreenVO():LevelScreenVO 
		{
			return _levelScreenVO;
		}
		
		public function set levelScreenVO(value:LevelScreenVO):void 
		{
			_levelScreenVO = value;
			
			for each (var gameLevelVO:GameLevelVO in value.gameLevelVOs) 
			{
				var buttonLevel:ButtonLevel = new ButtonLevel(target['buttonLevel' + gameLevelVO.index]);
			
				buttonLevel.gameLevelVO = gameLevelVO;
				buttonLevel.addEventListener(MouseEvent.CLICK, onClickButtonLevel);
				
				buttonLevels.push(buttonLevel);
			}
	
		}
		
		private function onClickButtonLevel(e:MouseEvent):void 
		{
			var buttonLevel:ButtonLevel = e.target as ButtonLevel;
			
			signalClickButtonLevel.dispatch(buttonLevel.gameLevelVO);
		}
		
		private function onClickButtonBack(e:MouseEvent):void 
		{
			signalClickButtonBack.dispatch();
		}
			
	 
	
		
	}

}