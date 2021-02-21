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
    
    // Identifiable -> constraints and gain
    // we have to add id but we gain other functions from it 
    struct Card : Identifiable{
        var isFaceUp = true
        var isMatched = false
        var cardContent:CardType
        var id:Int
    }
    
    init(numberOfPairs:Int, cardInitFunction: (Int)->CardType){
        cards = Array<Card>()  // initialize the cards by empty array
        // the initialization of card content should be done by ViewModel
        // because Model doesn't know the type and content, just provides logic
        // use function type as parameters, so that the ViewModel can pass a proper function for it
        for i in 0..<numberOfPairs{
            cards.append(Card(cardContent: cardInitFunction(i), id: 2*i))
            cards.append(Card(cardContent: cardInitFunction(i), id: 2*i+1))
        }
        cards.shuffle()
    }
    // Because Card is struct, it's passed by value
    // the card in choose func is a copy 
    mutating func choose(card: Card){
        print("choose a \(card)")
        self.cards[index(of: card)].isFaceUp = !self.cards[index(of: card)].isFaceUp
    }
    
    func index(of card: Card) -> Int{
        for i in 0..<cards.count{
            if cards[i].id == card.id {
                return i;
            }
        }
        return 0;
    }
}

