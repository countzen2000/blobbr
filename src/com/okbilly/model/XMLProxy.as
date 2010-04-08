package com.okbilly.model
{
	
	import com.okbilly.ApplicationFacade;
	
	import flash.display.Bitmap;
	import flash.utils.setTimeout;
	
	import org.puremvc.as3.multicore.utilities.startupmanager.interfaces.IStartupProxy;
	
	public class XMLProxy extends StartUpEntityProxy implements IStartupProxy
	{
		public static const NAME:String = "AssetsProxy";
		public static const SRNAME:String = "AssetsSRProxy";
		
		
		public function XMLProxy()
		{
			super(NAME, null);
		}
		/*
		<root>
		<status>success</status>
		<blobbs>
		<item> <id>36</id> <pollid>2</pollid> <userid>1</userid> <created>2010-03-29T19:28:36-04:00</created> <answers> <item> <item> <choiceid>0</choiceid> <answer>Awesome!</answer> </item> </item> </answers> <poll> <id>2</id> <title>My mood</title> <description>How are you feeling? Blobb this as many times as you want!</description> <featured>1</featured> <sponsored>1</sponsored> <published>2010-03-11T01:37:40-05:00</published> <numblobbs>26</numblobbs> <questions> <item> <id>4</id> <format>text</format> <question>What's your mood?</question> <type>open</type> <answermin>1</answermin> <answermax>1</answermax> <choices/> </item> </questions> <user> <id>2</id> <username>elenor</username> <displayname>Elenor</displayname> <avatar>http://blobbr.com/files/avatar/1/5/6/0/0/2.jpg</avatar> </user> </poll> <user> <id>1</id> <username>admin</username> <displayname>Administrator</displayname> <avatar>http://blobbr.com/files/tmp/avatar-alt.png</avatar> </user> </item> <item> <id>3</id> <pollid>3</pollid> <userid>1</userid> <created>2010-03-09T20:29:19-05:00</created> <answers> <item> <item> <choiceid>0</choiceid> <answer>Tron</answer> </item> <item> <choiceid>0</choiceid> <answer>Office Space</answer> </item> <item> <choiceid>0</choiceid> <answer>Whip It!</answer> </item> <item> <choiceid>0</choiceid> <answer>Gleaming the Cube</answer> </item> <item> <choiceid>0</choiceid> <answer>L.A. Story</answer> </item> </item> </answers> <poll> <id>3</id> <title>Top 5 movies</title> <description>What are your top 5 favorite movies?</description> <featured>0</featured> <sponsored>0</sponsored> <published>2010-03-09T20:28:02-05:00</published> <numblobbs>1</numblobbs> <questions> <item> <id>5</id> <format>text</format> <question>Movies</question> <type>open</type> <answermin>5</answermin> <answermax>5</answermax> <choices/> </item> </questions> <user> <id>2</id> <username>elenor</username> <displayname>Elenor</displayname> <avatar>http://blobbr.com/files/avatar/1/5/6/0/0/2.jpg</avatar> </user> </poll> <user> <id>1</id> <username>admin</username> <displayname>Administrator</displayname> <avatar>http://blobbr.com/files/tmp/avatar-alt.png</avatar> </user> </item> <item> <id>1</id> <pollid>1</pollid> <userid>1</userid> <created>2010-03-05T13:56:29-05:00</created> <answers> <item> <item> <choiceid>0</choiceid> <answer>G-Star</answer> </item> <item> <choiceid>0</choiceid> <answer>Diesel</answer> </item> <item> <choiceid>0</choiceid> <answer>Kid Robot</answer> </item> <item> <choiceid>0</choiceid> <answer>James Perse</answer> </item> <item> <choiceid>0</choiceid> <answer>Converse</answer> </item> </item> <item> <item> <choiceid>0</choiceid> <answer>Black</answer> </item> <item> <choiceid>0</choiceid> <answer>White</answer> </item> <item> <choiceid>0</choiceid> <answer>Pink</answer> </item> </item> <item> <item> <choiceid>5</choiceid> <answer>Bracelet</answer> </item> <item> <choiceid>6</choiceid> <answer>Belt</answer> </item> <item> <choiceid>8</choiceid> <answer>Watch</answer> </item> <item> <choiceid>9</choiceid> <answer>Ring</answer> </item> <item> <choiceid>10</choiceid> <answer>Earrings</answer> </item> </item> </answers> <poll> <id>1</id> <title>My clothing</title> <description>What brand, color and style of clothing are you currently wearing?</description> <featured>1</featured> <sponsored>0</sponsored> <published>2010-03-11T01:31:39-05:00</published> <numblobbs>5</numblobbs> <questions> <item> <id>1</id> <format>text</format> <question>Brands</question> <type>open</type> <answermin>1</answermin> <answermax>7</answermax> <choices/> </item> <item> <id>2</id> <format>color</format> <question>Colors</question> <type>open</type> <answermin>1</answermin> <answermax>7</answermax> <choices/> </item> <item> <id>3</id> <format>text</format> <question>Accessories</question> <type>choice</type> <answermin>0</answermin> <answermax>10</answermax> <choices/> </item> <item> <id>6</id> <format>text</format> <question>Are you comfortable?</question> <type>choice</type> <answermin>1</answermin> <answermax>1</answermax> <choices/> </item> </questions> <user> <id>1</id> <username>admin</username> <displayname>Administrator</displayname> <avatar>http://blobbr.com/files/tmp/avatar-alt.png</avatar> </user> </poll> <user> <id>1</id> <username>admin</username> <displayname>Administrator</displayname> <avatar>http://blobbr.com/files/tmp/avatar-alt.png</avatar> </user> </item> </blobbs> <total>3</total> 
		</root> 
		*/
		
		public function load():void
		{
			trace ("AssetsProxy");
			setTimeout(this.sendLoadedNotification, 1000, ApplicationFacade.XML_DATA_LOADED, NAME, SRNAME);
			
			//Setting up assets for multiple uses.
			//ImageAssets.instance.setAssets("LOGO", new LOGO as Bitmap);
			//ImageAssets.instance.setAssets("DRAGGER", new DRAGGER as Bitmap);
		}
		
		public function getImages(imageName:String):Bitmap
		{
			var returnImage:Bitmap;
		/*	switch (imageName) {
				case "LOGO":
					returnImage = new LOGO() as Bitmap;
					break;
				case "DRAGGER":
					returnImage = new DRAGGER() as Bitmap;
				default:
					returnImage = new Bitmap();
					break;
			}
			*/
			return returnImage;
		}
	}
}