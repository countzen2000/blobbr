package com.okbilly.view.component
{
	import com.greensock.TweenLite;
	import com.okbilly.view.HeaderMediator;
	
	import flash.display.Bitmap;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.InterpolationMethod;
	import flash.display.Loader;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.text.TextField;
	
	public class Header extends Sprite
	{
		[Embed (source="assets/global/next.png")]
		public var NEXT:Class; //LOGO
		
		[Embed (source="assets/global/previous.png")]
		public var PREVIOUS:Class; //LOGO
		
		private var _box:Sprite;
		private var _width:Number;
		
		private var _loadAvatar:Loader;
		private var _description:EmbeddTextField;
		
		private var _left:Sprite;
		private var _right:Sprite;
		
		public function Header(wide:Number)
		{
			super();
			
			_width = wide; 
			
			drawBackground();
			
			_left = new Sprite();
			_left.addChild(new PREVIOUS() as Bitmap);
			_left.alpha = 0;
			_left.useHandCursor = _left.buttonMode = true;
			_left.addEventListener(MouseEvent.ROLL_OVER, onOver);
			_left.addEventListener(MouseEvent.ROLL_OUT, onOut);
			_left.addEventListener(MouseEvent.CLICK, onClick);
			
			_right = new Sprite();
			_right.addChild(new NEXT() as Bitmap);
			_right.alpha = 0;
			_right.useHandCursor = _right.buttonMode = true;
			_right.addEventListener(MouseEvent.ROLL_OVER, onOver);
			_right.addEventListener(MouseEvent.ROLL_OUT, onOut);
			_right.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function drawBackground():void
		{
			_box = new Sprite();
			var g:Graphics = _box.graphics;
			var gradient:Matrix = new Matrix();
			gradient.createGradientBox(_width, 45, Math.PI/2);			
			g.beginGradientFill(GradientType.LINEAR, [0x2a2a2a, 0x0c0c0c], [1,1], [0, 255], gradient, SpreadMethod.PAD, InterpolationMethod.RGB,0);
			g.drawRect(0,0, _width, 45);
			g.endFill();
			g.moveTo(0, 45);
			g.lineStyle(1, 0xFFFFFF);
			g.lineTo(_width, 45);
			
			this.addChild(_box);
		}
		
		public function loadUp(avatarURL:String, question:String):void
		{
			_description = new EmbeddTextField(FontName.ARIAL_BOLD, true, 10, 0xffffff);
			_description.text = question;
			_description.multiline = true;
			_description.wordWrap = true;
			
			if (Blobbr.avatar >= 1) {
				_loadAvatar = new Loader();
				_loadAvatar.contentLoaderInfo.addEventListener(Event.COMPLETE, onAvatarLoaded);
				_loadAvatar.load(new URLRequest(avatarURL), new LoaderContext());
			} else {
				_description.width = _width - 20;
				_description.x = 10;
				_description.y = 10;
				this.addChild(_description);
				
				this.addChild(_left);
				this.addChild(_right);
				_right.x = _left.x + _left.width;
			}
			
			
		}
		
		private function onAvatarLoaded(e:Event):void
		{
			_loadAvatar.contentLoaderInfo.removeEventListener(Event.COMPLETE, onAvatarLoaded);
			(_loadAvatar.content as Bitmap).smoothing = true;
			_loadAvatar.width = (45*(_loadAvatar.width/_loadAvatar.height));
			_loadAvatar.height = 45;
			
			
			_loadAvatar.x = _width - _loadAvatar.width;
			
			_description.width = _width - _loadAvatar.width - 20;
			_description.x = 10;
			_description.y = 10;
			this.addChild(_description);
			
			this.addChild(_loadAvatar);
			
			this.addChild(_left);
			this.addChild(_right);
			_right.x = _left.x + _left.width;

		}
		
		private function onClick(e:Event):void
		{
			if (e.currentTarget == _left) {
				this.dispatchEvent(new Event(HeaderMediator.PREVIOUS));
			} else {
				this.dispatchEvent(new Event(HeaderMediator.NEXT));
			}
		}
		
		private function onOver(e:Event):void
		{
			TweenLite.to(e.currentTarget, .5, {alpha:.7});	
		}
		
		private function onOut(e:Event):void
		{
			TweenLite.to(e.currentTarget, .5, {alpha:0});
		}
	}
}