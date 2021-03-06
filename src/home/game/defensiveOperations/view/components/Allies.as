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
	public class Allies extends Component 
	{	 
		protected var attack:int;
		protected var attackSpeed:int;
		protected var currentHealth:int;
		protected var healthMax:int;
	
		protected var index:int;
	
		protected var body:ImageLoadComponent;
		protected var hitspot:MovieClip;
		protected var attackRange:MovieClip;
		protected var healthLine:MovieClip;
		protected var bulletHolder:MovieClip;
		
		public function Allies(target:MovieClip):void
		{
			super(target);
		}
	
			override protected function createChildren():void 
		{
			super.createChildren();
			
			hitspot = target.hitspot;
			hitspot.addEventListener(MouseEvent.ROLL_OVER, onRollOverBody);
			hitspot.addEventListener(MouseEvent.ROLL_OUT, onRollOutBody);
			
			body = new ImageLoadComponent(target.body);
			
			attackRange = target.attackRange;
			attackRange.visible = false;
		
			healthLine = target.healthLine;
			healthLine.visible = false;
			
			bulletHolder = target.bulletHolder;
			
		}
		

		private function onRollOutBody(e:MouseEvent):void 
		{
			attackRange.visible = false;
			healthLine.visible 	= false;	
		}
		
		private function onRollOverBody(e:MouseEvent):void 
		{
			attackRange.visible = true;
			healthLine.visible = false;
		}
		
	}

}