package home.game.defensiveOperations{
	import home.game.defensiveOperations.view.components.interfaces.IMain;
	import home.game.defensiveOperations.MainContext;
	import flash.display.Sprite;
	import flash.display.LoaderInfo;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.Capabilities;
	
	/**
	 * <p>
	 * Parse data from the preloader and initialise the Robotlegs framework
	 * </p>
	 *
	 * @class Main
	 * @author Jake
	 * @date 
	 * @version 1.0
	 * @see
	 */
	
	public class Main extends Sprite implements IMain{
		
		private var _context:MainContext;
		
		/**
		* Constructor
		*/
		public function Main(){
			if (Capabilities.playerType == "StandAlone"){
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
				init(this.loaderInfo);
			}
		}
		
		/*-----------------------------------------------------------------------------------------
		Public methods
		-------------------------------------------------------------------------------------------*/
		/**
		 * Function to make sure that the main intro start once the preloader is ready.
		 */
		public function init(loaderInfo:LoaderInfo):void {
			//I want to know if I am running this locally for stuff like AMF calls etc
			var local:Boolean = false;
			if (Capabilities.playerType == "StandAlone"){
				local = true;
			}
			//parse the loader info here and give the data to the context so that he can put it in the ApplicationModel
			
			
			_context = new MainContext(this, local);
		}
		
		/*-----------------------------------------------------------------------------------------
		Private methods
		-------------------------------------------------------------------------------------------*/
		
		/*-----------------------------------------------------------------------------------------
		Event Handlers
		-------------------------------------------------------------------------------------------*/		
	}	
}