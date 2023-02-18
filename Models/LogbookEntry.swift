//
//  LogbookEntry.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 14/2/2023.
//

import Foundation


struct LogbookEntry: Identifiable, Hashable, Codable {
    var id: Int
    var driver: String
    var purposeOfTrip: String
    var tripDateTime: String
    var time: String
    var date: String
    var signature: String
    
    private static let newLogbookEntryId: LogbookEntry.ID = -1
}

extension LogbookEntry {
    static func blankEntry() -> LogbookEntry {
        let now = Date()
        return LogbookEntry(
            id: LogbookEntry.newLogbookEntryId,
            driver: "",
            purposeOfTrip: "",
            tripDateTime: now.formatted(),
            time: now.formatted(date: .omitted, time: .shortened),
            date: now.formatted(date: .complete, time: .omitted),
            signature: ""
        )
    }

}
