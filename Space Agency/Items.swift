//
//  Items.swift
//  Space Agency
//
//  Created by Cal on 4/13/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit

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
    
    Item(name: "Man on the Moon", income: 100000000, price: 5000000000, desc: "This is one small step for a man, but one giant leap for your space program. You really wish you had sent dogs instead, though. Just imagine that. Dogs on the moon. That would have been great."),
    
    Item(name: "Moon Buggy", income: 500000000, price: 10000000000, desc: "Your astronauts asked you for something more fun to do on the Moon than just walking around and picking up rocks, so you sent them a moon buggy to drive around with. TODO: consider purchasing television rights for NASCAR On The Moon™"),
    
    Item(name: "Moon Outpost", income: 3000000000, price: 50000000000, desc: "You send astronauts to the moon often enough, so you figured you'd give them a place to crash for the night. You build a self-sufficient little outpost on the moon. Men and women must sleep in separate rooms."),
    
    Item(name: "Interstellar Probe", income: 25000000000, price: 130000000000, desc: "Some ambitious advances in kite technology gave you the idea to create a really big kite in space and call it a solar sail. Your advisors tell you that it will get to another star eventually."),
    
    Item(name: "Asteroid Lander", income: 80000000000, price: 250000000000, desc: "Companies are getting interested in asteroid mining, so you bite the bullet and send a probe to find out more about these big chunks of metal hurling through space. Hopefully new tax revenue will turn this into a good investment."),
    
    Item(name: "Asteroid Smasher", income: 300000000000, price: 9000000000000, desc: "Turns out there's a lot of raw materials packed into those asteroids, but it's a little too dense for traditional mining to be effective. You take some warheads from your ICBM days and explode an asteroid into little chunks."),
    
    Item(name: "Space Elevator", income: 1000000000000, price: 70000000000000, desc: "It takes a lot of rocket power to safely shuttle all of these resources back to Earth, so you build a space elevator for the good of humanity. It quickly got bogged down in regulations and has a waitlist of 20 years."),
    
    Item(name: "Mars Orbiter", income: 5000000000000, price: 200000000000000, desc: "With all this focus on Near Earth Asteroids and the Moon, you realize there's been very little attention given to bodies outside of the Earth-Moon system. You send a probe to Mars to see it up close for the first time."),
    
    Item(name: "Mars Rover", income: 30000000000000, price: 1000000000000000, desc: "Probes in orbit are cool and all, but what the people really want to see is a robot driving around on the surface. In a last-second epiphany, you strap a selfie-stick to the robot to appeal to the younger crowd."),
    
    Item(name: "Martian Greenhouse", income: 200000000000000, price: 8000000000000000, desc: "Affluent business man Yelon Mushk announces he plans to put a greenhouse full of lemongrass on Mars by the end of the decade, so you decide you have to one-up him and build one within the next six months. Afterwards, you realize that's exactly what he intended."),
    
    Item(name: "Men on Mars", income: 1000000000000000, price: 25000000000000000, desc: "After your greenhouse is a resounding success, you realize you're already like half way to putting men on Mars. You allow him to take his dog, too, because you know the public goes crazy for a cute dog pic. You cross your fingers they can survive on lemongrass."),
    
    Item(name: "Martian Colony", income: 150000000000000000, price: 800000000000000000, desc: "As more people (and dogs) arrive on Mars, you decide to send them some extra metal and a few builder-bots so they can set up a city. Within a year, they have a functional city. They refuse to pay taxes to your unrepresentative \"agency\" and your ability to expand any futher is extremely limited. Ungrateful swine.")
    
]


class Item {
    
    let name: String
    var income: Double
    let price: Double
    let description: String
    
    var unlocked: Bool = false
    var count: Double = 0
    var image: UIImage? = nil
    
    init(name: String, income: Double, price: Double, desc: String) {
        self.name = name
        self.income = income
        self.price = price
        self.description = desc
    }
    
}
