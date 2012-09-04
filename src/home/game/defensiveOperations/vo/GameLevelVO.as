package home.game.defensiveOperations.vo 
{
	import adobe.utils.CustomActions;
	import com.lookmum.util.TextManager;
	import home.game.defensiveOperations.event.ScreenEvent;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameLevelVO 
	{	
		public var index:int;
		public var stepTotal:int;
		
		public var stepVOs:Array;
		
		public static function fromXML(xml:XML):GameLevelVO 
		{
			var vo:GameLevelVO = new GameLevelVO();
			vo.index = xml.@index;
			vo.stepTotal = xml.@stepTotal;
			vo.stepVOs = new Array();
			
			var counter:int = 0;
			for each (var stepXML:XML in xml.steps.step) 
			{
				var stepLevelVO:GameStepVO = GameStepVO.fromXML(stepXML);
				stepLevelVO.index = counter;
				vo.stepVOs.push(stepLevelVO);
				
				counter ++;
			}
			return vo;
		}
		
	}

}