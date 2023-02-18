//
//  LogbookEntryConfig.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 14/2/2023.
//

import Foundation

struct LogbookEntryConfig {
    var isPresented = false
    var shouldSaveChanges = false
    var logbookEntry = LogbookEntry.blankEntry()
    
    mutating func presentNewLogbookEntry() {
        logbookEntry = LogbookEntry.blankEntry()
            
        shouldSaveChanges = false
        isPresented = true
    }
    
    mutating func presentEditLogbookEntry(_ entryToEdit: LogbookEntry) {
        logbookEntry = entryToEdit
        shouldSaveChanges = false
        isPresented = true
    }
    
    mutating func done() {
        shouldSaveChanges = true
        isPresented = false
    }
    
    mutating func cancel() {
        shouldSaveChanges = false
        isPresented = false
    }
}
