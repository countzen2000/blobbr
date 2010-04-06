package
{
	
	import com.okBilly.ApplicationFacade;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class Blobbr extends Sprite
	{
		public function Blobbr()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var facade:ApplicationFacade= ApplicationFacade.getInstance();
			facade.init( this.stage );
		}
	}
}