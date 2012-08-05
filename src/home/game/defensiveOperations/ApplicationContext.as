package home.game.defensiveOperations 
{
	import home.game.defensiveOperations.control.StartupCommand;
	import home.game.defensiveOperations.event.ApplicationEvent;
	import home.game.defensiveOperations.service.ApplicationService;
	import home.game.defensiveOperations.view.Application;
	import home.game.defensiveOperations.view.ApplicationMediator;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	/**
	 * ...
	 * @author Jacob
	 */
	
	public class ApplicationContext extends Context
	{
		
		public function ApplicationContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) 
		{
			super(contextView, autoStartup);
			
		}
		override public function startup():void
		{
			//map commands
			commandMap.mapEvent( ContextEvent.STARTUP, StartupCommand, ContextEvent, true );
			//start the app
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
	}

}