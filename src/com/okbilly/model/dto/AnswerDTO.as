package com.okbilly.model.dto
{
	public class AnswerDTO
	{
		public var key:String;
		public var items:Array = [];
		
		public function AnswerDTO(data:XML = null)
		{
			if (!data) return;
			
			key = data.@key;
			
			for each (var item:XML in data.item) {
				var tempObject:Object = {answer:item.answer[0].toString(), choiceid:item.choiceid[0].toString(), key:item.@key[0].toString()};
				items.push(tempObject);
			}
		}
	}
}

/*
<answer key="5">
<item key="0">
<choiceid>0</choiceid>
<answer>Tron</answer>
</item>
<item key="1">
<choiceid>0</choiceid>
<answer>Office Space</answer>
</item>
<item key="2">
<choiceid>0</choiceid>
<answer>Whip It!</answer>
</item>
<item key="3">
<choiceid>0</choiceid>
<answer>Gleaming the Cube</answer>
</item>
<item key="4">
<choiceid>0</choiceid>
<answer>L.A. Story</answer>
</item>
</answer>
*/

/*
<answer key="4">
<item key="0">
<choiceid>0</choiceid>
<answer>Awesome!</answer>
</item>
</answer>*/