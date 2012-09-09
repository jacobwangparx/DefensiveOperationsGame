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
	public class SentryGun extends SupportUnit
	{	
		
		private var _sentryGunVO:SentryGunVO;
		
		public function SentryGun(target:MovieClip):void
		{
			super(target);
		}
		
		public function get sentryGunVO():SentryGunVO 
		{
			return _sentryGunVO;
		}
		
		public function set sentryGunVO(value:SentryGunVO):void 
		{
			_sentryGunVO = value;
			
			body.load(value.bodyImageUri);
	
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