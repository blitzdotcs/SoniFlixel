package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSubState;
import flixel.FlxObject;
import flixel.FlxCamera;
import chars.*;

class DebugState extends FlxState
{
	public var s1sonic:Sonic;
    var soniccamera:FlxCamera;

	override public function create()
	{
        soniccamera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
        FlxG.cameras.add(soniccamera);
        FlxCamera.defaultCameras = [soniccamera];

		s1sonic = new Sonic(64, 64);
		add(s1sonic);

        soniccamera.follow(s1sonic, FlxCameraFollowStyle.LOCKON);
        soniccamera.zoom = 2.5;

		super.create();
	}

	override public function update(elapsed:Float)
	{
        super.update(elapsed);

        var movementSpeed:Float = 6.78;
        var jumpForce:Float = 6.5;
        var debugMode:Bool = false;
        var deadorsum:Bool = false;

		if (debugMode)
        { 
            FlxG.switchState(new debug.DebugMenu());
        }    

        if (!FlxG.keys.pressed.LEFT || !FlxG.keys.pressed.RIGHT || !FlxG.keys.pressed.UP || !FlxG.keys.pressed.DOWN || !FlxG.keys.pressed.Z)
        {  
            s1sonic.animation.play('idleLOOP');
        }

        if (FlxG.keys.pressed.LEFT)
        {  
            s1sonic.x -= movementSpeed;
            s1sonic.animation.play('walk');
            s1sonic.scale.x = -1;
        }
        else if (FlxG.keys.pressed.RIGHT)
        {
            s1sonic.x += movementSpeed;
            s1sonic.animation.play('walk');
            s1sonic.scale.x = 1;
        }

        if (FlxG.keys.pressed.UP)
        {
            s1sonic.animation.play('up');
        }
        else if (FlxG.keys.pressed.DOWN)
        {
            s1sonic.animation.play('down');
        }

        if (FlxG.keys.pressed.Z)
        {
            s1sonic.animation.play('jump');
        }

        if (FlxG.keys.pressed.X)
        {
            s1sonic.animation.play('jump');
        }  

        if (FlxG.keys.pressed.C)
        {
            debugMode = true;
            FlxG.switchState(new debug.DebugMenu());
        }

        if (FlxG.keys.pressed.R)
        {
            s1sonic.animation.play('deathlmaoz');
            deadorsum = true;
            switchtoContinue();
        }                        
	}

    function switchtoContinue()
    {
        FlxG.switchState(new ContinueState());
    }    
}
