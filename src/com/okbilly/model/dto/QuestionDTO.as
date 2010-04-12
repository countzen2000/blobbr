package com.okbilly.model.dto
{
	public class QuestionDTO
	{
		public var id:Number;
		public var format:String;
		public var question:String;
		public var type:String;
		public var answermin:Number;
		public var answermax:Number;
		public var key:Number;
		
		public function QuestionDTO(data:XML = null)
		{
			if (!data) return;
			
			key = data.@key;
			id = data.id;
			format = data.format;
			question = data.question;
			type = data.type;
			answermin = data.answermin;
			answermax = data.answermax;
		}
	}
}

/*
<question key="0">
<id>4</id>
<format>text</format>
<question>What's your mood?</question>
<type>open</type>
<answermin>1</answermin>
<answermax>1</answermax>
<choices/>
</question>
*/