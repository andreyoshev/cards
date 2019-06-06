//
//  ContentView.swift
//  cards
//
//  Created by Andrey Oshev on 06/06/2019.
//  Copyright © 2019 oshev. All rights reserved.
//

import SwiftUI

struct Card: Identifiable {
    var id: Int
    
    let ru: String
    let eng: String
}

struct CardView : View {
    
    let card: Card
    
    var body: some View {
        Text(card.eng)
        .font(.system(size: 32, design: .monospaced))
    }
}

struct ContentView : View {
    
    let cards: [Card] = [
        .init(id: 0, ru: "Привет", eng: "Hello"),
        .init(id: 1, ru: "Библиотека", eng: "Library"),
        .init(id: 2, ru: "Лето", eng: "Summer"),
        .init(id: 3, ru: "Снег", eng: "Snow"),
        .init(id: 4, ru: "Яблоко", eng: "Apple"),
        .init(id: 5, ru: "Автомобиль", eng: "Car")
    ]
    
    let cardsPadding: UIEdgeInsets = .init(top: 30, left: 22, bottom: 200, right: 22)
    
    var body: some View {
        ScrollView(showsHorizontalIndicator: false) {
            HStack(spacing: 22) {
                ForEach(cards) {
                    CardView(card: $0)
                    .frame(width: UIScreen.main.bounds.width - self.cardsPadding.left - self.cardsPadding.right,
                           height: UIScreen.main.bounds.height - self.cardsPadding.bottom)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.battleshipGrey.opacity(0.25), radius: 15, x: 0, y: 2)
                }
            }
            .padding([.leading, .trailing], cardsPadding.left)
            .padding([.top], cardsPadding.top)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
