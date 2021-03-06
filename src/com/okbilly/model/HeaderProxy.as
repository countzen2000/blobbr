package com.okbilly.model
{
	import com.okbilly.ApplicationFacade;
	import com.okbilly.model.dto.BlobbDTO;
	import com.okbilly.model.dto.UserDTO;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import org.puremvc.as3.multicore.utilities.startupmanager.interfaces.IStartupProxy;
	
	public class HeaderProxy extends StartUpEntityProxy implements IStartupProxy
	{
		public static const NAME:String = 'headerProxy';
		public static const SRNAME:String = 'SRheaderProxy';
		
		private var _xml:XMLProxy;
		
		public var user:UserDTO;
		
		public function HeaderProxy()
		{
			super(NAME);
		}
		
		public function load():void
		{
			_xml = facade.retrieveProxy(XMLProxy.NAME) as XMLProxy;
			if (_xml.currentBlob != null) {
				user = _xml.currentBlob.user;
			}
			
			this.sendLoadedNotification(ApplicationFacade.HEADER_DATA_LOADED, NAME, SRNAME);
		}
		
		public function reloadUser():void
		{
			if (_xml.currentBlob != null) {
				user = _xml.currentBlob.user;
			}
		}
	}
}