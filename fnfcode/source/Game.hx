import flixel.FlxGame;
import states.SongState;  // Import the SongState class

class Game {
    static function main() {
        // Create a new FlxGame instance with SongState as the starting state
        new FlxGame(800, 600, SongState); // You can adjust the window size as needed
    }
}
