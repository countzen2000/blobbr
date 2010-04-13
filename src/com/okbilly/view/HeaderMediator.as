package com.okbilly.view
{
	import com.okbilly.ApplicationFacade;
	import com.okbilly.model.HeaderProxy;
	import com.okbilly.model.XMLProxy;
	import com.okbilly.view.component.Header;
	
	import flash.events.Event;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class HeaderMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "headerMediator";
		
		public static const NEXT:String = "nextClicked";
		public static const PREVIOUS:String = "previousClicked";
		
		private var _headProxy:HeaderProxy;
		private var _xmlProxy:XMLProxy;
		
		public function HeaderMediator(header:Header)
		{
			super(NAME, header);
			head.addEventListener(NEXT, onNext);
			head.addEventListener(PREVIOUS, onPrevious);
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
		private function onNext(e:Event):void
		{
			trace ('next');
			_xmlProxy.changeCurrentBlob(1);
		}
		
		private function onPrevious(e:Event):void
		{
			trace ('previous');
			_xmlProxy.changeCurrentBlob(-1);
		}
			
	}
}