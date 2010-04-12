package com.okbilly.model.dto
{
	public class PollDTO extends Object
	{
		public var user:UserDTO;
		public var title:String;
		public var description:String;
		public var featured:Boolean;
		public var sponsored:Boolean;
		public var published:Date;
		public var id:String;
		public var numblobbs:Number;
		
		public var questions:Array = [];
		private var _answers:Array = [];
		public var QASet:Array = [];
		
		public function PollDTO(data:XML = null)
		{
			super();
			
			if (!data) return;
			
			user = new UserDTO(new XML(data.user));
			title = data.title;
			description = data.description;
			featured = data.featured;
			sponsored = data.sponsored;
			numblobbs = data.numblobbs;
			id = data.id;
			
			for each (var item:XML in data.questions.question) {
				questions.push(new QuestionDTO(item));
			}
			
			//We also set the answers from blobbDTO
		}
		
		public function set answers(_array:Array):void
		{
			_answers = _array;
			
			for each (var question:QuestionDTO in questions) {
				for each (var answer:AnswerDTO in _answers) {
					if (question.id == answer.key) {
						QASet[question.id] = new QASetDTO({"id":question.id, "question":question, "answer":answer});
						break;
					}
				}
			}
		}
		
		public function MatchingQuestionsAndAnswers():void
		{
			
		}
	}
}

/*
<poll>
<id>2</id>
<title>My mood</title>
<description>How are you feeling? Blobb this as many times as you want!</description>
<featured>1</featured>
<sponsored>1</sponsored>
<published>2010-03-11T01:37:40-05:00</published>
<numblobbs>26</numblobbs>
<questions>
	<question key="0">
	<id>4</id>
	<format>text</format>
	<question>What's your mood?</question>
	<type>open</type>
	<answermin>1</answermin>
	<answermax>1</answermax>
	<choices/>
	</question>
</questions>
<user>
<id>2</id>
<username>elenor</username>
<displayname>Elenor</displayname>
<avatar>http://blobbr.com/files/avatar/1/3/6/a/0/2-thumb.jpg</avatar>
</user>
</poll>
*/