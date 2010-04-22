package com.okbilly.view.component
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class EmbeddTextField extends TextField
	{
		[Embed(source="./assets/fonts/font.swf", fontFamily="Arial")]
		public var arial:Class;
		
		[Embed(source="./assets/fonts/font.swf", fontFamily="Arial", fontWeight="bold")]
		public var arialBold:Class;
		
		private var _format:TextFormat;
		private var _tempFormat:TextFormat;
		
		public function EmbeddTextField(fontName:String = FontName.ARIAL, bold:Boolean = false, size:Number = 10, color:Number = 0xffffff)
		{
			super();	
			
			_format = new TextFormat(fontName, size, color, bold);
			this.selectable = false;
			this.autoSize = TextFieldAutoSize.LEFT;
			this.embedFonts = true;
			this.defaultTextFormat = _format;
		}
		
		public function set temporaryFormat(style:TextFormat):void
		{
			_tempFormat = style;
		}
		
		public function useTemporaryFormat():void
		{
			this.setTextFormat(_tempFormat);
		}
		
		public function restoreNormalFormat():void
		{
			this.setTextFormat(_format)
		}
	}
}