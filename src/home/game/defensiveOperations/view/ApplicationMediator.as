package com.twoandtwo.calculator.view 
{
	import com.twoandtwo.calculator.event.BusyEvent;
	import com.twoandtwo.calculator.view.screens.CalculatorScreen;
	import com.twoandtwo.calculator.view.screens.CalculatorScreenMediator;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/*screentag-mediator-import*/
	import com.twoandtwo.calculator.event.ScreenEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class ApplicationMediator extends Mediator
	{
		
		[Inject]
		public var application:Application;
		private var pageKeys:Boolean = false;
		
		public function ApplicationMediator() 
		{
			super();
		}
		
		override public function onRegister():void 
		{
			super.onRegister();

			//register child mediators
			mediatorMap.mapView(CalculatorScreen, CalculatorScreenMediator);
			mediatorMap.createMediator(application.calculatorScreen);
			
			/*screentag-mediator-register*/
			if(pageKeys){
				application.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
				if (application.stage) onAddedToStage();
			}
		}
		
		private function onHideBusy(e:BusyEvent):void 
		{
			//application.showBusyPopup = false;
		}
		
		private function onShowBusy(e:BusyEvent):void 
		{
			//application.setBusyHeading(e.busyHeading);
			//application.setBusyText(e.busyText);
			//application.showBusyPopup = true;
		}
		
		private function onAddedToStage(e:Event = null):void 
		{
			application.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			application.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT) {
				dispatch(new ScreenEvent(ScreenEvent.NEXT));
			}
		}
		
	}

}