//
//  ContentView.swift
//  Memorize
//
//  Created by Gustavo Martins on 09/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗", "🛵", "🚚", "🚜", "🏎️",  "🚀", "✈️", "🚁", "🛳️", "🏍️", "🛶", "⛵️", "🚊", "🚲", "🚑", "🚠", "🚂", "🛸", "⛴️", "🛺", "🚌", "🚓", "🚒", "🚇"]
    let vehiclesEmojis = ["🚗", "🛵", "🚚", "🚜", "🏎️",  "🚀", "✈️", "🚁", "🛳️", "🏍️", "🛶", "⛵️", "🚊", "🚲", "🚑", "🚠", "🚂", "🛸", "⛴️", "🛺", "🚌", "🚓", "🚒", "🚇"]
    let foodsEmojis = ["🍔", "🥨", "🥐", "🍕", "🥙", "🌮", "🍝", "🍙", "🍰", "🍿", "🍫", "🥗", "🍩", "🥪"]
    let sportsEmojis = ["⚽️", "🏀", "🏈", "⚾️", "⛸️", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏒", "🛹", "🏹", "🥊", "🥍"]
    
    @State var emojiCount = 8
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
                
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack{
                vehiclesTheme
                Spacer()
                foodsTheme
                Spacer()
                sportsTheme
            }
            .font(.largeTitle)
            .padding(.horizontal, 60.0)

        }
        .padding(.horizontal)

    }
    
    var vehiclesTheme: some View {
        Button {
            emojis = vehiclesEmojis.shuffled()
            emojiCount = Int.random(in: 8...24)
        } label: {
            VStack{
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.footnote)
            }
        }
    }
    
    var sportsTheme: some View {
        Button {
            emojis = sportsEmojis.shuffled()
            emojiCount = Int.random(in: 8...16)
        } label: {
            VStack{
                Image(systemName: "football")
                Text("Sports")
                    .font(.footnote)
            }
        }
    }
    
    var foodsTheme: some View {
        Button {
            emojis = foodsEmojis.shuffled()
            emojiCount = Int.random(in: 8...14)
        } label: {
            VStack{
                Image(systemName: "fork.knife")
                Text("Foods")
                    .font(.footnote)
            }
        }
    }
}
 
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
 














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
