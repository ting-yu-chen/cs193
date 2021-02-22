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
        VStack{
            HStack{
                Text(game.getThemeName())
                Spacer()
                Text("Score")
            }
            Divider()
            GridView(items: game.cards){
                // SwiftUI only re-draws the part really changed
                card in
                CardView(card: card).onTapGesture {game.choose(card:card)}
            }
            
            Button("New Game"){
                game.restart()
            }.buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .foregroundColor(game.getThemeColor())
        
    }
}

struct CardView: View{
    var card: MemorizeGame<String>.Card
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
                        //.aspectRatio(aspectRatio, contentMode: .fit)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: lineWidth)
                        //.aspectRatio(aspectRatio, contentMode: .fit)
                    Text(card.cardContent)
                }
                else{
                    if !card.isMatched{
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill()
                    }
                }
            }.font(Font.system(size: FontScale(geometry_size: geometry.size)))
            .padding(1.5)
        }
    }
    
    // drawing constant
    //let aspectRatio:CGFloat = 2/3
    let cornerRadius:CGFloat = 12.0
    let lineWidth:CGFloat = 2.0
    func FontScale(geometry_size:CGSize) -> CGFloat{
        return min(geometry_size.width, geometry_size.height)*0.6
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // create viewModel on fly for preview
        ContentView(game:EmojiMemorizeGame())
    }
}
