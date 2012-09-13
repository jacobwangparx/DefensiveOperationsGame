package home.game.defensiveOperations.view.components 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.Component;
	import com.lookmum.view.ImageButton;
	import com.lookmum.view.LabelButton;
	import com.lookmum.view.TextComponent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Dictionary;
	import org.osflash.signals.Signal;
	import home.game.defensiveOperations.vo.*;
	
	/**
	 * ...
	 * @author Jake
	 */
	public class GameEnemyHolder extends Component
	{	
	 
		private var holder:MovieClip;
		private var solider:EnemySolider;
		
		private var _currentGameScreenVO:GameScreenVO;
	 
		public function GameEnemyHolder(target:MovieClip):void
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			trace("enemyHolder");
			super.createChildren();
			holder = target.holder;
			solider = new EnemySolider(new soliderClip());
			solider.transitionIn();
			holder.addChild(solider);
		}
		
		public function get currentGameScreenVO():GameScreenVO 
		{
			return _currentGameScreenVO;
		}
		
		public function set currentGameScreenVO(value:GameScreenVO):void 
		{
			_currentGameScreenVO = value;
		}
		
	 
						
	}

}