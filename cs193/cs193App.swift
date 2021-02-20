//
//  cs193App.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/19.
//

import SwiftUI

@main
struct cs193App: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemorizeGame()
            ContentView(game:game)
        }
    }
}
