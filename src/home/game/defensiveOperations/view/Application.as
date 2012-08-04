package com.twoandtwo.calculator.view 
{
	import com.twoandtwo.calculator.ApplicationContext;
	import com.twoandtwo.calculator.view.components.BusyPopup;
	import com.twoandtwo.calculator.view.components.ErrorPopup;
	import com.twoandtwo.calculator.view.screens.CalculatorScreen;
	/*screentag-view-import*/
	import com.lookmum.view.Component;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.ErrorEvent;
	import flash.events.UncaughtErrorEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Phil Douglas
	 */
	public class Application extends Component
	{
		private var context:ApplicationContext;

		public var calculatorScreen:CalculatorScreen;
		
		static private const STAGE_WIDTH:Number = 1000;
		static private const STAGE_HEIGHT:Number = 590;
		
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

			calculatorScreen = new CalculatorScreen(target.calculatorScreen);

			context = new ApplicationContext(this);
		}
		
	}

}