package;

import flixel.FlxState;
import hxcodec.flixel.FlxVideo;
import flixel.FlxG;
import flixel.FlxSprite;

class SegaIntro extends FlxState
{
    var video:FlxVideo;

	override public function create():Void
	{
		var video:FlxVideo = new FlxVideo();
		video.onEndReached.add(onVideoEnd);
		video.play('assets/vids/intoro!!/SEGASCREAM.mp4');

        if (FlxG.keys.pressed.ENTER)
        {
            FlxG.switchState(new SoniFlixelIntro());
        }

		super.create();
	}

    public function onVideoEnd():Void
    {
		FlxG.switchState(new SoniFlixelIntro());
    }    
}