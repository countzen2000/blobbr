package com.okbilly.view.component
{
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import mx.events.DragEvent;
	
	public class Scrollbar extends Sprite
	{
		public static const SCROLLING:String = "scrollbarMoving";
		
		private var _thumb:Sprite;
		private var _background:Sprite;
		private var _upArrow:Sprite;
		private var _downArrow:Sprite;
		
		private var _height:Number;
		
		public function Scrollbar(targetHeight:Number)
		{
			super();
			
			_height = targetHeight;
			
			_upArrow = new Arrow(1);
			_upArrow.useHandCursor = _upArrow.buttonMode = true;
			_upArrow.addEventListener(MouseEvent.CLICK, onArrowClick);
			this.addChild(_upArrow);
			
			_background = new Sprite();
			_background.graphics.beginFill(0xffffff);
			_background.graphics.drawRect( 0, 0, 15, _height - 24);
			_background.graphics.endFill();
			_background.y = _upArrow.y + _upArrow.height;
			this.addChild(_background);
			
			_downArrow = new Arrow(-1);
			_downArrow.useHandCursor = _downArrow.buttonMode = true;
			_downArrow.addEventListener(MouseEvent.CLICK, onArrowClick);
			_downArrow.y = _background.y + _background.height;
			this.addChild(_downArrow);
			
			_thumb = new Sprite();
			_thumb.graphics.beginFill(0x9e9e9e);
			_thumb.graphics.drawRect(0,0,15,45);
			_thumb.graphics.endFill();
			_thumb.y = _upArrow.y + _upArrow.height;
			this.addChild(_thumb);
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);

		}
		
		private function onAdded(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			_thumb.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			_thumb.stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		private function onArrowClick(e:Event):void
		{
			if (e.currentTarget == _upArrow) {
				_thumb.y -= 5;
				if (_thumb.y < _background.y) {
					_thumb.y = _background.y;
				}
			} else {
				_thumb.y += 5;
				if (_thumb.y + _thumb.height > _background.y+_background.height) {
					_thumb.y = _background.y + _background.height - _thumb.height;
				}
			}
			onDrag();
		}
		
		private function onDown(e:Event):void
		{
			_thumb.startDrag(false, new Rectangle(_background.x, _background.y, 0, _background.height - _thumb.height));
			if (_thumb.stage) {
				_thumb.stage.addEventListener(MouseEvent.MOUSE_MOVE, onDrag);
			}
		}
		
		private function onUp(e:Event):void
		{
			_thumb.stopDrag();
			if (_thumb.stage) {
				_thumb.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onDrag);
			}
		}
		
		private function onDrag(e:Event = null):void
		{
			var scroll:Number = ((_thumb.y -  _background.y) / ( _background.height - _thumb.height));
			//scroll *= 100;
			//scroll = Math.round(scroll);
			//scroll -= _thumb.height;
			this.dispatchEvent(new DataEvent(SCROLLING, true, false, scroll.toString() ));	
		}
		
		
	}
}
import flash.display.GradientType;
import flash.display.Graphics;
import flash.display.InterpolationMethod;
import flash.display.SpreadMethod;
import flash.display.Sprite;
import flash.geom.Matrix;

internal class Arrow extends Sprite {
	
	private var g:Graphics;
	
	public function Arrow(UpOrDown:Number):void
	{
		g = this.graphics;
		var gradient:Matrix = new Matrix();
		gradient.createGradientBox(15, 12, Math.PI/2);
		if (UpOrDown > 0) {
			g.beginGradientFill(GradientType.LINEAR, [0xdbdbdb, 0xbebebe], [1,1], [0, 255], gradient, SpreadMethod.PAD, InterpolationMethod.RGB,0);
		} else {
			g.beginGradientFill(GradientType.LINEAR, [0xbebebe, 0xdbdbdb], [1,1], [0, 255], gradient, SpreadMethod.PAD, InterpolationMethod.RGB,0);
		}
		g.drawRect(0,0, 15, 12);
		g.endFill();
		
		g.beginFill(0x000000);
		
		if (UpOrDown > 0) {
			g.moveTo(4, 8);
			g.lineTo(7.5, 4);
			g.lineTo(11, 8);
			g.lineTo(4,8);
						
		} else {
			g.moveTo(4, 4);
			g.lineTo(7.5, 8);
			g.lineTo(11, 4);
			g.lineTo(4,4);
			
		}
		g.endFill();
		
	}
}