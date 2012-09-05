package home.game.defensiveOperations.model 
{
	import home.game.defensiveOperations.event.GameScreenEvent;
	import home.game.defensiveOperations.event.ScreenEvent;
	import home.game.defensiveOperations.vo.CharacterVO;
	import home.game.defensiveOperations.vo.GameScreenVO;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Jacob
	 */
	public class GameScreenProxy extends Actor
	{
	
		private var _currentGameScreenVO:GameScreenVO;
		private var _btrVOs:Array;
		private var _tankVOs:Array;
		private var _soliderVOs:Array;
		
		private var _characterJacobVO:CharacterVO;
		private var _characterStaceyVO:CharacterVO;
		
		public function GameScreenProxy() 
		{
			super();
		}
		
		public function get currentGameScreenVO():GameScreenVO 
		{
			return _currentGameScreenVO;
		}
		
		public function set currentGameScreenVO(value:GameScreenVO):void 
		{
			_currentGameScreenVO = value;
			
			var gameScreenEvent:GameScreenEvent = new GameScreenEvent(GameScreenEvent.CHANGE_CURRENT_GAME_SCREEN);
			gameScreenEvent.currentGameScreenVO = value;
			dispatch(gameScreenEvent);
		}
		
		public function get btrVOs():Array 
		{
			return _btrVOs;
		}
		
		public function set btrVOs(value:Array):void 
		{
			_btrVOs = value;
		}
		
		public function get tankVOs():Array 
		{
			return _tankVOs;
		}
		
		public function set tankVOs(value:Array):void 
		{
			_tankVOs = value;
		}
		
		public function get characterJacobVO():CharacterVO 
		{
			return _characterJacobVO;
		}
		
		public function set characterJacobVO(value:CharacterVO):void 
		{
			_characterJacobVO = value;
		}
		
		public function get soliderVOs():Array 
		{
			return _soliderVOs;
		}
		
		public function set soliderVOs(value:Array):void 
		{
			_soliderVOs = value;
		}
		
		public function get characterStaceyVO():CharacterVO 
		{
			return _characterStaceyVO;
		}
		
		public function set characterStaceyVO(value:CharacterVO):void 
		{
			_characterStaceyVO = value;
		}
	}

}