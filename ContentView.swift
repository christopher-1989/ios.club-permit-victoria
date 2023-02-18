//
//  ContentView.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 25/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GarageList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Garage())
    }
}
