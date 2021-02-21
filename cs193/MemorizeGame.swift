//
//  MemorizeGame.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/20.
//

import Foundation

// model
struct MemorizeGame<CardType>{
    var cards:Array<Card>
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var cardContent:CardType
    }
    
    init(numberOfPairs:Int, cardInitFunction: (Int)->CardType){
        cards = Array<Card>()  // initialize the cards by empty array
        // the initialization of card content should be done by ViewModel
        // because Model doesn't know the type and content, just provides logic
        // use function type as parameters, so that the ViewModel can pass a proper function for it
        for i in 0..<numberOfPairs{
            cards.append(Card(cardContent: cardInitFunction(i)))
            cards.append(Card(cardContent: cardInitFunction(i)))
        }
        cards.shuffle()
    }
    
    func choose(card: Card){
        print("choose a \(card)")
    }
}

