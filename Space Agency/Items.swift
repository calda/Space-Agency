//
//  Items.swift
//  Space Agency
//
//  Created by Cal on 4/13/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

let SAItems = [
    
    Item(name: "Bottle Rocket", income: 10, price: 100, desc: "You figure you have to start your space program somewhere, so you go out to your local superstore and pick up a few 2-liter bottles. TODO: Maybe pick up some Mentos."),
    
    Item(name: "Fireworks", income: 100, price: 800, desc: "With a bottle rocket altitude record of an astounding 146 meters, you finally figure out this whole \"chemical propulsion\" thing."),
    
    Item(name: "Missile", income: 500, price: 10000, desc: "After your fireworks make spectacular and delightful explosions, the military approches you and asks you to create some rocket-powered explosions that are a little... less delightful."),
    
    Item(name: "ICBM", income: 1500, price: 35000, desc: "Those missiles can cause some pretty great destruction on a small scale, but why stop there? The power goes to your head and you create a rocket missile large enough to go across oceans and destroy entire cities."),
    
    Item(name: "Weather Balloon", income: 5000, price: 100000, desc: "After some aggressive overuse of your missiles & ICBMs, you decide to take a step back from all this dangerous rocketry. Balloons can go pretty high without killing people, right?"),
    
    Item(name: "Suborbital Rocket", income: 10000, price : 300000, desc: "A balloon can get your pretty high, but it doesn't give you the lateral velocity you need to get into orbit. You reinvest in rocket tech and develop a new model that can reach just outside of the atmosphere."),
    
    Item(name: "Satellite", income: 50000, price: 2000000, desc: "With just enough height and just enough speed, you manage to get a small little satellite in orbit. It doesn't do much, and its orbit might not be very stable, but at least you beat those clowns on the other side of the planet."),
    
    Item(name: "Dog in Space", income: 100000, price: 6000000, desc: "Ever since you sent machines into space, everyone has been expecting you to send humans. You created some pods with life support, and decided to test it with a dog, mostly so you can get some cute pictures."),
    
    Item(name: "Manned Spaceflight", income: 500000, price: 25000000, desc: "You finally did it, after all this time. You sent an astronaut into space, crossed your fingers that he would make it back, and then everything went smoothly. This is a huge step for your space agency! Now you set your sights on the moon."),
    
    Item(name: "Docking", income: 1000000, price: 70000000, desc: "If you can send one person into space, why not send two at once and then have them dock together in orbit and say hi? Something tells you this is gonna be like hitting a speeding bullet with a second bullet."),
    
    Item(name: "Space Station", income: 3000000, price: 150000000, desc: "You've put all these guys (and pups) in space, but you realize you haven't actually done much science yet. You build a space station to serve as a platform for scientific research."),
    
    Item(name: "Moon Impact Probe", income: 10000000, price: 600000000, desc: "You go back to your mechanical roots and send a probe to smack into the moon. For science. It returns some valuable telemetry before it reaches what you call an \"intentional high-speed stop\""),

    Item(name: "Lunar Soil Return", income: 25000000, price: 1000000000, desc: "This time, you put a few retrograde rockets on your probe so that it can touch down on the surface, grab a couple of rocks, and then bring them back to you. These rocks finally confirm that the moon is not, in fact, made of cheese."),
    
    Item(name: "Man on the Moon", income: 100000000, price: 5000000000, desc: "")
    
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