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
		public var question:String;
		public var answermin:Number;
		public var answermax:Number;
		public var numblobbs:Number;
		public var format:String;
		public var type:String;
		
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
			format = data.format;
			question = data.question;
			type = data.type;
			answermin = data.answermin;
			answermax = data.answermax;
		}
	}
}
/*
<id>3</id>
<title>Top 5 movies</title>
<description>What are your top 5 favorite movies?</description>
<featured>0</featured>
<sponsored>0</sponsored>
<published>2010-03-09T20:28:02-05:00</published>
<numblobbs>1</numblobbs>
<questions>
<item>
<id>5</id>
<format>text</format>
<question>Movies</question>
<type>open</type>
<answermin>5</answermin>
<answermax>5</answermax>
<choices/>
</item>
</questions>
* 

*/