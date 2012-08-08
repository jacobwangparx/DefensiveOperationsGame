package home.game.defensiveOperations.view.screens 
{
	import com.lookmum.view.LabelButton;
	import home.game.defensiveOperations.event.ScreenEvent;
	import com.lookmum.util.TextManager;
	import com.lookmum.view.Button;
	import com.lookmum.view.Component;
	import com.lookmum.view.TextComponent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class AbstractScreen extends Component 
	{
		protected var buttonNext:Button;
		protected var buttonBack:LabelButton;
		protected var screenTitle:TextComponent;
		public var next:Signal;
		protected var nextScreen:String = ScreenEvent.NEXT;
		
		public function AbstractScreen(target:MovieClip) 
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			visible = false;
			next = new Signal();
			if (target.buttonNext)
			{
				buttonNext = new Button(target.buttonNext);
				buttonNext.addEventListener(MouseEvent.CLICK, onClickNext);
			}
			if (target.screenTitle)
			{
				screenTitle = new TextComponent(target.screenTitle);
				screenTitle.autoSize = TextFieldAutoSize.LEFT;
			}
			if (target.buttonBack)
			{
				buttonBack = new LabelButton(target.buttonBack);
				buttonBack.addEventListener(MouseEvent.CLICK, onClickBack); 
				addChild(buttonBack);
				
			}
		}
		
		private function onClickBack(e:MouseEvent):void 
		{
			var screenEvent:ScreenEvent = new ScreenEvent(ScreenEvent.MENUSCREEN);
			dispatchEvent(screenEvent);
		}
		
		protected function onClickNext(e:MouseEvent):void 
		{
			transitionOut();
		}
		
		public function transitionIn():void
		{
			if (!visible) visible = true;
		}
		
		public function transitionOut():void
		{
			onTransitionOut();
		}
		
		protected function onTransitionOut():void
		{
			if (visible) 
				visible = false;
			next.dispatch(nextScreen);
		}
	}

}