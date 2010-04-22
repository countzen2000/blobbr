package
{
	import com.okbilly.ApplicationFacade;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class Blobbr extends Sprite
	{
		private var _xmlURL:String = "http://blobbr.com/api/blobbs/include=poll,answers/filter/by=combo/username=elenor/poll=6/username,poll.xml";
		public static var color:Number = 0x68a100;
		public static var avatar:Number = 1;
		
		public function Blobbr()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			
			var paramObj:Object = this.root.loaderInfo.parameters;
			if (paramObj.xmlURL ) {
				_xmlURL == paramObj.xmlURL;
			}
			
			if (paramObj.questionColor) {
				color == paramObj.questionColor;
			}
			
			if (paramObj.avatar) {
				avatar == paramObj.avatar;
			}
			
			var facade:ApplicationFacade = ApplicationFacade.getInstance();
			facade.init( this.stage, _xmlURL );
			
		}
	}
}