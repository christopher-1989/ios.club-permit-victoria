//
//  LogbookEntryRow.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 22/1/2023.
//

import SwiftUI

struct LogbookEntryRow: View {
    
    var date: String
    var driver: String
    var reason: String
    
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Date: \(date)")
            Text("Driver: \(driver)")
            Text("Reason: \(reason)")
        }
        .padding()
    }
}

struct LogbookEntryRow_Previews: PreviewProvider {
    static var entry = Garage().cars[0].logbook[0]
    static var previews: some View {
        LogbookEntryRow(date: entry.tripDateTime, driver: entry.driver, reason: entry.purposeOfTrip)
    }
}
