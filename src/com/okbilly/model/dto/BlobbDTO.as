package com.okbilly.model.dto
{
	public class BlobbDTO extends Object
	{
		public var id:Number;
		
		public var pollid:Number;
		public var created:Date;
		public var createAgo:String;
		public var poll:PollDTO;
		public var userid:String;
		private var _answers:Array = [];
		
		
		/* The number of milliseconds in one day
		*/     
		public static const MILLISECONDS_IN_DAY : Number = 86400000;
		
		/**
		 * The number of milliseconds in one hour
		 */     
		public static const MILLISECONDS_IN_HOUR : Number = 3600000;
		
		/**
		 * The number of milliseconds in one minute
		 */     
		public static const MILLISECONDS_IN_MINUTE : Number = 60000;
		
		/**
		 * The number of milliseconds in one second
		 */     
		public static const MILLISECONDS_IN_SECOND : Number = 1000;
		
		public function BlobbDTO(data:XML = null)
		{
			super();
			
			if (!data) return;
			
			id = data.id;
			userid = data.userid;
			pollid = data.pollid;
			created = new Date();
			var temp:String = data.created;
			//2010-04-12T01:59:49-04:00
			
			created.setFullYear(temp.substr(0, 4).toString(), Number(temp.substr(5,2))-1, temp.substr(8, 2).toString()); 
			created.setHours(temp.substr(11, 2).toString(), temp.substr(14, 2).toString(), temp.substr(17,2).toString());
			
			var current:Date = new Date();
			if ((current.getMonth() - created.getMonth()) > 0) {
				createAgo = "a long while ago";
			} else if ((current.getDate() - created.getDate()) > 0) {
				if ((current.getDate() - created.getDate()) > 1) {
					createAgo = (current.getDate() - created.getDate()) + " days ago";
				} else {
					createAgo = "1 day ago";
				}
			} else if ((current.getHours() - created.getHours()) > 0) {
				createAgo = (current.getHours() - created.getHours()) + " hours ago";
			} else if ((current.getMinutes() - created.getMinutes()) > 0) {
				createAgo = (current.getMinutes() - created.getMinutes()) + " mins ago";
			} else {
				createAgo = "just now";
			}
			
			for each (var answer:XML in data.answers.answer) {
				_answers.push(new AnswerDTO(answer));
			}
			
			poll = new PollDTO(new XML(data.poll));
			poll.answers = _answers;
			
		}
	}
}

/**
 <blobb key="0">
      <id>36</id>
      <pollid>2</pollid>
      <userid>1</userid>
      <created>2010-03-29T19:28:36-04:00</created>
      <answers>
        <answer key="4">
          <item key="0">
            <choiceid>0</choiceid>
            <answer>Awesome!</answer>
          </item>
        </answer>
      </answers>
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
      <user>
        <id>1</id>
        <username>admin</username>
        <displayname>Administrator</displayname>
        <avatar>http://blobbr.com/img/themes/v1/avatar.png</avatar>
      </user>
    </blobb>
 */