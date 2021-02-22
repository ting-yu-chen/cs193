//
//  MemorizeGame.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/20.
//

import Foundation
import SwiftUI

struct Theme<themeType>{
    var name:String
    var emojiSet:[themeType]
    var color:Color
    init(name: String, emojiSet: [themeType], color: Color){
        self.name = name
        self.emojiSet = emojiSet.shuffled()
        self.color = color 
    }
    
}

// model
struct MemorizeGame<CardType> where CardType:Equatable{
    var cards:Array<Card>
    var OnlyOneFaceUpCard:Int?
    var theme:Theme<CardType>
    
    // Identifiable -> constraints and gain
    // we have to add id but we gain other functions from it 
    struct Card : Identifiable{
        var isFaceUp = false
        var isMatched = false
        var cardContent:CardType
        var id:Int
    }
    
    init(numberOfPairs:Int, cardInitFunction: (Int)->CardType, theme:Theme<CardType>){
        cards = Array<Card>()  // initialize the cards by empty array
        // the initialization of card content should be done by ViewModel
        // because Model doesn't know the type and content, just provides logic
        // use function type as parameters, so that the ViewModel can pass a proper function for it
        for i in 0..<numberOfPairs{
            cards.append(Card(cardContent: cardInitFunction(i), id: 2*i))
            cards.append(Card(cardContent: cardInitFunction(i), id: 2*i+1))
        }
        cards.shuffle()
        self.theme = theme;
    }
    // Because Card is struct, it's passed by value
    // the card in choose func is a copy 
    mutating func choose(card: Card){
        // comma is sequential &&
        if let chosenIdx = cards.firstIndex(matching: card), !cards[chosenIdx].isFaceUp, !cards[chosenIdx].isMatched {
            cards[chosenIdx].isFaceUp  = !cards[chosenIdx].isFaceUp
            if let onlyFaceUp = OnlyOneFaceUpCard{
                if cards[chosenIdx].cardContent == cards[onlyFaceUp].cardContent{
                    cards[chosenIdx].isMatched = true
                    cards[onlyFaceUp].isMatched = true
                }
                OnlyOneFaceUpCard = nil
            }
            else{
                for i in 0..<cards.count{
                    cards[i].isFaceUp = false
                }
                OnlyOneFaceUpCard = chosenIdx;
                cards[chosenIdx].isFaceUp = true
            }
        }
        // else do nothing
    }
    
}

