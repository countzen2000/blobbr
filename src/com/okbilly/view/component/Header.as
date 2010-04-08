package com.okbilly.view.component
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class Header extends Sprite
	{
		private var _box:Sprite;
		private var _width:Number;
		
		public function Header(wide:Number)
		{
			super();
			trace (wide);
			_width = wide; 
			
			drawBackground();
		}
		
		private function drawBackground():void
		{
			_box = new Sprite();
			var g:Graphics = _box.graphics;
			var gradient:Matrix = new Matrix();
			gradient.createGradientBox(_width, 22, Math.PI/2);			
			g.beginGradientFill(GradientType.LINEAR, [0x2a2a2a, 0x0c0c0c], [1,1], [0, 255], gradient, SpreadMethod.PAD, InterpolationMethod.RGB,0);
			g.drawRect(0,0, _width, 22);
			
			this.addChild(_box);
		}
	}
}