package  
{
	import com.greensock.TweenMax;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Andrew Catchaturyan
	 */
	[SWF(width="1000", height="590", frameRate="25")]
	public class Preloader extends Sprite
	{
		private var loader:Loader;
		private var loaderGraphic:MovieClip;
		static private const STAGE_WIDTH:Number = 1000;
		static private const STAGE_HEIGHT:Number = 590;
		
		public function Preloader() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			loaderGraphic= new loaderClip();
			addChild(loaderGraphic);
			
			loaderGraphic.textField.text = "0%";
			if (loaderGraphic.fill)
				loaderGraphic.fill.scaleX = 0;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest("main.swf"));
		}
		
		private function onAdded(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.RESIZE, onResize)
			onResize(null);
		}
		
		private function onResize(e:Event):void 
		{
			if (loaderGraphic)
			{
				loaderGraphic.x = (STAGE_WIDTH - loaderGraphic.width) * 0.5;
				loaderGraphic.y = (STAGE_HEIGHT - loaderGraphic.height) * 0.5;
			}
		}
		
		private function onComplete(e:Event):void 
		{
			//trace( "Preloader.onComplete > e : " + e );
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			
			loaderGraphic.textField.text = "100%";
			if (loaderGraphic.fill)
				loaderGraphic.fill.scaleX = 1;
			/* 
			 * You can tweak the length of time the preloader takes to fade down here.
			 * Or you can add a custom animation
			 */ 
			TweenMax.to(loaderGraphic, 1, { alpha:0, onComplete:onLoadComplete } );
		}
		
		// Callback function where loader is added to the display list
		private function onLoadComplete():void
		{
			addChild(loader);
		}
		
		private function onProgress(e:ProgressEvent):void 
		{
			/*
			 * If your preloader design/view requires percentage output, use below var
			 */ 
			var percent:int = int(Math.ceil(e.bytesLoaded / e.bytesTotal * 100));
			loaderGraphic.textField.text = percent + "%";
			if (loaderGraphic.fill)
				loaderGraphic.fill.scaleX = percent / 100;
			//trace( "Preloader.onProgress > percent : " + percent );
		}
		
		private function onIOError(e:IOErrorEvent):void 
		{
			trace( "Preloader.onIOError > e : " + e );
		}
		

	}

}