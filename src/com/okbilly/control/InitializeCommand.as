/**
 * This is the first command that runs to initialize the necessary proxies and such.
 * */

package com.okbilly.control
{

	
	import com.socialvibe.model.GraphDataProxy;
	import com.socialvibe.model.MetricProxy;
	import com.socialvibe.model.NameDataProxy;
	import com.socialvibe.model.StatsDataProxy;
	import com.socialvibe.view.StageMediator;
	
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
			var stats:StatsDataProxy = new StatsDataProxy();
			facade.registerProxy(stats);			
			var graphDataProxy:GraphDataProxy = new GraphDataProxy();
			facade.registerProxy(graphDataProxy);
			var nameDataProxy:NameDataProxy = new NameDataProxy();
			facade.registerProxy(nameDataProxy);
			var metric:MetricProxy = new MetricProxy();
			facade.registerProxy(metric);
			
			//Register all the startup Proxies			
			var r:StartupResourceProxy = new StartupResourceProxy( StatsDataProxy.SRNAME, stats );
			facade.registerProxy( r );
			_monitor.addResource( r );
			
			var r2:StartupResourceProxy = new StartupResourceProxy( GraphDataProxy.SRNAME, graphDataProxy);
			facade.registerProxy( r2 );
			_monitor.addResource( r2 );
			
			var r3:StartupResourceProxy = new StartupResourceProxy( NameDataProxy.SRNAME, nameDataProxy);
			facade.registerProxy( r3 );
			_monitor.addResource( r3 );
			
			r3.requires = [r2];
			r.requires = [r2, r3];
			
			
			_monitor.loadResources();
			
		}
	}
}