package com.okbilly.model
{
	
	import com.okbilly.ApplicationFacade;
	import com.okbilly.model.dto.BlobbDTO;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import org.puremvc.as3.multicore.utilities.startupmanager.interfaces.IStartupProxy;
	
	public class XMLProxy extends StartUpEntityProxy implements IStartupProxy
	{
		public static const NAME:String = "AssetsProxy";
		public static const SRNAME:String = "AssetsSRProxy";
		
		private var _loader:URLLoader;
		private var _xml:XML;
		
		public var blobbs:Array = []; 
		public var currentBlob:BlobbDTO;
		
		public function XMLProxy()
		{
			super(NAME, null);			
		}
	
		public function load():void
		{
			loadXML();
		}
		
		private function loadXML():void
		{
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, onLoaded, false, 0, true);
			_loader.load(new URLRequest("http://blobbr.com/api/blobbs/include=poll,answers/filter/by=username/admin.xml"));
		}
		
		private function onLoaded(e:Event):void
		{
			_xml = new XML(_loader.data);
			
			for each (var blobb:XML in _xml.blobbs.blobb) {
				blobbs.push(new BlobbDTO(blobb));
			}
			
			currentBlob = blobbs[0];
			
			this.sendLoadedNotification(ApplicationFacade.XML_DATA_LOADED, NAME, SRNAME);
		}
	}
}