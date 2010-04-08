package com.okbilly.view
{
	import com.okbilly.view.component.Header;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class HeaderMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "headerMediator";
		
		public function HeaderMediator(header:Header)
		{
			super(NAME, header);
		}
		
		
	}
}