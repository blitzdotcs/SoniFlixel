package debug;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxState;

class DebugLevelSelect extends FlxState 
{
    var textOptions:Array<String> = ["Test Stage"];
    var textOptionsGroup:Array<FlxText> = [];
    var curSelected:Int = 0;

    override public function create() {
        super.create();

        for (i in 0...textOptions.length) {
            var option:FlxText = new FlxText(FlxG.width / 2 - 50, 100 + (i * 60), FlxG.width, textOptions[i], 32);
            option.ID = i;
            option.screenCenter(X);
            textOptionsGroup.push(option);
            add(option);
        }
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.UP)
            curSelected -= 1;

        if (FlxG.keys.justPressed.DOWN)
            curSelected += 1;

        if (curSelected < 0)
            curSelected = textOptions.length - 1;

        if (curSelected >= textOptions.length)
            curSelected = 0;

        for (i in 0...textOptionsGroup.length) {
            var option:FlxText = textOptionsGroup[i];
            option.color = FlxColor.WHITE;

            if (option.ID == curSelected)
                option.color = FlxColor.YELLOW;
        }

        if (FlxG.keys.justPressed.Z) 
        {
            var selectedOption:String = textOptions[curSelected];
            trace("Selected option: " + selectedOption);

            switch (selectedOption) {
                case "Test Stage":
                    FlxG.switchState(new DebugState());
            }
        }
    }
}