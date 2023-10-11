package;

import flixel.FlxState;

class PlayState extends FlxState
{
	public var s1sonic:Sonic;

	override public function create()
	{
		s1sonic = new Sonic(0, 0);
		add(s1sonic);

		super.create();
	}

	override public function update(elapsed:Float)
	{
        super.update(elapsed);

        var movementSpeed:Float = 5;

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
            s1sonic.animation.play('jumpie');
            FlxG.sound.play(Paths.sound('scdjump'));
        }
	}
}
