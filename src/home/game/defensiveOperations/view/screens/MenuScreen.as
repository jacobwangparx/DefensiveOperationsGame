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
	import home.game.defensiveOperations.event.MenuScreenEvent;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class MenuScreen extends AbstractScreen
	{
		private static const Y_OFFSET:Number = 10;
		//private static const MENU_BUTTONS_Y_START:Number = 242;
		//private static const NENU_BUTTONS_X:Number = 37;
		
		private var _menuScreenVO:MenuScreenVO;
		
		private var textHeading:TextField;
		private var menuButtons:Array;
		private var panelMenu:MovieClip;
		private var bg:MovieClip;
		
		public var signalClickStartGame:Signal;
		public var signalClickSelectLevel:Signal;
		public var signalClickCredits:Signal;
		public var signalClickHelp:Signal;
		public var signalClickExit:Signal;
		
		public function MenuScreen(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			
			super.createChildren();
			
			textHeading = target.textHeading;
			textHeading.mouseEnabled = false;
			textHeading.autoSize = TextFieldAutoSize.RIGHT;
			
			menuButtons = new Array();
			panelMenu = target.panelMenu;
			bg = target.bg;
			
			signalClickStartGame = new Signal();
			signalClickSelectLevel = new Signal();
			signalClickCredits = new Signal();
			signalClickHelp = new Signal();
			signalClickExit = new Signal();
		}
			
		public function get menuScreenVO():MenuScreenVO 
		{
			return _menuScreenVO;
		}
		
		public function set menuScreenVO(value:MenuScreenVO):void 
		{
			_menuScreenVO = value;
			
			textHeading.htmlText = value.textHeading;
			
			//var currentY:Number = MENU_BUTTONS_Y_START;
			//var currentX:Number = NENU_BUTTONS_X;
			
			for (var i:int = 0; i < 5; i++) 
			{
				var button:LabelButton = new LabelButton(target['button' + i]);
				//button.x = currentX;
				//button.y = currentY;
				
				switch (i) 
				{
					case 0:
						button.htmlText = value.textStartGame;
						button.addEventListener(MouseEvent.CLICK, onClickButtonStartGame);
					break;
							
					case 1:
						button.htmlText = value.textSelectLevel;
						button.addEventListener(MouseEvent.CLICK, onClickButtoSelectLevel);
					break;
					
					case 2:
						button.htmlText = value.textCredits;
						button.addEventListener(MouseEvent.CLICK, onClickButtonCredits);
					break;
					
					case 3:
						button.htmlText = value.textHelp;
						button.addEventListener(MouseEvent.CLICK, onClickButtonHelp);
					break;
					
					case 4:
						button.htmlText = value.textExit;
						button.addEventListener(MouseEvent.CLICK, onClickButtonExit);
					break;
					
					
					default: button.htmlText = '';
				}
				
				
				menuButtons.push(button);
				addChild(button);
				//currentY += button.height + Y_OFFSET;
			}
			
 
			
		}
		
		private function onClickButtonExit(e:MouseEvent):void 
		{
			signalClickExit.dispatch();
		}
		
		private function onClickButtonHelp(e:MouseEvent):void 
		{
			signalClickHelp.dispatch();
		}
		
		private function onClickButtonCredits(e:MouseEvent):void 
		{
			signalClickCredits.dispatch();
		}
		
		private function onClickButtoSelectLevel(e:MouseEvent):void 
		{
			signalClickSelectLevel.dispatch();
		}
		
		private function onClickButtonStartGame(e:MouseEvent):void 
		{
			signalClickStartGame.dispatch();
		}
		
		
		
	}

}