package home.game.defensiveOperations.view 
{
	import home.game.defensiveOperations.ApplicationContext;
	import home.game.defensiveOperations.enum.ScreenSets;
	import home.game.defensiveOperations.view.components.BusyPopup;
	import home.game.defensiveOperations.view.components.ErrorPopup;
	import home.game.defensiveOperations.view.screens.*;
	
	/*screentag-view-import*/
	import com.lookmum.view.Component;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.ErrorEvent;
	//import flash.events.UncaughtErrorEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Phil Douglas
	 */
	public class Application extends Component
	{
		private var context:ApplicationContext;

		public var menuScreen:MenuScreen;
		public var shopScreen:ShopScreen;
		public var creditsScreen:CreditsScreen;
		public var levelScreen:LevelScreen;
		public var gameScreen:GameScreen;
		//public var helpScreen:HelpScreen;
		
		static private const STAGE_WIDTH:Number = ScreenSets.SCREEN_WIDTH;
		static private const STAGE_HEIGHT:Number = ScreenSets.SCREEN_HEIGHT;
		
		public function Application(target:MovieClip) 
		{
			super(target);
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			if (stage) onAdded();
			var fonts:fontEmbeds;
			tabEnabled = false;
			tabChildren = false;
		}
		
		private function onAdded(e:Event = null):void 
		{	
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, onResize)
			onResize(null);
		}
		
		private function onResize(e:Event = null):void 
		{

		}
		
		override protected function createChildren():void 
		{
			super.createChildren();

			menuScreen = new MenuScreen(new menuScreenClip());
			shopScreen = new ShopScreen(new shopScreenClip());
			creditsScreen = new CreditsScreen(new creditsScreenClip());
			levelScreen = new LevelScreen(new levelScreenClip());
			gameScreen = new GameScreen(new gameScreenClip());
			//helpScreen = new HelpScreen(new helpScreenClip());
			
			addChild(menuScreen);
			addChild(gameScreen);
			addChild(shopScreen);
			addChild(creditsScreen);
			addChild(levelScreen);
			//addChild(helpScreen);
			
			context = new ApplicationContext(this);
		}
		
	}

}