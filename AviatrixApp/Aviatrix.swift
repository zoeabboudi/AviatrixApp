//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    var running = false
    var author = “”
    var location = “”
    var distanceTraveled = 0
    AviatrixData data = AviatrixData()
    var maxFuel = 0
    var fuelLevel = 0
    var milesPerGallon = 0.4
    var fuelCost = 0

    init(authorName : String) {
 	author = authorName
        distanceTraveled = 0
        maxFuel = 5000
        fuelLevel = 5000.0
    }

    func start() -> Bool {
	running = true
  	return running
    }
    
    func refuel() {
        double difference = 0
        difference = maxFuel - fuelLevel
        fuelLevel = maxFuel
        fuelCost += data.fuelPrices[myPlane.location] * difference //add the necessary cost at fuel of this location
        return difference
        
    }
    
    func flyTo(destination : String) {
        location = destination
        distance = distanceTo(destination,location)
        distanceTraveled += distance
        fuelLevel -= distance/(0.4)
    }
    
    func distanceTo(target : String , location : String) {
        return data.knownDistances[location]![target]!
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
}
