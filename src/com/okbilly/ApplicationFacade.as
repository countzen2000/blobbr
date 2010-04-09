package com.okbilly
{
	import com.okbilly.control.InitializeCommand;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.startupmanager.controller.StartupResourceLoadedCommand;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		//Key for Modules
		public var KEY:String = "MainFacade";
		
		//Notification Names
		public static const INIT:String = "initializeApp";
		
		//StartupManager
		public static const HEADER_DATA_LOADED:String = "headerDataLoaded";
		public static const XML_DATA_LOADED:String = "xmlDataLoaded";
		public static const STARTUP:String = "startup";
		
		public static var instance:ApplicationFacade;
		
		public function ApplicationFacade()
		{
			super(KEY);
		}
		
		public static function getInstance(): ApplicationFacade
		{
			if (instance == null)
			{
				instance = new ApplicationFacade();
			}
			
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(INIT, InitializeCommand);
			
			//For startup Sequence--Startup Manager
			registerCommand(XML_DATA_LOADED, StartupResourceLoadedCommand);
			registerCommand(HEADER_DATA_LOADED, StartupResourceLoadedCommand);
		}
		
		public function init( stage:Object ):void
		{
			sendNotification( INIT, stage );
		}
	}
}