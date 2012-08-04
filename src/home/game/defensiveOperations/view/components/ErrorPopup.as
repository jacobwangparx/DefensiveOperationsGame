package home.game.defensiveOperations.view.components 
{
	import com.lookmum.events.ComponentEvent;
	import com.lookmum.util.ModalManager;
	import com.lookmum.util.ScrollBarManager;
	import com.lookmum.view.Button;
	import com.lookmum.view.Overlay;
	import com.lookmum.view.ScrollBar;
	import com.lookmum.view.TextComponent;
	import com.lookmum.view.ToggleButton;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Phil Douglas
	 */
	public class ErrorPopup extends TextComponent 
	{
		private var _debugInfo:String;
		private var _heading:String;
		private var buttonClose:Button;
		private var buttonDebug:ToggleButton;
		private var textFieldHeading:TextField;
		private var textFieldDebug:TextField;
		private var scrollbar:ScrollBar;
		static private const MARGIN:Number = 10;
		private var scrollbarManager:ScrollBarManager;
		private var overlay:Overlay;
		public function ErrorPopup(target:MovieClip) 
		{
			super(target);
			
		}
		override protected function createChildren():void 
		{
			super.createChildren();
			overlay = new Overlay(target.overlay);
			buttonClose = new Button(target.buttonClose);
			buttonDebug = new ToggleButton(target.buttonDebug);
			buttonClose.addEventListener(MouseEvent.CLICK, onClickClose);
			buttonDebug.addEventListener(MouseEvent.CLICK, onClickDebug);
			buttonClose.enabled = false;
			buttonDebug.enabled = false;
			ModalManager.getInstance().deactivate();
			buttonClose.enabled = true;
			textFieldHeading = target.textFieldHeading;
			textFieldDebug = target.textFieldDebug;
			textFieldDebug.visible = false;
			buttonDebug.visible = false;
			scrollbar = new ScrollBar(target.scrollbar);
			scrollbarManager = new ScrollBarManager(scrollbar);
			scrollbarManager.associateTextFieldScroll(textFieldDebug);
			scrollbar.visible = false;
			bg = target.bg;
			autoSize = TextFieldAutoSize.LEFT;
			wordWrap = true;
			multiline = true;
		}
		override protected function arrangeComponents():void 
		{
			super.arrangeComponents();
			buttonDebug.y = textField.y + textField.height + MARGIN;
			textFieldDebug.y = buttonDebug.y + buttonDebug.height + MARGIN;
			scrollbar.y = textFieldDebug.y;
			buttonDebug.visible = debugInfo != null;
			if (textFieldDebug.visible) {
				bg.height = textFieldDebug.y + textFieldDebug.height + MARGIN;
			}else if (buttonDebug.visible) {
				bg.height = buttonDebug.y + buttonDebug.height + MARGIN;
			}else{
				bg.height = textField.y + textField.height + MARGIN;
			}
			overlay.update();
		}
		
		private function onClickDebug(e:MouseEvent):void 
		{
			textFieldDebug.visible = buttonDebug.toggle;
			scrollbar.visible = buttonDebug.toggle;
			arrangeComponents();
		}
		
		private function onClickClose(e:MouseEvent):void 
		{
			ModalManager.getInstance().activate();
			destroy();
		}
		
		public function get debugInfo():String 
		{
			return _debugInfo;
		}
		
		public function set debugInfo(value:String):void 
		{
			_debugInfo = value;
			textFieldDebug.text = value;
			arrangeComponents();
			if (value != null && visible) buttonDebug.enabled = true;
			scrollbarManager.calculateScroll();
		}
		override public function get htmlText():String 
		{
			return super.htmlText;
		}
		
		override public function set htmlText(value:String):void 
		{
			super.htmlText = value;
			arrangeComponents();
		}
		override public function get text():String 
		{
			return super.text;
		}
		
		override public function set text(value:String):void 
		{
			super.text = value;
			arrangeComponents();
		}
		
		public function get heading():String 
		{
			return _heading;
		}
		
		public function set heading(value:String):void 
		{
			_heading = value;
			textFieldHeading.text = value;
			arrangeComponents();
		}
		override public function get height():Number 
		{
			return bg.height;
		}
		
		override public function set height(value:Number):void 
		{
			super.height = value;
		}
		override public function get width():Number 
		{
			return bg.width;
		}
		
		override public function set width(value:Number):void 
		{
			super.width = value;
		}
		
	}

}