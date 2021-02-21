//
//  EmojiMemorizeGame.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/20.
//

import Foundation
import SwiftUI


// ViewModel
class EmojiMemorizeGame{
    // access to model
    static let emojisSet = ["👻", "💀", "🎃", "🍬", "😈", "🎄", "🌈", "☃️", "🍎", "🍔" ].shuffled()
    //static let shuffledEmojiSet = emojisSet.shuffled()
    static let numberOfPairs = Int.random(in: 2...5)
    private var memorizeGame: MemorizeGame<String> = MemorizeGame<String>(numberOfPairs: numberOfPairs, cardInitFunction: createCardcontent);
    
    // can be inlining in the function
    static func createCardcontent(PairIndex:Int) -> String{
        return emojisSet[PairIndex];
    }
    
    // provide access of Model for View
    // ViewModel : present the Model for the View
    var cards:Array<MemorizeGame<String>.Card>{
        return memorizeGame.cards
    }
    
    // MARK: intents
    func choose(card: MemorizeGame<String>.Card){
        return memorizeGame.choose(card: card);
    }
}
