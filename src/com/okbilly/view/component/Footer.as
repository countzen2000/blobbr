package com.okbilly.view.component
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	public class Footer extends Sprite
	{
		[Embed (source="assets/global/footerLogo.png")]
		public var LOGO:Class; //LOGO
		
		private var _width:Number;
		private var _logo:Bitmap;
		private var _ago:EmbeddTextField;
		
		public function Footer(stageWidth:Number)
		{
			super();
			
			_width = stageWidth;
			
			var g:Graphics = this.graphics;
			g.beginFill(0x1e1e1e);
			g.drawRect(0,0, _width, 23);
			g.endFill();
			
			_logo = new LOGO() as Bitmap;
			_logo.x = _width - _logo.width - 8;
			_logo.y = 23/2 - _logo.height/2;
			this.addChild(_logo);
			
			_ago = new EmbeddTextField(FontName.ARIAL, false, 10, 0xb9b9b9);
			_ago.text = "posetd by Elenor 14hrs ago.";
			_ago.x = 6;
			_ago.y = 23/2 - _ago.textHeight/2 -2
			this.addChild(_ago);
			
		}
	}
}