package home.game.defensiveOperations.model {
	import org.robotlegs.mvcs.Actor;	
	/**
	 * <p>
	 * Main model for the application
	 * </p>
	 *
	 * @class ApplicationModel
	 * @author Jake
	 * @date 
	 * @version 1.0
	 * @see
	 */
	
	public class ApplicationModel extends Actor {
		private var _local:Boolean; //if the application is executing locally or on the server
		/**
		* Constructor
		*/
		public function ApplicationModel() {
		}		
		/*-----------------------------------------------------------------------------------------
		Public methods
		-------------------------------------------------------------------------------------------*/
		public function get local():Boolean { return _local;};
		public function set local(value:Boolean):void { _local = value};
		/*-----------------------------------------------------------------------------------------
		Private methods
		-------------------------------------------------------------------------------------------*/
		
		/*-----------------------------------------------------------------------------------------
		Event Handlers
		-------------------------------------------------------------------------------------------*/
    }
	
}