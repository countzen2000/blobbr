package com.okbilly.control
{
	import com.okbilly.model.HeaderProxy;
	import com.okbilly.view.StageMediator;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ReloadCommand extends SimpleCommand implements ICommand
	{
		public function ReloadCommand()
		{
			super();
		}
		
		override public function execute(note:INotification):void
		{
			var _head:HeaderProxy = facade.retrieveProxy(HeaderProxy.NAME) as HeaderProxy;
			_head.reloadUser();
			
			var _stage:StageMediator = facade.retrieveMediator(StageMediator.NAME) as StageMediator;
			_stage.redoSite();
		}
		
	}
}