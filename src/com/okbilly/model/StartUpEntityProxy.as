/** 
 * This is copied from the example of startupManager for using 
 * */ 

package com.okbilly.model
{
	
	import com.okbilly.ApplicationFacade;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import org.puremvc.as3.multicore.utilities.startupmanager.model.StartupResourceProxy;
	
	public class StartUpEntityProxy extends Proxy implements IProxy
	{
		public function StartUpEntityProxy(name:String = null, data:Object = null)
		{
			super(name, data);
		}
		
		protected function sendLoadedNotification( noteName:String, noteBody:String, srName:String ):void
		{
			var srProxy:StartupResourceProxy = ApplicationFacade.getInstance().retrieveProxy( srName ) as StartupResourceProxy;
			if ( ! srProxy.isTimedOut() )
			{
				sendNotification( noteName, noteBody);
			}
		}
	}
}