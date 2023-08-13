//
//  CoffeItemView.swift
//  rocket
//
//  Created by mohsen mokhtari on 5/31/23.
//

import SwiftUI

struct CoffeItemView: View {
    var coffe: Coffe
    var size: CGSize
    var body: some View {
        let cardSize = size.width
        let maxCardsDisplaySize = size.width * 3
        GeometryReader { proxy in
            let _size = proxy.size
           
            let offset = proxy.frame(in: .named("SCROLL")).minY - (size.height - cardSize)
            let scale = offset <= 0 ?  offset / maxCardsDisplaySize : 0
            let reducedScale = scale + 1
            let currentCardScale = offset / cardSize
            Image(coffe.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: _size.width, height: _size.height)
                .scaleEffect(reducedScale < 0 ? 0.001:reducedScale,anchor: .init(
                    x:0.5,y: 1 - (currentCardScale/2.4)))
                .scaleEffect(offset > 0 ? 1 + currentCardScale : 1 , anchor: .top)
                .offset(y:offset>0 ? currentCardScale * 200 : 0)
                .offset(y:currentCardScale * -130)
            
                
        }.frame(height: cardSize)
         
    }
}

struct CoffeItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeListView()
    }
}
