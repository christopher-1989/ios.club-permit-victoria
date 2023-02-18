//
//  LogbookView.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 5/1/2023.
//

import SwiftUI

struct LogbookView: View {
    
    var car: Car
    @EnvironmentObject var garage: Garage
    @State private var logbookEntryConfig = LogbookEntryConfig()
    
    
    
    var body: some View {
            VStack{
                PlateRow(car: car)
                Text("Registered owner: \(car.registeredOwner)")
                Text("Expiry date: \(car.registrationEnd)")
                Text("Days driven: \(car.logbook.count)")
                Divider()
                    .frame(width: 400)
                ScrollView {
                    List {
                        ForEach (car.logbook) {entry in
                            LogbookEntryRow(date: DateTime.getDate(entry.tripDateTime), driver: entry.driver, reason: entry.purposeOfTrip)
                        }
                    }
                    .listStyle(.plain)
                    .frame(width: 400, height: 200)
                    Spacer()

                }
            }
            .toolbar {
                Button {
                    logbookEntryConfig.presentNewLogbookEntry()
                } label: {
                    Label("Add new logbook entry", systemImage: "plus")
                        .tint(Color("PlateColor"))
                }
            }
            .navigationTitle("Logbook")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $logbookEntryConfig.isPresented, onDismiss: didDismissEditor) {
                LogbookEntryForm(car: car, config: $logbookEntryConfig)
                    .environmentObject(garage)
            }
        }
    
        private func didDismissEditor() {
                if logbookEntryConfig.shouldSaveChanges {
//                    car = modelData.add(logbookEntryConfig.logbookEntry)
//                    SOME CODE FOR ADDING NEW ENTRY
//                    MUST ALSO TRACK WHICH CAR IS BEING ADDED
                    print("added to cars logbook")
                }
            }
}
        

struct LogbookView_Previews: PreviewProvider {
    static var previews: some View {
        LogbookView(car: Garage().cars[0])
            .environmentObject(Garage())
    }
}
