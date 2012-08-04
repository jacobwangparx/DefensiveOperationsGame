package com.twoandtwo.calculator.view.components 
{
	import com.lookmum.util.ModalManager;
	import com.lookmum.view.Overlay;
	import com.lookmum.view.TextComponent;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class BusyPopup extends TextComponent
	{
		private var overlay:Overlay;
		private var textFieldHeading:TextField;
		private var busyIcon:MovieClip;
		private var _heading:String;
		
		public function BusyPopup(target:MovieClip) 
		{
			super(target);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			overlay = new Overlay(target.overlay);
			textFieldHeading = target.textFieldHeading;
			busyIcon = target.busyIcon;
			autoSize = TextFieldAutoSize.LEFT;
			wordWrap = true;
			multiline = true;
		}
		
		override protected function arrangeComponents():void 
		{
			super.arrangeComponents();
			busyIcon.y = textField.y + textField.height + 10;
			bg.height = busyIcon.y + busyIcon.height + 20;
			overlay.update();
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
		
		override public function get width():Number 
		{
			return bg.width;
		}
		
		override public function set width(value:Number):void 
		{
			super.width = value;
		}
		
		override public function get height():Number 
		{
			return bg.height;
		}
		
		override public function set height(value:Number):void 
		{
			super.height = value;
		}
		
	}

}