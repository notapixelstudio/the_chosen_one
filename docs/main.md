# The Chosen One - main design document

Trying to be minimalistic for now... Square brackets denote optional features.

**Main idea**: The game asks the player to fight a dragon. First, the player creates a character. Then, they use the character in battle against the dragon in a Final Fantasy-style combat session. The battle itself is not the point though: The player will always be defeated unless they choose a specific combination of character features in the character creation screen (the combination is secret). During battle, a villain-style monologue of the dragon gives the player hints about which features are right and which aren't, like in a "Guess who?" game. If the combination is right (i.e., the player is *the chosen one*), the player will always succeed in battle. The interesting part is that the game tricks the player into believing that the battle is the relevant part of the game and that the character creation is not, while it is the exact opposite.

## Setup and splash screen
At setup, the game randomly chooses a secret set of target character features for the chosen one.

[The game starts with a splash screen with an image, the title and a short text telling the story. Then it proceeds to the character creation screen]

## Character Creation Screen
The player is asked to create a character. This step sets the values for many different character features. When ready, the player can proceed to the arena ("play" button).

## Arena
The game checks if the features of the player match the features of the chosen one. Then it shows the Arena: The player is on the left side and the dragon is on the right. [At the top, a health bar shows the dragon's remaining health.] At the bottom of the screen, a Final Fantasy-style menu alternates with dialog boxes.

### If the player is not the chosen one
[The first battle or two, the dragon follows a pre-scripted routine to let the player believe the game can be won by fighting. The routine ends with the dragon revealing that it was an act, while its health is replenished.]

Whatever the action the player chooses, it has [either a negligible or] no effect on the dragon. The dragon answer with monologue lines for 6 times, then it attacks back and kills the player. The last line from the dragon is always "You are not The Chosen One!" (Game Over screen).

Each monologue line is randomly picked from a pool. The pool contains a lot of generic lines (cackling, shouting "Wraargh", telling the player "You will never defeat me!", etc.) and feature-specific ones.
- Feature-specific lines are not provided if the feature is correct.
- [Feature-specific lines take more than one feature into account.]
- [Feature-specific lines are different according to whether the feature is correct or not.]
- [Feature-specific lines are more and more clear about the feature change they require].

Since the name is important, but also difficult to guess, we should provide a list of names or a "random" generator for them to help the player choose one by following the dragon's hints.

generic lines
- "Bwahahahaha! Fool!"
- "You'll never defeat me!"
- "I'll tear you into pieces!"
- "I'll crush you into smithereens!"
- ...

character features -> monster hints
- name (string, obtained by splitting the space in the "name" field)
	- wrong
		- "You are insignificant, human!"
		- "No one ever heard of you before! What were yout thinking when you came here to face me?"
		- "What was your name again..?"
		- "<name>... A ridiculous name for a ridiculous human!"
		- "(Singing) Hail the hero, hail <name>... It doesn't click. I believe it should rhyme with <chosen_one_name[-3:-1]>."
		- "A true hero's name should begin with <chosen_one_name[0]>"
		- "Fool! The name of The Chosen One should give a monster the shivers! For example: <chosen_one_name>! ...brrr. <name>! ...nope. Understood?"
- family_name (see above)
	- wrong
		- "Your blood is worthless!"
		- "I will eat you, then I will eat all your family too!"
		- "Your house is insignificant."
		- "Ha! Only a noble with proper training could hope to hit me!"
		- "The <family_name>s fell in disgrace many years ago... And you poor thing are what's left of them. Nothing!"
		- "No song will ever tell the story of a <family_name>!"
		- "The prophecy was about a <chosen_one_family_name>, not a <family_name>, if I remember correctly..."
- hair_type
	- long
		- wrong
			- ""
	- short
- hair_color
	- yellow
	- brown
	- black
	- white
- weapon
	- sword
	- dagger
	- staff
