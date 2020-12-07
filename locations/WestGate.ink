=== WestGate ===
# LOCATION: West Gate

The gate stands tall, made of vibrant orange bricks. The bustle of travelers a constant background noise as town guards try to keep things somewhat organized. Strong scents of ginger linger in the air. # description

{
    - not talkToGuard and not examineBooth: 
    As you approach the West Gate you marvel at the tall vibrant orange bricked walls that surround the city. This combined with the strong scent of ginger makes you realize the influence of the towns name. You notice a town guard posted at the gate and a small booth with a crowd right outside the gate.
    - else:
        You notice {talkToGuard: Leora|a guard} deep in conversation with another traveler who {~is towing a myriad of old books|is dressed in old regal wear|seems to be part of a traveling troupe|is covered in ancient runes|is covered in gold cloth|is wearing fine jewelry|is waving a bag of coins|is holding a small pig|seems to be performing a magic trick}, and a small {examineBooth: Gingera tunic} booth with a crowd right outside the gate.
        
}

* [Talk to Guard.] -> talkToGuard ->
* [Examine Booth.] -> examineBooth ->
* [Pass through the gate.] 

- ->->

= talkToGuard

As you approach the guard you notice them engrossed in a conversation with a merchant. You catch snippets of the conversation as you wait for them to finish in the bustle of travelers coming through. 

"No no, it's true. These apples really do taste like oranges," the merchant says. The guard frowns, staring at the merchant and their cart full of apples.

"I just don't see the value in these. If you wanted an orange, wouldn't you just eat one?" The guard asks.

"It is not the taste but the <em>experience</em> I'm selling. The novelty of it all. Truly you see that?" The merchant says, making grand gestures with their hands as if to add to the wonder of it all. The guard sighs.

"Alright, you can set up shop in the Market Strip. There should be some space in the eastern section. If not, head to the manor and ask to see Lady Vera," the guard says. The merchant smiles in delight and claps their hands together.

"You won't be dissapointed! Truly you have brought wonder to your town," the merchant says. The guard waves him off and the merchant heads into the city. The guard then notices you standing in the crowd and smiles as they wave you closer.

"Well met traveler! The name is Leora. How can I help you?" the guard asks{Souvenirs == gingeraTunic:, then she points at your tunic. "I see you got one! I really like the design this year. Looks good on you," she says. <>|.}

You {Souvenirs == gingeraTunic: thank her and |}introduce yourself.

- (optsGuard)

