package states;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.Keyboard;

class ChartEditorState extends FlxState {
    var noteGrid:Array<FlxSprite>;
    var gridSize:Int = 4;  // 4x4 grid for placing notes
    var currentNote:FlxSprite;
    var noteSize:Int = 50;  // Size of each note

    override public function create():Void {
        super.create();

        // Initialize the note grid
        noteGrid = new Array<FlxSprite>();
        
        // Create the first note (place it somewhere on the screen)
        currentNote = new FlxSprite(100, 100);  // Initial position
        currentNote.loadGraphic("assets/images/note.png", true, noteSize, noteSize);  // Load the note graphic
        add(currentNote);
    }

    override public function update():Void {
        super.update();

        // Handle the movement of the note based on the controls (A, S, W, D)
        if (FlxG.keys.pressed.A) {
            // Move the note to the left
            currentNote.x -= noteSize;
        } 
        if (FlxG.keys.pressed.S) {
            // Move the note down
            currentNote.y += noteSize;
        }
        if (FlxG.keys.pressed.W) {
            // Move the note up
            currentNote.y -= noteSize;
        }
        if (FlxG.keys.pressed.D) {
            // Move the note to the right
            currentNote.x += noteSize;
        }

        // Rotate the note as it is placed
        if (FlxG.keys.justPressed.A || FlxG.keys.justPressed.S || FlxG.keys.justPressed.W || FlxG.keys.justPressed.D) {
            // Rotate the note by 90 degrees clockwise when any control is pressed
            currentNote.angle += 90;
            if (currentNote.angle >= 360) {
                currentNote.angle = 0;  // Reset angle after a full rotation
            }
        }
    }
}
