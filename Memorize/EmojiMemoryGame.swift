//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Gustavo Martins on 01/08/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚌","🏎","🚀","🚅","🚜","🛵","🚁","🛳","🚗","🛻","🚲","🛸","🚚"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    
    // Essa é uma outra forma de acessar algum elemento do Model sem pertimir que ele seja modificado.
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        //objectWillChange.send() -> uma possibilidade, mas usaremos o @published junto a declaração do model.
        model.choose(card)
    }
}
