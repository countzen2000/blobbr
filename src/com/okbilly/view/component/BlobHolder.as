package com.okbilly.view.component
{
	import com.okbilly.model.dto.BlobbDTO;
	import com.okbilly.model.dto.PollDTO;
	import com.okbilly.model.dto.QuestionDTO;
	
	import flash.display.Sprite;

	public class BlobHolder extends Sprite
	{
		public function BlobHolder()
		{
			super();
		}
		
		public function create(data:BlobbDTO):void
		{
			for each (var question:QuestionDTO in data.poll.questions) {
				
			}
		}
	}
}
import com.okbilly.view.component.EmbeddTextField;
import com.okbilly.view.component.FontName;

import flash.display.Sprite;

internal class Blobs extends Sprite
{
	private var _question:Question;
	
	public function Blobs(questionText:String)
	{
		super();
		
		_question = new Question(questionText);
		this.addChild(_question);
		
	}
}

internal class Question extends Sprite
{
	private var _title:EmbeddTextField;
	
	public function Question(string:String)
	{
		_title = new EmbeddTextField(FontName.ARIAL, true, 10);
		_title.text = string;
		this.addChild(_title);
	}
}

internal class Answer extends Sprite
{
	private var _answer:EmbeddTextField;
	
	public function Answer(string:String)
	{
		_answer = new EmbeddTextField(FontName.ARIAL, false, 10);
		_answer.text = string;
		this.addChild(_answer);
	}
	
}