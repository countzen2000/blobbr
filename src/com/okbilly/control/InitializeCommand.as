/**
 * This is the first command that runs to initialize the necessary proxies and such.
 * */

package com.okbilly.control
{
	
	import com.okbilly.model.XMLProxy;
	import com.okbilly.view.StageMediator;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.utilities.startupmanager.model.RetryParameters;
	import org.puremvc.as3.multicore.utilities.startupmanager.model.RetryPolicy;
	import org.puremvc.as3.multicore.utilities.startupmanager.model.StartupMonitorProxy;
	import org.puremvc.as3.multicore.utilities.startupmanager.model.StartupResourceProxy;
	
	public class InitializeCommand extends SimpleCommand implements ICommand
	{
		private var _monitor:StartupMonitorProxy;
		
		public function InitializeCommand()
		{
			trace ("Initialize Command!");
		}
		
		override public function execute (note:INotification):void
		{
			var stage:Stage = note.getBody() as Stage;
			//Register Immediate Mediators
			facade.registerMediator(new StageMediator(stage));
			
			//TODO put retryParams in another GLOBAL setting file.
			_monitor = new StartupMonitorProxy();
			_monitor.defaultRetryPolicy = new RetryPolicy(new RetryParameters(3, 5000, 15000));
			facade.registerProxy( _monitor );
			
			//Register all the proxies			
			var assets:XMLProxy = new XMLProxy();
			facade.registerProxy(assets);			
						
			//Register all the startup Proxies			
			var r:StartupResourceProxy = new StartupResourceProxy( XMLProxy.SRNAME, assets );
			facade.registerProxy( r );
			_monitor.addResource( r );
			
			
			_monitor.loadResources();
			
		}
	}
}