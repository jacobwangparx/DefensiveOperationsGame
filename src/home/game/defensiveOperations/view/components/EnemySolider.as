package home.game.defensiveOperations.view.components 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.Component;
	import com.lookmum.view.LabelButton;
	import com.lookmum.view.TextComponent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import home.game.defensiveOperations.view.screens.AbstractScreen;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class EnemySolider extends Component
	{	
		private var _soliderVO:SoliderVO;
	 
		public function EnemySolider(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
		 
		}
		
		public function get soliderVO():SoliderVO 
		{
			return _soliderVO;
		}
		
		public function set soliderVO(value:SoliderVO):void 
		{
			_soliderVO = value;
		}
	
						
	}

}