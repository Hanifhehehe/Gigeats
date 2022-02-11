//
//  ContentView.swift
//  Gigit
//
//  Created by Hanif Pramono on 18/04/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            
            // MapView
            ZStack {
                MapView()
                    .ignoresSafeArea()
                    .frame(width: 430,height: 200)
                Image(systemName: "location.circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .offset(y: 50)
            
            // Card
            // Check out bawah
            ZStack {
                ForEach(Card.data.reversed()) { card in
                    CardView(card: card)
                        
                }
                
                
            }
            .offset(y: 50)
            .padding(.horizontal)
            
            
//            Spacer()
//
//            Text ("Insert details here")

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    @State var card: Card
//    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View {
        
        
        //VStack just to collapse all
        VStack {
            
            ZStack (alignment: .leading) {
                
                // Background
                ZStack {
                    Spacer()
                    Image("background")
                            .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                
                // Image
                VStack {
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(y: 0)
                    Spacer()
                }
//                LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
                    
                // Texts
                VStack (alignment: .leading) {
                    Text(card.name)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(card.category)
                }
                .padding(5)
                .background(Color.black.opacity(0.3))
                .offset (y: -80)
                .foregroundColor(.white)
                .padding()
                
                Text ("Kata orang tentang \(card.name)")
//                    .background(Color.yellow)
                    .padding(.horizontal, 20)
                    .offset(y: -15)
                
                Divider()
                
                Text("\(card.description)")
//                    .background(Color.yellow)
                    .padding(.horizontal, 20)
                    .offset(y: 20)

                
            }
            .cornerRadius(20)
            // Step 1 - ZStack follows the coordinate of the card model
            .offset(x: card.x, y: card.y)
            .rotationEffect(.init(degrees: card.degree))
            // Step 2 - gesture recogniser updates the coordinate value of the card model
            // .gesture is the animation
            .gesture (
                DragGesture ()
                    .onChanged { value in
                        // User is dragging the view
                        withAnimation(.default) {
                            card.x = value.translation.width
                            card.y = value.translation.height
                            card.degree = 7 * (value.translation.width > 0 ? 1 : -1)}
                    }
                    .onEnded { value in
                        // Do something when the user stops dragging
                        withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 8, initialVelocity: 0)) {
                            switch value.translation.width {
                            case 0...150:
                                card.x = 0; card.degree = 0; card.y = 0
                            case let x where x > 100:
                                card.x = 500; card.degree = 12
                            case (-100)...(-1):
                                card.x = 0; card.degree = 0; card.y = 0
                            case let x where x < -100:
                                card.x = -500; card.degree = -12
                            default: card.x = 0; card.y = 0
                            }
                        }})

        }
    }
}
