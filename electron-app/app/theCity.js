const Story = require('inkjs').Story;
const Improv = require('improv');
const yaml = require('js-yaml');
const fs = require("fs");

/**
 * Procedurally Generated Text
 */

// Load our data from a file
const grammarData = yaml.load(fs.readFileSync(`${__dirname}/models/grammar.yaml`));

// Create a generator object from this data
const generator = new Improv(grammarData, {
	filters: [Improv.filters.mismatchFilter()],
	reincorporate: true
});

// Generate text and print it out
console.log(generator.gen('root', {}));


/**
 *  Ink Story Setup and Code
 */

//load the ink file
const inkFile = fs.readFileSync(`${__dirname}/theCityStory.json`, 'UTF-8').replace(/^\uFEFF/, ''); //strips the BOM

//create a new story
const story = new Story(inkFile);

const buildings = ['Royal Smithy', 'The Leaning Tankard', 'Lion\'s Smithy', 'Grand Cathedral', 'The Academy', 'Healers House', 'Apothecary', 'Lord\'s Manor', 'Knights Guild', 'Lion\'s Tavern', 'Market Strip', 'Lion\'s Theater', 'Royal Gardens', 'Lion\'s Inn'];
const locations = ['Religious District', 'Industrial District', 'Market & Arts District', 'Town Center', 'Residential District', 'West Gate'];
const memories = ['novicePoet', 'masterPoet'];

//Observer Functions
story.ObserveVariable("playerCharacterFlags", function (variableName, variableValue) {
	let currentValue = variableValue.keys().next().value;
	currentValue = JSON.parse(currentValue).itemName;
	console.log(currentValue);
});

continueToNextChoice();

function continueToNextChoice() {
	//check we haven't reached the end of the story
	if (!story.canContinue && story.currentChoices.length === 0) end();

	//Clear screen before we can add new content
	$('#story-panel').empty();
	$('#location-description').empty();
	$('#locations').empty();
	$('#buildings').empty()
	$('#choices').empty()

	

	//write the story to the console until we find a choice
	while (story.canContinue) {
		let currentParagraphText = story.Continue()
		let tags = story.currentTags;
		processTags(tags);

		if(tags.includes('description')) {
			$('#location-description').append(`<p class="story-paragraphs">${currentParagraphText}</p>`)
		} else {
			$('#story-panel').append(`<p class="story-paragraphs">${currentParagraphText}</p>`)
		}
		
	}

	//check if there are choices
	if (story.currentChoices.length > 0) {
		story.currentChoices.forEach((choice) => {
			let choiceButton = `<button class="locations-and-buildings" id="choice-${choice.index}">${choice.text}</button>`;
			//Check to see if the choice text is one of the locations or building and add them to the side bar
			if (locations.includes(choice.text)) {
				$('#locations').append(choiceButton)
			} else if (buildings.includes(choice.text)) {
				$('#buildings').append(choiceButton)
			} else {
				$('#choices').append(`<button class="choice" id="choice-${choice.index}">${choice.text}</button>`)
			}

			//When choice is clicked, updated the story index and rerun the loop!
			$(`#choice-${choice.index}`).on('click', () => {
				story.ChooseChoiceIndex(choice.index);
				continueToNextChoice();
			})

		});
	}
	else {
		//if there are no choices, we reached the end of the story
		end();
	}
}

function end() {
	console.log('THE END');
}

function processTags(tags) {
	let keyPair = []
	tags.forEach(tag => {
		keyPair = tag.split(':');

		if(keyPair.length === 2) {
			switch (keyPair[0]) {
				case 'LOCATION':
				  $('#current-location-title').text(keyPair[1]);
				  break;
				default:
				  console.log(`Sorry, ${keyPair[0]} was not found.`);
			  }
		}
	})
}