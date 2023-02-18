//
//  Garage.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 16/2/2023.
//

import SwiftUI

class Garage: ObservableObject {
    @Published var cars: [Car]
    var reasons: [String]
    
    init() {
        self.cars = load("garageData.json")
        self.reasons = ["Cruising", "Club meeting", "Club event", "Service/repairs", "Other"]

    }
    
    func carsInGarage() -> [Car] {
        return cars
    }
    
    func delete(_ car: Car) {
        delete(car.id)
    }
    
    func delete(_ id: Car.ID) {
        if let index = index(for: id) {
            cars.remove(at: index)
        }
    }
    
    func update(_ car: Car) {
        if let index = index(for: car.id) {
            cars[index] = car
        }
    }
    
    func index(for id: Car.ID) -> Int? {
        cars.firstIndex(where: { $0.id == id })
    }
    
    func car(with id: Int) -> Car? {
        return cars.first(where: { $0.id == id })
    }
    
    func contains(_ car: Car) -> Bool {
        contains(car.id)
    }

    func contains(_ id: Car.ID?) -> Bool {
        guard let carId = id else { return false }
        return cars.contains { $0.id == carId }
    }
}

extension Garage {
    func add(_ car: Car) -> Car.ID {
        var carToAdd = car
        carToAdd.id = (cars.map { $0.id }.max() ?? 0) + 1
        cars.append(carToAdd)
        return carToAdd.id
    }
}


