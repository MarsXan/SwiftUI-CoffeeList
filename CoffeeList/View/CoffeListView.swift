//
//  CoffeListView.swift
//  rocket
//
//  Created by mohsen mokhtari on 5/31/23.
//

import SwiftUI

struct CoffeListView: View {
    @State var offsetY: CGFloat = 0
    @State var currentIndex: CGFloat = 0
    var body: some View {
        VStack{
            GeometryReader {
                let size = $0.size
                let cardSize = size.width
                
                LinearGradient(
                    colors:
                        [
                            .clear,
                            Color.brown.opacity(0.2),
                            Color.brown.opacity(0.45),
                            Color.brown
                        ], startPoint: .top, endPoint: .bottom)
                .frame(height:300)
                .frame(maxHeight: .infinity,alignment: .bottom)
                .ignoresSafeArea()
                
                CoffeHeaderItem(currentIndex: $currentIndex)
                
                VStack(spacing: 0) {
                    ForEach(coffees) { coffe in
                        CoffeItemView(coffe: coffe, size: size)
                    }
                }.frame(width: size.width)
                    .padding(.top, size.height - cardSize)
                    .offset(y: offsetY)
                    .offset(y: -currentIndex * cardSize)
            }
            .contentShape(Rectangle())
            .coordinateSpace(name: "SCROLL")
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        // slowing down the gesturee
                        offsetY = value.translation.height * 0.4
                    }).onEnded({ value in
                        let translation = value.translation.height
                        
                        withAnimation(.easeInOut) {
                            if translation > 0 {
                                if currentIndex > 0 && translation > 250 {
                                    currentIndex -= 1
                                }
                            } else {
                                if currentIndex < CGFloat(coffees.count - 1) && -translation > 250 {
                                    currentIndex += 1
                                }
                                
                            }
                            offsetY = .zero
                        }
                    })
            )}
            .preferredColorScheme(.light)
            .navigationBarBackButtonHidden(true)
    }
}

struct CoffeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeListView()
    }
}
