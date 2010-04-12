package com.okbilly.model.dto
{
	public class QASetDTO
	{
		public var question:QuestionDTO;
		public var answer:AnswerDTO;
		public var id:Number;
		
		
		public function QASetDTO(data:Object)
		{
			id = data.id;
			answer = data.answer;
			question = data.question;
		}
	}
}