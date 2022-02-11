//
//  Cards.swift
//  Gigit
//
//  Created by Hanif Pramono on 18/04/21.
//

import UIKit

struct Card: Identifiable {
//    let id = UUID()
    let id: Int
    let name: String
    let imageName: String
    let category: String
    let description: String
    
    
    // Card x position
    var x: CGFloat = 0.0
    // Card y position
    var y: CGFloat = 0.0
    // Card rotation angle
    var degree: Double = 0.0
    

    
    static var data: [Card] {
        [
            Card(id: 1,name: "Osteria Gia", imageName: "i01", category: "Italian Restaurant", description: "Eh gila cuma 20 rebu bisa kenyang!"),
            Card(id: 2,name: "Paris Sorbet", imageName: "i02", category: "Dessert Parlor", description: "Ey cyiiin topoto yukss!!"),
            Card(id: 3,name: "Kashiwa", imageName: "i03", category: "Japanese Restaurant", description: "Diet?? Jaman?"),
            Card(id: 4,name: "Pippo", imageName: "i04", category: "Italian Restaurant", description: "Best place for bukber! takjilnya mantap!"),
            Card(id: 5,name: "Kaum", imageName: "i05", category: "Indonesian Restaurant", description: "Enak dan murah banget loh!!"),
            Card(id: 6,name: "Yoisho Ramen", imageName: "i06", category: "Japanese Restaurant", description: "Indomie? apaan tuh?"),
            Card(id: 7,name: "Furusato Izakaya", imageName: "i07", category: "Japanese Restaurant", description: "AHAHAHAHA HARI GINI HOKBEN!?!")
        ]
    }
}
