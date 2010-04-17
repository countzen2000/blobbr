package com.okbilly.view.component
{
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
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
			this.addChild(_upArrow);
			
			_background = new Sprite();
			_background.graphics.beginFill(0x999999);
			_background.graphics.drawRect( 0, 0, 15, _height - 30);
			_background.graphics.endFill();
			_background.y = _upArrow.y + _upArrow.height;
			this.addChild(_background);
			
			_downArrow = new Arrow(-1);
			_downArrow.y = _background.y + _background.height;
			this.addChild(_downArrow);
			
			_thumb = new Sprite();
			_thumb.graphics.beginFill(0xFFFFFF);
			_thumb.graphics.lineStyle(0, 0x666666);
			_thumb.graphics.drawRect(0,0,15,15);
			_thumb.graphics.endFill();
			_thumb.y = _upArrow.y + _upArrow.height;
			this.addChild(_thumb);
			
			_thumb.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			_thumb.addEventListener(MouseEvent.MOUSE_UP, onUp);
			
		}
		
		private function onDown(e:Event):void
		{
			_thumb.startDrag(false, new Rectangle(_background.x, _background.y, 0, _background.height - _thumb.height));
			_thumb.addEventListener(MouseEvent.MOUSE_MOVE, onDrag);
		}
		
		private function onUp(e:Event):void
		{
			_thumb.stopDrag();
			_thumb.removeEventListener(MouseEvent.MOUSE_MOVE, onDrag);
		}
		
		private function onDrag(e:Event):void
		{
			var scroll:Number = ((_thumb.y) / (_background.height - _thumb.height));
			scroll *= 100;
			scroll = Math.round(scroll);
			scroll -= 8;
			this.dispatchEvent(new DataEvent(SCROLLING, true, false, scroll.toString() ));	
		}
		
		
	}
}
import flash.display.Graphics;
import flash.display.Sprite;

internal class Arrow extends Sprite {
	
	private var g:Graphics;
	
	public function Arrow(UpOrDown:Number):void
	{
		g = this.graphics;
		g.beginFill(0xFFFFFF);
		g.drawRect(0,0, 15, 15);
		g.endFill();
		
		g.beginFill(0x000000);
		if (UpOrDown > 0) {
			g.moveTo(7.5, 2);
			g.lineTo(13, 13);
			g.lineTo(2, 13);
			g.lineTo(7.5, 2);
						
		} else {
			g.moveTo(7.5, 13);
			g.lineTo(2, 2);
			g.lineTo(13, 2);
			g.lineTo(7.5, 13);
			
		}
		g.endFill();
		
	}
}