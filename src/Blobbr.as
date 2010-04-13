package
{
	import com.okbilly.ApplicationFacade;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class Blobbr extends Sprite
	{
		private var _xmlURL:String = "http://blobbr.com/api/blobbs/include=poll,answers/filter/by=username/elenor.xml";
		
		public function Blobbr()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var paramObj:Object = this.root.loaderInfo.parameters;
			if (paramObj == null || paramObj.xmlURL == "" || paramObj.xmlURL == null) {
				//do nithing
			} else {
				_xmlURL == paramObj.xmlURL;
			}
			
			var facade:ApplicationFacade = ApplicationFacade.getInstance();
			facade.init( this.stage, _xmlURL );
			
		}
	}
}