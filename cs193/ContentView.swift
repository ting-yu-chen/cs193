//
//  ContentView.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            ForEach(0..<4){
                index in
                if index%2 == 0{
                    CardView(isFaceUp: true)
                }
                else {
                    CardView(isFaceUp: false)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        
    }
}

struct CardView: View{
    var isFaceUp:Bool;
    var body: some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 15.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 15.0).stroke()
                Text("👻").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 15.0).fill()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
