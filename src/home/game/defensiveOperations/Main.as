package home.game.defensiveOperations{

	
	
	import flash.display.Sprite;
	import flash.display.LoaderInfo;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.Capabilities;
	
	import home.game.defensiveOperations.view.Application;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class Main extends Sprite 
	{
		
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(new Application(new applicationClip()));
		}
		
	}
}