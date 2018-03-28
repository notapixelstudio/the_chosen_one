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

- Player's turn
	1. Choose either "Attack", "Item", "Magic" or "Run" (this will play a different animation, but it always have the same effect except for "Run", that essentially quits the battle and transitions directly to the Game Over screen)
	2. Player animation
	3. Dragon damage animation
- Dragon's turn
	- either a Monologue line (any key to continue, may be more than a single one. proceeding when the last line is displayed passes the turn back to the player)
	- or an attack (6th turn)

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
- "I'll tear you into little pieces!"
- "I'll crush you into smithereens!"
- "You are just a tiny human..."
- "How dare you to face **me**?"
- "Courage and recklessness are two faces of the same medal."
- "Stupid human!"
- "Mmm... I am hungry."
- "There's nothing you can do to win this fight!"
- "You are hopeless, like the rest of humankind."
- "Has your kingdom ran out of fighters?"
- "Why are you even trying?"
- "My power is boundless."
- ...

character features -> monster hints
- name (string, obtained by splitting the space in the "name" field)
	- wrong
		- "You are insignificant, human!"
		- "No one ever heard of you before! What were yout thinking when you came here to face me?"
		- "What was your name again..?"
		- "(name)... A ridiculous name for a ridiculous human!"
		- "(Singing) Hail the hero, hail (name)... It doesn't click. I believe it should rhyme with (chosen_one_name[-3:-1])."
		- "A true hero's name should begin with (chosen_one_name[0])"
		- "Fool! The name of The Chosen One should give a monster the shivers! For example: (chosen_one_name)! ...brrr. (name)! ...nope. Understood?"
- family_name (see above)
	- wrong
		- "Your blood is worthless!"
		- "I will eat you, then I will eat all your family too!"
		- "Your house is insignificant."
		- "Ha! Only a noble with proper training could hope to hit me!"
		- "The (family_name)s fell in disgrace many years ago... And you poor thing are what's left of them. Nothing!"
		- "No song will ever tell the story of a (family_name)!"
		- "The prophecy was about a (chosen_one_family_name), not a (family_name), if I remember correctly..."
- hair_type
	- long
		- wrong
			- ""
			- ""
			- "Such long hair and such a short life... what a pity!"
			- "Are you an idiot? That haircut is way too impractical for a boss fight!"
	- short
		- wrong
			- ""
			- ""
			- "The Prophecy was wrong... The Chosen One is said to have beautiful, long hair. -- But wait... Prophecies are never wrong!"
- hair_color
	- yellow
		- wrong
			- "Poor creature... you remind me of a little, harmless canary."
	- green
		- wrong
			- "Great! You arrived just in time for my new veggie diet!"
	- pink
		- wrong
			- "I'll chew you like bubblegum!"
	- black
		- wrong
			- "Mmm... Am I supposed to be scared by a tenebrous figure? I am a **monster**, remember?"
	- white
		- wrong
			- "Poor little angel. I'll send you back to heaven in a minute."
	- blue
		- wrong
			- "I feel like Gargamel..."
			- "Roses are red, humans are blue / I just can't eat flowers, so I will eat you."
- weapon
	- wrong
		- "I get that the toy shop has cheaper prices, but still..."
		- "Bring a serious weapon next time, ok? -- Oh, there's no next time for you. Dang."
	- sword
		- wrong
			- "Being unoriginal will not save you, nor anyone else."
			- "Oh, you like classic choices! Me too. I always eat humans with no fancy spices or sauce."
			- "A sword! How unexpected! Us dragons are so unfamiliar with the concept of heroes with swords that we are always caught by surprise when they show up..."
	- dagger
		- wrong
			- "It's not like they say, you know? The size **does** matter!"
			- "Sorry, no toothpicks allowed here."
			- "Was a proper, bigger weapon too heavy to carry? Oh, I can totally relate."
	- staff
		- wrong
			- "This is not a hike. This is a battle."
			- "Afraid of sharp objects? Mee too."
			- "Oh, I suppose the blacksmith was already closed..."
			- "Even a putter would hurt me more than that wood you carry!"
			- "Wrong place. The pool billiard house is two blocks south from here."

## Game structure

0. load persistent data
1. if there is no chosen one, secretly create a random one and persist it
2. if there is no previous character, create a random one and persist it
3. character creation -> each change persists
4. arena -> comparison ("dragon's algorithm')
5. execution of battle and monologue
6. end of the match
  1. if character is the chosen one, you win. then all persistent data is cleared
  2. if the character is not the chosen one, you lose. (all persistent data stay persistent! restarting or reopening the game should have the same effect)

## Dragon's algorithm
