//
//  DateTime.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 14/2/2023.
//

import Foundation

struct DateTime {
    static func getRegistrationEndDateFrom(_ endDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "au")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.date(from: endDate)!.formatted(date: .complete, time: .omitted)
    }
    
    static func getDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_AU")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateTime = dateFormatter.date(from: dateString)
        return dateTime!.formatted(date: .complete, time: .omitted)
    }
}
