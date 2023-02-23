//
//  Car.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 5/1/2023.
//

import Foundation

struct Car: Identifiable, Hashable, Codable {
    var id: Int
    var name: String
    var model: String
    var make: String
    var year: Int
    var licensePlate: String
    var registeredOwner: String
    var registrationEnd: String
    var permittedNumberDays: Int
    var logbook: [LogbookEntry]
 }

extension Car {
    mutating func addLogbookEntry(_ entry: LogbookEntry) {
        var entryToAdd = entry
        entryToAdd.id = (logbook.map { $0.id }.max() ?? 0) + 1
        logbook.append(entryToAdd)
    }
}
