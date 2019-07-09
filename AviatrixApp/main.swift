//
//  main.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

func gauges(myPlane : Aviatrix) {
    print("Reading the gauges...")
    print(" ")
    print("| Running:  | ✅")
    print("| Location:  | \(myPlane.location)")
    print("| Distance:  | \(myPlane.distanceTraveled) miles")
    print("| Fuel:      | \(myPlane.fuelLevel) gallons")
    print("| Max Fuel:  | \(myPlane.maxFuel) gallons")
    print("| MPG:       | \(myPlane.milesPerGallon)")
//    print("| Fuel Bill: | \(myPlane.fuelCost)")
}

func fly(myPlane : Aviatrix) {
    print("Where would you like to fly to? ")
    print(" ")
    let destinations = myPlane.knownDestinations()
    
    for (index, city) in destinations.enumerated() {
        let distance = myPlane.distanceTo(target: city, location: Aviatrix.location)
        print("\(index): \(city), \(distance) miles")
    }
    
    let response = Int(readLine()!)
    var desiredLocation = ""
    
    if response! >= 0 && response! < 4 {
        desiredLocation = myPlane.knownDestinations()[response!]
        
        print("🛫 Preparing for takeoff...")
        print("🛫 Flying...")
        
        if fuelCheck(myPlane: myPlane, destination : desiredLocation) {
            myPlane.flyTo(destination: desiredLocation)
            print("🛬 You've arrived in \(Aviatrix.location)!”)
            gauges(myPlane: myPlane)
        }
    }
    else {
        print("⚠️Please enter a valid command⚠️")
    }
    
}

func refuel(myPlane : Aviatrix) {
    let refuelData = myPlane.refuel()
    AviatrixData data = AviatrixData() // create data variable
    double cost = data.fuelPrices[myPlane.location]
    print("Refueling…”)
    print("⛽ Here in \(myPlane.location), jet fuel costs \(cost)”)
    print("⛽ You refueled \(refuelData) gallons totaling \(refuelData * cost)”)
}

func fuelCheck(myPlane : Aviatrix, destination : String) -> Bool {
//    let distanceToTravel =  Double(myPlane.distanceTo(target : destination))
//    if myPlane.fuelLevel < distanceToTravel {
//        print(" ")
//        print("🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥")
//        print("Oh no! You've run out of fuel and crashed on the way to \(myPlane.location)!")
//        print("🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥")
//
//        return false
//    } else {
//        return true
//    }
    return true
}

var plane = Aviatrix(“Zoe”) //added this string

print("Welcome to the Aviatrix Flight System by \(Aviatrix.author)”) //fixed using interpolation
plane.start()

print("You're currently in \(Aviatrix.location)”)

var command = ""

while command != "q" {
    print(" ")
    print("What would you like to do?")
    print("a) 📊 check the plane gauges")
    print("b) 🛫 fly to a different city")
    print("c) ⛽ refuel")
    print("q) ❌ quit")
    print(" ")
    print("Action: ")
    command = readLine()!
    
    if command == "a" {
        gauges(myPlane: plane)
    }
    else if command == "b" {
        fly(myPlane: plane)
    }
    else if command == "c" {
        refuel(myPlane: plane)
    }
    else if command != "q" {
        print("⚠️Please enter a valid command⚠️")
    }
}

print(" ")
print("Thanks for flying with \(Aviatrix.author) airline!")
