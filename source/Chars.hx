package;

import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Chars extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'sonic';

	public function new(x:Float, y:Float, ?character:String = "sonic", ?isPlayer:Bool = false)
	{
		animOffsets = new Map<String, Array<Dynamic>>();
		super(x, y);

		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'sonic':
            {
				tex = Paths.getSparrowAtlas('chars/SonicPlayer');
				frames = tex;
                animation.addByPrefix('down', "down", 6);
                animation.addByPrefix('up', "up", 6);
                animation.addByPrefix('run', "soncrun", 6);
			    animation.addByPrefix('balance', "balancing", 6);
			    animation.addByPrefix('idle', "bored", 6);
			    animation.addByPrefix('idleLOOP', "boredloop", 6);
			    animation.addByPrefix('jump', "ball", 6);
				animation.addByPrefix('deathlmaoz', "death", 6);
                playAnim('idleLOOP');
            }    						
		}
	}

	override function update(elapsed:Float)
    {
		super.update(elapsed);
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(animation.curAnim.name);
		if (animOffsets.exists(animation.curAnim.name))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}