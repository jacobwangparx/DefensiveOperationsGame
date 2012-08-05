package  home.game.defensiveOperations{	
	import home.game.defensiveOperations.model.ApplicationModel;
	import home.game.defensiveOperations.controller.CreateModelsCommand;
	import home.game.defensiveOperations.controller.CreateMediatorsCommand;
	
	import flash.display.LoaderInfo;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	/**
	 * <p>
	 * Main context for the application
	 * </p>
	 *
	 * @class MainContext
	 * @author Jake
	 * @date 
	 * @version 1.0
	 * @see
	 */
	
	public class MainContext extends Context {
		private var _local:Boolean;
		/**
		* Constructor
		*/
		public function MainContext(contextView:DisplayObjectContainer, local:Boolean) {
			_local = local;
			super(contextView);
		}		
		/*-----------------------------------------------------------------------------------------
		Public methods
		-------------------------------------------------------------------------------------------*/
		override public function startup():void{
			
			injector.mapSingleton(ApplicationModel);
			var appModel:ApplicationModel = injector.instantiate(ApplicationModel);
			appModel.local = _local;
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CreateModelsCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CreateMediatorsCommand, ContextEvent, true);
			
			super.startup();
		}
		/*-----------------------------------------------------------------------------------------
		Private methods
		-------------------------------------------------------------------------------------------*/
		
		/*-----------------------------------------------------------------------------------------
		Event Handlers
		-------------------------------------------------------------------------------------------*/
    }
	
}