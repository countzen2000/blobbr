package com.okbilly.model
{
	import com.okbilly.ApplicationFacade;
	import com.okbilly.model.dto.BlobbDTO;
	import com.okbilly.model.dto.UserDTO;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import org.puremvc.as3.multicore.utilities.startupmanager.interfaces.IStartupProxy;
	
	public class QAProxy extends StartUpEntityProxy implements IStartupProxy
	{
		public static const NAME:String = 'QAProxy';
		public static const SRNAME:String = 'SRQAProxy';
		
		private var _xml:XMLProxy;
		
		public var user:UserDTO;
		
		public function QAProxy()
		{
			super(NAME);
		}
		
		public function load():void
		{
		
			
			this.sendLoadedNotification(ApplicationFacade.HEADER_DATA_LOADED, NAME, SRNAME);
		}
	}
}