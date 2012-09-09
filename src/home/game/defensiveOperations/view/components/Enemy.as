package home.game.defensiveOperations.view.components 
{
	import com.lookmum.view.AdvancedTextField;
	import com.lookmum.view.Button;
	import com.lookmum.view.Component;
	import com.lookmum.view.ImageButton;
	import com.lookmum.view.ImageLoadComponent;
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
	public class Enemy extends GameElement
	{	
		private static const MOVE_SPEED:int = 10;
		
		private var _enemyVO:EnemyVO;
		
		public function Enemy(target:MovieClip):void
		{
			super(target);
		}
			
		public function get enemyVO():EnemyVO 
		{
			return _enemyVO;
		}
		
		public function set enemyVO(value:EnemyVO):void 
		{
			_enemyVO = value;
			
			attack = value.attack;
			attackSpeed = value.speed;
			attackRange.width = value.range; 
			attackRange.height = value.range; 
			
			healthMax = value.healthMax;
			currentHealth = healthMax;
			healthLine.width = currentHealth / healthMax;
			
		}
	}

}