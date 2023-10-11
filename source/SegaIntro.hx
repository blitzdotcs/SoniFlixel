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
    var segacam:FlxCamera;
	public var camHUD:FlxCamera;

    public function new()
    {
        super();

        segalogo = new FlxSprite(0, 0, "assets/images/intro/sega/SegaIntro.png");
        segalogoshit(segalogo, FlxG.width / 2, FlxG.height / 2);
    }

    function segalogoshit(segalogoshittwo:FlxSprite, locationX:Float = 0, locationY:Float = 0)
    {
        segalogoshittwo.x = locationX;
        segalogoshittwo.y = locationY;

        var scaleFactor:Float = 1;
        segalogoshittwo.scale.x = scaleFactor;
        segalogoshittwo.scale.y = scaleFactor;

        segalogoshittwo.setGraphicSize(Std.int(segalogoshittwo.width));
        if (segalogoshittwo == segalogo)
        {
            segalogoshittwo.frames = Paths.getSparrowAtlas('SegaIntro');
            segalogoshittwo.animation.addByPrefix('main', "Intro", 6);
            segalogoshittwo.animation.play('main');
        }
    }

    override public function create()
    {
        segacam = new FlxCamera(0, 0, FlxG.width, FlxG.height);
        FlxG.cameras.add(segacam);

		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;

		FlxG.cameras.add(camHUD);
		FlxCamera.defaultCameras = [segacam];

        segalogo.antialiasing = true;
        add(segalogo);

        segacam.follow(segalogo, FlxCameraFollowStyle.LOCKON);

        super.create();
    }

    override public function update(elapsed:Float)
    {

        if(FlxG.keys.pressed.ENTER)
        {
            FlxG.switchState(new DebugState());
        }

        super.update(elapsed);
    }
}