//
//  LogbookRow.swift
//  club-permit-victoria
//
//  Created by Christopher McDonald on 5/1/2023.
//

import SwiftUI

struct PlateRow: View {
    
    var car: Car

    var body: some View {
        HStack {
            Plate(number: car.licensePlate, description: car.name)
        }
        .background(.opacity(0.00))

    }
}

struct LogbookRow_Previews: PreviewProvider {
    static var cars = Garage().cars

    static var previews: some View {
        PlateRow(car: cars[0])
    }
}
