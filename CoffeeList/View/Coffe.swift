//
//  Coffe.swift
//  rocket
//
//  Created by mohsen mokhtari on 5/31/23.
//

import Foundation

struct Coffe: Identifiable {
    var id: UUID = UUID()
    var image: String
    var title: String
    var price: Double
    var description: String = ""
}

var coffees: [Coffe] = [
        .init(image: Images.coffe1, title: "Cappuccino", price: 2.5),
        .init(image: Images.coffe2, title: "Espresso", price: 3.9),
        .init(image: Images.coffe3, title: "Latte", price: 3.5),
        .init(image: Images.coffe4, title: "Mocha", price: 10),
        .init(image: Images.coffe5, title: "Americano", price: 5),
        .init(image: Images.coffe6, title: "Macchiato", price: 4.3),
        .init(image: Images.coffe7, title: "Flat White", price: 6),
        .init(image: Images.coffe8, title: "Long Black", price: 5.5),
]
