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
	public class Character extends Allies
	{	

		private var _currentCharacterVO:CharacterVO;
	 
		
		public function Character(target:MovieClip):void
		{
			super(target);
		}
						
	
		public function get currentCharacterVO():CharacterVO 
		{
			return _currentCharacterVO;
		}
		
		public function set currentCharacterVO(value:CharacterVO):void 
		{
			_currentCharacterVO = value;
			
			var bodyImageUri:String = LevelCharacterVO(value.levelVOs[value.currentLevel]).imageUri;
			body.load(bodyImageUri);
	 
			attack = value.currentAttack;
			attackSpeed = value.currentSpeed;
			attackRange.width = value.currentRange; 
			attackRange.height = value.currentRange;
			
			healthMax = value.currentHealth;
			currentHealth = healthMax;
			healthLine.width = currentHealth / healthMax;
		}
		
	 
	}

}