//
//  club_permit_victoriaApp.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 25/12/2022.
//

import SwiftUI

@main
struct club_permit_victoriaApp: App {
    
    @StateObject private var garage = Garage()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(garage)
        }
    }
}
