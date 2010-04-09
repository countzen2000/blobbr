package com.okbilly.view.component
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.InterpolationMethod;
	import flash.display.Loader;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.text.TextField;
	
	public class Header extends Sprite
	{
		private var _box:Sprite;
		private var _width:Number;
		
		private var _loadAvatar:Loader;
		private var _question:EmbeddTextField;
		
		public function Header(wide:Number)
		{
			super();
			
			_width = wide; 
			
			drawBackground();
		}
		
		private function drawBackground():void
		{
			_box = new Sprite();
			var g:Graphics = _box.graphics;
			var gradient:Matrix = new Matrix();
			gradient.createGradientBox(_width, 45, Math.PI/2);			
			g.beginGradientFill(GradientType.LINEAR, [0x2a2a2a, 0x0c0c0c], [1,1], [0, 255], gradient, SpreadMethod.PAD, InterpolationMethod.RGB,0);
			g.drawRect(0,0, _width, 45);
			
			this.addChild(_box);
		}
		
		public function loadUp(avatarURL:String, question:String):void
		{
			_loadAvatar = new Loader();
			_loadAvatar.contentLoaderInfo.addEventListener(Event.COMPLETE, onAvatarLoaded);
			_loadAvatar.load(new URLRequest(avatarURL), new LoaderContext());
			
			_question = new EmbeddTextField(FontName.ARIAL, false, 10, 0xffffff);
			_question.text = question;
			_question.multiline = true;
			_question.wordWrap = true;
		}
		
		private function onAvatarLoaded(e:Event):void
		{
			_loadAvatar.contentLoaderInfo.removeEventListener(Event.COMPLETE, onAvatarLoaded);
			_loadAvatar.x = _width - _loadAvatar.width;
			
			_question.width = _width - _loadAvatar.width - 20;
			_question.x = 10;
			_question.y = 10;
			this.addChild(_question);
			
			this.addChild(_loadAvatar);
		}
	}
}