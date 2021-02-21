//
//  ContentView.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/19.
//

import SwiftUI
// View here
// View wants to access the Model by ViewModel
// show the current state of the model 
struct ContentView: View {
    var game: EmojiMemorizeGame
    // it's the ViewModel, a class
    // it should be created when this ContentView is created
    // body is called by the system
    var body: some View {
        HStack{
            // if you want to put ForEach(game.cards)
            // cards need to be identifiable by adding id to cards
            ForEach(0..<game.cards.count){
                index in
                CardView(card: game.cards[index], numberOfCards: game.cards.count)
                    .onTapGesture(perform: {
                        game.choose(card:game.cards[index])
                    })
            }
        }
        .padding()
        .foregroundColor(.orange)
        
    }
}

struct CardView: View{
    var card: MemorizeGame<String>.Card
    var numberOfCards:Int
    // because we declare string in the ViewModel
    // it's initialize by the cardView in ContentView
    //if numberOfPair < 5 ? .largeTitle : .title
    //let fontSize =  numberOfPairs < 5 ? Font.largeTitle : Font.title
    var body: some View{
        // declaring var in View builder (ZStack) is not allowed 
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color.white)
                    .aspectRatio(0.66, contentMode: .fit)
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke()
                    .aspectRatio(0.66, contentMode: .fit)
                CardContentView(card: card, numberOfCards: numberOfCards)
                //Text(card.cardContent).font()
            }
            else{
                //RoundedRectangle(cornerRadius: 15.0).fill()
                RoundedRectangle(cornerRadius: 15.0)
                    .fill()
                    .aspectRatio(0.66, contentMode: .fit)
            }
        }
    }
}

struct CardContentView: View{
    var card: MemorizeGame<String>.Card;
    var numberOfCards:Int
    var body: some View{
        if numberOfCards >= 10 {
            return Text(card.cardContent).font(.title)
        }
        else{
            return Text(card.cardContent).font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // create viewModel on fly for preview
        ContentView(game:EmojiMemorizeGame())
    }
}
