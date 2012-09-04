package home.game.defensiveOperations.control 
{
	import home.game.defensiveOperations.event.*;
	import home.game.defensiveOperations.model.*;
	import home.game.defensiveOperations.view.*;
	import home.game.defensiveOperations.service.ApplicationService;
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
			
			commandMap.mapEvent(GameScreenEvent.SET_CURRENT_GAME_SCREEN, SetGameScreenCommand, GameScreenEvent, false);
			commandMap.mapEvent(GameLevelEvent.SET_CURRENT_LEVEL, SetLevelCommand, GameLevelEvent, false);
			commandMap.mapEvent(GameLevelEvent.SET_CURRENT_LEVELSCREEN, SetLevelScreenCommand, GameLevelEvent, false);
			
			
			/*screentag-command*/
			
			//map model
			injector.mapValue(ScreenProxy, new ScreenProxy());
			injector.mapValue(GameScreenProxy, new GameScreenProxy());
			injector.mapValue(GameLevelProxy, new GameLevelProxy());
			
			//map view
			mediatorMap.mapView(Application, ApplicationMediator);
			
			mediatorMap.createMediator(contextView);
			//map service
			injector.mapSingletonOf(ApplicationService, ApplicationService );
			
			//map command
			commandMap.mapEvent(ApplicationEvent.LOAD_TEXT, LoadTextCommand, ApplicationEvent, true);
			
			commandMap.mapEvent(ApplicationServiceEvent.LOAD_TEXT, LoadStructureCommand, ApplicationServiceEvent, true);
			commandMap.mapEvent(ApplicationServiceEvent.LOAD_STRUCTURE, SetStructureCommand, ApplicationServiceEvent, true);
			
			//chain command
			dispatch( new ApplicationEvent( ApplicationEvent.LOAD_TEXT));
		}
	}

}