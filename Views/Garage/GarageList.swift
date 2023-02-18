//
//  LogbookList.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 5/1/2023.
//

import SwiftUI

struct GarageList: View {

    @EnvironmentObject var garage: Garage
    @State private var showingProfile = false

    
    var body: some View {
        NavigationView {
            List{
                ForEach(garage.cars) { car in
                    NavigationLink {
                        LogbookView(car: car)
                    } label: {
                        PlateRow(car: car)
                    }
                    .listRowSeparator(.hidden)
                }
                .navigationTitle("My Garage")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .listStyle(.plain)
            
        }
        .tint(Color("PlateColor"))
    }
}

struct GarageList_Previews: PreviewProvider {
    static var previews: some View {
        GarageList()
            .environmentObject(Garage())
    }
}
