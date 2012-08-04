package com.twoandtwo.calculator.control 
{
	import com.twoandtwo.calculator.event.*;
	import com.twoandtwo.calculator.model.*;
	import com.twoandtwo.calculator.view.*;
	import com.twoandtwo.calculator.service.ApplicationService;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class StartupCommand extends Command
	{
		override public function execute():void
		{
			super.execute();
			
			commandMap.mapEvent(ScreenEvent.NEXT, NextCommand, ScreenEvent, false);
			commandMap.mapEvent(ScreenEvent.BEGIN, BeginCommand, ScreenEvent, true);
			
			/*screentag-command*/
			
			//map model
			injector.mapValue(ScreenProxy, new ScreenProxy());
			injector.mapValue(CalculatorProxy, new CalculatorProxy());
			
			//map view
			mediatorMap.mapView(Application, ApplicationMediator);
			
			mediatorMap.createMediator(contextView);
			//map service
			injector.mapSingletonOf(ApplicationService, ApplicationService );
			
			//map command
			commandMap.mapEvent(ApplicationEvent.LOAD_TEXT, LoadTextCommand, ApplicationEvent, true);
			
			commandMap.mapEvent(ApplicationServiceEvent.LOAD_TEXT, LoadStructureCommand, ApplicationServiceEvent, true);
			commandMap.mapEvent(ApplicationServiceEvent.LOAD_STRUCTURE, SetStructureCommand, ApplicationServiceEvent, true);
			
			commandMap.mapEvent(ScreenEvent.CALCULATORSCREEN, CalculatorScreenCommand, ScreenEvent, false);
			
			commandMap.mapEvent(CalculatorEvent.SET_FIRST_VALUE, SetFirstValueCommand, CalculatorEvent, false);
			commandMap.mapEvent(CalculatorEvent.SET_SECOND_VALUE, SetSecondValueCommand, CalculatorEvent, false);
			commandMap.mapEvent(CalculatorEvent.SET_OPERATOR_VALUE, SetOperatorValueCommand, CalculatorEvent, false);
			
			commandMap.mapEvent( CalculatorEvent.SET_TOTAL_VALUE, SetTotalValueCommand, CalculatorEvent,false);
			
			commandMap.mapEvent( CalculatorEvent.SET_CURRENT_TYPE_VALUE, SetCurrentTypeValueCommand, CalculatorEvent, false);
			
			commandMap.mapEvent( CalculatorEvent.RESET, ResetCommand, CalculatorEvent, false);
			
			//chain command
			dispatch( new ApplicationEvent( ApplicationEvent.LOAD_TEXT));
		}
	}

}