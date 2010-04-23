package com.okbilly.view.component
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Footer extends Sprite
	{
		[Embed (source="assets/global/footerLogo.png")]
		public var LOGO:Class; //LOGO
		
		private var _width:Number;
		private var _logo:Sprite;
		private var _ago:EmbeddTextField;
		
		public static const HEIGHT:Number = 23;
		
		public function Footer(stageWidth:Number)
		{
			super();
			
			_width = stageWidth;
			
			var g:Graphics = this.graphics;
			g.beginFill(0x1e1e1e);
			g.drawRect(0,0, _width, HEIGHT);
			g.endFill();
			g.moveTo(0, 0);
			g.lineStyle(1, 0xFFFFFF);
			g.lineTo(_width, 0);
		
			_logo = new Sprite();
			_logo.addChild(new LOGO() as Bitmap);
			_logo.useHandCursor = _logo.buttonMode = true;
			_logo.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
			_logo.x = _width - _logo.width - 8;
			_logo.y = HEIGHT/2 - _logo.height/2;
			this.addChild(_logo);
			
			
		}
		
		public function draw(ago:String, name:String):void
		{
			_ago = new EmbeddTextField(FontName.ARIAL, false, 10, 0xb9b9b9);
			_ago.text = "blobbed by "+name+" "+ago;
			_ago.x = 6;
			_ago.y = HEIGHT/2 - _ago.textHeight/2 -2
			this.addChild(_ago);
		}
		
		private function onClick(e:Event):void
		{
			navigateToURL(new URLRequest(Blobbr.CLICK_URL), "_blank");
		}
	}
}