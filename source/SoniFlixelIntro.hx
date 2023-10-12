// Just a copy of SegaIntro lol
package;

import flixel.FlxState;
import hxcodec.flixel.FlxVideo;
import flixel.FlxG;
import flixel.FlxSprite;

class SoniFlixelIntro extends FlxState
{
    var video:FlxVideo;

	override public function create():Void
	{
		var video:FlxVideo = new FlxVideo();
		video.onEndReached.add(onVideoEnd);
        // TODO: Animate SoniFlixel intro in Aseprite
		video.play('assets/vids/intoro!!/SEGASCREAM.mp4');

        if (FlxG.keys.pressed.ENTER)
        {
            FlxG.switchState(new DebugState());
        }

		super.create();
	}

    public function onVideoEnd():Void
    {
		FlxG.switchState(new DebugState());
    }    
}