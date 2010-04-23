package com.okbilly.view
{
	import com.okbilly.ApplicationFacade;
	import com.okbilly.model.XMLProxy;
	import com.okbilly.view.component.Footer;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class FooterMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "footerMediator";
		
		private var _xml:XMLProxy;
		
		public function FooterMediator( viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void
		{
			_xml = facade.retrieveProxy(XMLProxy.NAME) as XMLProxy;
		}
		
		override public function listNotificationInterests():Array
		{
			return [ApplicationFacade.STARTUP];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName()) {
				case ApplicationFacade.STARTUP:
					footer.draw(_xml.currentBlob.createAgo, _xml.currentBlob.user.displayName);
					break;
			}
		}
		
		public function get footer():Footer
		{
			return viewComponent as Footer;
		}
	}
}