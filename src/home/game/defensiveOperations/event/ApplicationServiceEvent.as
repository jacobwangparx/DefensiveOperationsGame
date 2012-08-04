package com.twoandtwo.calculator.event 
{
	import com.twoandtwo.calculator.vo.StructureVO
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class ApplicationServiceEvent extends Event 
	{
		public static const LOAD_STRUCTURE:String = "LOAD_STRUCTURE";
		public static const LOAD_TEXT:String = "LOAD_TEXT";
		public var structure:StructureVO;
		
		public function ApplicationServiceEvent(type:String, structure:StructureVO = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this.structure = structure;
		} 
		
		public override function clone():Event 
		{ 
			return new ApplicationServiceEvent(type, structure, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ApplicationServiceEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}