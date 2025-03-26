package;

import flixel.FlxGame;
import states.SongState;  // Import SongState from the states folder

class Main extends FlxGame {
    public function new() {
        super(640, 480, SongState, 1); // Initialize with SongState
    }
}
