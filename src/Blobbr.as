package
{
	import com.okbilly.ApplicationFacade;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class Blobbr extends Sprite
	{
		private var _xmlURL:String = "http://blobbr.com/api/blobbs/include=poll,answers/filter/by=username/elenor.xml";
		public static var color:Number = 0x68a100;
		public static var avatar:Number = 0;
		
		public function Blobbr()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var paramObj:Object = this.root.loaderInfo.parameters;
			if (paramObj == null || paramObj.xmlURL == "" || paramObj.xmlURL == null) {
				//do nothing
			} else {
				_xmlURL == paramObj.xmlURL;
			}
			
			if (paramObj == null || paramObj.questionColor == "" || paramObj.questionColor == null) {
				//do nothing
			} else {
				color == paramObj.questionColor;
			}
			
			if (paramObj == null || paramObj.avatar == "" || paramObj.avatar == null) {
				//do nothing
			} else {
				avatar == paramObj.avatar;
			}
			
			var facade:ApplicationFacade = ApplicationFacade.getInstance();
			facade.init( this.stage, _xmlURL );
			
		}
	}
}