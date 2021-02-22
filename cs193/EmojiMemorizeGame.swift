//
//  EmojiMemorizeGame.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/20.
//

import Foundation
import SwiftUI


// ViewModel
// ObservableObject only valid for class, and we get ObjectWillChangePublisher var for free
// we can call ObjectWillChangePublisher.send() to publish the change to the world so that the View notice!
// add the property wrapper @Published: whenever the property change, it calls ObjectWillChangePublisher.send() automatically

class EmojiMemorizeGame: ObservableObject{
    // access to model
    static let theme1 = Theme<String>(name: "Halloween", emojiSet: ["👻", "💀", "🎃", "🍬", "😈" ], color: Color.orange)
    static let theme2 = Theme<String>(name: "Food", emojiSet: [ "🍎", "🍔", "🍕", "🍰", "🍣"], color: Color.green)
    static let theme3 = Theme<String>(name: "Sport", emojiSet: ["🏀", "⚽️", "🏈", "🥎", "🎱"], color: Color.blue)
    static let themes:[Theme<String>] = [theme1, theme2, theme3]
    // add a theme by creating a Theme and append to the array 

    static func createNewGame(themes: [Theme<String>])->MemorizeGame<String>{
        let randomThemeIdx = Int.random(in: 0..<themes.count)
        let numberOfPairs = Int.random(in: 3..<themes[randomThemeIdx].emojiSet.count)
        // can be inlining in the function
        func createCardcontent(PairIndex:Int) -> String{
            return themes[randomThemeIdx].emojiSet[PairIndex];
        }
        return MemorizeGame<String>(numberOfPairs: numberOfPairs, cardInitFunction: createCardcontent, theme: themes[randomThemeIdx])
    }
    
    @Published private var memorizeGame: MemorizeGame<String> = createNewGame(themes: themes);
    
    // provide access of Model for View
    // ViewModel : present the Model for the View
    var cards:Array<MemorizeGame<String>.Card>{
        return memorizeGame.cards
    }
    
    // MARK: intents
    func choose(card: MemorizeGame<String>.Card){
        return memorizeGame.choose(card: card)
    }
    
    func restart(){
        memorizeGame = EmojiMemorizeGame.createNewGame(themes: EmojiMemorizeGame.themes);
    }
    
    func getThemeName()-> String{
        return memorizeGame.theme.name 
    }
    
    func getThemeColor()-> Color{
        return memorizeGame.theme.color
    }
}
