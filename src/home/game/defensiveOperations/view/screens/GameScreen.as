package home.game.defensiveOperations.view.screens 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.LabelButton;
	import com.lookmum.view.TextComponent;
	import com.lookmum.view.ToggleButton;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import home.game.defensiveOperations.view.components.*;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameScreen extends AbstractScreen
	{
		//private var gameScreenMask: MovieClip;
		
		private var gameElementHolder:MovieClip;
		
		private var labelKilled:TextComponent;
		private var labelLevel:TextComponent;
		private var buttonRestart:LabelButton;
		private var buttonSound:ToggleButton;
		private var panelControl:PanelControl;
		
		private var btrs:Array;
		private var tanks:Array;
		private var soliders:Array;
		
		private var sentryGuns:Array;
		private var sentryRPGs:Array;
		
		private var stepTotal:int;
		private var stepVOs:Array;
		
		private var characterStacey:Character;
		private var characterJacob:Character;
		
		private var _gameLevelVO:GameLevelVO;
		private var _gameScreenVO:GameScreenVO;
		
		public var signalClickButtonRestart:Signal;
		public var signalClickButtonMenu:Signal;
		
		private var objectOnMove:DisplayObject;
		
		private var currentStep:int;
	
		private var timer:Timer;
		
		public function GameScreen(target:MovieClip):void
		{
			super(target);
		}
				
		override public function transitionIn():void 
		{
			super.transitionIn();
		}
		
		override public function transitionOut():void 
		{
			if(gameScreenVO.isStart)
			{
				resetGame();
				gameScreenVO.isStart = false;
			}
			super.transitionOut();
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
		
			gameElementHolder = target.gameElementHolder;
			
			characterStacey = new Character(target.characterStacey);
			characterJacob = new Character(target.characterJacob);
			
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
			panelControl.signalClickButtonMenu.add(onClickButtonMenuOnPanelControl);
			signalClickButtonMenu = new Signal();
			panelControl.signalClickButtonPause.add(onClickButtonPauseOnPanelControl);
		
			stepVOs = new Array();
			
			sentryGuns = new Array();
			sentryRPGs = new Array();
		}
		
		private function onClickButtonStartOnPanelControl():void 
		{			
			gameScreenVO.isStart = true;
			createEnemiesForCurrentStep();
		}
		
		private function onClickButtonPauseOnPanelControl():void 
		{
			trace("click button pause");
		}
		
		private function onClickButtonMenuOnPanelControl():void 
		{
			trace("click button menu");
			resetGame();
			signalClickButtonMenu.dispatch();
		}
		
		private function onClickButtonSound(e:MouseEvent):void 
		{
			trace("add button sound");
		}
		
		private function onClickButtonRestart(e:MouseEvent):void 
		{
			signalClickButtonRestart.dispatch();
			
			resetGame();
			currentStep = 0;
		}
		
				
		private function onClickPanelUnitOnPanelControl(index:int):void 
		{
			if (index == 0)
			{
				var sentryGun:SentryGun = new SentryGun(new sentryGunClip());
				sentryGun.sentryGunVO = gameScreenVO.sentryGunVO;
				gameElementHolder.addChild(sentryGun);
				sentryGuns.push(sentryGun);
				objectOnMove = sentryGun; 
			}
			else if(index == 1)
			{
				var sentryRPG:SentryRPG = new SentryRPG(new sentryRpgClip());
				sentryRPG.sentryRPGVO = gameScreenVO.sentryRPGVO;
				gameElementHolder.addChild(sentryRPG);
				sentryRPGs.push(sentryRPG);
				objectOnMove = sentryRPG;
			}
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveNewGameObject);
			stage.addEventListener(MouseEvent.MOUSE_UP, positionNewGameObject);
		}
		
		private function moveNewGameObject(e:MouseEvent):void 
		{
			objectOnMove.x = mouseX;
			objectOnMove.y = mouseY;
		}
		
		private function positionNewGameObject(e:MouseEvent):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveNewGameObject);
			stage.removeEventListener(MouseEvent.MOUSE_UP, positionNewGameObject);
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
				btr.enemyVO = gameScreenVO.btrVO;
				
				btr.x = currentX;
				btr.y = currentY;
				
				gameElementHolder.addChild(btr);
				btrs.push(btr);
				
				currentX += 200;
				currentY += 200
			}
			
			for (index = 0; index < stepVO.tankNum; index++) 
			{
				var tank:EnemyTank = new EnemyTank(new tankClip());
				tank.enemyVO = gameScreenVO.tankVO;
				
				tank.x = currentX;
				tank.y = currentY;
				
				gameElementHolder.addChild(tank);
				tanks.push(tank);
				
				currentX += 30;
				currentY += 30;
			}
			
			for (index = 0; index < stepVO.soliderNum; index++) 
			{
				var solider:EnemySolider = new EnemySolider(new soliderClip());
				solider.enemyVO = gameScreenVO.soliderVO;
				
				solider.x = currentX;
				solider.y = currentY;
				
				gameElementHolder.addChild(solider);
				soliders.push(solider);
				
				currentX += 10;
				currentY += 10;
			}
		}
		
		private function resetGame():void 
		{
			var index:int;
		
			if(btrs != null){
				for (index = 0; index < btrs.length; index++) 
				{
					var btr:EnemyBtr = EnemyBtr(btrs[index]);
					gameElementHolder.removeChild(btr.target);
				}
				btrs = new Array();
			}
			
			if(tanks != null){
				for (index = 0; index < tanks.length; index++) 
				{
					var tank:EnemyTank = EnemyTank(tanks[index]);
					gameElementHolder.removeChild(tank.target);
				}
				tanks = new Array();
			}
			
			if(soliders != null){
				for (index = 0; index < soliders.length; index++) 
				{
					var solider:EnemySolider = EnemySolider(soliders[index]);
					gameElementHolder.removeChild(solider.target);
				}
				
				soliders = new Array();
			}
			
			//reset sentryGun
			if (sentryGuns.length >= 0)
			{
				for (index = 0; index < sentryGuns.length; index++) 
				{
					var sentryGun:SentryGun = SentryGun(sentryGuns[index]);
					gameElementHolder.removeChild(sentryGun.target);
				}
				
				sentryGuns = new Array();
			}
			
			//reset sentryRPG
			if (sentryRPGs.length >= 0)
			{
				for (index = 0; index < sentryRPGs.length; index++) 
				{
					var sentryRPG:SentryRPG = SentryRPG(sentryRPGs[index]);
					gameElementHolder.removeChild(sentryRPG.target);
				}
				
				sentryRPGs = new Array();
			}
			
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
			
			characterJacob.currentCharacterVO = value.characterVOs[1];
			characterStacey.currentCharacterVO = value.characterVOs[0];
			
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