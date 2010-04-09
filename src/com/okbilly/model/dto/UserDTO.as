package com.okbilly.model.dto
{
	public class UserDTO extends Object
	{
		public var username:String;
		public var displayName:String;
		public var avatar:String;
		public var id:String;
		
		public function UserDTO(data:XML = null)
		{
			super();
			
			if (!data) return;
			
			id = data.id;
			username = data.username;
			displayName = data.displayname;
			avatar = data.avatar;
			
		}
	}
}

/*
<user>
<id>2</id>
<username>elenor</username>
<displayname>Elenor</displayname>
<avatar>http://blobbr.com/files/avatar/1/3/6/a/0/2-thumb.jpg</avatar>
</user>
*/