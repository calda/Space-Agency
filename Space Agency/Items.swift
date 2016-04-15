//
//  Items.swift
//  Space Agency
//
//  Created by Cal on 4/13/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

let SAItems = [
    
    Item(name: "Fireworks", income: 10, price: 100, desc: "You figure you have to start your space program somewhere, so you go out to Joe's Wacky Rocket Shack and pick up a few 4th of July fireworks on clearence. This will be some valuable science."),
    
    Item(name: "Bottle Rocket", income: 100, price: 800, desc: "After a few close shaves and burnt eyebrows, you finally figure out this whole \"rocket\" thing. TODO: Maybe pick up some Mentos."),
    
    Item(name: "Weather Balloon", income: 500, price: 10000, desc: "With a bottle rocket altitude record of an astounding 146 meters, you realize that a balloon could get a little bit higher."),
    
    Item(name: "Missile", income: 1500, price: 35000, desc: "Your military thinks you should be doing something a little more productive. They enlist you to create missles to \"protect democracy\"."),
    
    Item(name: "ICBM", income: 5000, price: 100000, desc: "Those missles were impressive, but the only way to make them go farther is to make them even bigger.")
]


class Item {
    
    let name: String
    let income: Int
    let price: Int
    let description: String
    
    var unlocked: Bool = false
    var count = 0
    
    init(name: String, income: Int, price: Int, desc: String) {
        self.name = name
        self.income = income
        self.price = price
        self.description = desc
    }
    
}