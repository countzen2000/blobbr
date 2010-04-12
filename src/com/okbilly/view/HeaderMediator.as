package com.okbilly.view
{
	import com.okbilly.ApplicationFacade;
	import com.okbilly.model.HeaderProxy;
	import com.okbilly.model.XMLProxy;
	import com.okbilly.view.component.Header;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class HeaderMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "headerMediator";
		
		private var _headProxy:HeaderProxy;
		private var _xmlProxy:XMLProxy;
		
		public function HeaderMediator(header:Header)
		{
			super(NAME, header);
		}
		
		override public function onRegister():void
		{
			_headProxy = facade.retrieveProxy(HeaderProxy.NAME) as HeaderProxy;
			_xmlProxy = facade.retrieveProxy(XMLProxy.NAME) as XMLProxy;
		}
		
		override public function listNotificationInterests():Array
		{
			return [ApplicationFacade.STARTUP];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName()) {
				case ApplicationFacade.STARTUP:
					if (_xmlProxy.currentBlob != null) {
						head.loadUp(_headProxy.user.avatar, _xmlProxy.currentBlob.poll.title);
					}
					break;
			}
		}
		
		public function get head():Header
		{
			return viewComponent as Header;
		}
		
	}
}