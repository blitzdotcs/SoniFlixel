package chars;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Sonic extends Chars
{
	public var stunned:Bool = false;

	public function new(x:Float, y:Float)
	{
		super(x, y);
		
		setSize(8, 8);
 		offset.set(4, 4);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
