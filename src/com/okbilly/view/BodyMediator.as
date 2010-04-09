package com.okbilly.view
{
	import com.okbilly.ApplicationFacade;
	import com.okbilly.model.HeaderProxy;
	import com.okbilly.model.XMLProxy;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class BodyMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "bodyMediator";
		
		private var _headProxy:HeaderProxy;
		private var _xmlProxy:XMLProxy;
		
		public function BodyMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
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
					
					break;
			}
		}
	}
}