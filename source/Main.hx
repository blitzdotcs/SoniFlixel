package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, debug.DebugMenu));
		//addChild(new FlxGame(0, 0, ContinueState));
	}
}