* [Ask about the city.]
    "What can you tell me about Gingera?" you ask. The guard laughs.
    
    "First time? Well for starters, you'll notice the scent a lot less the longer you stay," she says. She starts to speak again but pauses holding up a finger. "Just a minute, hey, hey—," she walks over and seems to be in a lively discussion with another traveler. 
    
    After a few exchanges she heads back to you. "Sorry about that," she says and rubs the back of her neck. "Now, the city right? Well we mainly export various gingers, coal, and steel. We have a mine close by and if you hadn't notice ginger grows like weeds around here." She chuckles. "We also have a thriving arts district so be sure to check it our before you leave!"
    -- (optsGuard2)
    ** [Ask about the wall color.]
        "Why are your city walls orange?" you ask, you've never seen a wall that vibrant an orange. The guard looks up at the towering stones behind her. 
        
        "Honestly? I'm not quite sure, but rumor has it that a brick layer had bought some tumeric to take home after work. By pure happenstance she accidently dumped the tumeric in her brick mix. Not wanting to start again she simply laid the bricks with tumeric, which gave them a vibrant orange hue. The current Lord at the time, Lord Mara, saw this and was so enamored, she ordered the whole wall to be done this way."
        
        The guard pauses again and looks at the gate. She turns back to you. "Not sure if that's true but its what my Grandma used to tell me." She smiles, her brown eyes sparkling. "Could never tell if she was being sincere or lying out her ass," she says. 
        
    ** (askGuardArts)[Ask about the Arts District]
        "What should I make sure to see in the Arts District?" you ask. The guard stops and thinks before answering.
        
        "Well, officially it's called the Market and Arts District, but people just call it the Arts District for short. I'd say definetly check out the theater if you have the chance. They have a showing every evening," she pauses, her arms folded in contemplation. "Theres also the market strip. It's full of fine wonders and wares, and the inn doubles as a poetry reading spot in the evenings. If you fancy yourself a soneteer, you should try sharing one of your works!" she says.
        
    ** {askGuardArts}[Poetry?]
        "Can you tell me more about this poetry reading?" you ask.
        
        "Oh, so you do fancy yourself a poet?" the guard responds.
        
        *** (just_curious)[No, just curious.]
            "Ah, no, was just curious." you say. The guard smirks at you.
            
            "Thats how it starts," she says with a wink.
        *** [Yes, but your just starting out.]
            ~ PlayerCharacterFlags = novicePoet
            "I would say more novice poet but, yes, I am," you say.
        *** [Yes, and your quite accomplished.]
            ~ PlayerCharacterFlags = masterPoet
            "Yes I am," you say. The guards eyes go wide.
        --- 
        { not just_curious: "Well, well! You should really stop by, I'm sure they'd love to have you!" she says.}
        <> She folds her arms and leans back. "Well, lets see. It happens most evenings. It's pretty casual so you can really read whatever. Don't worry about it being perfect. Its really just about sharing words with others."
        
    ** {not askAboutMerchant}[Ask about a different topic.] -> optsGuard
    ** {askAboutMerchant} [Thats all the questions you had.] -> goodbye
    -- (guard1)
        {
            - optsGuard2 == 1:
                The guard pauses and looks at the gate. "I've got time for about one more question, but then I need to see to the others," the guard says and points to the small queue forming behind you.
                ->optsGuard2
            - else:
                The guard stops and walks away from you for a bit, barking orders to someone you can't see in the crowd. She returns and gives you a smile. "Sorry I couldn't answer all your question but duty calls!" She waves one of the people behind you forward. As you begin to walk away she calls out to you. "If you want I'm usually at The Leaning Tankard in the evenings. Stop by and I can answer more of your questions!"
                
               ** [Head back to gate entrance.]  -> WestGate
        }
        -> DONE
* (askAboutMerchant)[Ask about the merchant.]
    "About that merchant you were talking with earlier—" you begin.
    
    "Oh, that one," she interrupts, "He comes here regularly with some new <em>experience</em> to sell. Most of it I find a bit, disengenous if you ask me. Last time he came here selling purple bananas. No taste difference. They were just purple," she says and rubs her temples in fustration. "But, he's really popular," she sighs. "I'll never understand." 
    
    {
        - optsGuard2 > 1: 
            -> guard1
        
        - else: 
        A noise catches her attention and she looks at the gate. Once satisfied it isn't anything worrying she turns back to you, "Was there anything else?"
    }
    
    -> optsGuard
* [{Nevermind.|See ya later.}]
- (goodbye)
    {optsGuard == 1: "Ah sorry, was just saying hi!" you say. The guard smiles and nods.| "Gotta go, but thanks for the information," you say.}
    
    "Well met {playerName}, enjoy your visit to Gingera," she says and goes back to managing her post.
    
    ** [Head back to gate entrance.]  -> WestGate

= examineBooth

As you try to work your way through the crowd to see what all the commotion is about, you hear a loud voice addressing the curious travelers.

"—never before seen design. Come get your authentic Gingeria tunic! Comes in all sizes! Only five silver coins folks," the seller yells. The crowd oo's and aw's. As you get close enough to examine the tunic, you see its a simple brown cloth with an elaborate stitched design of a ginger plant in yellow thread.

You examine your coin bag and count {silverCoins} silver coins. Five is slightly pricey but not unreasonable.

- (optsBooth)
* [Buy tunic.]
    ~ silverCoins -= 5
    ~ Souvenirs += gingeraTunic
    You push through and ask for your size. You pay the seller and they hand you your Gingera tunic.
    
    "The best purchase you'll make your entire stay," the seller says. You nod and walk away from the booth. You slip on the tunic, the fabric soft on your skin.
    
    ** [Head back to gate entrance.] 
        You head back to the gate entrance.
        -> WestGate
    
* [Ask about tunic.]
    You try to stretch above the crowd and with your hands cupping your mouth you yell, "What are these tunics?" The seller turns to you and points in your direction.
    
    "Only one of the finest souveniers you can get from Gingera," the seller says.
    ->optsBooth
* [Leave.] 
You head back to the gate entrance
-> WestGate