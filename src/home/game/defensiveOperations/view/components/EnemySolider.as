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
	public class EnemySolider extends Enemy
	{			
		private var frame:int;
		private var ySpeed:Number = 0;
		static private const ACC_Y:Number = 0.2;
		static private const MAX_Y:Number = 1;
		static private const MIN_Y:Number = 1;
		 
		
		public function EnemySolider(target:MovieClip):void
		{
			super(target);
		}
	
		override public function transitionIn():void 
		{
			super.transitionIn();
			gotoAndStop("run");
		}
		
		public function tick():void 
		{
			//accelerate
			ySpeed += ACC_Y;
			//limit speed
			if (ySpeed < MIN_Y) ySpeed = MIN_Y;
			if (ySpeed > MAX_Y) ySpeed = MAX_Y;
			//move
			y += ySpeed;			
		}
		
	}

}