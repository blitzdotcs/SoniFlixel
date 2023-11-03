package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		#if desktop
		addChild(new FlxGame(0, 0, SegaIntro));
		#else
		addChild(new FlxGame(0, 0, DebugMenu));
		#end
		flixel.addons.studio.FlxStudio.create();
	}
}
