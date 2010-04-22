package com.okbilly.view
{
	import com.okbilly.ApplicationFacade;
	import com.okbilly.view.component.BlobHolder;
	import com.okbilly.view.component.Footer;
	import com.okbilly.view.component.Header;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.utilities.startupmanager.StartupManager;
	
	public class StageMediator extends Mediator implements IMediator
	{
		static public const NAME:String = "stageMediator";
		
		public function StageMediator(stage:Object)
		{
			super(NAME, stage);
		}
		
		override public function onRegister() : void
		{
			
		}
		
		override public function listNotificationInterests() : Array
		{
			return [
				StartupManager.LOADING_PROGRESS,
				StartupManager.LOADING_COMPLETE
			];
		}
		
		override public function handleNotification( note:INotification ):void
		{
			switch (note.getName()) {
				case StartupManager.LOADING_PROGRESS:
					trace ("loading progress");
					break;
				case StartupManager.LOADING_COMPLETE:
					trace ("Loading Complete");
					initializeSite();					
					break;
				default:
					break;
			}
		}
		
		private function initializeSite():void
		{
			var header:Header = new Header(this.stage.stageWidth);
			facade.registerMediator(new HeaderMediator(header));
			this.stage.addChild(header);

			trace (this.stage.stageHeight);
			
			var blobHold:BlobHolder = new BlobHolder(this.stage.stageWidth, this.stage.stageHeight - (Footer.HEIGHT + Header.HEIGHT));
			facade.registerMediator(new BodyMediator(blobHold));
			blobHold.y = header.y + header.height;
			this.stage.addChild(blobHold);

			var footer:Footer = new Footer(this.stage.stageWidth);
			facade.registerMediator(new FooterMediator(footer));
			this.stage.addChild(footer);
			
			ApplicationFacade.instance.sendNotification(ApplicationFacade.STARTUP);
			footer.y = blobHold.y + blobHold.height;
			
		}
		
		public function redoSite():void
		{
			//Fade Out
			while (this.stage.numChildren > 0) {
				this.stage.removeChildAt(0);
			}
			
			facade.removeMediator(HeaderMediator.NAME);
			var header:Header = new Header(this.stage.stageWidth);
			facade.registerMediator(new HeaderMediator(header));
			this.stage.addChild(header);
			
			facade.removeMediator(BodyMediator.NAME);
			var blobHold:BlobHolder = new BlobHolder(this.stage.stageWidth, this.stage.stageHeight -  (Footer.HEIGHT + Header.HEIGHT));
			facade.registerMediator(new BodyMediator(blobHold));
			blobHold.y = header.y + header.height;
			this.stage.addChild(blobHold);

			facade.removeMediator(FooterMediator.NAME);
			var footer:Footer = new Footer(this.stage.stageWidth);
			facade.registerMediator(new FooterMediator(footer));
			this.stage.addChild(footer);

			
			ApplicationFacade.instance.sendNotification(ApplicationFacade.STARTUP);
			
			footer.y = blobHold.y + blobHold.height;
			
		}
		
		public function get stage():Stage
		{
			return this.viewComponent as Stage;
		}
	}
}