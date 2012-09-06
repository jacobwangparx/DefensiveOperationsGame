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
	import home.game.defensiveOperations.view.components.*;
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
		
		private var btrs:Array;
		private var tanks:Array;
		private var soliders:Array;
		
		private var stepTotal:int;
		private var stepVOs:Array;
		
		private var characterJacobVO:CharacterVO;
		private var characterStaceyVO:CharacterVO;
		
		private var _gameLevelVO:GameLevelVO;
		private var _gameScreenVO:GameScreenVO;
		
		public var signalClickButtonRestart:Signal;
		public var signalClickButtonMenu:Signal;
		
		private var currentStep:int;
	
		
		
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
		
			stepVOs = new Array();
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
		}
		
		override public function transitionOut():void 
		{
			if(gameScreenVO.isStart)
			{
				destoryCurrentEnemies();
				gameScreenVO.isStart = false;
			}
			super.transitionOut();
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
			
			if(gameScreenVO.isStart)
			{
				destoryCurrentEnemies();
				currentStep = 0;
				createEnemiesForCurrentStep();
			}
			
		}
		
		private function onClickCharacterLabelOnPanelControl(index:int):void 
		{
			trace("click character label: + index: " + index);
		}
		
		private function onClickButtonStartOnPanelControl():void 
		{
			trace("click button start");
			
			gameScreenVO.isStart = true;
			//check character status
			
			//destory the group
			//destoryCurrentEnemies();
			
			//create the first group of enemies
			createEnemiesForCurrentStep();

		}
		
		private function createEnemiesForCurrentStep():void 
		{
			btrs = new Array();
			soliders = new Array();
			tanks = new Array();
			
			var stepVO:GameStepVO = stepVOs[currentStep];
			var index:int;
			var currentX:int = 0;
			var currentY:int = 0;
			for (index = 0; index < stepVO.btrNum; index++) 
			{
				var btr:EnemyBtr = new EnemyBtr(new btrClip());
				btr.x = currentX;
				btr.y = currentY;
				
				addChild(btr);
				btrs.push(btr);
				
				currentX += 30;
				currentY +=30
			}
			
			for (index = 0; index < stepVO.tankNum; index++) 
			{
				var tank:EnemyTank = new EnemyTank(new tankClip());
				tank.x = currentX;
				tank.y = currentY;
				
				addChild(tank);
				tanks.push(tank);
				
				currentX += 30;
				currentY += 30;
			}
			
			for (index = 0; index < stepVO.soliderNum; index++) 
			{
				var solider:EnemySolider = new EnemySolider(new soliderClip());
				solider.x = currentX;
				solider.y = currentY;
				
				addChild(solider);
				soliders.push(solider);
				
				currentX += 10;
				currentY += 10;
			}
		}
		
		private function destoryCurrentEnemies():void 
		{
			var index:int;
		
			if(btrs != null){
				for (index = 0; index < btrs.length; index++) 
				{
					var btr:EnemyBtr = EnemyBtr(btrs[index]);
					removeChild(btr.target);
				}
			}
			
			if(tanks != null){
				for (index = 0; index < tanks.length; index++) 
				{
					var tank:EnemyTank = EnemyTank(tanks[index]);
					removeChild(tank.target);
				}
			}
			
			if(soliders != null){
				for (index = 0; index < soliders.length; index++) 
				{
					var solider:EnemySolider = EnemySolider(soliders[index]);
					removeChild(solider.target);
				}
			}
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
			
			characterJacobVO = value.characterVOs[1];
			characterStaceyVO = value.characterVOs[0];
		
			currentStep = 0;
		}
		
		public function get gameLevelVO():GameLevelVO 
		{
			return _gameLevelVO;
		}
		
		public function set gameLevelVO(value:GameLevelVO):void 
		{
			_gameLevelVO = value;
			labelLevel.htmlText =  gameScreenVO.textLevel + (value.index + 1).toString();
				
			stepVOs = value.stepVOs;
			stepTotal = value.stepTotal;
		}
			
	  
	}

}