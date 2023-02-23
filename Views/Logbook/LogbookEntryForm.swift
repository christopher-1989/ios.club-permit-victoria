//
//  LogbookEntryForm.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 5/1/2023.
//

import SwiftUI

struct LogbookEntryForm: View {
    
    var car: Car
    @Binding var config: LogbookEntryConfig
    @State private var showingAlert = false
//    @State private var driver: String = ""
//    @State private var selection: String = "Cruising"
    @EnvironmentObject var garage: Garage

    var body: some View {
        NavigationStack{
            VStack {
                PlateRow(car: car)
                Text("Registered owner: \(car.registeredOwner)")
                Text("Expiry date: \(DateTime.getRegistrationEndDateFrom(car.registrationEnd))")
                Divider()
                    .frame(width: 350)
                Text("New logbook entry")
                    .font(.title2)
                    .padding(10)
                
                VStack (alignment: .leading, spacing: 10) {
                    VStack (alignment: .leading, spacing: 10){
                        Text("Date: \(config.logbookEntry.date)")
                        Text("Time: \(config.logbookEntry.time)")
                    }
                    .alert("Cannot change date and time", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("The date and time must be set for now.")
                    }
                    .onTapGesture {
                        showingAlert = true
                    }
                    HStack{
                        Text("Driver: ")
                        TextField("Driver name", text: $config.logbookEntry.driver)
                    }
                    HStack{
                        Text("Purpose of trip: ")
                        Picker(config.logbookEntry.purposeOfTrip, selection: $config.logbookEntry.purposeOfTrip) {
                            ForEach(garage.reasons, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(.black)
                        
                    }
                    VStack (alignment: .leading){
                        Text("Confirm and sign")
                        Text("Press to sign")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(Edge.Set(.leading), 50)
            }
            .navigationBarItems(leading: Button("Cancel", action: {config.cancel()}), trailing: Button("Save", action: {config.done()}))
            .navigationTitle("New logbook entry")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LogbookEntry_Previews: PreviewProvider {
    
    static var cars = Garage().cars
    @State static var config = LogbookEntryConfig()
    
    static var previews: some View {
        LogbookEntryForm(car: cars[0], config: $config)
            .environmentObject(Garage())
    }
}
