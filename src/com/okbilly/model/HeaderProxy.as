package com.okbilly.model
{
	import com.okbilly.ApplicationFacade;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import org.puremvc.as3.multicore.utilities.startupmanager.interfaces.IStartupProxy;
	
	public class HeaderProxy extends StartUpEntityProxy implements IStartupProxy
	{
		public static const NAME:String = 'headerProxy';
		public static const SRNAME:String = 'SRheaderProxy';
		
		public function HeaderProxy()
		{
			super(NAME);
		}
		
		public function load():void
		{
			this.sendLoadedNotification(ApplicationFacade.HEADER_DATA_LOADED, NAME, SRNAME);
			
		}
	}
}