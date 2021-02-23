//
//  CardifyViewModifier.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/23.
//

import SwiftUI

struct CardifyViewModifier: ViewModifier {
    var isFaceUp:Bool
    func body(content: Content) -> some View{
        return ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                content
            }
            else{
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
    
    private let cornerRadius:CGFloat = 12.0
    private let lineWidth:CGFloat = 2.0
}

extension View {
    func cardify(isFaceUp:Bool)-> some View{
        self.modifier(CardifyViewModifier(isFaceUp: isFaceUp))
    }
}
