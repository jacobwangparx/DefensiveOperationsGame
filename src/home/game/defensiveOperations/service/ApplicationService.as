package home.game.defensiveOperations.service 
{
	import home.game.defensiveOperations.event.ApplicationServiceEvent;
	import home.game.defensiveOperations.vo.StructureVO;
	import com.lookmum.events.TextManagerEvent;
	import com.lookmum.util.TextManager;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class ApplicationService extends Actor
	{
		private var loader:URLLoader;
		private var textManager:TextManager;
		public function ApplicationService() 
		{
			super();
			
		}
		public function loadText():void 
		{
			TextManager.debug = true;
			TextManager.throwEmptyIDError = true;
			textManager = TextManager.getInstance();
			textManager.loadText('xml/text.xml');
			textManager.addEventListener(TextManagerEvent.LOAD, onLoadText);
		}
		
		private function onLoadText(e:TextManagerEvent):void 
		{
			dispatch(new ApplicationServiceEvent(ApplicationServiceEvent.LOAD_TEXT));
		}
		public function loadStructure():void
		{
			loader = new URLLoader(new URLRequest('xml/structure.xml'));
			loader.addEventListener(Event.COMPLETE, onLoadStructure);
		}
		
		private function onLoadStructure(e:Event):void 
		{
			dispatch(new ApplicationServiceEvent(ApplicationServiceEvent.LOAD_STRUCTURE, StructureVO.fromXML(new XML(loader.data))));
		}
	}

}