package home.game.defensiveOperations.model
{

	import home.game.defensiveOperations.event.DebugEvent;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Jacob
	 */
	public class DebugProxy extends Actor
	{
		
		public function DebugProxy() 
		{
			super();
		}
		
		private var _isDebug: Boolean = false;
		
		public function set isDebug(value: Boolean):void
		{
			var debugEvent:DebugEvent = new DebugEvent(DebugEvent.CHANGE_IS_DEBUG);
			debugEvent.isDebug = value;
			dispatch(debugEvent);	
		}
		
		public function get isDebug():Boolean 
		{
			return _isDebug;
		}
	}

}