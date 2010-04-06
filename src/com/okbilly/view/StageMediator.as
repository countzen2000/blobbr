package com.socialvibe.view
{
	import com.okbilly.ApplicationFacade;
	
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
			ApplicationFacade.instance.sendNotification(ApplicationFacade.STARTUP);
		}
		
		public function get stage():Stage
		{
			return this.viewComponent as Stage;
		}
	}
}