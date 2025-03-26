package states;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxText;
import flixel.input.Keyboard;
import flixel.FlxSound;
import flixel.graphics.FlxSprite;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import haxe.Json;

class SongState extends FlxState {
    var missText:FlxText;
    var inputTimer:FlxTimer;
    var song:FlxSound; // For playing the song
    var notes:Array<Dynamic>; // Array for storing note data

    override public function create():Void {
        super.create();
        
        // Load the song and notes data
        loadSong("fractal_images"); // Make sure the song name matches the file in your songs folder

        // Setup initial state (add UI elements, etc.)
        missText = new FlxText(FlxG.width / 2 - 50, FlxG.height / 2, 100, "MISS!");
        missText.setFormat(null, 24, 0xFF0000, "center");
        missText.visible = false;
        add(missText);
        
        // Initialize the song player
        song.play();
    }

    // Function to load a song and its note data
    private function loadSong(songName:String):Void {
        // Load the song file (OGG from the songs folder)
        song = FlxSound.loadEmbedded(Assets.getMusic("songs/" + songName + ".ogg"));
        
        // Load the note data (JSON from the songs folder)
        var noteData = Assets.getText("songs/" + songName + ".json");
        notes = parseNoteData(noteData);
    }

    // Function to parse the note data from JSON
    private function parseNoteData(noteData:String):Array<Dynamic> {
        var json = Json.parse(noteData);
        var parsedNotes:Array<Dynamic> = [];
        
        for (note in json) {
            parsedNotes.push(note);
        }
        
        return parsedNotes;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        // Handle player input (key presses) to match notes
        handleKeyPress();

        // Handle other updates like note falling logic
    }

    private function handleKeyPress():Void {
        if (FlxG.keys.justPressed(Keyboard.A)) {
            checkHit("A");
        } else if (FlxG.keys.justPressed(Keyboard.S)) {
            checkHit("S");
        } else if (FlxG.keys.justPressed(Keyboard.D)) {
            checkHit("D");
        } else if (FlxG.keys.justPressed(Keyboard.F)) {
            checkHit("F");
        }
    }

    // Function to check if the player hit a note
    private function checkHit(key:String):Void {
        // Check if the note is close enough to the player's timing window
        // Assuming you have a timing window for note hit accuracy
        for (note in notes) {
            if (note.key == key && Math.abs(note.time - FlxG.elapsed) < 0.1) {
                // Successful hit, handle it (e.g., remove note, update score)
                notes.remove(note);
                break;
            }
        }
    }
}
