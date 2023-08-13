//
//  CoffeHeaderItem.swift
//  rocket
//
//  Created by mohsen mokhtari on 5/31/23.
//

import SwiftUI

struct CoffeHeaderItem: View {
    @Binding var currentIndex:CGFloat
    var body: some View {
        VStack{
            GeometryReader{
                let size = $0.size
                
                HStack(spacing:0){
                    ForEach(coffees){ coffe in
                        VStack(spacing:15){
                            Text(coffe.title)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("$\(String(format:"%g", coffe.price))")
                                .font(.title)
                        }
                        .frame(width:size.width)
                    }
                }
                .offset(x:currentIndex * -size.width)
                .animation(.interactiveSpring(response: 0.6,dampingFraction: 0.8,blendDuration: 0.8), value: currentIndex)
            }
        }.padding(.top,10)
    }
}

struct CoffeHeaderItem_Previews: PreviewProvider {
    static var previews: some View {
       CoffeListView()
    }
}
