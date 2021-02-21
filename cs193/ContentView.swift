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
    @ObservedObject var game: EmojiMemorizeGame
    // this var has a observable object
    // when it changes, we re-draw the UI
    
    // it's the ViewModel, a class
    // it should be created when this ContentView is created
    // body is called by the system
    var body: some View {
        HStack(alignment: .center){
            // SwiftUI only re-draws the part really changed
            ForEach(game.cards){
                card in
                CardView(card: card, numberOfCards: game.cards.count)
                    .onTapGesture(perform: {
                        game.choose(card:card)
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
        GeometryReader{ geometry in
            // declaring var in View builder (ZStack) is not allowed
            ZStack(alignment: .center){
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.white)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: lineWidth)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                    Text(card.cardContent)
                }
                else{
                    //RoundedRectangle(cornerRadius: 15.0).fill()
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill()
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }.font(Font.system(size: FontScale(geometry_size: geometry.size)))
        }
    }
    
    // drawing constant
    let aspectRatio:CGFloat = 2/3
    let cornerRadius:CGFloat = 12.0
    let lineWidth:CGFloat = 2.0
    func FontScale(geometry_size:CGSize) -> CGFloat{
        return min(geometry_size.width, geometry_size.height)*0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // create viewModel on fly for preview
        ContentView(game:EmojiMemorizeGame())
    }
}
