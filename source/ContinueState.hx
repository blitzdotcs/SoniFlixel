package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSubState;
import flixel.FlxObject;
import flixel.FlxCamera;

class ContinueState extends FlxState
{
    var soniccontinue:FlxSprite;
    var continuetextlmao:FlxSprite;
    var soniccamera:FlxCamera;

    public function new()
    {
        super();


        continuetextlmao = new FlxSprite(2, 100, "assets/images/continuetext.png");

        soniccontinue = new FlxSprite();
        setupCharacter(soniccontinue, FlxG.width / 2, FlxG.height / 2);
        continuetextsetup(continuetextlmao, FlxG.width / 2, FlxG.height / 2);
    }

    function continuetextsetup(ctext:FlxSprite, locationX:Float = 0, locationY:Float = 150)
    {
        ctext.x = locationX;
        ctext.y = locationY + 20;
        

        var scaleFactor:Float = 0.75;
        ctext.scale.x = scaleFactor;
        ctext.scale.y = scaleFactor;

        ctext.setGraphicSize(Std.int(ctext.width));
        if (ctext == continuetextlmao)
        {
            ctext.frames = Paths.getSparrowAtlas('continue/continuetext');
			ctext.animation.addByPrefix('idleLOOP', "idle", 6);
            ctext.animation.play('idleLOOP');
        }
    }

    function setupCharacter(character:FlxSprite, locationX:Float = 0, locationY:Float = 250)
    {
        character.x = locationX;
        character.y = locationY + 20;
        

        var scaleFactor:Float = 0.75;
        character.scale.x = scaleFactor;
        character.scale.y = scaleFactor;

        character.setGraphicSize(Std.int(character.width));
        if (character == soniccontinue)
        {
            character.frames = Paths.getSparrowAtlas('continue/SonicContinue');
			character.animation.addByPrefix('idleLOOP', "continueidle", 6);
            character.animation.play('idleLOOP');
        }
    }

    override public function create()
    {
        soniccamera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
        FlxG.cameras.add(soniccamera);

		FlxCamera.defaultCameras = [soniccamera];

        add(soniccontinue);

        
        soniccamera.follow(soniccontinue, FlxCameraFollowStyle.LOCKON);
        soniccamera.zoom = 2.2;

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        soniccontinue.animation.play('idleLOOP');
    }
}