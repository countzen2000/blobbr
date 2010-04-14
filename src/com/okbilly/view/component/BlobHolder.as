package com.okbilly.view.component
{
	import com.okbilly.model.dto.BlobbDTO;
	import com.okbilly.model.dto.PollDTO;
	import com.okbilly.model.dto.QASetDTO;
	import com.okbilly.model.dto.QuestionDTO;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class BlobHolder extends Sprite
	{
		private var _width:Number;
		
		public function BlobHolder(stageWidth:Number)
		{
			super();
			
			_width = stageWidth;
		}
		
		public function create(data:BlobbDTO):void
		{
			if (!data) return;
			
			var temporary:DisplayObject;
			var counter:int = 1;
			
			for each (var QA:QASetDTO in data.poll.QASet) {
				var blob:Blobs = new Blobs(counter, QA, _width);
				
				if (temporary)
				{
					blob.y = temporary.y + temporary.height;					
				}
				
				this.addChild(blob);
				
				temporary = blob;
				counter++;
			}
		}
	}
}
import com.okbilly.model.dto.AnswerDTO;
import com.okbilly.model.dto.QASetDTO;
import com.okbilly.view.component.EmbeddTextField;
import com.okbilly.view.component.FontName;

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Sprite;

internal class Blobs extends Sprite
{
	private var _question:Question;
	private var _answers:Array = [];
	
	private var _width:Number;
	
	public function Blobs(count:Number, QA:QASetDTO, stageWidth:Number)
	{
		super();
		
		_width = stageWidth;
		
		_question = new Question(count.toString() + ". "+QA.question.question, _width);
		this.addChild(_question);
		
		var temporary:DisplayObject = _question;
		
		for each (var item:Object in QA.answer.items) {
			var _answer:Answer = new Answer(item.answer, _width);
			
			if (temporary)
			{
				_answer.y = temporary.y + temporary.height;					
			}
			
			this.addChild(_answer);
			
			temporary = _answer;
			
		}
		
	}
}

internal class Question extends Sprite
{
	private var _title:EmbeddTextField;
	private var _width:Number;
	
	public function Question(string:String, stageWidth:Number)
	{
		_width = stageWidth;
		
		var g:Graphics = this.graphics;
		g.beginFill(Blobbr.color);
		g.drawRect(0,0, _width, 23);
		g.endFill();
		g.moveTo(0, 23);
		g.lineStyle(1, 0xFFFFFF);
		g.lineTo(_width, 23);
		
		_title = new EmbeddTextField(FontName.ARIAL_BOLD, true, 12);
		_title.multiline = true;
		_title.wordWrap = true;
		_title.width = _width - 10;
		_title.text = string;
		_title.y = this.height/2 - _title.textHeight/2 - 2;
		_title.x = 10;
		this.addChild(_title);
		
		if (_title.textHeight > 15) {
			g.clear();
			g.beginFill(0x68a100);
			g.drawRect(0,0, _width, _title.height + 12);
			g.endFill();
			_title.y = this.height/2 - _title.textHeight/2 - 2;
		}
	}
}

internal class Answer extends Sprite
{
	private var _answer:EmbeddTextField;
	private var _width:Number;
	
	public function Answer(string:String, stageWidth:Number)
	{
		_width = stageWidth;
		
		var g:Graphics = this.graphics;
		g.beginFill(0xFFFFFF);
		g.drawRect(0,0, _width, 23);
		g.endFill();
		
		_answer = new EmbeddTextField(FontName.ARIAL, false, 10, 0x45494d);
		_answer.multiline = true;
		_answer.wordWrap = true;
		_answer.width = _width - 10;
		_answer.htmlText = string;
		_answer.y = this.height/2 - _answer.textHeight/2 - 2;
		_answer.x = 10;
		this.addChild(_answer);
		
		if (_answer.textHeight > 15) {
			g.clear();
			g.beginFill(0xFFFFFF);
			g.drawRect(0,0, _width, _answer.height + 12);
			g.endFill();
			_answer.y = this.height/2 - _answer.textHeight/2 - 2;
		}
	}
	
}