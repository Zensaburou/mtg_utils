# Mana Curve Calculator

A small ruby app that outputs the mana curve of an MTG deck.

### Usage

Deck files are parsed according to the `.dec` format (see [here](http://www.deckedbuilder.com/faq.html) for details)

The app requires two arguments:

    1) A comma separated list of the abbreviated set names used in the deck
    2) The path to the `.dec` file

Example:

    A deck using cards from "Eldritch Moon" and "Shadows Over Innistrad" can be analyzed by running
    `$ ruby init_app.rb EMN,SOI ./decks/example_deck.dec`
