//
//  MemoryGame.swift
//  Memorize
//
//  Created by Gustavo Martins on 01/08/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var card: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
