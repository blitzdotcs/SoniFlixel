package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSubState;
import flixel.FlxObject;
import flixel.FlxCamera;

class SegaIntro extends FlxState
{
    var segalogo:FlxSprite;
    var bfcamera:FlxCamera;
	public var camHUD:FlxCamera;

    public function new()
    {
        super();

        segalogo = new FlxSprite(0, 0, "assets/images/intro/sega/sega.png");
    }

    override public function create()
    {
        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}
